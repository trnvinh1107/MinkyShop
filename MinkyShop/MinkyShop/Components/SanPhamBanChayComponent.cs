using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Components
{
    [ViewComponent(Name = "SanPhamBanChay")]
    public class SanPhamBanChayComponent : ViewComponent
    {
        private MinkyShopContext data;
        public SanPhamBanChayComponent(MinkyShopContext context)
        {
            data = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var Sanpham = (from sp in data.Sanphams select sp).ToList();
            return await Task.FromResult((IViewComponentResult)View("Default", Sanpham));
        }
    }
}
