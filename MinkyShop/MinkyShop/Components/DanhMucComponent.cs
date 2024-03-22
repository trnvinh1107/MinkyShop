using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Components
{
    [ViewComponent(Name = "DanhMuc")]
    public class DanhMucComponent : ViewComponent
    {
        private MinkyShopContext data;
        public DanhMucComponent(MinkyShopContext context)
        {
            data = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var Danhmuc = (from dm in data.Danhmucs select dm).ToList();
            return await Task.FromResult((IViewComponentResult)View("Default", Danhmuc));
        }
    }
}
