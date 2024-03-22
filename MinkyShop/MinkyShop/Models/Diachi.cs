using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Diachi
{
    public int MaDiaChi { get; set; }

    public int? MaKh { get; set; }

    public string? TenNguoiNhann { get; set; }

    public string? Sdt { get; set; }

    public string? DiaChi1 { get; set; }

    public virtual Khachhang? MaKhNavigation { get; set; }
}
