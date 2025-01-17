USE [master]
GO
/****** Object:  Database [db_ecommerce]    Script Date: 1/9/2019 4:19:50 PM ******/
CREATE DATABASE [db_ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\db_ecommerce.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\db_ecommerce_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_ecommerce] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ecommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [db_ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [db_ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ecommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [db_ecommerce]
GO
/****** Object:  Table [dbo].[tbl_invoice]    Script Date: 1/9/2019 4:19:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_invoice](
	[in_id] [int] IDENTITY(1,1) NOT NULL,
	[in_fk_user] [int] NULL,
	[in_date] [datetime] NULL,
	[in_totalbill] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[in_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 1/9/2019 4:19:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[o_id] [int] IDENTITY(1,1) NOT NULL,
	[o_fk_pro] [int] NULL,
	[o_fk_invoice] [int] NULL,
	[o_date] [datetime] NULL,
	[o_qty] [int] NULL,
	[o_bill] [float] NULL,
	[o_unitprice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[o_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 1/9/2019 4:19:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_name] [nvarchar](50) NOT NULL,
	[pro_price] [float] NULL,
	[pro_desc] [nvarchar](500) NOT NULL,
	[pro_image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 1/9/2019 4:19:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[U_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](50) NOT NULL,
	[u_contact] [nvarchar](50) NOT NULL,
	[u_password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[U_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_price], [pro_desc], [pro_image]) VALUES (1, N'Pepsi', 50, N'soft drink', N'~/Content/Uploads/1.png')
INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_price], [pro_desc], [pro_image]) VALUES (2, N'cocacola', 40, N'soft drink', N'~/Content/Uploads/2.png')
INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_price], [pro_desc], [pro_image]) VALUES (3, N'Jaam e sheeren', 60, N'soft drink', N'~/Content/Uploads/3.jpg')
INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_price], [pro_desc], [pro_image]) VALUES (4, N'red man t shirt', 530, N'Armaani t shirt', N'~/Content/Uploads/4.png')
INSERT [dbo].[tbl_product] ([pro_id], [pro_name], [pro_price], [pro_desc], [pro_image]) VALUES (5, N'white shirt', 750, N'formal t shirt', N'~/Content/Uploads/5.jpg')
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_prod__E653C07B27DCADFC]    Script Date: 1/9/2019 4:19:50 PM ******/
ALTER TABLE [dbo].[tbl_product] ADD UNIQUE NONCLUSTERED 
(
	[pro_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_user__F8193DB75CD0CD3B]    Script Date: 1/9/2019 4:19:50 PM ******/
ALTER TABLE [dbo].[tbl_user] ADD UNIQUE NONCLUSTERED 
(
	[u_contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_invoice]  WITH CHECK ADD FOREIGN KEY([in_fk_user])
REFERENCES [dbo].[tbl_user] ([U_id])
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD FOREIGN KEY([o_fk_pro])
REFERENCES [dbo].[tbl_product] ([pro_id])
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD FOREIGN KEY([o_fk_invoice])
REFERENCES [dbo].[tbl_invoice] ([in_id])
GO
USE [master]
GO
ALTER DATABASE [db_ecommerce] SET  READ_WRITE 
GO
