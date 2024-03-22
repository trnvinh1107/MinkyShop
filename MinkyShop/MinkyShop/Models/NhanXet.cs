using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class NhanXet
{
    public int MaNhanXet { get; set; }

    public string? NoiDung { get; set; }

    public string? HinhAnh { get; set; }

    public int? MaKh { get; set; }

    public int? MaSp { get; set; }

    public int? MaHd { get; set; }
}
