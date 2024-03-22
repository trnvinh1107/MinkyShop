using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Loai
{
    public int MaL { get; set; }

    public int? MaDm { get; set; }

    public string TenLoai { get; set; } = null!;

    public virtual Danhmuc? MaDmNavigation { get; set; }

    public virtual ICollection<Sanpham> Sanphams { get; set; } = new List<Sanpham>();
}
