using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MinkyShop.Models;

public partial class MinkyShopContext : DbContext
{
    public MinkyShopContext()
    {
    }

    public MinkyShopContext(DbContextOptions<MinkyShopContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Admin> Admins { get; set; }

    public virtual DbSet<Chitietdonthang> Chitietdonthangs { get; set; }

    public virtual DbSet<Danhmuc> Danhmucs { get; set; }

    public virtual DbSet<Diachi> Diachis { get; set; }

    public virtual DbSet<Dondathang> Dondathangs { get; set; }

    public virtual DbSet<Khachhang> Khachhangs { get; set; }

    public virtual DbSet<Khuyenmai> Khuyenmais { get; set; }

    public virtual DbSet<Loai> Loais { get; set; }

    public virtual DbSet<Nhacungcap> Nhacungcaps { get; set; }

    public virtual DbSet<NhanXet> NhanXets { get; set; }

    public virtual DbSet<Sanpham> Sanphams { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=I_AM_PEWNOY\\MAYAO;Initial Catalog=MinkyShop;Integrated Security=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Admin>(entity =>
        {
            entity.HasKey(e => e.UserAdmin).HasName("PK__ADMIN__AF86462BD99B60B4");

            entity.ToTable("ADMIN");

            entity.Property(e => e.UserAdmin)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.HoTen).HasMaxLength(50);
            entity.Property(e => e.PassAdmin)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Chitietdonthang>(entity =>
        {
            entity.HasKey(e => new { e.MaDonHang, e.MaSp }).HasName("PK_CTDatHang");

            entity.ToTable("CHITIETDONTHANG");

            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.Dongia).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.MaDonHangNavigation).WithMany(p => p.Chitietdonthangs)
                .HasForeignKey(d => d.MaDonHang)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DonHang");

            entity.HasOne(d => d.MaSpNavigation).WithMany(p => p.Chitietdonthangs)
                .HasForeignKey(d => d.MaSp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SanPham");
        });

        modelBuilder.Entity<Danhmuc>(entity =>
        {
            entity.HasKey(e => e.MaDm).HasName("PK_DanhMuc");

            entity.ToTable("DANHMUC");

            entity.Property(e => e.MaDm).HasColumnName("MaDM");
            entity.Property(e => e.TenDanhMuc).HasMaxLength(50);
        });

        modelBuilder.Entity<Diachi>(entity =>
        {
            entity.HasKey(e => e.MaDiaChi);

            entity.ToTable("DIACHI");

            entity.Property(e => e.MaDiaChi).ValueGeneratedNever();
            entity.Property(e => e.DiaChi1)
                .HasMaxLength(500)
                .HasColumnName("DiaChi");
            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.Sdt)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.TenNguoiNhann).HasMaxLength(50);

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.Diachis)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK_DIACHI_KHACHHANG");
        });

        modelBuilder.Entity<Dondathang>(entity =>
        {
            entity.HasKey(e => e.MaDonHang).HasName("PK_DonDatHang");

            entity.ToTable("DONDATHANG");

            entity.Property(e => e.DiaChi).HasMaxLength(250);
            entity.Property(e => e.Ghichu).HasMaxLength(500);
            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.MaVoucher)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Ngaydat).HasColumnType("date");
            entity.Property(e => e.Ngaygiao).HasColumnType("date");
            entity.Property(e => e.Sdt)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TenNguoiNhan).HasMaxLength(50);
            entity.Property(e => e.Tinhtranggiaohang).HasMaxLength(50);
            entity.Property(e => e.TongGia).HasColumnType("decimal(18, 0)");

            entity.HasOne(d => d.MaKhNavigation).WithMany(p => p.Dondathangs)
                .HasForeignKey(d => d.MaKh)
                .HasConstraintName("FK_Khachhang");
        });

        modelBuilder.Entity<Khachhang>(entity =>
        {
            entity.HasKey(e => e.MaKh).HasName("PK_Khachhang");

            entity.ToTable("KHACHHANG");

            entity.HasIndex(e => e.Taikhoan, "UQ__KHACHHAN__7FB3F64FC08A3864").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__KHACHHAN__A9D105342273C2BD").IsUnique();

            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.HoTen).HasMaxLength(50);
            entity.Property(e => e.Matkhau)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Ngaysinh).HasColumnType("datetime");
            entity.Property(e => e.Taikhoan)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Khuyenmai>(entity =>
        {
            entity.HasKey(e => e.MaKhuyenMai);

            entity.ToTable("KHUYENMAI");

            entity.Property(e => e.MaKhuyenMai).ValueGeneratedNever();
            entity.Property(e => e.CodeMaKhuyenMai)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.HanSuDung).HasColumnType("date");
            entity.Property(e => e.LoaiMaKhuyenMai).HasMaxLength(50);
            entity.Property(e => e.TenKhuyenMai).HasMaxLength(50);
        });

        modelBuilder.Entity<Loai>(entity =>
        {
            entity.HasKey(e => e.MaL).HasName("PK_Loai");

            entity.ToTable("LOAI");

            entity.Property(e => e.MaDm).HasColumnName("MaDM");
            entity.Property(e => e.TenLoai).HasMaxLength(50);

            entity.HasOne(d => d.MaDmNavigation).WithMany(p => p.Loais)
                .HasForeignKey(d => d.MaDm)
                .HasConstraintName("FK_DanhMuc");
        });

        modelBuilder.Entity<Nhacungcap>(entity =>
        {
            entity.HasKey(e => e.MaNcc).HasName("PK_NhaCungCap");

            entity.ToTable("NHACUNGCAP");

            entity.Property(e => e.MaNcc).HasColumnName("MaNCC");
            entity.Property(e => e.Diachi).HasMaxLength(200);
            entity.Property(e => e.DienThoai)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TenNcc)
                .HasMaxLength(50)
                .HasColumnName("TenNCC");
        });

        modelBuilder.Entity<NhanXet>(entity =>
        {
            entity.HasKey(e => e.MaNhanXet);

            entity.ToTable("NhanXet");

            entity.Property(e => e.MaNhanXet).ValueGeneratedNever();
            entity.Property(e => e.HinhAnh)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MaHd).HasColumnName("MaHD");
            entity.Property(e => e.MaKh).HasColumnName("MaKH");
            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.NoiDung).HasMaxLength(255);
        });

        modelBuilder.Entity<Sanpham>(entity =>
        {
            entity.HasKey(e => e.MaSp).HasName("PK_SanPham");

            entity.ToTable("SANPHAM");

            entity.Property(e => e.MaSp).HasColumnName("MaSP");
            entity.Property(e => e.Anhbia)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Giaban).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.MaNcc).HasColumnName("MaNCC");
            entity.Property(e => e.Ngaycapnhat).HasColumnType("datetime");
            entity.Property(e => e.TenSp)
                .HasMaxLength(100)
                .HasColumnName("TenSP");

            entity.HasOne(d => d.MaLNavigation).WithMany(p => p.Sanphams)
                .HasForeignKey(d => d.MaL)
                .HasConstraintName("FK_Loai");

            entity.HasOne(d => d.MaNccNavigation).WithMany(p => p.Sanphams)
                .HasForeignKey(d => d.MaNcc)
                .HasConstraintName("FK_NhaCungCap");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
