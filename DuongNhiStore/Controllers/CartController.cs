using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using DuongNhiStore.Models;
using Microsoft.EntityFrameworkCore;
using DuongNhiStore.AppData;

namespace DuongNhiStore.Controllers
{
    public class CartController : Controller
    {
        private readonly AppDBContext _db;

        public CartController(AppDBContext db)
        {
            _db = db;
        }


        // Key lưu chuỗi json của Cart
        public const string CARTKEY = "cart";

        // Lấy cart từ Session (danh sách CartItem)
        List<CartItem> GetCartItems()
        {
            var session = HttpContext.Session;
            string jsoncart = session.GetString(CARTKEY);
            if (jsoncart != null)
            {
                return JsonConvert.DeserializeObject<List<CartItem>>(jsoncart);
            }
            return new List<CartItem>();
        }

        // Xóa cart khỏi session
        void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove(CARTKEY);
        }

        // Lưu Cart (Danh sách CartItem) vào session
        void SaveCartSession(List<CartItem> ls)
        {
            var session = HttpContext.Session;
            string jsoncart = JsonConvert.SerializeObject(ls);
            session.SetString(CARTKEY, jsoncart);
        }

        // Index Action (Displays the Cart)
        public IActionResult Index()
        {
            var cart = GetCartItems();
            return View(cart); // Pass the cart items to the view
        }
        /// Thêm sản phẩm vào cart
        [Route("addcart/{productid:int}", Name = "addcart")]
        public IActionResult AddToCart([FromRoute] int productid)
        {

            var product = _db.Products
                .Where(p => p.Id == productid)
                .FirstOrDefault();
            if (product == null)
                return NotFound("Không có sản phẩm");

            // Xử lý đưa vào Cart ...
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.product.Id == productid);
            if (cartitem != null)
            {
                // Đã tồn tại, tăng thêm 1
                cartitem.quantity++;
            }
            else
            {
                //  Thêm mới
                cart.Add(new CartItem() { quantity = 1, product = product });
            }

            // Lưu cart vào Session
            SaveCartSession(cart);
            // Chuyển đến trang hiện thị Cart
            return RedirectToAction(nameof(Cart));
        }
        // Xóa sản phẩm khỏi giỏ hàng
        [Route("/removecart/{productid:int}", Name = "removecart")]
        public IActionResult RemoveCart([FromRoute] int productid)
        {
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.product.Id == productid);
            if (cartitem != null)
            {
                cart.Remove(cartitem);
            }

            SaveCartSession(cart);
            return RedirectToAction(nameof(Cart));
        }

        // Cập nhật số lượng sản phẩm trong giỏ hàng
        [Route("/updatecart", Name = "updatecart")]
        [HttpPost]
        public IActionResult UpdateCart([FromForm] int quantity, [FromForm] int productid)
        {
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.product.Id == productid);
            if (cartitem != null)
            {
                cartitem.quantity = quantity;
            }

            SaveCartSession(cart);
            return Ok();
        }
        // Hiện thị giỏ hàng
        [Route("/cart", Name = "cart")]
        public IActionResult Cart()
        {
            return View(GetCartItems());
        }

        [Route("/checkout", Name = "checkout")]
        public IActionResult Checkout()
        {
            var cart = GetCartItems();

            // Kiểm tra giỏ hàng không trống
            if (cart.Count == 0)
            {
                TempData["ErrorMessage"] = "Giỏ hàng trống. Vui lòng thêm sản phẩm!";
                return RedirectToAction(nameof(Cart));
            }

            // Lấy thông tin người dùng hiện tại
            var userId = User.Identity?.Name;
            if (string.IsNullOrEmpty(userId))
            {
                TempData["ErrorMessage"] = "Vui lòng đăng nhập để tiếp tục thanh toán!";
                return RedirectToAction("Login", "Account");
            }

            // Tạo đơn hàng mới
            var order = new Order
            {
                UserId = userId,
                Status = "Đang xử lý",
                CreatedAt = DateTime.Now,
            };

            _db.Orders.Add(order);
            _db.SaveChanges();

            // Thêm sản phẩm vào OrderProduct
            foreach (var cartItem in cart)
            {
                var orderProduct = new OrderProduct
                {
                    OrderId = order.Id.Value,
                    ProductId = cartItem.product.Id,
                    Quantity = cartItem.quantity,
                    Price = cartItem.product.Price,
                    Discount = cartItem.product.Discount,
                };
                _db.OrderProducts.Add(orderProduct);
            }

            _db.SaveChanges();

            // Xóa giỏ hàng sau khi đặt hàng thành công
            ClearCart();

            // Chuyển hướng đến trang xác nhận
            TempData["SuccessMessage"] = "Đơn hàng của bạn đã được gửi đi thành công!";
            return RedirectToAction("OrderConfirmation");
        }


        [Route("/orderconfirmation", Name = "orderconfirmation")]
        public IActionResult OrderConfirmation()
        {
            return View();
        }

    }
}
