USE [master]
GO
/****** Object:  Database [MinkyShop]    Script Date: 9/30/2023 8:59:48 AM ******/
CREATE DATABASE [MinkyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MinkyShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ADMIN\MSSQL\DATA\MinkyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MinkyShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ADMIN\MSSQL\DATA\MinkyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MinkyShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MinkyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MinkyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MinkyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MinkyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MinkyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MinkyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MinkyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MinkyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MinkyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MinkyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MinkyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MinkyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MinkyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MinkyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MinkyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MinkyShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MinkyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MinkyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MinkyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MinkyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MinkyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MinkyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MinkyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MinkyShop] SET RECOVERY FULL 
GO
ALTER DATABASE [MinkyShop] SET  MULTI_USER 
GO
ALTER DATABASE [MinkyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MinkyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MinkyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MinkyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MinkyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MinkyShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MinkyShop', N'ON'
GO
ALTER DATABASE [MinkyShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [MinkyShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MinkyShop]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
use MinkyShop
go
CREATE TABLE [dbo].[ADMIN](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CTDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIACHI]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIACHI](
	[MaDiaChi] [int] NOT NULL,
	[MaKH] [int] NULL,
	[TenNguoiNhann] [nvarchar](50) NULL,
	[Sdt] [varchar](10) NULL,
	[DiaChi] [nvarchar](500) NULL,
 CONSTRAINT [PK_DIACHI] PRIMARY KEY CLUSTERED 
(
	[MaDiaChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Ngaydat] [date] NULL,
	[Ngaygiao] [date] NULL,
	[MaKH] [int] NULL,
	[Ghichu] [nvarchar](500) NULL,
	[TongGia] [decimal](18, 0) NULL,
	[Tinhtranggiaohang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Sdt] [varchar](50) NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[MaVoucher] [varchar](50) NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHUYENMAI]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYENMAI](
	[MaKhuyenMai] [int] NOT NULL,
	[LoaiMaKhuyenMai] [nvarchar](50) NULL,
	[TenKhuyenMai] [nvarchar](50) NULL,
	[CodeMaKhuyenMai] [varchar](50) NULL,
	[GiaTri] [float] NULL,
	[SoLuong] [int] NULL,
	[HanSuDung] [date] NULL,
 CONSTRAINT [PK_KHUYENMAI] PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAI]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI](
	[MaL] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 9/30/2023 8:59:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Mota] [nvarchar](max) NULL,
	[Anhbia] [varchar](50) NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Soluongton] [int] NULL,
	[MaL] [int] NULL,
	[MaNCC] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ADMIN] ([UserAdmin], [PassAdmin], [HoTen]) VALUES (N'admin1', N'admin1', N'Trần Thế Vinh')
GO
INSERT [dbo].[ADMIN] ([UserAdmin], [PassAdmin], [HoTen]) VALUES (N'admin2', N'admin2', N'Lỷ Thanh Kỳ')
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (1, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (2, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (3, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (4, 1, 2, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (5, 11, 2, CAST(117000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (6, 5, 2, CAST(29000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (7, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (8, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (8, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (9, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (9, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (10, 1, 3, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (10, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (11, 1, 2, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (11, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (12, 1, 2, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (12, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (13, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (13, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (14, 1, 2, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (14, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (15, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (16, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (17, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (18, 1, 2, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (19, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (20, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (21, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (22, 4, 1, CAST(67000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (23, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (24, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (25, 1, 2, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (25, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (26, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (27, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (28, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (29, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (30, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (31, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (32, 4, 1, CAST(67000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (33, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (34, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (35, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (36, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (37, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (38, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (39, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (40, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (41, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (42, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (43, 3, 1, CAST(19000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (44, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (45, 3, 1, CAST(19000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (46, 3, 2, CAST(19000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (47, 2, 1, CAST(109000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (48, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (49, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (50, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (51, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (52, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (53, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (54, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (55, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (56, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaSP], [Soluong], [Dongia]) VALUES (57, 1, 1, CAST(165000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 
GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (1, N'Thức ăn cho mèo')
GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (2, N'Thức ăn cho chó')
GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (3, N'Thức ăn cho thú cưng khác')
GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (4, N'Chăm sóc thú cưng')
GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (5, N'Phụ kiện chăm sóc')
GO
INSERT [dbo].[DANHMUC] ([MaDM], [TenDanhMuc]) VALUES (6, N'Phụ kiện khác')
GO
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
GO
INSERT [dbo].[DIACHI] ([MaDiaChi], [MaKH], [TenNguoiNhann], [Sdt], [DiaChi]) VALUES (1, 1, N'manh', N'0123456789', N'haha')
GO
INSERT [dbo].[DIACHI] ([MaDiaChi], [MaKH], [TenNguoiNhann], [Sdt], [DiaChi]) VALUES (2, 1, N'manh', N'0123456789', N'hehe')
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (1, CAST(N'2023-04-11' AS Date), CAST(N'2023-11-04' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'giao thanh cong', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (2, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-24' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (3, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-24' AS Date), 1, N'Test', CAST(165000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (4, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-23' AS Date), 1, N'Test TIếp', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (5, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-23' AS Date), 1, N'', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (6, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-23' AS Date), 1, N'', CAST(58000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (7, CAST(N'2023-05-23' AS Date), CAST(N'2023-05-24' AS Date), 3, N'', CAST(165000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (8, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-24' AS Date), 3, N'', CAST(274000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (9, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-25' AS Date), 3, N'', CAST(274000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (10, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-25' AS Date), 3, N'', CAST(604000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (11, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-25' AS Date), 3, N'', CAST(439000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (12, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-25' AS Date), 3, N'', CAST(439000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (13, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-25' AS Date), 3, N'', CAST(274000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (14, CAST(N'2023-05-24' AS Date), CAST(N'2023-05-25' AS Date), 4, N'', CAST(439000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (15, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-03' AS Date), 4, N'', CAST(165000 AS Decimal(18, 0)), N'0', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (16, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), 4, N'test', CAST(165000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (17, CAST(N'2023-06-20' AS Date), CAST(N'2023-06-21' AS Date), 1, N'test', CAST(165000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (18, CAST(N'2023-06-20' AS Date), CAST(N'2023-06-20' AS Date), 1, N'', CAST(330000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (19, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-20' AS Date), 10, N'', CAST(165000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (20, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-22' AS Date), 10, N'', CAST(109000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (21, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-22' AS Date), 10, N'', CAST(109000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (22, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-20' AS Date), 10, N'', CAST(67000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (23, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-22' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (24, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-22' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (25, CAST(N'2023-09-21' AS Date), CAST(N'2023-09-21' AS Date), 1, N'', CAST(439000 AS Decimal(18, 0)), N'giao thanh cong', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (26, CAST(N'2023-09-22' AS Date), CAST(N'2023-09-22' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (27, CAST(N'2023-09-22' AS Date), CAST(N'2023-09-22' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'dang giao', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (28, CAST(N'2023-09-24' AS Date), CAST(N'2023-09-24' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'da huy', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (29, CAST(N'2023-09-24' AS Date), CAST(N'2023-09-24' AS Date), 1, N'đasa', CAST(109000 AS Decimal(18, 0)), N'da huy', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (30, CAST(N'2023-09-24' AS Date), CAST(N'2023-09-24' AS Date), 1, N'dsa', CAST(109000 AS Decimal(18, 0)), N'da huy', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (31, CAST(N'2023-09-24' AS Date), CAST(N'2023-09-24' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'da huy', N'123, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội', NULL, NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (32, CAST(N'2023-09-24' AS Date), CAST(N'2023-09-24' AS Date), 1, N'', CAST(67000 AS Decimal(18, 0)), N'da huy', N'123, Phường Tứ Liên, Quận Tây Hồ, Thành phố Hà Nội', N'0123456789', N'Bùi vy', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (33, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'da huy', N'1111, Phường Quảng An, Quận Tây Hồ, Thành phố Hà Nội', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (34, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'da huy', N'222, Xã Sủng Tráng, Huyện Yên Minh, Tỉnh Hà Giang', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (35, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'da huy', N'aa, Xã Na Khê, Huyện Yên Minh, Tỉnh Hà Giang', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (36, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'da huy', N'sadas, Xã Cô Ba, Huyện Bảo Lạc, Tỉnh Cao Bằng', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (37, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'da huy', N'111, Xã Cô Ba, Huyện Bảo Lạc, Tỉnh Cao Bằng', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (38, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'da huy', N'21312, Xã Cao Mã Pờ, Huyện Quản Bạ, Tỉnh Hà Giang', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (39, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'da huy', N'321321, Xã Pả Vi, Huyện Mèo Vạc, Tỉnh Hà Giang', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (40, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'aaax, Xã Bạch Đích, Huyện Yên Minh, Tỉnh Hà Giang', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (41, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(109000 AS Decimal(18, 0)), N'chua giao', N'111s, Xã Bảo Toàn, Huyện Bảo Lạc, Tỉnh Cao Bằng', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (42, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'11aa, Phường Ngọc Hà, Thành phố Hà Giang, Tỉnh Hà Giang', N'', N'', NULL)
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (43, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(-31000 AS Decimal(18, 0)), N'da huy', N'dsadsadsa, Xã Cô Ba, Huyện Bảo Lạc, Tỉnh Cao Bằng', N'', N'', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (44, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(59000 AS Decimal(18, 0)), N'chua giao', N'111, Xã Quang Vinh, Huyện Trùng Khánh, Tỉnh Cao Bằng', N'', N'', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (45, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(-31000 AS Decimal(18, 0)), N'da huy', N'đasa, Xã Quang Vinh, Huyện Trùng Khánh, Tỉnh Cao Bằng', N'', N'', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (46, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(0 AS Decimal(18, 0)), N'da huy', N'đasa, Xã Cao Chương, Huyện Trùng Khánh, Tỉnh Cao Bằng', N'', N'', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (47, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(98100 AS Decimal(18, 0)), N'chua giao', N'dsdsad, Xã Thanh Vân, Huyện Quản Bạ, Tỉnh Hà Giang', N'', N'dsada', N'AGS789')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (48, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(115000 AS Decimal(18, 0)), N'chua giao', N'dsadsa, , , ', N'', N'', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (49, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(148500 AS Decimal(18, 0)), N'chua giao', N'dsadsa, , , ', N'', N'', N'AGS789')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (50, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'dsadsads, , , ', N'', N'', N'')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (51, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(115000 AS Decimal(18, 0)), N'chua giao', N'dsadsa, , , ', N'', N'', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (52, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-26' AS Date), 1, N'', CAST(148500 AS Decimal(18, 0)), N'chua giao', N'dsadas, , , ', N'', N'', N'AGS789')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (53, CAST(N'2023-09-25' AS Date), CAST(N'2023-09-25' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'dsaddsaas, , , ', N'', N'', N'')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (54, CAST(N'2023-09-26' AS Date), CAST(N'2023-09-26' AS Date), 1, N'', CAST(115000 AS Decimal(18, 0)), N'da huy', N'dsda, Phường Đồng Xuân, Quận Hoàn Kiếm, Thành phố Hà Nội', N'', N'Test', N'GIAM50')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (55, CAST(N'2023-09-26' AS Date), CAST(N'2023-09-26' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'vdsvds, , , ', N'', N'', N'')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (56, CAST(N'2023-09-26' AS Date), CAST(N'2023-09-26' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'dsadsa, , , ', N'', N'', N'')
GO
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Ngaydat], [Ngaygiao], [MaKH], [Ghichu], [TongGia], [Tinhtranggiaohang], [DiaChi], [Sdt], [TenNguoiNhan], [MaVoucher]) VALUES (57, CAST(N'2023-09-26' AS Date), CAST(N'2023-09-26' AS Date), 1, N'', CAST(165000 AS Decimal(18, 0)), N'chua giao', N'csczxc, , , ', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (1, N'Thanh Kỳ', N'3621132na', N'3621132', N'thanhky2706@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (2, N'Khánh vy', N'khanhvy', N'aa123', N'kvy126@gmail.com', CAST(N'2002-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (3, N'khánh như', N'knhu', N'nhungu', N'hsdg@gmail.com', CAST(N'2002-08-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (4, N'pham manh', N'manh123', N'abc123', N'hsddg@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (7, N'abc', N'user3', N'user3', N'abc@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (8, N'dsadsa', N'user2', N'user2', N'aaa@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (9, N'dsadsa', N'dsadsa', N'user2', N'vd@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (10, N'dsadas', N'dâs', N'user2', N'da@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (12, N'hihi', N'hahaha', N'user2', N'zxc@gmail.com', CAST(N'2001-11-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [Ngaysinh]) VALUES (13, N'haha', N'qweer', N'admin1', N'abc@gmail.com', CAST(N'2002-06-11T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
INSERT [dbo].[KHUYENMAI] ([MaKhuyenMai], [LoaiMaKhuyenMai], [TenKhuyenMai], [CodeMaKhuyenMai], [GiaTri], [SoLuong], [HanSuDung]) VALUES (1, N'tien', N'Mã giảm giá 50k', N'GIAM50', 50000, 100, CAST(N'2023-09-26' AS Date))
GO
INSERT [dbo].[KHUYENMAI] ([MaKhuyenMai], [LoaiMaKhuyenMai], [TenKhuyenMai], [CodeMaKhuyenMai], [GiaTri], [SoLuong], [HanSuDung]) VALUES (2, N'phantram', N'Mã giảm giá 10%', N'AGS789', 0.1, 100, CAST(N'2023-09-26' AS Date))
GO
SET IDENTITY_INSERT [dbo].[LOAI] ON 
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (1, 1, N'Thức ăn khô')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (2, 1, N'Thức ăn ướt')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (3, 1, N'Thức ăn kiêng')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (4, 1, N'Thức ăn lạnh')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (5, 1, N'Sữa dinh dưỡng')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (6, 2, N'Thức ăn khô')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (7, 2, N'Snack')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (8, 2, N'Kẹo sạch răng')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (9, 2, N'Kẹo xương chó')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (10, 2, N'Sửa dinh dưỡng')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (11, 2, N'Thịt que cho chó')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (12, 3, N'Cá')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (13, 3, N'Chim')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (14, 3, N'Bò sát')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (15, 3, N'Các loại thức ăn khác')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (16, 4, N'Trị ve')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (17, 4, N'Thuốc xịt')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (18, 4, N'Thuốc uống')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (19, 5, N'Bát ăn & uống')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (20, 5, N'Vòi nước uống')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (21, 5, N'Máy thức ăn tự động')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (22, 5, N'Thảm lót')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (23, 5, N'Bồn & Cát cho chó mèo')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (24, 5, N'Đồ chơi cho thú cưng')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (25, 5, N'Máy cắt tỉa lông chó mèo')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (26, 5, N'Dụng cụ vệ sinh')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (27, 5, N'Tã cho chó mèo')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (28, 6, N'Quần áo')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (29, 6, N'Phụ kiện đi xe hơi')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (30, 6, N'Túi vận chuyển')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (31, 6, N'Balo')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (32, 6, N'Lồng vận chuyển chó & mèo')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (33, 6, N'Vòng cổ, dây dắt')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (34, 6, N'Rọ mõm')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (35, 6, N'Đai yếm')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (36, 6, N'Thẻ tên')
GO
INSERT [dbo].[LOAI] ([MaL], [MaDM], [TenLoai]) VALUES (37, 6, N'Thiết bị định vị')
GO
SET IDENTITY_INSERT [dbo].[LOAI] OFF
GO
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] ON 
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (1, N'Perfect Companion Việt Nam', N'Tầng 3, Số 5 Đồng Nai, P.2, Q.Tân Bình, TP.Hồ Chí Minh', N'028 3844 0785')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (2, N'Mars Incorporated', N'Elm Street McLean, Virginia, Hoa Kỳ', N'02897826')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (3, N'Deahan Feed Co,.Ltd', N'13, Bukseongpo-gil, Jung-gu, Incheon, Korea', N' 82-32-770-1100 ~ 2')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (4, N'cityzoo VN', N'146D4 Nguyễn Văn Hưởng, Thảo Điền, Quận 2, Thành phố Hồ Chí Minh', N'0283512793')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (5, N'Thương hiệu Pedigree', N'Thái Lan', N'chua c?p nh?t')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (6, N'CAT S EYE KITTEN & CAT', N'Hàn Quốc', N'chua c?p nh?t')
GO
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [Diachi], [DienThoai]) VALUES (7, N'PETMART VIET NAM COMPANY LIMITED', N'Tầng 4, Tòa nhà HUD3 Tower,Số 121–123,đườngTô Hiệu,Phường Nguyễn Trãi,Quận Hà Đông,Tp.Hà Nội', N'028 7106 9906')
GO
SET IDENTITY_INSERT [dbo].[NHACUNGCAP] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (1, N'Hạt Royal Canin Kitten cho mèo - Túi chiết 1kg', CAST(165000 AS Decimal(18, 0)), N'Thức ăn cho mèo con ROYAL CANIN Kitten hỗ trợ sức khỏe của mèo con bằng việc cung cấp các chất dinh dưỡng chính xác dựa trên nghiên cứu của các nhà khoa học từ ROYAL CANIN. Trong giai đoạn tăng trưởng, hệ thống tiêu hóa của mèo con chưa phát triển đầy đủ, chính vì vậy ROYAL CANIN Kitten thúc đẩy sự cân bằng hệ vi sinh đường ruột, hỗ trợ sự phát triển khỏe mạnh.
', N'/assets/images/sanpham/img (1).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), -11, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (2, N'COMBO 4 loại thức ăn hạt cho mèo (Whiskas, Minino, Minino Yum, Hello Cat)', CAST(109000 AS Decimal(18, 0)), N'ACombo gồm 4 loại thức ăn khác nhau dành cho mèo. Đảm bảo cân bằng dinh dưỡng, giúp cải thiện sức khỏe toàn diện cho mèo cưng mỗi ngày 
A', N'/assets/images/sanpham/img (2).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), -5, 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (3, N'Pate Wanpy Happy 100 Thơm Ngon Cho Mèo (Lon 95g)', CAST(19000 AS Decimal(18, 0)), N'Pate Wanpy Happy 100 Lon 95g Cho Mèo - dinh dưỡng - nhiều mùi vị ngon, bổ, rẻ đang được bán bởi shop đã được chứng thực nên bạn hoàn toàn co thể an tâm khi mua hàng mà không lo mất tất cả. Hiện đã có 26 sản phẩm được bán ra nên bạn hay nhanh chân lên để chọn lấy sản phẩm xịn nhất nhưng phù hợp với túi tiền, ngoại hình của mình nhất.
', N'/assets/images/sanpham/img (3).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 6, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (4, N'[Combo 6] Pate Whiskas Cho Mèo Con 85g', CAST(67000 AS Decimal(18, 0)), N'Pate Whiskas Vị Cá Ngừ - Cá Thu 85g Cho Mèo Con là thức ăn dạng Pate đóng gói vị cá ngừ cho mèo, thơm ngon bổ dưỡng, nhập khẩu chính hãng từ Thái. Pate Whiskas Vị Cá Ngừ - Cá Thu 85g Cho Mèo Con cung cấp dinh dưỡng hoàn chỉnh cho mèo nhỏ của bạn, được phát triển độc quyền cho nhu cầu năng lượng và dinh dưỡng cao hơn của mèo con.
', N'/assets/images/sanpham/img (4).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 8, 2, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (5, N'10 Gói Súp thưởng Pet Snack món ăn ưa thích của các chú mèo', CAST(29000 AS Decimal(18, 0)), N'SÚP THƯỞNG DINH DƯỠNG PET SNACK 15g/ thanh ☀Cung cấp dinh dưỡng, kích thích các bé ăn ngon miệng hơn ☀️Siêu vỗ béo cho mèo mọi lứa tuổi ☀3 Hương vị: Ức Gà, Cá hồi, Cá ngừ ☀Date: 24 tháng tính từ ngày sản xuất, ngày sản xuất được in rõ ràng trên bao bì nhé.
', N'/assets/images/sanpham/img (5).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (6, N'que bánh từ trà xanh và sữa cho mèo', CAST(25000 AS Decimal(18, 0)), N'que bánh từ trà xanh và sữa cho mèo mùi vị thơm béo, cho bé cắn đỡ ngứa răng mà vẫn đảm bảo sức khỏe ăn kiêng.
', N'/assets/images/sanpham/img (6).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 3, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (7, N'Pate lon GimCat Shiny Cat Filet cho mèo (70g)', CAST(26000 AS Decimal(18, 0)), N'Sản phẩm gồm các miếng phi lê tươi ngon giàu dinh dưỡng được nấu vừa chín tới trong nước súp. 
2 cách ăn: Ăn riêng hoặc trộn chung với hạt hoặc cơm là có ngay một bữa ăn hoàn chỉnh đầy đủ dinh dưỡng cần thiết cho cơ thể khỏe mạnh và da lông bóng mượt', N'/assets/images/sanpham/img (7).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 4, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (8, N'[HN] 2 Cây Xúc Xích Dinh Cho Chó Mèo Xúc Xích Bioline Giàu Vitamin', CAST(3500 AS Decimal(18, 0)), N'Xúc Xích Dinh Dưỡng Giàu Vitamin, Đạm Bioline Cho Chó Mèo Xúc Xích chứa Vitamin & khoáng chất cho cơ thể những thú cưng luôn khỏe mạnh, linh hoạt. Chất xơ cho hệ thống tiêu hóa tốt, tăng cường khả năng hấp thu chất dinh dưỡng, góp phần vào sự phát triển đồng đều cho thú cưng
', N'/assets/images/sanpham/img (8).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 4, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (9, N'[HN] Combo 5 gói Sữa bột cho chó mèo Bio Milk 100gr cung cấp dinh', CAST(160000 AS Decimal(18, 0)), N'Sữa Bio-Milk là dòng sữa cao cấp chuyên dùng cho chó mèo. với thành phần giàu dinh dưỡng, cân đối và dễ tiêu hóa tương tự sữa mẹ, có tác dụng thay thế sữa mẹ trong trường hợp chó mèo mẹ mất sữa, kém sữa hoặc mất sữa, đồng thời bổ sung dưỡng chất cho chó mèo còi cọc chậm lớn
', N'/assets/images/sanpham/img (9).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 5, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (10, N'Sữa cho mèo cao cấp Msbilac God Cat 100g', CAST(37000 AS Decimal(18, 0)), N'Sữa tách béo cao cấp
Dành cho mèo, mèo non mất mẹ
Bổ sung cho mẹ ít sữa
Bổ sung dinh dưỡng cho mèo, mèo bị suy nhược.
Đầy đủ dinh dưỡng, hồi sức sau bệnh.
', N'/assets/images/sanpham/img (10).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 5, 1)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (11, N'Thức ăn cho chó trưởng thành vị gà nướng Ganador Adult Roasted', CAST(117000 AS Decimal(18, 0)), N'Thức ăn cho chó trưởng thành Ganador vị gà nướng Adult Roasted Chicken Flavor 3kg/gói. Dành cho chó trên 12 tháng tuổi. Ganador là nhãn hiệu thức ăn cho chó cưng được sản xuất bởi Tập đoàn Neovia với gần 60 năm kinh nghiệm trong lĩnh vực dinh dưỡng và chăm sóc thú cưng', N'/assets/images/sanpham/img (11).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 6, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (12, N'[85g] Pate cho chó con Royal Canin Mini Puppy', CAST(37000 AS Decimal(18, 0)), N'Thức ăn cho chó con ROYAL CANIN Mini Puppy có dạng viên hình tam giác phù hợp với cấu tạo răng của chó, giảm nguy cơ hình thành mảng bám răng ở chó. Kích thước hạt phù hợp cỡ răng, thông qua việc cọ xát vào răng giúp bảo vệ răng miệng cho chó.
', N'/assets/images/sanpham/img (12).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 6, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (13, N'Bánh thưởng Sumiho dành cho chó mèo - Gói 100g', CAST(17000 AS Decimal(18, 0)), N'Bánh thưởng cho chó Sumiho với nhiều hương vị hấp dẫn, được làm 100% từ các loại thịt thật nguyên chất (heo, bò, gà), sấy khô tự nhiên, không chất bảo quản, hoàn toàn an toàn cho sức khỏe của cún cưng.
', N'/assets/images/sanpham/img (13).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 7, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (14, N'(1 cái 6cm) Xương cho chó gặm sạch răng 6cm Xương chữ thập', CAST(7000 AS Decimal(18, 0)), N'+ Sản phẩm sử dụng nguyên liệu da bò tự nhiên
+ Dễ tiêu hóa,ít chất béo,khử men răng,m hôi miệng và phòng tránh các chứng bệnh về răng miệng
+ sản phẩm xương da doog còn bổ sung chất dinh dưỡng cần thiết cho phát triển khỏe mạnh
+ không gây hại, không chứa chất bảo quản, giúp cún con thích thú khi ăn
', N'/assets/images/sanpham/img (14).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 7, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (15, N'Xương Canxi Da Bò Cho Chó Gặm Làm Sạch Răng Giúp Răng Chắc', CAST(7000 AS Decimal(18, 0)), N'Là 1 sản phẩm của hãng sản xuất về thú cưng nổi tiếng, xương canxi được sản xuất từ các nguyên liệu an toàn, thơm ngon, là sản phẩm thích hợp nếu bạn muốn chó cưng nhà mình có một hàm răng sạch sẽ, sức khỏe dẻo dai, cũng như nếu bạn muốn xóa bỏ tình trạng chó cưng buồn chán, cắn phá các đồ vật trong nhà.', N'/assets/images/sanpham/img (15).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 8, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (16, N'Xương sữa dê bổ sung canxi Goats milk formula dành cho thú', CAST(25000 AS Decimal(18, 0)), N'Xương thưởng sữa dê Goats milk formula bổ sung canxi dành cho thú cưng - CutePets
Xương sữa được làm từ sữa dê nguyên chất, giàu vitamin, khoáng chất và protein, rất tốt cho sức khỏe của bé.
Xương sữa là món thưởng tuyệt vời cho chú cún hay boss nhà bạn, giàu dưỡng chất và vô cùng ngon miệng
', N'/assets/images/sanpham/img (16).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 8, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (17, N'Xương gặm cho chó Orgo 90gr gói 6 thanh hình bàn chải giúp sạch', CAST(25000 AS Decimal(18, 0)), N'Làm sạch răng, giúp hợp khẩu vị, giúp xương chắc khỏe, và bổ sung canxi. Với thành phần phomat chất lượng cao từ nguyên liệu thô, cùng với công thức sữa thơm ngon. Giúp cho sự phát triển tốt của xương, răng, loại bỏ mảng bám cao răng, giúp răng trắng hơn Không khiến cún yêu của bạn gây mùi khó chịu.
', N'/assets/images/sanpham/img (17).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 9, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (18, N'Xương Gặm Cho Chó Orgo 90Gr Gói 5 Thanh Hình Xương Vị Phô', CAST(28000 AS Decimal(18, 0)), N'Làm sạch răng, giúp hợp khẩu vị, giúp xương chắc khỏe, và bổ sung canxi. Với thành phần phomat chất lượng cao từ nguyên liệu thô, cùng với công thức sữa thơm ngon. Giúp cho sự phát triển tốt của xương, răng, loại bỏ mảng bám cao răng, giúp răng trắng hơn Không khiến cún yêu của bạn gây mùi khó chịu.
', N'/assets/images/sanpham/img (18).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 9, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (19, N'Combo 5 Gói Sữa Bột Cho Chó Mèo Bio Milk 100Gr Cung Cấp', CAST(160000 AS Decimal(18, 0)), N'Bio Milk For Pet với thành phần giàu chất dinh dưỡng, cân đối và rất dể tiêu hóa tương tự sữa mẹ, có tác dụng thay thế sữa mẹ trong trường hợp chó, mèo mất sữa, kém sữa hoặc thiếu sữa do bầy con quá đông, đồng thời là nguồn bổ xung chất dinh dưỡng cho chó mèo còi cọc, chậm lớn.
', N'/assets/images/sanpham/img (19).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 10, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (20, N'Sữa chua chó mèo biếng ăn gói 50ml Hỗ trợ tiêu hoá', CAST(7000 AS Decimal(18, 0)), N'Thành phần giàu chất dinh dưỡng, cân đối và rất dể tiêu hóa tương tự sữa mẹ, giúp pet của bạn ăn mau chóng lớn.
', N'/assets/images/sanpham/img (20).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 10, 2)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (21, N'Combo 5 Chiếc Xúc Xích Ăn Liền Cho Chó Mèo, Hamster Hương Vị', CAST(20000 AS Decimal(18, 0)), N'- Xúc xích chứa Vitamin & khoáng chất cho cơ thể những thú cưng luôn khỏe mạnh, linh hoạt. Chất xơ cho hệ thống tiêu hóa tốt, tăng cường khả năng hấp thu chất dinh dưỡng, góp phần vào sự phát triển đồng đều cho thú cưng. 
- Chọn nguyên liệu tươi tự nhiên chất lượng cao, tất cả các nguyên liệu được kiểm tra nghiêm ngặt. Giúp ổn định hệ thống vi khuẩn đường ruột, tiêu hóa khỏe, bé ăn ngon
', N'/assets/images/sanpham/img (21).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 11, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (22, N'Thịt bò que 40g và 90g dành cho chó - 90g', CAST(40000 AS Decimal(18, 0)), N'Thịt bò que cho chó Bowwow được làm từ thịt bò tươi Úc và New Zealand, chứa nhiều vitamin và khoáng chất, giúp hỗ trợ việc huấn luyện chó và nâng cao khả năng học hỏi của chó. Sản phẩm có dạng mềm, thơm ngon, có hàm lượng chất béo, muối và calo thấp.
', N'/assets/images/sanpham/img (22).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 11, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (23, N'100g Cám nhật B2 - Cám cá bảy màu - guppy - betta - cám siêu tốt', CAST(99000 AS Decimal(18, 0)), N'cám siêu tốt cho cá, thành phần dinh dưỡng cao lên đên 50% giúp cá mau lớn và phát triển toàn diện
', N'/assets/images/sanpham/img (23).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 12, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (24, N'Thức Ăn Cá Koi Sakura Gold 2500g 35% - Cám Cá Cảnh HẠT', CAST(230000 AS Decimal(18, 0)), N'Thức Ăn Cá Koi Sakura Gold 2500g 35% - Cám Cá Cảnh HẠT NHỎ 2MM là thực phẩm, cám cá cho các loại cá cảnh vừa và lớn như cá vàng, cá chép bé, hồng két, cá koi với nhiều hạt với kích thước khác nhau phù hợp cho từng loại cá.
', N'/assets/images/sanpham/img (24).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 12, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (25, N'[GÓI 200G] Cám cho chim Khuyên số 2 - Cám cho chim ăn - Cám	', CAST(49000 AS Decimal(18, 0)), N'Cám chim vành khuyên Thuý Tuấn là dòng cám thuần dưỡng, thi đấu dành cho chim vành khuyên. Sản phẩm gồm 5 số: số 0 dành cho chim thay lông, chim mộc, số 1 dùng dưỡng chim l, nuôi văn nghệ, số 2, số 3 dành cho chim thi đấu, gói vip dành cho thi đấu đỉnh cao.
', N'/assets/images/sanpham/img (25).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 13, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (26, N'Cám ớt cho chim', CAST(15000 AS Decimal(18, 0)), N'Cám ớt là loại thức ăn đặc biệt dùng cho các loại chim biết nói như: nhồng, két, cưỡng, sáo. 
 Thành phần: thịt bò, ớt, bột bắp, bột gạo, đậu nành, bột cá, vitamin và khoáng chất rất tốt và cần thiết cho chim nuôi trong lồng. Đặc biệt giúp cho chim nhanh biết nói chuyện, tăng màu sắc và bóng mượt lông chim.
', N'/assets/images/sanpham/img (26).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 13, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (27, N'Combo 5 Túi Thức Ăn Chuyên Dụng Cho Rùa Cản', CAST(65000 AS Decimal(18, 0)), N'Thức ăn được chế biến dạng hạt đặc biệt cho tất cả các loại rùa (cả rùa nước và rùa cạn) Giúp cung cấp dinh dưỡng cần thiết hàng ngày và ngăn chặn sự mềm mại của vỏ rùa để hỗ trợ cho rùa phát triển khoẻ mạnh.
', N'/assets/images/sanpham/img (27).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 14, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (28, N'Thức ăn dinh dưỡng T-Balance bổ sung đủ chất dinh dưỡng cho rùa', CAST(100000 AS Decimal(18, 0)), N'Thức ăn dinh dưỡng bổ sung đủ chất dinh dưỡng cho rùa của bạn. – T- Balance 1 nhãn hiệu được Thái Lan rất tin dùng , với thành phần chống các bệnh về xuơng chống gù …hầu như các bạn bên Thái đều dùng loại này cho rùa của họ ăn hàng ngày .
', N'/assets/images/sanpham/img (28).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 14, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (29, N'Sâu rang bơ cho Hamster', CAST(15000 AS Decimal(18, 0)), N'Thức ăn dặm tuyệt vời cho các bé Hamster, thỏ , bọ , sóc...
', N'/assets/images/sanpham/img (29).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 15, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (30, N'Rainbow lốc 12 lọ nuôi gà đá hàng ngày -1200 viên', CAST(350000 AS Decimal(18, 0)), N'thuốc gà đá-nuôi tăng cơ,phát triển khung hình cho gà tơ.
', N'/assets/images/sanpham/img (30).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 15, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (31, N'Fleadom của Virbac chống ve, chống rận, bọ chét, ghẻ cho chó,', CAST(127000 AS Decimal(18, 0)), N'Vòng đeo cổ chống ve, chống rận, bọ chét, ghẻ cho chó, mèo Fleadom của Virbac – Pháp
', N'/assets/images/sanpham/img (31).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 16, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (32, N'Vòng Cổ Chống Rận Ngăn Ngừa Diệt Ve Rận Bọ Chét VCR005', CAST(16000 AS Decimal(18, 0)), N'Công thức độc đáo, tác dụng nhanh chóng, bảo vệ lâu dài. Đẩy lùi ve, bọ chét. Có bổ sung tinh dầu thiên nhiên.
Các hoạt chất trong vòng sẽ liên tục tỏa ra và bao phủ trên lông mèo sau khi đeo vòng cổ. Các hợp chất tự nhiên được dùng thay thế cho các chất hóa học, đảm bảo an toàn cho mèo.Thêm vào đó, vòng có độ đàn hồi cùng lớp phủ phản quang giúp tăng thêm việc bảo vệ chó thêm tiện lợi.
', N'/assets/images/sanpham/img (32).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 16, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (33, N'Thuốc Trị Viêm Tai Cho Chó Mèo Virbac Dexoryl', CAST(130000 AS Decimal(18, 0)), N'Thuốc nhỏ tai dạng huyền dịch dầu, giúp khuếch tán thuốc tốt hơn. Điều trị cục bộ bệnh viêm tai ngoài do vi khuẩn, nấm hoặc ngoại kí sinh.
', N'/assets/images/sanpham/img (33).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 17, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (34, N'Chai Xịt Ngoài Da Diệt Ve Rận Bọ Chét Ký Sinh Trùng Cho Chó Mèo', CAST(19000 AS Decimal(18, 0)), N'Chiết Suất Từ Hoa Cúc Nên Hoàn Toàn Không Độc Hại Đến Người Và Vật Nuôi
Giúp bảo vệ vật nuôi khỏi bọ chét và ký sinh trùng.
', N'/assets/images/sanpham/img (34).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 17, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (35, N'Viên nhai diệt 4 loại: (35)ve- (2)rận- (3)bọ chét- (4)ghẻ. NexGard cho', CAST(105000 AS Decimal(18, 0)), N'Với công dụng trừ ve rận bọ chét và ghẻ Demodex, Sarcoptes, Viên Nhai NexGard Phòng & Ve, Rận, Ghẻ Cho Chó có tác dụng kéo dài trong vòng 30 ngày, chủ nuôi sẽ thấy hiệu quả ngay sau 24-36 giờ sử dụng. Ve rận bọ chét sẽ chết khô trên da và dễ dàng loại bỏ sau những lần tắm. Vết ngứa và mẩn đỏ da do ghẻ sẽ thuyên giảm hẳn sau lần sử dụng thuốc đầu tiên.
', N'/assets/images/sanpham/img (35).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 18, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (36, N'1 viên XỔ GIUN SANPET tẩy giun chó mèo- (hanpet 303)', CAST(5000 AS Decimal(18, 0)), N'Sản Phẩm được phân phối bởi Hanpet Công dụng của sanpet:
- Tẩy sạch các loại sán dây, sán hạt dưa và giun tròn ký sinh ở chó, mèo và động vật ăn thịt.
- Sán dây: sán hạt dưa (Echinococcus granulosus ), Dipylidium cananium, Taenia pisiformis, T. ovis, T. hydatigena.
- Giun tròn: Giun đũa ( Toxacara canis, Toxascaris leonina), giun tóc ( Trichuris vulpis), giun móc ( Ancylostoma canium, A. blaziliensse, Unicaria stenocephala).
', N'/assets/images/sanpham/img (36).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 18, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (37, N'Máng ăn tự động cho chim cảnh, vẹt, gà...', CAST(30000 AS Decimal(18, 0)), N'Sản phẩm dùng rất thuận tiện, đổ đầy là thức ăn tự ra cho vật nuôi ăn không còn tốn công của người nông dân phải đổ thức ăn mỗi ngày', N'/assets/images/sanpham/img (37).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 19, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (38, N'Máng uống nước tự động cho gà, vịt nuôi công nghiệp	', CAST(8000 AS Decimal(18, 0)), N'Máng Uống có cấu tạo khá đơn giản và dễ lắp đặt bà con có thể nhìn và tự lắp đặt máng nước 
', N'/assets/images/sanpham/img (38).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 19, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (39, N'40 vòi thỏ uống nước màu vàng đồng - 40 beck thỏ - 40 van uống', CAST(200000 AS Decimal(18, 0)), N'Cung cấp nước sạch luôn luôn sẳn có cho thỏ, chuột hamster , cho thú cưng ..vv......
=> Đây là sản phẩm tuyệt vời ,,, ứng dụng thông Minh trong mô hình phát triển công nghệ cho ngành nuôi trông
', N'/assets/images/sanpham/img (39).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 20, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (40, N'Cóng uống nước cho chim loại 105ml ( Hàng Nhập Khẩu )', CAST(15000 AS Decimal(18, 0)), N'Được sản xuất trên dây chuyền và công nghệ hiện đại của Italia
Phù hợp cho các loại lồng nhỏ
Gọn nhẹ dễ vệ sinh và tháo lắp
Dung tích 105ml thích hợp nuôi cặp từ 2 cặp trở lên hoặc tách lẻ
Dành cho các loại chim Yến Hót và các dòng chim nhỏ khác
', N'/assets/images/sanpham/img (40).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 20, 3)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (41, N'Máy cho ăn tự động dành cho thú cưng có app điện thoại giao diện', CAST(1500000 AS Decimal(18, 0)), N'Máy cho ăn tự động dành cho thú cưng có app điện thoại giao diện tiếng việt dễ sử dụng
Chưa bao giờ việc cho thú cưng ăn lại tiện lợi đến thế.
', N'/assets/images/sanpham/img (41).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 21, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (42, N'Bánh Rán Cho Thú Cưng Ăn Tự Động 6 Bữa Với Bộ Hẹn Giờ Lập', CAST(550000 AS Decimal(18, 0)), N'Sản phẩm được làm bằng vật liệu dùng cho thực phẩm, vô hại với cơ thể con người và vật nuôi đáng yêu của bạn.
Thiết bị định giờ, 24 giờ để điều chỉnh thời gian ăn tối cho thú cưng, do đó không cần phải lo lắng về việc thú cưng bị đói trong khi chủ của chúng đi xa.
Thiết kế 6 bữa ăn: Mỗi ngăn trong khay có thể tháo rời chứa tới 450g Thức ăn khô hoặc bán ẩm; sử dụng bộ cấp liệu này để cho thú cưng của bạn ăn suốt cả ngày.
', N'/assets/images/sanpham/img (42).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 21, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (43, N'Bán Chạy Miếng Lót Thức Ăn Chậm Chống Sặc Cho Thú Cưng,', CAST(190000 AS Decimal(18, 0)), N'Sản phẩm này bền, thân thiện với môi trường và không độc hại, thích hợp cho thú cưng ăn, và có thể làm chậm tốc độ ăn của thú cưng.
', N'/assets/images/sanpham/img (43).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 22, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (44, N'[Yuanhesheng] Thảm Đồ Chơi Cho Chó Máy Cấp Liệu Chậm, Thảm', CAST(200000 AS Decimal(18, 0)), N'Đây là một tấm thảm huấn luyện chó độc đáo, được giấu bằng đồ ăn nhẹ hoặc đồ chơi nhỏ trong miếng đệm Hít Để chú chó của bạn tìm thấy nó. Nó giúp huấn luyện mùi của chú chó của bạn, và có thể tiêu thụ năng lượng của chú chó của bạn và giúp chú chó của bạn giảm cân.
Nó có thể giữ cho con chó của bạn bận rộn. Miếng lót cho chó này là một cách tuyệt vời để có một chú chó có nhiều năng lượng để sử dụng não trong giờ ăn tối, nó có thể mặc chúng như đi bộ.
', N'/assets/images/sanpham/img (44).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 22, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (45, N'Cát vệ sinh cho mèo của Úc Best In Show/BIS Cat Sand 12L', CAST(117000 AS Decimal(18, 0)), N'Là một loại cát được làm từ 💯💯 nguyên liệu bentonot tự nhiên của Úc. Công thức độc đáo để cát dễ hấp thụ và bắt mùi trước khi lan rộng.
', N'/assets/images/sanpham/img (45).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 23, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (46, N'Cát tắm diệt khuẩn jolly 500gr -1kg - dâu - bịch 1kg', CAST(40000 AS Decimal(18, 0)), N'Sạch sẽ, an toàn cho thú cưng của bạn
', N'/assets/images/sanpham/img (46).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 23, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (47, N'Xích Đu Cho Hamster', CAST(40000 AS Decimal(18, 0)), N'Là nơi các chú hamster nhỏ bé vui đùa, cũng như chất liệu an toàn với người sử dụng.
', N'/assets/images/sanpham/img (47).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 24, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (48, N'Bóng chạy hamster ( không đế )', CAST(30000 AS Decimal(18, 0)), N'An toàn, bền và dễ sử dụng', N'/assets/images/sanpham/img (48).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 24, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (49, N'Set Tông Đơ Sạc Điện 8 Món Cắt Tỉa Lông Chó Mèo Sweet Care', CAST(280000 AS Decimal(18, 0)), N'Tông Đơ Sạc Điện Cắt Tỉa Lông Chó Mèo Sweet Care 
- Tông đơ có thể sạc điện dễ dàng: sạc trong 3h và có thể sử dụng liên tục trong 5 tiếng 
- Thiết kế dễ sử dụng, vận hành: khởi động chỉ cần ấn nút đơn giản 
- Có đèn điện tử báo hiệu sản phẩm đang sử dụng hay đang sạc 
- Lưỡi tông đơ từ vật liệu gốm ceramic + titan thép không gỉ bền và sắc, dễ dàng tháo ra vệ sinh 
- Đầu lược nhựa kèm theo giúp định hình phần lông bạn muốn tạo hình và giúp chó mèo cảm thấy êm ái, dễ chịu hơn
', N'/assets/images/sanpham/img (49).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 25, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (50, N'Tông Đơ máy CP-6800 - Chuyên Dụng Cắt Lông Chó Mèo', CAST(349000 AS Decimal(18, 0)), N'Tông Đơ máy Chuyên Dụng Cắt Lông Chó Mèo là máy tông đơ cắt lông chuyên dụng cho thú cưng của Hồng Kông
Máy có thiết kế nhỏ gọn, dễ cầm trong lòng bàn tay, tông đơ cắt lông CP-6800 giúp bạn có thể dễ dàng hớt lông với cả 2 tay ở những bộ phận như vùng tai, vùng bụng, hay bắp chân, kể cả những chùm lông dày.
Công tắc máy được đặt trên thân máy kết hợp với lưỡi tông đơ cực kì sắc bén - cấu tạo từ lõi sứ Titanium - giúp bạn hớt lông thoái mái hơn và nhanh chóng hơn cho chó mèo, đặc biệt khi các bé chó mèo nhà bạn thuộc dạng hiếu động ham chơi, khó giữ yên một chỗ. Khi sử dụng tông đơ cắt lông, bạn sẽ còn tiết kiệm được nhiều thời gian cắt tỉa lông cho bé cưng ở nhà, do lưỡi dao của tông đơ có thể tháo rời, giúp bạn tiện lợi hơn nhiều trong khâu vệ sinh sau khi hớt lông.
 
', N'/assets/images/sanpham/img (50).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 25, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (51, N'Xịt Khử Mùi Diệt Khuẩn Bảo Vệ Sức Khỏe Chó Mèo Natural Core', CAST(185000 AS Decimal(18, 0)), N'- Xịt khử mùi diệt khuẩn trong gia đình, nhà ở…
- Hương hoa nhài nhẹ nhàng êm dịu
- 100% thành phần hữu cơ thiên nhiên
- Khử mùi tuyệt vời, mang lại bầu không khí trong lành
- Hiệu quả, an toàn, nhanh chóng, tiện dụng
- Khử sạch mùi hôi trên cơ thể thú cưng
- Loại bỏ nhanh chóng và triệt để đến 99.9% các loại vi khuẩn
', N'/assets/images/sanpham/img (51).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 26, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (52, N'Túi Đựng Phân TDP003 Combo 2 Túi', CAST(8000 AS Decimal(18, 0)), N'Một công cụ cần thiết cho thú cưng của bạn. Lý tưởng để sử dụng tại nhà, du lịch và ngày lễ.', N'/assets/images/sanpham/img (52).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 26, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (53, N'Tã lót cho chó mèo đi vệ sinh vào khay, chuồng bằng giấy siêu thấm', CAST(4000 AS Decimal(18, 0)), N'Công dụng của tã lót chuồng:
- Thấm hút nước tiểu của thú cưng rất nhanh chóng và đóng kết lại
- Bề mặt trên của miếng lót chuồng là vải không dệt, mềm mại, thấm hút nhanh , luôn duy trì được bề mặt khô thoáng tạo cảm giác dễ chịu và thoải mái chc thú cưng của bạn
- Diệt khuẩn tốt, ngăn chặn sự phát triển của vi khuẩn 
- Phòng chống nước tiểu (chất lỏng) trào ngược trở lại- Khử mùi hiệu quả, giúp phòng luôn sạch sẽ không có mùi hôi do thú cưng đi vệ sinh
- Luyện chó mèo đi vệ sinh đúng chỗ, do mùi hương thu hút bản năng của chó mèo
', N'/assets/images/sanpham/img (53).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 27, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (54, N'(1 bịch) Bỉm chó mèo dạng quần dán &Tã giấy lót chuồng chất liệu', CAST(70000 AS Decimal(18, 0)), N'Giúp dễ dàng dọn vệ sinh và tiện lợi hơn cho chủ.
', N'/assets/images/sanpham/img (54).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 27, 4)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (55, N'Kakaoppa Hàn Quốc Làm Mới Phong Cách Chó Ăn Mặc Sọc Cổ', CAST(90000 AS Decimal(18, 0)), N'Vải thời trang, mềm mại và thoải mái
Chiều dài trang phục: Bình thường
Cổ áo: Cổ áo O
', N'/assets/images/sanpham/img (55).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 28, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (56, N'2019 Xuân Hè Mới Quần Áo Nhiều Màu Sắc Cho Thú Cưng Streamer', CAST(40000 AS Decimal(18, 0)), N'Váy cho thú cưng mùa hè với họa tiết hoa.
Chất liệu cotton thoáng khí, mỏng và mát mẻ cho mùa hè nóng bức.
Quần áo trang trí đẹp cho chú mèo hoặc chú chó yêu quý của bạn.
Loại: Váy cho thú cưng
Chất liệu: Cotton
Phong cách: thoải mái
Tính năng: in hoa, mỏng, thoáng khí
 
', N'/assets/images/sanpham/img (56).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 28, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (57, N'Dog Cover for Car Back Seat Side Protection, Washable Waterproof', CAST(345000 AS Decimal(18, 0)), N'Dụng cụ tiện lợi và không thể thiếu cho thú cưng của bạn trong những chuyến đi xa bằng oto
', N'/assets/images/sanpham/img (57).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 29, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (58, N'Pet Dog Hãng, Bọc Ghế Ô Tô Cho Chó Cưng Sau Lưng Chống Nước', CAST(340000 AS Decimal(18, 0)), N'Tính năng: Thảm ngồi ô tô cho chó cưng
Một món quà thiết bị tốt cho thú cưng của bạn! Giữ cho xe của bạn sạch sẽ, và nó cũng có thể được sử dụng để cắm trại, đi bộ đường dài hoặc các hoạt động ngoài trời khác
 
', N'/assets/images/sanpham/img (58).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 29, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (59, N'Size 1- Lồng hàng không (hanpet 4711769) lồng vận chuyển chó', CAST(358000 AS Decimal(18, 0)), N'Lồng hàng không cho chó mèo, chất liệu , bền, đẹp, chắc chắn.
Có nắp cà tiện dụng, thiết kế hiện đại thoáng mát, giúp thú cưng nhà bạn cực kỳ thoải mái trong các chuyến đi xa.
Chất liệu nhựa cấp cửa kim loại, không chứa chất độc hại, không gây kích ứng
', N'/assets/images/sanpham/img (59).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 30, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (60, N'Túi lưới đa nặng giúp tắm, cắt mòng, vệ sinh tai cho mèo - kích', CAST(70000 AS Decimal(18, 0)), N'Kích thước: 33x62 cm
Chất liệu: Vải nhân tạo độ bền cao
Đặc điểm: Lưới, bảo vệ
Dành cho mèo từ 10kg trở xuống.
', N'/assets/images/sanpham/img (60).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 30, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (61, N'Balo túi vận chuyển chó mèo thú cưng du lịch - Balo tui van chuyen', CAST(350000 AS Decimal(18, 0)), N'Thoáng mát, giúp bạn dễ quan sát hoạt động của bé
', N'/assets/images/sanpham/img (61).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 31, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (62, N'Balo Phi Hành Gia Cho Thú Cưng ♥️♥️ Balo vận chuyển chó mèo', CAST(205000 AS Decimal(18, 0)), N'Balo Phi Hành Gia cho chó mèo là sản phẩm linh động cho các Sen khi mang theo thú cưng của mình đi chơi. Balo phi hành gia có thiết kế thông minh, thông thoáng giúp cho thú cưng của bạn thoải mái và an toàn khi di chuyển. Cho phép các Boss tận hưởng ánh nắng mặt trời, phong cảnh và tương tác với thế giới bên ngoài.
', N'/assets/images/sanpham/img (62).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 31, 5)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (63, N'Pet Backpack Backpack Suitable for Small Cats and Dogs', CAST(501000 AS Decimal(18, 0)), N'Làm bằng vật liệu chất lượng cao, bền, thoáng khí và thoải mái. Thiết kế trong suốt, cho thú cưng của bạn nhìn thấy ánh nắng và cảnh vật thế giới từ bên ngoài.

', N'/assets/images/sanpham/img (63).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 32, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (64, N'(Nóng) Địu Thú Cưng Ba Lô Cho Chó, Túi Chó Mèo Cún Con Mềm', CAST(420000 AS Decimal(18, 0)), N'Dễ dàng tiện lợi mang theo thú cưng bên mình mỗi khi ra đường, chăm sóc và gần gũi với chúng khi đi bộ hoặc đi xe. 
', N'/assets/images/sanpham/img (64).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 32, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (65, N'Dây dắt kèm vòng cổ cho chó mèo', CAST(35000 AS Decimal(18, 0)), N'Nhằm giải quyết sự băn khoăn làm thế nào để đi chơi cho thoải mái mà thú cưng của mình không bị bắt mắt, hay nó chạy đi mất. Chất liệu chắc chắn và thiết kế dày dặn cho độ bền , đồng thời tạo cảm giác êm ái khi đeo. Dạng vòng cổ chắc chắn giúp bạn “quản lý” các chú cún hiếu động và tinh nghịch dễ hơn. Thiết kế khóa giúp bạn dễ dàng đeo hoặc tháo mở dây và vòng một cách nhanh chóng. 
', N'/assets/images/sanpham/img (65).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 33, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (66, N'Vòng Cổ Chó Mèo Inox Loại Trung (50Cm )', CAST(15000 AS Decimal(18, 0)), N'Cổ Xích chó mèo inox là chất liệu inox 304 tốt nhất nói ko với han gỉ, dây xích là mắt kép đặc và vô cùng chắc chắn. Cổ trung gồm 1 đoạn và 1 móc riêng biệt giúp dễ dàng điều chỉnh độ dài ngắn và chỉnh được độ rộng cổ vừa với cún nhà bạn
', N'/assets/images/sanpham/img (66).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 33, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (67, N'[HN] Rọ Mõm Inox Cho Thú Cưng Size M - Phụ Kiện Cho Thú Cưng', CAST(90000 AS Decimal(18, 0)), N'Với chất liệu da có 2-3 đai ở mõm có thể thu nhỏ hoặc nới rộng phần mõm chó. phần đai quàng gáy có thể điều chỉnh cho phù hợp với đầu chó, đai này có bộ phận cố định vào vòng cổ, làm cho rọ mõm gắn chắc chắn không bao giờ bị tuột. 
', N'/assets/images/sanpham/img (67).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 34, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (68, N'rọ mõm cho innox', CAST(60000 AS Decimal(18, 0)), N'Sử dụng rọ mõm để phòng tránh trường hợp chó cắn người hay những con chó khác khi cảm thấy bị đe dọa. Khi chăm sóc lông, có một vài chú chó cảm thấy không quen, không thân thiết với người chăm sóc lông cho mình, bạn nên đeo rọ mõm để đảm bảo an toàn. Có một vài giống chó bắt buộc phải đeo rọ mõm. Không may là chưa có luật quy định rõ ràng về một vài giống chó đặc biệc hung hăng và nguy hiểm, bắt buộc phải đeo rọ mõm ở nơi công cộng.
', N'/assets/images/sanpham/img (68).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 34, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (69, N'1 Bộ Dây Dắt Thú Cưng, In Hoa Thoáng Khí Cho Chó Cún ', CAST(63000 AS Decimal(18, 0)), N'Sử dụng dây nịt cho thú cưng với kết cấu vải lưới thoáng khí để cho chó của bạn mặc, sau đó sẽ cảm thấy thoải mái.
Là một dây nịt thú cưng có thể điều chỉnh với thiết kế khoa học, nó có thể phù hợp với cơ thể thú cưng của bạn mà không gây hại cho cổ thú cưng.
Nó được làm từ chất liệu polyester.
', N'/assets/images/sanpham/img (69).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 35, 6)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (70, N'Áo Dây Xích Đai Yếm Cho Mèo Con Và Chó Con ', CAST(42000 AS Decimal(18, 0)), N'Thuận tiện dẫn thú cưng đi dạo và tạo gu thời trang cho thú cưng của mỗi người. ', N'/assets/images/sanpham/img (70).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 35, 7)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (71, N'1 Tấm Gỗ Hình Chữ Nhật Hình Mèo Trang Trí Biển Hiệu Tình Bạn', CAST(24000 AS Decimal(18, 0)), N'Tình trạng: mới 100%
Làm bằng chất lượng cao
Màu sắc: Như trong hình
Đóng gói bao gồm: 1 miếng gỗ hình mèo
Kích thước: 10*20cm
Chất liệu: Gỗ
', N'/assets/images/sanpham/img (71).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 36, 7)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (72, N'Tongpudi®Chống Lạc Kim Loại Chó Mèo Cổ Áo Thẻ Tên Khắc ID', CAST(25000 AS Decimal(18, 0)), N'Hấp dẫn về hình dạng và màu sắc. Đảm bảo an toàn cho thú cưng. Dễ dàng lau chùi, bảo dưỡng Được làm từ chất liệu cứng cáp.
', N'/assets/images/sanpham/img (73).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 36, 7)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (73, N'WANGHU Cam Ánh Nắng Mặt Trời Kim Loại Vít Mất Chó Mèo PET ID', CAST(20000 AS Decimal(18, 0)), N'Ống này chứa thông tin khẩn cấp quan trọng, đáy ống tháo ra và giữ Bảng thông tin
Đặt nó vào cổ thú cưng và không bao giờ lo lắng về việc bị lạc một lần nữa. tất cả thông tin liên lạc của bạn có thể được giữ bên trong để cho người khác
Biết cách liên hệ với bạn ID thú cưng bằng hợp kim nhôm chắc chắn. Nó đi kèm với một nắp vặn
	', N'/assets/images/sanpham/img (73).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 37, 7)
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Mota], [Anhbia], [Ngaycapnhat], [Soluongton], [MaL], [MaNCC]) VALUES (74, N'GF-07 Thiết Bị Định Vị Thiết Bị Định Vị SOS Từ Tính Thời Gian', CAST(290000 AS Decimal(18, 0)), N'Mini GPS Tracker Thiết bị theo dõi vật nuôi theo thời gian thực di động Thiết bị theo dõi GPS cho trẻ em, người già, vật nuôi, ô tô, Trình theo dõi định vị đa năng, GPS + AGPS + Wifi + LBS Định vị SOS Báo động theo dõi ứng dụng web Sử dụng GPS Tracker mini này cho bất kỳ mục đích theo dõi nào! Đừng dành quá nhiều thời gian và sức lực để tìm kiếm những món đồ bị đánh cắp, thất lạc và / hoặc thất lạc.
', N'/assets/images/sanpham/img (74).jpg', CAST(N'2021-06-26T00:00:00.000' AS DateTime), 10, 37, 7)
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64FC08A3864]    Script Date: 9/30/2023 8:59:48 AM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D105342273C2BD]    Script Date: 9/30/2023 8:59:48 AM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_DonHang]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_SanPham]
GO
ALTER TABLE [dbo].[DIACHI]  WITH CHECK ADD  CONSTRAINT [FK_DIACHI_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DIACHI] CHECK CONSTRAINT [FK_DIACHI_KHACHHANG]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_Khachhang]
GO
ALTER TABLE [dbo].[LOAI]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DANHMUC] ([MaDM])
GO
ALTER TABLE [dbo].[LOAI] CHECK CONSTRAINT [FK_DanhMuc]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_Loai] FOREIGN KEY([MaL])
REFERENCES [dbo].[LOAI] ([MaL])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_Loai]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_NhaCungCap]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [MinkyShop] SET  READ_WRITE 
GO
