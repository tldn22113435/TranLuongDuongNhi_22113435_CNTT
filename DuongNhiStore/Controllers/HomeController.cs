using DuongNhiStore.Models;
using Microsoft.AspNetCore.Mvc;
using DuongNhiStore.AppData;
namespace DuongNhiStore.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AppDBContext _db;
        public HomeController(ILogger<HomeController> logger, AppDBContext db)
        {
            _logger = logger;
            _db = db;
        }
 
        public IActionResult Index()
        {
            List<Product> products = _db.Products.ToList();
            return View(products);
        }

        public IActionResult Privacy()
            
        {
            List<Product> products = _db.Products.ToList();
            return View(products);
        }

        
    }
}
