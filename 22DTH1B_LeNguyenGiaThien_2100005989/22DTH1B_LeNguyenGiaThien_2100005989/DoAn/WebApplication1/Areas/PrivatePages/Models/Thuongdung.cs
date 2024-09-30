using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;
namespace WebApplication1.Areas.PrivatePages.Models
{
    public class Thuongdung
    {
        public static TaiKhoan GetTaiKhoanHH()
        {
            TaiKhoan kq = new TaiKhoan();
            kq = HttpContext.Current.Session["TtDangNhap"] as TaiKhoan;
            return kq;
        }
        public static string GetTenTaiKhoan()
        {
            return GetTaiKhoanHH().taiKhoan1;
        }
    }
}