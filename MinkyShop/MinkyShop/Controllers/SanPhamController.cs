using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Controllers
{
    public class SanPhamController : Controller
    {
        private readonly MinkyShopContext data;
        public SanPhamController(MinkyShopContext context)
        {
            data = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult TenNhaCungCap(int id)
        {
            var sp = data.Sanphams.Where(s => s.MaNcc == id).ToList();
            return View(sp);
        }

        public IActionResult SPLoai(int id)
        {
            var sp = data.Sanphams.Where(s => s.MaL == id).ToList();
            return View(sp);
        }

        public IActionResult ChiTietSanPham(int id)
        {
            var sp = data.Sanphams.Where(s => s.MaSp == id).ToList();
            return View(sp);
        }

        public IActionResult SPDanhMuc(int id)
        {
            var sp = (from s in data.Sanphams
                      join l in data.Loais on s.MaL equals l.MaL
                      where l.MaDm == id
                      select new SanPham_Loai
                      {
                          MaSp = s.MaSp,
                          MaL = l.MaL,
                          TenSp = s.TenSp,
                          Anhbia = s.Anhbia,
                          Mota = s.Mota,
                          Gia = s.Giaban,
                      }).ToList();

            return View(sp);
        }

    }
}
