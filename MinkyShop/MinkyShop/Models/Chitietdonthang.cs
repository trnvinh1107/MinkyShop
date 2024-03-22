using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Chitietdonthang
{
    public int MaDonHang { get; set; }

    public int MaSp { get; set; }

    public int? Soluong { get; set; }

    public decimal? Dongia { get; set; }

    public virtual Dondathang MaDonHangNavigation { get; set; } = null!;

    public virtual Sanpham MaSpNavigation { get; set; } = null!;
}
