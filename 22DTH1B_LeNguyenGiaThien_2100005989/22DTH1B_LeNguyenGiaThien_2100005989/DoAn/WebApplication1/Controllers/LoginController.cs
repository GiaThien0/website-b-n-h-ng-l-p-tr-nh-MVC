using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string Acc, string Pass)
        {
            string mk = Mahoa.encryptSHA256(Pass);

            // Thay vì sử dụng First, sử dụng FirstOrDefault để tránh ngoại lệ nếu không tìm thấy
            TaiKhoan ttdn = new ShopOnlineConnet()
                .TaiKhoans
                .FirstOrDefault(x => x.taiKhoan1.Equals(Acc.ToLower().Trim()) && x.matKhau.Equals(mk));

            bool isAuthentic = ttdn != null && ttdn.taiKhoan1.Equals(Acc.ToLower().Trim()) && ttdn.matKhau.Equals(mk);

            if (isAuthentic)
            {
                // Xác thực thành công, lưu thông tin đăng nhập vào session
                Session["TtDangNhap"] = ttdn;
                return RedirectToAction("Index", "Dashboard", new { Area = "PrivatePages" });
            }
            else
            {
                // Đăng nhập không thành công, chuyển hướng về trang đăng nhập
                ModelState.AddModelError(string.Empty, "Tên đăng nhập hoặc mật khẩu không đúng.");
                return RedirectToAction("Index", "Login");
            }
        }
    }
}