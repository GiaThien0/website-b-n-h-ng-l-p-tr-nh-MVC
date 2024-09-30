﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using System.Data.Entity;
using PagedList;
namespace WebApplication1.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index(int? page)
        {
            ShopOnlineConnet db = new ShopOnlineConnet();
            var pageNumber = page ?? 1;
            var pageSize = 8;

            return View("Index", db.SanPhams.OrderBy(p => p.maLoai).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Index2(int loai, int? page)
        {
            ShopOnlineConnet db = new ShopOnlineConnet();
            var pageNumber = page ?? 1;
            var pageSize = 8;

            var products = db.SanPhams.Where(d => d.maLoai == loai).OrderBy(p => p.maLoai).ToPagedList(pageNumber, pageSize);

            return View("Index", products);
        }

    }
}