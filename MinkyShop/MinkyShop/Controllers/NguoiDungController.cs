using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Controllers
{
    public class NguoiDungController : Controller
    {
        private readonly MinkyShopContext data;
        public NguoiDungController(MinkyShopContext context)
        {
            data = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Dangxuat()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }
        public IActionResult ThongTin()
        {
            if (HttpContext.Session.Get("Taikhoan") == null)
                return RedirectToAction("Dangnhap", "Home");
            var khachHang = HttpContext.Session.Get<Khachhang>("Taikhoan");
            return View(khachHang);
        }
        public IActionResult EditThongTin()
        {
            
            if (HttpContext.Session.Get("Taikhoan") == null)
                return RedirectToAction("Dangnhap", "Home");
            var khachHang = HttpContext.Session.Get<Khachhang>("Taikhoan");
            return View(khachHang);
        }
        [HttpPost]
        public IActionResult EditThongTin(Khachhang khachHang)
        {

            if (HttpContext.Session.Get("Taikhoan") == null)
            {
                return RedirectToAction("Dangnhap", "Home");
            }
            var khachHangSession = HttpContext.Session.Get<Khachhang>("Taikhoan");

            using (var data = new MinkyShopContext())
            {
                var khachHangDB = data.Khachhangs.SingleOrDefault(kh => kh.MaKh == khachHangSession.MaKh);
                if (khachHangDB == null)
                    return NotFound();
                khachHangDB.HoTen = khachHang.HoTen;
                khachHangDB.Email = khachHang.Email;
                khachHangDB.Ngaysinh = khachHang.Ngaysinh;
                data.SaveChanges();
                HttpContext.Session.Set("Taikhoan", khachHangDB);
                HttpContext.Session.SetString("Name", khachHangDB.HoTen);
            }

            return RedirectToAction("ThongTin");
        }
        public IActionResult DoiMatKhau()
        {
            if (HttpContext.Session.Get("Taikhoan") == null)
                return RedirectToAction("Dangnhap", "Home");
            var khachHang = HttpContext.Session.Get<Khachhang>("Taikhoan");
            return View(khachHang);
        }
        [HttpPost]
        public IActionResult DoiMatKhau(string matKhauCu, string matKhauMoi, string xacNhanMatKhau)
        {
            using (var data = new MinkyShopContext())
            {
                Khachhang khachHang = HttpContext.Session.Get<Khachhang>("Taikhoan");
                var user = data.Khachhangs.SingleOrDefault(u => u.Taikhoan == khachHang.Taikhoan);
                if (user != null && user.Matkhau == matKhauCu)
                {
                    if (matKhauMoi == xacNhanMatKhau)
                    {
                        user.Matkhau = matKhauMoi;
                        data.SaveChanges();
                        TempData["PasswordChanged"] = "true";
                        return RedirectToAction("DoiMatKhau");
                    }
                    else
                        TempData["ErrorMessage"] = "Mật khẩu mới và xác nhận mật khẩu mới không trùng khớp.";
                }
                else
                    TempData["ErrorMessage"] = "Mật khẩu hiện tại không chính xác.";
            }
            return RedirectToAction("DoiMatKhau");
        }
        public IActionResult LichSuMuaHang()
        {
            if (HttpContext.Session.Get("Taikhoan") == null)
                return RedirectToAction("Dangnhap", "Home");
            var khachHang = HttpContext.Session.Get<Khachhang>("Taikhoan");
            var hoadon = from hd in data.Dondathangs
                         where hd.MaKh == khachHang.MaKh
                         orderby hd.Ngaydat descending
                         select hd;
            return View(hoadon);
        }

        public IActionResult HuyDonHang(int id)
        {
            var donHang = data.Dondathangs.FirstOrDefault(dh => dh.MaDonHang == id);
            if (donHang == null)
                return NotFound();
            if (donHang.Tinhtranggiaohang == "chua giao")
            {
                donHang.Tinhtranggiaohang = "da huy";
                data.SaveChanges();
                return RedirectToAction("LichSuMuaHang");
            }
            else
            {
                return RedirectToAction("LichSuMuaHang");
            }
        }

        public IActionResult ChiTietLichSu(int id)
        {
            if (HttpContext.Session.Get("Taikhoan") == null)
                return RedirectToAction("Dangnhap", "Home");
            var find = data.Dondathangs.FirstOrDefault(p => p.MaDonHang == id);
            if (find != null)
            {
                var cthd = data.Chitietdonthangs.Where(p => p.MaDonHang == id).ToList();
                ViewBag.cthd = cthd;
                var anhSanPham = new Dictionary<int, string>();
                var tenSanPham = new Dictionary<int, string>();
                foreach (var item in cthd)
                {
                    var sanPham = data.Sanphams.FirstOrDefault(s => s.MaSp == item.MaSp);
                    if (sanPham != null)
                    {
                        anhSanPham[item.MaSp] = sanPham.Anhbia;
                        tenSanPham[item.MaSp] = sanPham.TenSp;
                    }
                }
                ViewBag.anhSanPham = anhSanPham;
                ViewBag.tenSanPham = tenSanPham;
                return View(find);
            }
            return RedirectToAction("Index", "Home");
        }
    }
}
