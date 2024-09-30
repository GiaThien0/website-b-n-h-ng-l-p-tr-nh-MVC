using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using System.IO;
using WebApplication1.Areas.PrivatePages.Models;   
namespace WebApplication1.Areas.PrivatePages.Controllers
{
    public class NewArticleController : Controller
    {
        // GET: PrivatePages/NewArticle
        [HttpGet]
        public ActionResult Index()
        {
            BaiViet x = new BaiViet();
            x.ngayDang = DateTime.Now;
            x.solandoc = 0;

            x.taiKhoan = Thuongdung.GetTenTaiKhoan();

            ViewBag.ddHinh = "/Asset/Images/user2-160x160.jpg";
            return View(x);
        }
        [HttpPost]
        public ActionResult Index(BaiViet x, HttpPostedFileBase HinhDaiDien)
        {
            try
            {
                x.maBV = string.Format("{0:yyMMddhhmm}", DateTime.Now);
                x.daDuyet = false;
                x.ngayDang = DateTime.Now;
                x.taiKhoan = Thuongdung.GetTenTaiKhoan();
                x.solandoc = 0;
                x.loaiTin = "QC";
                if (HinhDaiDien != null)
                {
                    string virPath = "/Asset/Images/BaiViet/";
                    string phyPath = Server.MapPath("~/" + virPath);
                    string ext = Path.GetExtension(HinhDaiDien.FileName);
                    string tenF = "HDD" + x.maBV + ext;
                    HinhDaiDien.SaveAs(phyPath + tenF);
                    x.hinhDD = virPath + tenF;
                    ViewBag.ddHinh = x.hinhDD;
                }
                else
                {
                    x.hinhDD = "";
                }

                ShopOnlineConnet db = new ShopOnlineConnet();
                db.BaiViets.Add(x);
                db.SaveChanges();
               
            }
            catch
            {
                return RedirectToAction("Index", "Danhsachbaiviet", new { IsActive = 0 });
            }
            return View(x);
        }

    }
}