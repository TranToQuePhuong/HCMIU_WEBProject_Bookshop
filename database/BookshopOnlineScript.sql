USE [master]
GO
/****** Object:  Database [BookshopOnline]    Script Date: 01-Apr-20 10:27:20 AM ******/
CREATE DATABASE [BookshopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookshopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookshopOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookshopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookshopOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookshopOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookshopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookshopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookshopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookshopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookshopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookshopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookshopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookshopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookshopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookshopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookshopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookshopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookshopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookshopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookshopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookshopOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookshopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookshopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookshopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookshopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookshopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookshopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookshopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookshopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [BookshopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [BookshopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookshopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookshopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookshopOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookshopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookshopOnline', N'ON'
GO
ALTER DATABASE [BookshopOnline] SET QUERY_STORE = OFF
GO
USE [BookshopOnline]
GO
/****** Object:  User [powerranger1]    Script Date: 01-Apr-20 10:27:21 AM ******/
CREATE USER [powerranger1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [powerranger]    Script Date: 01-Apr-20 10:27:21 AM ******/
CREATE USER [powerranger] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [necopotts]    Script Date: 01-Apr-20 10:27:21 AM ******/
CREATE USER [necopotts] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [hello]    Script Date: 01-Apr-20 10:27:21 AM ******/
CREATE USER [hello] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [bookshoponline]    Script Date: 01-Apr-20 10:27:21 AM ******/
CREATE USER [bookshoponline] FOR LOGIN [bookshoponline] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [powerranger1]
GO
ALTER ROLE [db_datareader] ADD MEMBER [powerranger1]
GO
ALTER ROLE [db_owner] ADD MEMBER [powerranger]
GO
ALTER ROLE [db_owner] ADD MEMBER [necopotts]
GO
ALTER ROLE [db_owner] ADD MEMBER [hello]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [bookshoponline]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [bookshoponline]
GO
ALTER ROLE [db_datareader] ADD MEMBER [bookshoponline]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [bookshoponline]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01-Apr-20 10:27:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 01-Apr-20 10:27:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 01-Apr-20 10:27:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01-Apr-20 10:27:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01-Apr-20 10:27:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[Special] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderDetails] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Orders_OrderDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Products_OrderDetails] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Products_OrderDetails]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Orders] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Customers_Orders]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Products] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Categories_Products]
GO
USE [master]
GO
ALTER DATABASE [BookshopOnline] SET  READ_WRITE 
GO
