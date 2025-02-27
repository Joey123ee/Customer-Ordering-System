USE [master]
GO
/****** Object:  Database [PhilipsOnlineShop]    Script Date: 22/11/2024 12:40:05 am ******/
CREATE DATABASE [PhilipsOnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhilipsOnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PhilipsOnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PhilipsOnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PhilipsOnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PhilipsOnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhilipsOnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhilipsOnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhilipsOnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhilipsOnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PhilipsOnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhilipsOnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PhilipsOnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [PhilipsOnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhilipsOnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhilipsOnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhilipsOnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PhilipsOnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PhilipsOnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PhilipsOnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [PhilipsOnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PhilipsOnlineShop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/11/2024 12:40:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/11/2024 12:40:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22/11/2024 12:40:05 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderStatus] [nvarchar](20) NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
	[DeliveryAddress] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241118083635_InitialCreate', N'9.0.0')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (1, N'alice_smith', N'password1', N'alice.smith@example.com', N'9876543210', N'Yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (2, N'bob_jones', N'password2', N'bob.jones@example.com', N'5432167890', N'ToaPayoh')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (3, N'charlie_brown', N'password3', N'charlie.brown@example.com', N'1029384756', N'Bishan')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (4, N'kyaw', N'123789', N'kyaw@gmail.com', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (6, N'kyawdw', N'AQAAAAIAAYagAAAAEAxrbVv6Di/T2LItO8MqpRWC1K/tlO4bmVnUiKt9U6U+jbovl3hRJ4PnwiArBUGlCg==', N'kyawdw@gmail.com', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (8, N'fefe', N'AQAAAAIAAYagAAAAECnfhwHqUIk3YZ06m54QwMT5QHrd7CTZiXCw++HBYNYGHvwcQ279VilOtqevEPl29g==', N'kyawdwd@gmail.com', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (9, N'dwdawdwa', N'dwdaddwd', N'dawd@gmail.com', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (10, N'dwdawdwaDAWDAD', N'12342341', N'rwqrqwr@ffawfaw', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (11, N'FEFEFAFA', N'23232313', N'kyawdwdDQD@gmail.com', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (12, N'grhgerhreh', N'23232313', N'kyawd42424@gmail.com', N'1234567891', N'242414')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (13, N'kkkfawkfakfaw', N'1232312312', N'dwadaw@gmail.com', N'1234567891', N'bishan')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (14, N'wfafawffwaf', N'1233123213', N'kyawrwerwr@gmail.com', N'1234567891', N'yishun')
INSERT [dbo].[Customer] ([CustomerID], [Username], [Password], [Email], [PhoneNumber], [Address]) VALUES (15, N'lolloooll', N'123789', N'zay@gmail.com', N'1234567891', N'1312yishun ')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (1, 1, CAST(N'2024-01-13T10:00:00.000' AS DateTime), N'Confirmed', N'Philips Sonicare DiamondClean', N'Yishun')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (2, 2, CAST(N'2024-04-14T10:30:00.000' AS DateTime), N'Saved', N'Updated Philips Sonicare', N'ToaPayoh')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (3, 3, CAST(N'2024-07-08T11:00:00.000' AS DateTime), N'Confirmed', N'Philips Sonicare FlexCare+', N'Bishan')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (4, 2, CAST(N'2024-11-18T00:23:24.863' AS DateTime), N'Saved', N'Updated Philips Sonicare', N'ToaPayoh')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (6, 4, CAST(N'2024-11-21T20:02:15.233' AS DateTime), N'Confirmed', N'dwdw', N'dwada')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (13, 4, CAST(N'2024-11-21T23:18:06.253' AS DateTime), N'Confirmed', N'dwdad dw', N'dwadadwwd')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (17, 4, CAST(N'2024-11-21T23:54:24.567' AS DateTime), N'Confirmed', N'dw', N'dwdwfawf')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [ItemName], [DeliveryAddress]) VALUES (18, 4, CAST(N'2024-11-22T00:30:51.150' AS DateTime), N'Saved', N'dawdwa', N'fawfa')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__536C85E48F02D902]    Script Date: 22/11/2024 12:40:05 am ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D1053490E92B37]    Script Date: 22/11/2024 12:40:05 am ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
USE [master]
GO
ALTER DATABASE [PhilipsOnlineShop] SET  READ_WRITE 
GO
