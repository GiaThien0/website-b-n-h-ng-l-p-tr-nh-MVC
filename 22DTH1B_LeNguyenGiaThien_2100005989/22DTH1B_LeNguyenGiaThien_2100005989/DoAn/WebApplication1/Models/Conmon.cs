using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
namespace WebApplication1.Models
{
    public class Conmon
    {
        static DbContext cn = new DbContext("name=ShopOnlineConnet");
        public static List<SanPham> getProducts()
        {
            List<SanPham> l = new List<SanPham>();
            DbContext cn = new DbContext("name=ShopOnlineConnet");
            l = cn.Set<SanPham>().ToList<SanPham>();
            return l;
        }
        public IEnumerable<LoaiSP> Nhomhang
        {

            get
            {
                return this.db.LoaiSPs;
            }

        }

        private ShopOnlineConnet db;
        public Conmon()
        {
            this.db = new ShopOnlineConnet();
        }


      
     
        public static SanPham GetProductsByID(string maSP)
        {
            return cn.Set<SanPham>().Find(maSP);
        }
        public static string getimagesOfProducByID(string maSP)
        {
            return cn.Set<SanPham>().Find(maSP).hinhDD;
        }
        public static string getNameProductBYID(String maSP)
        {
            return cn.Set<SanPham>().Find(maSP).tenSP;
        }

    }

}