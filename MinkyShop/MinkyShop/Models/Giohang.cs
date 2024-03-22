using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace MinkyShop.Models
{
    public class Giohang
    {
        private readonly MinkyShopContext _context;
        public int iMaSp { set; get; }
        public string sTenSp { set; get; }
        public string sAnhbia { set; get; }
        public Double dDongia { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien
        {
            get { return iSoluong * dDongia; }
        }
        public Giohang(int MaSp)
        {
            iMaSp = MaSp;
            Sanpham sp = _context.Sanphams.Single(n => n.MaSp == iMaSp);
            sTenSp = sp.TenSp;
            sAnhbia = sp.Anhbia;
            dDongia = double.Parse(sp.Giaban.ToString());
            iSoluong = 1;
        }
    }
}
