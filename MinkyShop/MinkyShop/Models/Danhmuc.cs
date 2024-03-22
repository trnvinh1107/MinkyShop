using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Danhmuc
{
    public int MaDm { get; set; }

    public string TenDanhMuc { get; set; } = null!;

    public virtual ICollection<Loai> Loais { get; set; } = new List<Loai>();
}
