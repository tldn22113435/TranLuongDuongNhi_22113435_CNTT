using Microsoft.AspNetCore.Mvc;
using DuongNhiStore.AppData;
using DuongNhiStore.Models;
using Microsoft.EntityFrameworkCore;

namespace DuongNhiStore.Components
{
    public class CategoryViewComponent : ViewComponent
    {
        private readonly AppDBContext _db;
        public CategoryViewComponent(AppDBContext db)
        {
            this._db = db;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            List<Category> categories = await this._db.Categories.ToListAsync();
            return View(categories);
        }
    }
}
