using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class CartController : Controller
    {

        [HttpGet]
        // GET: Cart
        public ActionResult Index()
        {
            Cart gh = Session["GioHang"] as Cart;
            ViewData["Cart"] = gh;
            return View();
        }
        public ActionResult Increase(string maSP)
        {
            Cart gh = Session["GioHang"] as Cart;
            gh.addItem(maSP);
            Session["GioHang"] = gh;


            return RedirectToAction("Index");
        }
        public ActionResult Decrease(string maSP)
        {
            Cart gh = Session["GioHang"] as Cart;
            gh.decrease(maSP);
            Session["GioHang"] = gh;
            return RedirectToAction("Index");
        }
        public ActionResult RemoveItem(string maSP)
        {
            Cart gh = Session["GioHang"] as Cart;
            gh.deleteItem(maSP);
            Session["GioHang"] = gh;
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult ClearCart()
        {
            // Lấy giỏ hàng từ session (hoặc nơi lưu trữ khác)
            Cart cart = Session["GioHang"] as Cart;

            // Kiểm tra nếu giỏ hàng không null, thực hiện xóa
            if (cart != null)
            {
                cart.clearCart();
            }
            // Chuyển hướng hoặc thực hiện các hành động khác (tuỳ thuộc vào yêu cầu của bạn)
            return RedirectToAction("Index", "Cart");
        }

    }

}