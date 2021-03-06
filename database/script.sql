USE [master]
GO
/****** Object:  Database [VegetableStore]    Script Date: 3/11/2022 11:45:40 PM ******/
CREATE DATABASE [VegetableStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VegetableStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VegetableStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VegetableStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VegetableStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VegetableStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VegetableStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VegetableStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VegetableStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VegetableStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VegetableStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VegetableStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [VegetableStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VegetableStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VegetableStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VegetableStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VegetableStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VegetableStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VegetableStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VegetableStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VegetableStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VegetableStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VegetableStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VegetableStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VegetableStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VegetableStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VegetableStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VegetableStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VegetableStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VegetableStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VegetableStore] SET  MULTI_USER 
GO
ALTER DATABASE [VegetableStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VegetableStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VegetableStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VegetableStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VegetableStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VegetableStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VegetableStore] SET QUERY_STORE = OFF
GO
USE [VegetableStore]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/11/2022 11:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/11/2022 11:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[total] [float] NULL,
	[email] [varchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/11/2022 11:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/11/2022 11:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
	[image] [nvarchar](255) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/11/2022 11:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](30) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/11/2022 11:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [varchar](255) NOT NULL,
	[fullName] [nvarchar](255) NULL,
	[password] [char](200) NULL,
	[roleID] [int] NULL,
	[address] [nvarchar](300) NULL,
	[birthday] [date] NULL,
	[phone] [char](15) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (1, N'FRUITS', 1)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (2, N'VEGETABLES', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (2, CAST(N'2022-03-10' AS Date), 0, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (3, CAST(N'2022-03-10' AS Date), 760000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (4, CAST(N'2022-03-11' AS Date), 100000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (5, CAST(N'2022-03-11' AS Date), 120000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (6, CAST(N'2022-03-11' AS Date), 60000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (7, CAST(N'2022-03-11' AS Date), 0, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (8, CAST(N'2022-03-11' AS Date), 40000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (9, CAST(N'2022-03-11' AS Date), 45000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (10, CAST(N'2022-03-11' AS Date), 90000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (11, CAST(N'2022-03-11' AS Date), 90000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (12, CAST(N'2022-03-11' AS Date), 45000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (13, CAST(N'2022-03-11' AS Date), 45000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (14, CAST(N'2022-03-11' AS Date), 45000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (15, CAST(N'2022-03-11' AS Date), 85000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (16, CAST(N'2022-03-11' AS Date), 35000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (17, CAST(N'2022-03-11' AS Date), 35000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (18, CAST(N'2022-03-11' AS Date), 35000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (19, CAST(N'2022-03-11' AS Date), 215000, N'doanngocthuytien@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (20, CAST(N'2022-03-11' AS Date), 3960000, N'doanngocthuytien@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (21, CAST(N'2022-03-11' AS Date), 85000, N'huydvqse151224@fpt.edu.vn', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (22, CAST(N'2022-03-11' AS Date), 45000, N'huydoanmec@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (23, CAST(N'2022-03-11' AS Date), 80000, N'banhquy0610@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (24, CAST(N'2022-03-11' AS Date), 165000, N'datnhtse151251@fpt.edu.vn', 1)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (17, 35000.0000, 1, 18, 4, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (18, 45000.0000, 3, 19, 3, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (19, 35000.0000, 1, 19, 4, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (20, 45000.0000, 1, 19, 5, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (21, 45000.0000, 88, 20, 3, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (22, 35000.0000, 1, 21, 4, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (23, 50000.0000, 1, 21, 8, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (24, 45000.0000, 1, 22, 3, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (25, 45000.0000, 1, 23, 3, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (26, 35000.0000, 1, 23, 4, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (27, 30000.0000, 3, 24, 1008, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (28, 40000.0000, 1, 24, 2, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (29, 35000.0000, 1, 24, 24, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (2, N'Cam Xành', 40000, 99, 1, CAST(N'2022-02-02' AS Date), CAST(N'2023-03-16' AS Date), N'https://hoachatdaiviet.com/wp-content/uploads/2018/09/H%C6%B0%C6%A1ng-cam-t164-533x400.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (3, N'Mận', 45000, 98, 1, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-16' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU9nuaZRU66Qbs1IS-kPqWxlf3-hn_nu6pgnK8PuujVSYpQyIZaAXxWlN3TMnorWbrXfI&usqp=CAU', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (4, N'Ổi', 35000, 94, 1, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-16' AS Date), N'https://quangtrimart.vn/wp-content/uploads/2022/01/image4-1631247488-554-width620height481.png', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (5, N'Quýt đường ', 45000, 99, 1, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-16' AS Date), N'https://4.bp.blogspot.com/-vd7vwnhqOrI/XBZWx--2kfI/AAAAAAAAHds/MrrPpR5kfO8qjsv5d9ROrAfAMGVVCfFxACLcBGAs/s1600/Trai-Quyt.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (6, N'Bưởi da xanh', 60000, 95, 1, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-16' AS Date), N'https://product.hstatic.net/200000281397/product/upload_23d2dccfc5d54319887e2cc627bb648b_grande.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (7, N'Chuối', 20000, 46, 1, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-14' AS Date), N'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/9/1/chuoi1-1630451103524540765462.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (8, N'Chôm Chôm', 50000, 59, 1, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-15' AS Date), N'https://tintuc.vnshop.vn/wp-content/uploads/2020/06/Th%C3%A0nh-ph%E1%BA%A7n-dinh-d%C6%B0%E1%BB%A1ng-c%C3%B3-trong-ch%C3%B4m-ch%C3%B4m.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (15, N'Dừa tươi', 20000, 70, 1, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-16' AS Date), N'https://garisonvn.com/wp-content/uploads/2021/05/d.jpeg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (16, N'Dưa leo', 35000, 80, 2, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-16' AS Date), N'https://hinh365.com/wp-content/uploads/2020/06/497e1e40ac9f113e40b53f0d46a76baf.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (17, N'Bí đỏ', 35000, 100, 2, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-16' AS Date), N'http://chuthapdo.org.vn/wp-content/uploads/2015/02/bi-ngo.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (18, N'Dưa hấu', 25000, 100, 1, CAST(N'2022-02-05' AS Date), CAST(N'2022-03-16' AS Date), N'https://hinh365.com/wp-content/uploads/2020/06/thu-vien-anh-dep-ve-qua-dua-hau-voi-khoan-100-619-tam-anh-chat-luong-cuc-cao.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (19, N'Bầu', 50000, 100, 2, CAST(N'2022-02-05' AS Date), CAST(N'2022-03-16' AS Date), N'https://bizweb.dktcdn.net/100/435/899/products/24b4abc1-30cf-454e-8c8e-df2f2592cc64.jpg?v=1630325185350', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (20, N'Cà chua', 35000, 100, 2, CAST(N'2022-02-06' AS Date), CAST(N'2022-03-16' AS Date), N'https://originmarket.vn/wp-content/uploads/2021/08/ca-chua-9_cecp.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (21, N'Mướp hương', 35000, 100, 2, CAST(N'2022-02-06' AS Date), CAST(N'2022-03-18' AS Date), N'https://csfood.vn/wp-content/uploads/2018/03/M%C6%B0%E1%BB%9Bp-Vietrat....png', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (22, N'Rau muống', 30000, 100, 2, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-16' AS Date), N'https://rauxanh.net/wp-content/uploads/2019/05/rau-muong.png', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (23, N'Cải bẹ xanh', 35000, 100, 2, CAST(N'2022-02-08' AS Date), CAST(N'2022-03-15' AS Date), N'https://product.hstatic.net/1000281508/product/cach-lam-thit-bo-cuon-la-cai-be-xanh-nhanh-gon-le-3_60f062f84e554299a649f89c0bc74eb2.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (24, N'Đậu cove', 35000, 99, 2, CAST(N'2022-02-06' AS Date), CAST(N'2022-03-13' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8RnGuI2wturFhOV0V-daWqA_dXIs4WLmgG8Mr1a2abPwYGer9opKM2eb1KwiL3kVQycA&usqp=CAU', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (25, N'Bí xanh', 35000, 100, 2, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-16' AS Date), N'https://khuyennongtphcm.com/wp-content/uploads/2020/09/bi-xanh.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (1007, N'Sầu Riêng', 50000, 30, 1, CAST(N'2022-03-03' AS Date), CAST(N'2022-03-16' AS Date), N'https://hinh365.com/wp-content/uploads/2020/06/cao-vtai-ngay-hinh-anh-chat-luong-e-qua-sau-rieng-voi-khoan-9-944-hinh-anh-cuc-dep-de-ban-chon-lua.jpg', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [price], [quantity], [categoryID], [importDate], [usingDate], [image], [status]) VALUES (1008, N'Mít Thái', 30000, 47, 1, CAST(N'2022-03-11' AS Date), CAST(N'2022-03-11' AS Date), N'https://bizweb.dktcdn.net/100/324/966/products/mitvienlinh-4e5694ac-0b1e-4c47-b230-b5c0dbb5b9c2.jpg?v=1624982735883', 1)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (1, N'ADMIN', 1)
INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (2, N'USER', 1)
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'banhquy@gmail.com', N'Cookie2', N'123456                                                                                                                                                                                                  ', 1, N'11 trường chinh', CAST(N'2001-07-10' AS Date), N'0909563183     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'banhquy0610@gmail.com', N'Huy Đoàn', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-11' AS Date), N'0939483434     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'bemeodth@gmail.com', N'Tiên Hoa Hậu', N'123456                                                                                                                                                                                                  ', 1, N'12 trường chinh', CAST(N'2000-04-02' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'datnhtse151251@fpt.edu.vn', N'Nguyễn Tiến Đạt', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-10' AS Date), N'0909563183     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'doanngocthuytien@gmail.com', N'Cat Cute ', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2000-02-04' AS Date), N'0909563183     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huydeptrai@gmail.com', N'LE MINH KHOA1', N'123456                                                                                                                                                                                                  ', 2, N'11 trường chinh', CAST(N'2001-01-20' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huydoan123@gmail.com', N'Bánh Quy Thiếu Ngủ', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhấ 12 ', CAST(N'2001-10-02' AS Date), N'0909563183     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huydoan1234@gmail.com', N'Cookie1', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-08' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huydoan12345@gmail.com', N'Cookie1', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-08' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huydoanmec@gmail.com', N'Cookie1', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-09' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huydvqse151224@fpt.edu.vn', N'Đoàn Vũ Quang Huy', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-11' AS Date), N'0909563183     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huyle@gmail.com', N'Lê Đình Quốc Huy', N'123456                                                                                                                                                                                                  ', 2, N'18 Trường Chinh', CAST(N'2001-06-10' AS Date), N'0909236767     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huyle123@gmail.com', N'Toi la admin3', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-07' AS Date), N'0909563183     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huynhiepanh@gmail.com', N'Huy So Ciu', N'123456                                                                                                                                                                                                  ', 1, N'29 duong D9 ', CAST(N'2001-01-20' AS Date), N'0909563181     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'huypro123@gmail.com', N'Banh Quy Thiếu Ngủ', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-07' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'ngothiep2412@gmail.com', N'Ngô Xuân Thiệp', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-09' AS Date), N'0939483434     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'nguyenvu@fpt.edu.vn', N'Nguyễn Trọng Nguyên Vũ', N'123456                                                                                                                                                                                                  ', 1, N'14 Trường Chinh', CAST(N'2000-10-02' AS Date), N'0832132323     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'thanhbui@gmail.com', N'Thanh', N'123456                                                                                                                                                                                                  ', 1, N'17 quan 12', CAST(N'2001-10-18' AS Date), N'0939483434     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'thiepngo@gmail.com', N'Ngô Xuân Thiệp', N'123456                                                                                                                                                                                                  ', 2, N'16 Trường Chinh', CAST(N'2001-02-10' AS Date), N'0899845787     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'tuanh@gmail.com', N'Tú Anh', N'123456                                                                                                                                                                                                  ', 2, N'19 Trường Chinh', CAST(N'2001-12-02' AS Date), N'0989232983     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'tungngu@gmail.com', N'Nguyễn Thanh Tùng', N'123456                                                                                                                                                                                                  ', 2, N'15 Trường Chinh', CAST(N'2001-12-02' AS Date), N'0893774377     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'vuntnse151234@fpt.edu.vn', N'Vũ Ngu 123', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-10' AS Date), N'0909563122     ', 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [roleID], [address], [birthday], [phone], [status]) VALUES (N'zidarose112@gmail.com', N'Tú Anh', N'123456                                                                                                                                                                                                  ', 2, N'11 Tân Thới Nhất 12 ', CAST(N'2022-03-10' AS Date), N'0909563181     ', 1)
GO
ALTER TABLE [dbo].[tblOrder] ADD  CONSTRAINT [DF_tblOrder_orderDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[tblProduct] ADD  CONSTRAINT [DF_tblProduct_importDate]  DEFAULT (getdate()) FOR [importDate]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [default_password]  DEFAULT ('1') FOR [password]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [default_address]  DEFAULT ('FPT University') FOR [address]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [VegetableStore] SET  READ_WRITE 
GO
