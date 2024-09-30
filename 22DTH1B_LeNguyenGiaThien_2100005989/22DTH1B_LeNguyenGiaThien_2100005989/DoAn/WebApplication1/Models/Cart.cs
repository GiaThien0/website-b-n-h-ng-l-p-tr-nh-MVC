using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Cart
    {
        public string MaKH { get; set; }
        public string TaiKhoan { get; set; }
        public DateTime NgayDat { get; set; }
        public DateTime NgayGiao { get; set; }
        public string DiaChi { get; set; }
        public SortedList<string, CtDonHang> SanPhamDC { get; set; }



        public Cart()
        {

            this.MaKH = ""; this.TaiKhoan = ""; this.NgayDat = DateTime.Now; this.NgayGiao = DateTime.Now.AddDays(2); this.DiaChi = "";
            this.SanPhamDC = new SortedList<string, CtDonHang>();
        }
        public void updateItem(CtDonHang x)
        {
            this.SanPhamDC.Remove(x.maSP);
            this.SanPhamDC.Add(x.maSP, x);
        }
        public bool IsEmpty()
        {
            return (SanPhamDC.Keys.Count == 0);
        }
        public void addItem(string masp)
        {
            if (SanPhamDC.Keys.Contains(masp))
            {
                CtDonHang x = SanPhamDC.Values[SanPhamDC.IndexOfKey(masp)];
                x.soLuong++;
                updateItem(x);


            }
            else
            {
                CtDonHang i = new CtDonHang();
                i.maSP = masp;
                i.soLuong = 1;
                SanPham z = Conmon.GetProductsByID(masp);
                i.giaBan = (long)z.giaBan;
                i.giamGia = z.giamGia;
                SanPhamDC.Add(masp, i);
            }
        }
        public void deleteItem(string masp)
        {
            if (SanPhamDC.Keys.Contains(masp))
            {
                SanPhamDC.Remove(masp);

            }

        }
        public void decrease(string masp)
        {
            if (SanPhamDC.Keys.Contains(masp))
            {
                CtDonHang x = SanPhamDC.Values[SanPhamDC.IndexOfKey(masp)];

                if (x.soLuong > 1)
                {
                    x.soLuong--;
                    updateItem(x);
                }

            }
            else
            {
                deleteItem(masp);
            }

        }

        public long moneyOfOneProduct(CtDonHang x)
        {
            return (long)((x.giaBan * x.soLuong * x.giamGia) - (x.giaBan * x.soLuong));


        }
        public long totalOfCartShop()
        {
            long kq = 0;
            foreach (CtDonHang i in SanPhamDC.Values)
                kq += moneyOfOneProduct(i);
            return kq;

        }
        public void clearCart()
        {
            SanPhamDC.Clear();
        }

    }

}