using Microsoft.AspNetCore.Mvc;
    using DuongNhiStore.AppData;
using DuongNhiStore.Models;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using Newtonsoft.Json;
namespace DuongNhiStore.Controllers

{
    public class ProductController : Controller
    {
        private readonly AppDBContext _db;
        public ProductController(AppDBContext db)
        {
            _db = db;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Detail(int id)

        {
            Product p = (Product) _db.Products.Where(p=> p.Id == id).FirstOrDefault();
            return View(p);
        }
        public IActionResult ListPro(int? id)
        {
            var categories = _db.Categories.ToList(); // Fetch all categories
            ViewBag.Categories = categories;  // Pass categories to the view

            List<Product> proList = id.HasValue
                ? _db.Products.Where(p => p.CategoryId == id).ToList()
                : _db.Products.ToList(); // Filter by category if 'id' is provided

            return View(proList);
        }
    }
}
