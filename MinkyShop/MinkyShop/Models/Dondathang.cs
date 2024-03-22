using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Dondathang
{
    public int MaDonHang { get; set; }

    public DateTime? Ngaydat { get; set; }

    public DateTime? Ngaygiao { get; set; }

    public int? MaKh { get; set; }

    public string? Ghichu { get; set; }

    public decimal? TongGia { get; set; }

    public string? Tinhtranggiaohang { get; set; }

    public string? DiaChi { get; set; }

    public string? Sdt { get; set; }

    public string? TenNguoiNhan { get; set; }

    public string? MaVoucher { get; set; }

    public virtual ICollection<Chitietdonthang> Chitietdonthangs { get; set; } = new List<Chitietdonthang>();

    public virtual Khachhang? MaKhNavigation { get; set; }
}
