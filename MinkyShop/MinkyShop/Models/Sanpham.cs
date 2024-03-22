using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Sanpham
{
    public int MaSp { get; set; }

    public string TenSp { get; set; } = null!;

    public decimal? Giaban { get; set; }

    public string? Mota { get; set; }

    public string? Anhbia { get; set; }

    public DateTime? Ngaycapnhat { get; set; }

    public int? Soluongton { get; set; }

    public int? MaL { get; set; }

    public int? MaNcc { get; set; }

    public virtual ICollection<Chitietdonthang> Chitietdonthangs { get; set; } = new List<Chitietdonthang>();

    public virtual Loai? MaLNavigation { get; set; }

    public virtual Nhacungcap? MaNccNavigation { get; set; }
}
