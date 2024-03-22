using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;
using System.Diagnostics;
using System;
using System.Net.Mail;
using System.Net;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace MinkyShop.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly MinkyShopContext data;
        public HomeController(ILogger<HomeController> logger, MinkyShopContext MinkyShopContext)
        {
            _logger = logger;
            data = MinkyShopContext;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Search(String search)
        {
            var sanpham = from sp in data.Sanphams select sp;
            if (!String.IsNullOrEmpty(search))
                sanpham = sanpham.Where(s => s.TenSp.Contains(search));
            ViewBag.SearchKey = search;
            return View(sanpham.ToList());
        }
        public IActionResult ThongTinCuaHang()
        {
            return View();
        }
        public IActionResult Blog()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Dangky()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Dangky(Khachhang kh)
        {
            if (ModelState.IsValid) // Kiểm tra tính hợp lệ của mô hình
            {
                data.Khachhangs.Add(kh);
                data.SaveChanges();
                return RedirectToAction("Dangnhap");
            }

            return View(kh);
        }
        public IActionResult Dangnhap()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Dangnhap(string TenDN, string Matkhau)
        {
            if (string.IsNullOrEmpty(TenDN))
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            else if (string.IsNullOrEmpty(Matkhau))
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            else
            {
                Khachhang kh = data.Khachhangs.SingleOrDefault(n => n.Taikhoan == TenDN && n.Matkhau == Matkhau);
                if (kh != null)
                {
                    HttpContext.Session.Set("Taikhoan", kh);
                    HttpContext.Session.SetString("Name", data.Khachhangs.FirstOrDefault(i => i.Taikhoan == kh.Taikhoan).HoTen);
                    return RedirectToAction("Index", "Home");
                }
                else
                    ViewData["Thongbao"] = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }

        public IActionResult QuenMatKhau()
        {
            return View();
        }
        [HttpPost]
        public IActionResult QuenMatKhau([FromForm] IFormCollection collection, Khachhang kh)
        {
            var email = collection["Mail"];
            kh = data.Khachhangs.SingleOrDefault(n => n.Email == email.ToString());

            if (kh != null)
            {
                string MatKhauMoi = MatKhauNgauNhien(12);
                kh.Matkhau = MatKhauMoi;
                data.SaveChanges();
                string EmailGui = "MinkyShopthucunghutech@gmail.com";
                string PassGui = "rxpwvlwavztvkrev";
                string TieuDe = "Reset Password";
                string NoiDung = "Đây là mật khẩu mới của bạn: " + MatKhauMoi;
                using (var smtpClient = new SmtpClient("smtp.gmail.com"))
                {
                    smtpClient.Port = 587;
                    smtpClient.Credentials = new NetworkCredential(EmailGui, PassGui);
                    smtpClient.EnableSsl = true;

                    var mail = new MailMessage
                    {
                        From = new MailAddress(EmailGui),
                        Subject = TieuDe,
                        Body = NoiDung,
                        IsBodyHtml = true,
                    };
                    mail.To.Add(email);
                    try
                    {
                        smtpClient.Send(mail);
                        ViewBag.Message = "Một email kèm mật khẩu mới đã được gửi đến địa chỉ email của bạn";
                    }
                    catch (Exception ex)
                    {
                        ViewBag.Error = $"Lỗi gửi email: {ex.Message}";
                    }
                }
            }
            else
                ViewBag.Error = "Địa chỉ email không được tìm thấy trong cơ sở dữ liệu.";
            return RedirectToAction("DangNhap", "Home");
        }
        private string MatKhauNgauNhien(int length)
        {
            const string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            StringBuilder password = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int index = random.Next(characters.Length);
                password.Append(characters[index]);
            }
            return password.ToString();
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}