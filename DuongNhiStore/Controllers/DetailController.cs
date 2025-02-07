using DuongNhiStore.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using DuongNhiStore.AppData;

namespace DuongNhiStore.Controllers
{
    public class DetailController : Controller
    {
        private readonly AppDBContext _db;

        public DetailController( AppDBContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Detail(int id)

        {
            Product p =(Product) _db.Products.Where(p => p.Id == id).FirstOrDefault();
            return View(p);
        }

    }
}
