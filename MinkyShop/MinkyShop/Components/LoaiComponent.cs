using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Components
{
    [ViewComponent(Name = "Loai")]
    public class LoaiComponent : ViewComponent
    {
        private MinkyShopContext data;
        public LoaiComponent(MinkyShopContext context)
        {
            data = context;
        }
        public async Task<IViewComponentResult> InvokeAsync(int danhmuc)
        {
            var Loai = (from l in data.Loais where l.MaDm == danhmuc select l).ToList();
            return await Task.FromResult((IViewComponentResult)View("Default", Loai));
        }
    }
}
