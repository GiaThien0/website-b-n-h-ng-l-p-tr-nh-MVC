using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Areas.PrivatePages.Controllers
{
    public class DanhsachbaivietController : Controller
    {
        private static ShopOnlineConnet db = new ShopOnlineConnet();
        private static bool daDuyet;
        [HttpGet]
        public ActionResult Index(string IsActive)
        {
            daDuyet = IsActive != null && IsActive.Equals("1");
            capNhatDuLieu();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string maBaiviet)
        {
            BaiViet x = db.BaiViets.Find(maBaiviet);
            db.BaiViets.Remove(x);
            db.SaveChanges();
            capNhatDuLieu();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Active(string maBaiviet)
        {
            BaiViet x = db.BaiViets.Find(maBaiviet);
            x.daDuyet = !daDuyet;
            db.SaveChanges();

            capNhatDuLieu();
            return View("Index") ;
        }
        private void capNhatDuLieu()
        {
            List<BaiViet> l = db.BaiViets.Where(x => x.daDuyet == daDuyet).ToList<BaiViet>();
            ViewData["DanhSachBV"] = l;
            ViewBag.tdCuaNut = daDuyet ? "Cấm hiển thị" : "Kiểm duyệt bài";

        }
    }
    }
