using Microsoft.AspNetCore.Mvc;
using MinkyShop.Models;

namespace MinkyShop.Components
{
    [ViewComponent(Name = "NhaCungCap")]
    public class NhaCungCapComponent : ViewComponent
    {
        private MinkyShopContext data;
        public NhaCungCapComponent(MinkyShopContext context)
        {
            data = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var Nhacungcap = (from ncc in data.Nhacungcaps select ncc).ToList();
            return await Task.FromResult((IViewComponentResult)View("Default", Nhacungcap));
        }
    }
}
