using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using DuongNhiStore.AppData;
using DuongNhiStore.Data;
var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("DuongNhiStoreContextConnection") ?? throw new InvalidOperationException("Connection string 'DuongNhiStoreContextConnection' not found.");
//builder.Services.AddDbContext<IdentityContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddDbContext<AppDBContext>(options => options.UseSqlServer(connectionString));

builder.Services.AddDefaultIdentity<AppUser>(options => options.SignIn.RequireConfirmedAccount = false).AddEntityFrameworkStores<AppDBContext>();

// Thêm dịch vụ Session (cần phải sử dụng session trong app)
builder.Services.AddDistributedMemoryCache();  // Cấu hình cho session
builder.Services.AddSession(options =>
{
    options.Cookie.Name = "shoppingCart";  // Đặt tên cookie cho session
    options.IdleTimeout = TimeSpan.FromMinutes(30);  // Thời gian sống của session
    options.Cookie.HttpOnly = true;  // Đảm bảo cookie chỉ có thể truy cập từ server
});
// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseSession();
app.UseRouting();
app.UseAuthentication();// nếu không có dòng này thì login thành công vẫn không hiển thị được trạng thái đã đăng nhập
app.UseAuthorization();

app.MapAreaControllerRoute(
    name: "default",
    areaName: "admin",
    pattern: "{area = admin}/{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapRazorPages();
app.Run();