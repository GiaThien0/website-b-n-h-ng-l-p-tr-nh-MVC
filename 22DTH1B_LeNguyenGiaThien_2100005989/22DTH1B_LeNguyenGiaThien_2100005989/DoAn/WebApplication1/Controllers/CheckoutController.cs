using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        [HttpGet]
        public ActionResult Index()
        {
            KhachHang x = new KhachHang();
            Cart gh = Session["GioHang"] as Cart;
            ViewData["Cart"] = gh;


            return View(x);
        }
        [HttpPost]
        public ActionResult SaveToDataBase(KhachHang x)
        {
            using (var context = new ShopOnlineConnet())
            {
                using (DbContextTransaction trans = context.Database.BeginTransaction())
                {
                    try
                    {
                        x.maKH = x.soDT;

                        context.KhachHangs.Add(x);
                        context.SaveChanges();
                        DonHang d = new DonHang();
                        d.soDH = string.Format("{0:yyMMddhhmm}", DateTime.Now);
                        d.maKH = x.maKH;
                        d.ngayGH = DateTime.Now; d.ngayGH = DateTime.Now.AddDays(2);
                        d.taiKhoan = "thien"; d.diaChiGH = x.diaChi;
                        context.DonHangs.Add(d);
                        context.SaveChanges();
                        Cart gh = Session["GioHang"] as Cart;
                        foreach (CtDonHang i in gh.SanPhamDC.Values)
                        {
                            i.soDH = d.soDH;
                            context.CtDonHangs.Add(i);
                        }
                        context.SaveChanges();

                        trans.Commit();
                        return RedirectToAction("Index", "Index");
                    }
                    catch (Exception e)
                    {
                        trans.Rollback();
                        string s = e.Message;
                    }
                }
            }
            return RedirectToAction("Index", "Checkout");
        }

    }
}