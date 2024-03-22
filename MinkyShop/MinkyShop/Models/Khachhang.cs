using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Khachhang
{
    public int MaKh { get; set; }

    public string HoTen { get; set; } = null!;

    public string? Taikhoan { get; set; }

    public string Matkhau { get; set; } = null!;

    public string? Email { get; set; }

    public DateTime? Ngaysinh { get; set; }

    public virtual ICollection<Diachi> Diachis { get; set; } = new List<Diachi>();

    public virtual ICollection<Dondathang> Dondathangs { get; set; } = new List<Dondathang>();
}
