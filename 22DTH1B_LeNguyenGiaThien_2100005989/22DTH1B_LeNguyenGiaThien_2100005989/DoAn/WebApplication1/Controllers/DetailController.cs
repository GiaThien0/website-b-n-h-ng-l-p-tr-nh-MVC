using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class DetailController : Controller
    {
        // GET: Detail
        public ActionResult Index(string id)
        {
            ShopOnlineConnet db = new ShopOnlineConnet();

            return View(db.SanPhams.Find(id));
        }


    }
}