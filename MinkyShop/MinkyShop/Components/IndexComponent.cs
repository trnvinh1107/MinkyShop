using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Components
{
    [ViewComponent(Name = "Index")]
    public class IndexComponent : ViewComponent
    {
        private MinkyShopContext data;
        public IndexComponent(MinkyShopContext context)
        {
            data = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            var Danhmuc = (from dm in data.Danhmucs select dm).ToList();
            return await Task.FromResult((IViewComponentResult)View("Default", lstGiohang));
        }
        public int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Giohang> lstGiohang = HttpContext.Session.Get<List<Giohang>>("GioHang");
            if (lstGiohang != null)
                iTongSoLuong = lstGiohang.Sum(n => n.iSoluong);
            return iTongSoLuong;
        }

        public double TongTien()
        {
            double iTongTien = 0;
            List<Giohang> lstGiohang = HttpContext.Session.Get<List<Giohang>>("GioHang");
            if (lstGiohang != null)
                iTongTien = lstGiohang.Sum(n => n.dThanhtien);
            return iTongTien;
        }
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstGiohang = HttpContext.Session.Get<List<Giohang>>("Giohang");
            if (lstGiohang == null)
            {
                lstGiohang = new List<Giohang>();
                HttpContext.Session.Set("Giohang", lstGiohang);
            }
            return lstGiohang;
        }
    }
}
