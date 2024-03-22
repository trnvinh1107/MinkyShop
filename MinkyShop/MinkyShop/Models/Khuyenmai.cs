using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Khuyenmai
{
    public int MaKhuyenMai { get; set; }

    public string? LoaiMaKhuyenMai { get; set; }

    public string? TenKhuyenMai { get; set; }

    public string? CodeMaKhuyenMai { get; set; }

    public double? GiaTri { get; set; }

    public int? SoLuong { get; set; }

    public DateTime? HanSuDung { get; set; }
}
