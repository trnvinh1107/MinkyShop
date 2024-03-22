using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;
using System.Net.Mail;
using System.Net;

namespace MinkyShop.Controllers
{
    public class GioHangController : Controller
    {
        private readonly MinkyShopContext data;
        private readonly IWebHostEnvironment _env;
        public GioHangController(MinkyShopContext context, IWebHostEnvironment env)
        {
            data = context;
            _env = env;
        }
        public IActionResult Index()
        {
            List<Giohang> lstGiohang = Laygiohang();
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView("Index", lstGiohang);
        }


        public Task<IActionResult> Gia()
        {
            var tongsoluong =  TongSoLuong();
            var tongtien =  TongTien();
            ViewBag.Tongsoluong = tongsoluong;
            ViewBag.Tongtien = tongtien;
            return Task.FromResult<IActionResult>(PartialView("Gia"));
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

        public IActionResult ThemGiohang(int iMaSp, string strURL)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.Find(n => n.iMaSp == iMaSp);
            if (sanpham == null)
            {
                sanpham = new Giohang(iMaSp);
                lstGiohang.Add(sanpham);
            }
            else
            {
                sanpham.iSoluong++;
            }

            HttpContext.Session.Set("Giohang", lstGiohang);

            return Redirect(strURL);
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

        public IActionResult GioHang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
                return RedirectToAction("Index", "Home");

            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();

            return View(lstGiohang);
        }

        public IActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }

        public IActionResult CapnhatGiohang(int iMaSP, [FromForm] FormCollection f)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.iMaSp == iMaSP);
            if (sanpham != null)
                sanpham.iSoluong = int.Parse(f["txtSoluong"].ToString());

            HttpContext.Session.Set("Giohang", lstGiohang);

            return RedirectToAction("Giohang");
        }

        public IActionResult XoaGiohang(int iMaSP)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanpham = lstGiohang.SingleOrDefault(n => n.iMaSp == iMaSP);
            if (sanpham != null)
            {
                lstGiohang.RemoveAll(n => n.iMaSp == iMaSP);
                HttpContext.Session.Set("Giohang", lstGiohang);
                return RedirectToAction("GioHang");
            }
            if (lstGiohang.Count == 0)
                return RedirectToAction("Index", "Home");

            return RedirectToAction("GioHang");
        }

        public IActionResult XoaTatcaGiohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            HttpContext.Session.Set("Giohang", lstGiohang);

            return RedirectToAction("Index", "Home");
        }

        public IActionResult DatHang()
        {
            if (HttpContext.Session.GetString("Taikhoan") == null || HttpContext.Session.GetString("Taikhoan") == "")
                return RedirectToAction("Dangnhap", "Home");
            if (HttpContext.Session.Get<List<Giohang>>("Giohang") == null)
                return RedirectToAction("Index", "Home");
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
                return RedirectToAction("Index", "Home");

            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();

            return View(lstGiohang);
        }

        [HttpPost]
        public IActionResult DatHang([FromForm] FormCollection collection)
        {
            Dondathang ddh = new Dondathang();
            Khachhang kh = HttpContext.Session.Get<Khachhang>("Taikhoan");
            List<Giohang> gh = Laygiohang();
            var sonha = collection["Sonha"];
            var phuongxa = collection["Phuongxa"];
            var quanhuyen = collection["Quanhuyen"];
            var tinhthanh = collection["Tinhthanh"];
            var dienthoai = collection["Dienthoai"];
            var diachi = sonha + ", " + phuongxa + ", " + quanhuyen + ", " + tinhthanh;
            var tennguoinhan = collection["Tennguoinhan"];
            ddh.DiaChi = diachi;
            ddh.Sdt = dienthoai;
            ddh.TenNguoiNhan = tennguoinhan;
            ddh.MaKh = kh.MaKh;
            ddh.Ngaydat = DateTime.Now;
            var ngaygiao = collection["Ngaygiao"];
            ddh.Ngaygiao = DateTime.Parse(ngaygiao);
            var ghichu = collection["Ghichu"];
            ddh.Ghichu = ghichu;
            ddh.Tinhtranggiaohang = "chua giao";
            var voucher = collection["Voucher"];
            ddh.MaVoucher = voucher;
            var maVoucher = data.Khuyenmais.FirstOrDefault(p => p.CodeMaKhuyenMai == ddh.MaVoucher);
            var tongtien = (decimal)TongTien();
            var thanhtien = (decimal)TongTien();
            if (maVoucher != null)
            {
                if (maVoucher.LoaiMaKhuyenMai == "tien")
                {
                    tongtien -= (decimal)maVoucher.GiaTri;
                    if (tongtien < 0)
                        tongtien = 0;
                }
                else
                    tongtien = tongtien - tongtien * (decimal)maVoucher.GiaTri;
            }
            ddh.TongGia = tongtien;
            data.Dondathangs.Add(ddh);
            data.SaveChanges();
            foreach (var item in gh)
            {
                Chitietdonthang ctdh = new Chitietdonthang();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.MaSp = item.iMaSp;
                ctdh.Soluong = item.iSoluong;
                ctdh.Dongia = (decimal)item.dDongia;
                data.Chitietdonthangs.Add(ctdh);
                Sanpham sp = data.Sanphams.SingleOrDefault(s => s.MaSp == item.iMaSp);
                if (sp != null)
                    sp.Soluongton -= item.iSoluong;
            }
            data.SaveChanges();
            var strSanPham = "";
            foreach (var sp in gh)
            {
                strSanPham += "<tr>";
                strSanPham += "<td>" + sp.sTenSp + "</td>";
                strSanPham += "<td>" + sp.iSoluong + "</td>";
                strSanPham += "<td>" + (sp.dDongia * sp.iSoluong).ToString("N0") + "₫</td>";
                strSanPham += "</tr>";
            }
            string contentCusstomer = System.IO.File.ReadAllText(Path.Combine(_env.WebRootPath, "Content/template/senduser.html"));
            contentCusstomer = contentCusstomer.Replace("{{Tenkhachhang}}", ddh.TenNguoiNhan.ToString());
            contentCusstomer = contentCusstomer.Replace("{{Madonhang}}", ddh.MaDonHang.ToString());
            contentCusstomer = contentCusstomer.Replace("{{Ngaydat}}", ddh.Ngaydat.ToString());
            contentCusstomer = contentCusstomer.Replace("{{Sanpham}}", strSanPham);
            contentCusstomer = contentCusstomer.Replace("{{Thanhtien}}", thanhtien.ToString("N0"));
            if (maVoucher != null)
            {
                if (maVoucher.LoaiMaKhuyenMai == "tien")
                    contentCusstomer = contentCusstomer.Replace("{{Voucher}}", (-maVoucher.GiaTri).ToString());
                else
                    contentCusstomer = contentCusstomer.Replace("{{Voucher}}", (-(tongtien * (decimal)maVoucher.GiaTri)).ToString("N0"));
            }
            else
                contentCusstomer = contentCusstomer.Replace("{{Voucher}}", "0");
            contentCusstomer = contentCusstomer.Replace("{{Tongtien}}", ddh.TongGia.ToString());
            contentCusstomer = contentCusstomer.Replace("{{Diachi}}", ddh.DiaChi.ToString());
            contentCusstomer = contentCusstomer.Replace("{{Sdt}}", ddh.Sdt.ToString());
            contentCusstomer = contentCusstomer.Replace("{{Email}}", kh.Email.ToString());

            // Send email to customer
            string senderEmail = "MinkyShopthucunghutech@gmail.com";
            string senderPassword = "rxpwvlwavztvkrev";
            string subject = "Thông báo đặt hàng";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(senderEmail, senderPassword),
                EnableSsl = true,
            };
            MailMessage mail = new MailMessage
            {
                From = new MailAddress(senderEmail),
                Subject = subject,
                Body = contentCusstomer,
                IsBodyHtml = true,
            };
            mail.To.Add(kh.Email);
            try
            {
                smtpClient.Send(mail);
                ViewBag.Message = "An email with instructions to reset your password has been sent to your email address.";
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Error sending email: {ex.Message}";
            }

            string contentAdmin = System.IO.File.ReadAllText(Path.Combine(_env.WebRootPath, "Content/template/sendadmin.html"));
            contentAdmin = contentAdmin.Replace("{{Tenkhachhang}}", ddh.TenNguoiNhan.ToString());
            contentAdmin = contentAdmin.Replace("{{Madonhang}}", ddh.MaDonHang.ToString());
            contentAdmin = contentAdmin.Replace("{{Ngaydat}}", ddh.Ngaydat.ToString());
            contentAdmin = contentAdmin.Replace("{{Sanpham}}", strSanPham);
            contentAdmin = contentAdmin.Replace("{{Thanhtien}}", thanhtien.ToString("N0"));
            if (maVoucher != null)
            {
                if (maVoucher.LoaiMaKhuyenMai == "tien")
                    contentAdmin = contentAdmin.Replace("{{Voucher}}", (-maVoucher.GiaTri).ToString());
                else
                    contentAdmin = contentAdmin.Replace("{{Voucher}}", (-(tongtien * (decimal)maVoucher.GiaTri)).ToString("N0"));
            }
            else
                contentAdmin = contentAdmin.Replace("{{Voucher}}", "0");
            contentAdmin = contentAdmin.Replace("{{Tongtien}}", ddh.TongGia.ToString());
            contentAdmin = contentAdmin.Replace("{{Diachi}}", ddh.DiaChi.ToString());
            contentAdmin = contentAdmin.Replace("{{Sdt}}", ddh.Sdt.ToString());
            contentAdmin = contentAdmin.Replace("{{Email}}", kh.Email.ToString());

            // Send email to admin
            string senderEmailAdmin = "MinkyShopthucunghutech@gmail.com";
            string senderPasswordAdmin = "rxpwvlwavztvkrev";
            string subjectAdmin = "Thông báo đặt hàng";
            SmtpClient smtpClientAdmin = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(senderEmailAdmin, senderPasswordAdmin),
                EnableSsl = true,
            };
            MailMessage mailAdmin = new MailMessage
            {
                From = new MailAddress(senderEmailAdmin),
                Subject = subjectAdmin,
                Body = contentAdmin,
                IsBodyHtml = true,
            };
            mailAdmin.To.Add("3621132na@gmail.com");
            try
            {
                smtpClientAdmin.Send(mailAdmin);
                ViewBag.Message = "An email with instructions to reset your password has been sent to your email address.";
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"Error sending email: {ex.Message}";
            }

            HttpContext.Session.Set("Giohang", null);

            return RedirectToAction("Xacnhandonhang", "Giohang", new { maDonHang = ddh.MaDonHang });
        }

        public JsonResult ApplyVoucher(string voucherCode)
        {
            var voucher = data.Khuyenmais.SingleOrDefault(v => v.CodeMaKhuyenMai == voucherCode && v.HanSuDung >= DateTime.Now);
            if (voucher != null)
            {
                var voucherInfo = new
                {
                    Loai = voucher.LoaiMaKhuyenMai,
                    GiaTri = voucher.GiaTri,
                    TenKhuyenMai = voucher.TenKhuyenMai
                };
                return Json(new { success = true, data = voucherInfo });
            }
            else
            {
                return Json(new { success = false });
            }
        }

        public IActionResult Xacnhandonhang(int maDonHang)
        {
            var chiTietDonHang = new List<ChiTietDonHangViewModel>();
            var maVoucher = data.Dondathangs.FirstOrDefault(p => p.MaDonHang == maDonHang);
            var voucher = data.Khuyenmais.FirstOrDefault(p => p.CodeMaKhuyenMai.Equals(maVoucher.MaVoucher));
            var chiTietDonHangGoc = data.Chitietdonthangs.Where(ct => ct.MaDonHang == maDonHang).ToList();
            foreach (var item in chiTietDonHangGoc)
            {
                var tenSanPham = data.Sanphams.FirstOrDefault(sp => sp.MaSp == item.MaSp)?.TenSp;
                if (tenSanPham != null)
                {
                    var chiTietDonHangItem = new ChiTietDonHangViewModel
                    {
                        TenSP = tenSanPham,
                        Soluong = item.Soluong,
                        Dongia = item.Dongia,
                        ThanhTien = (decimal)(item.Soluong * item.Dongia)
                    };
                    chiTietDonHang.Add(chiTietDonHangItem);
                }
            }

            ViewBag.ChiTietDonHang = chiTietDonHang;

            if (voucher != null)
            {
                if (voucher.LoaiMaKhuyenMai == "tien")
                {
                    var tong = data.Chitietdonthangs
                        .Where(ct => ct.MaDonHang == maDonHang)
                        .Sum(ct => ct.Soluong * ct.Dongia) - (decimal)voucher.GiaTri;
                    if (tong < 0)
                        tong = 0;
                    ViewBag.Tongtien = tong;
                    ViewBag.Voucher = voucher.GiaTri;
                }
                else
                {
                    var tong = data.Chitietdonthangs
                        .Where(ct => ct.MaDonHang == maDonHang)
                        .Sum(ct => ct.Soluong * ct.Dongia) - data.Chitietdonthangs
                        .Where(ct => ct.MaDonHang == maDonHang)
                        .Sum(ct => ct.Soluong * ct.Dongia) * (decimal)voucher.GiaTri;
                    ViewBag.Tongtien = tong;
                    ViewBag.Voucher = data.Chitietdonthangs
                        .Where(ct => ct.MaDonHang == maDonHang)
                        .Sum(ct => ct.Soluong * ct.Dongia) * (decimal)voucher.GiaTri;
                }
            }
            else
            {
                var tong = data.Chitietdonthangs
                    .Where(ct => ct.MaDonHang == maDonHang)
                    .Sum(ct => ct.Soluong * ct.Dongia);
                ViewBag.Tongtien = tong;
                ViewBag.Voucher = 0;
            }

            return View();
        }

        public IActionResult MuaLai(int id)
        {
            var chiTietDonHang = data.Chitietdonthangs.Where(ct => ct.MaDonHang == id).ToList();
            if (chiTietDonHang.Count == 0)
                return NotFound();

            List<Giohang> lstGiohang = Laygiohang();
            foreach (var chiTiet in chiTietDonHang)
            {
                Giohang sanpham = lstGiohang.Find(n => n.iMaSp == chiTiet.MaSp);
                if (sanpham == null)
                {
                    sanpham = new Giohang(chiTiet.MaSp);
                    sanpham.iSoluong = (int)chiTiet.Soluong;
                    lstGiohang.Add(sanpham);
                }
                else
                {
                    sanpham.iSoluong += (int)chiTiet.Soluong;
                }
            }

            HttpContext.Session.Set("Giohang", lstGiohang);

            return RedirectToAction("GioHang");
        }

    }
}
