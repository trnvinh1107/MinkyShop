using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Controllers
{
    public class NhaCungCapController : Controller
    {
        private readonly MinkyShopContext data;
        public NhaCungCapController(MinkyShopContext context)
        {
            data = context;
        }
        public IActionResult Index()
        {
            var nhacungcap = data.Nhacungcaps.ToList();
            return View(nhacungcap);
        }

        public IActionResult Search(string search)
        {
            var nhacungcap = from ncc in data.Nhacungcaps select ncc;
            if (!String.IsNullOrEmpty(search))
                nhacungcap = nhacungcap.Where(s => s.TenNcc.Contains(search));
            ViewBag.Search = search;
            return View("Index", nhacungcap);
        }
        public IActionResult Details(int id)
        {
            var nhacungcap = data.Nhacungcaps.SingleOrDefault(ncc => ncc.MaNcc == id);
            if (nhacungcap == null)
            {
                return NotFound();
            }
            return View(nhacungcap);
        }
        public IActionResult Themmoinhacungcap()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Themmoinhacungcap(Nhacungcap nhacc)
        {
            if (ModelState.IsValid)
            {
                data.Nhacungcaps.Add(nhacc);
                data.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nhacc);
        }
        public IActionResult XoaNcc(int id)
        {
            var ncc = data.Nhacungcaps.SingleOrDefault(n => n.MaNcc == id);
            if (ncc == null)
            {
                return NotFound();
            }
            return View(ncc);
        }

        [HttpPost, ActionName("XoaNcc")]
        [ValidateAntiForgeryToken]
        public IActionResult Xacnhanxoa(int id)
        {
            var ncc = data.Nhacungcaps.SingleOrDefault(n => n.MaNcc == id);
            if (ncc == null)
            {
                return NotFound();
            }
            data.Nhacungcaps.Remove(ncc);
            data.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult SuaNhacc(int id)
        {
            var ncc = data.Nhacungcaps.SingleOrDefault(n => n.MaNcc == id);
            if (ncc == null)
            {
                return NotFound();
            }
            return View(ncc);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaNhacc(Nhacungcap nhacc)
        {
            var ncc = data.Nhacungcaps.SingleOrDefault(n => n.MaNcc == nhacc.MaNcc);
            if (ncc == null)
            {
                return NotFound();
            }
            ncc.TenNcc = nhacc.TenNcc;
            ncc.Diachi = nhacc.Diachi;
            ncc.DienThoai = nhacc.DienThoai;
            data.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
