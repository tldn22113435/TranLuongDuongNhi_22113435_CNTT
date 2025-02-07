namespace DuongNhiStore.Models
{
    public class OrderProduct
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public Product? Product { get; set; }

        public int OrderId { get; set; }
        public Order? Order { get; set; }

        public int? Quantity { get; set; }
        public int? Price { get; set; } = 0;

        // Thêm Discount để lưu giảm giá tại thời điểm tạo đơn hàng
        public float Discount { get; set; } = 0;
    }
}
