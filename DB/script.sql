USE [master]
GO
/****** Object:  Database [Boardgame]    Script Date: 6/17/2022 3:46:59 PM ******/
CREATE DATABASE [Boardgame]
GO
ALTER DATABASE [Boardgame] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Boardgame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Boardgame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Boardgame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Boardgame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Boardgame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Boardgame] SET ARITHABORT OFF 
GO
ALTER DATABASE [Boardgame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Boardgame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Boardgame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Boardgame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Boardgame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Boardgame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Boardgame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Boardgame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Boardgame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Boardgame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Boardgame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Boardgame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Boardgame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Boardgame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Boardgame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Boardgame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Boardgame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Boardgame] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Boardgame] SET  MULTI_USER 
GO
ALTER DATABASE [Boardgame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Boardgame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Boardgame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Boardgame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Boardgame] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Boardgame] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Boardgame] SET QUERY_STORE = OFF
GO
USE [Boardgame]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[CreatBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartProduct]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_CartProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateBy] [int] NULL,
	[CreateAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Stars] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackImages]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[FeedbackId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_RateImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[VoucherId] [int] NULL,
	[StatusId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserAddressId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[Ship] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[ProductPriceId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Players] [nvarchar](max) NULL,
	[PlayersSuggest] [int] NULL,
	[Time] [nvarchar](max) NULL,
	[AgeSuggest] [int] NULL,
	[MainImage] [nvarchar](max) NOT NULL,
	[ShortDesc] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[Origin] [nvarchar](max) NULL,
	[Weight] [float] NULL,
	[Size] [nvarchar](max) NULL,
	[Amount] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateAt] [datetime] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
 CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductViews]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductViews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[View] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_ProductViews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[DOB] [date] NULL,
	[Gender] [bit] NULL,
	[Phone] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[IsLock] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Fullname] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_UserAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Expired] [date] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[Amount] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Type] [bit] NOT NULL,
	[Value] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([Id], [UserId], [CreateAt], [CreatBy], [UpdateAt], [UpdateBy]) VALUES (1, 3, CAST(N'2022-05-16T21:25:34.240' AS DateTime), NULL, CAST(N'2022-05-16T21:25:34.240' AS DateTime), NULL)
INSERT [dbo].[Cart] ([Id], [UserId], [CreateAt], [CreatBy], [UpdateAt], [UpdateBy]) VALUES (2, 4, CAST(N'2022-05-16T22:13:06.720' AS DateTime), NULL, CAST(N'2022-05-16T22:13:06.720' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartProduct] ON 

INSERT [dbo].[CartProduct] ([Id], [CartId], [ProductId], [Amount], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (33, 2, 86, 3, CAST(N'2022-05-30T19:14:07.913' AS DateTime), NULL, CAST(N'2022-05-30T19:14:07.913' AS DateTime), NULL)
INSERT [dbo].[CartProduct] ([Id], [CartId], [ProductId], [Amount], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (34, 2, 88, 4, CAST(N'2022-05-30T19:14:14.747' AS DateTime), NULL, CAST(N'2022-05-30T19:14:14.747' AS DateTime), NULL)
INSERT [dbo].[CartProduct] ([Id], [CartId], [ProductId], [Amount], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (35, 2, 89, 3, CAST(N'2022-05-30T19:14:20.067' AS DateTime), NULL, CAST(N'2022-05-30T19:14:20.067' AS DateTime), NULL)
INSERT [dbo].[CartProduct] ([Id], [CartId], [ProductId], [Amount], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (36, 2, 90, 4, CAST(N'2022-05-30T19:14:24.520' AS DateTime), NULL, CAST(N'2022-05-30T19:14:24.520' AS DateTime), NULL)
INSERT [dbo].[CartProduct] ([Id], [CartId], [ProductId], [Amount], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (37, 2, 87, 2, CAST(N'2022-05-30T19:20:19.160' AS DateTime), NULL, CAST(N'2022-05-30T19:20:19.160' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CartProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (1, N'Gia đình', 0, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (2, N'nhung', 1, 1, CAST(N'2022-05-09T10:47:06.460' AS DateTime), 1, CAST(N'2022-05-09T10:50:05.350' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (3, N'Tagcat', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (4, N'Realbuzz', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (5, N'Dynava', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (6, N'Fivespan', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (7, N'Skidoo', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (8, N'Yoveo', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (9, N'Gigazoom', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (10, N'Ozu', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (11, N'Muxo', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
INSERT [dbo].[Category] ([Id], [Name], [IsDelete], [CreateBy], [CreateAt], [UpdatedBy], [UpdatedAt]) VALUES (12, N'Avamba', 0, NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime), NULL, CAST(N'2022-05-17T11:40:43.770' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [Stars], [Comment], [OrderId], [ProductId], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, 2, N'Tiếng VIệt', 6, 86, CAST(N'2022-05-20T17:35:29.093' AS DateTime), CAST(N'2022-05-20T17:35:29.093' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.093' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([Id], [Stars], [Comment], [OrderId], [ProductId], [Date], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, 3, N'Tiếng VIệt', 6, 88, CAST(N'2022-05-20T17:35:29.117' AS DateTime), CAST(N'2022-05-20T17:35:29.117' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.117' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbackImages] ON 

INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, N'http://localhost:3000/upload\98094329ca0649d8a7ac78942f2296ee', 10, CAST(N'2022-05-20T17:35:29.103' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.103' AS DateTime), NULL)
INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, N'http://localhost:3000/upload\d68088ebaaa554ee827b9d00f3c8ab78', 10, CAST(N'2022-05-20T17:35:29.103' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.103' AS DateTime), NULL)
INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (10, N'http://localhost:3000/upload\f11d04619ba5afc19337974d995c5edb', 11, CAST(N'2022-05-20T17:35:29.130' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.130' AS DateTime), NULL)
INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (11, N'http://localhost:3000/upload\1d0269bd25884305e5bd62892d7c774c', 11, CAST(N'2022-05-20T17:35:29.130' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.130' AS DateTime), NULL)
INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (12, N'http://localhost:3000/upload\c545083388e74b68de60e4803b41f9e0', 11, CAST(N'2022-05-20T17:35:29.130' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.130' AS DateTime), NULL)
INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (13, N'http://localhost:3000/upload\2cd3f7294bc76c2d50526767654c0612', 11, CAST(N'2022-05-20T17:35:29.133' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.133' AS DateTime), NULL)
INSERT [dbo].[FeedbackImages] ([Id], [Path], [FeedbackId], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (14, N'http://localhost:3000/upload\7ed7ee36f0130d1c71a5ab28565340c4', 11, CAST(N'2022-05-20T17:35:29.133' AS DateTime), NULL, CAST(N'2022-05-20T17:35:29.133' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[FeedbackImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [IsDelete], [VoucherId], [StatusId], [UserId], [UserAddressId], [Value], [Ship], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, 0, 2, 5, 4, 8, 11000901, 33000, CAST(N'2022-05-20T11:30:00.760' AS DateTime), NULL, CAST(N'2022-05-20T11:30:00.760' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [IsDelete], [VoucherId], [StatusId], [UserId], [UserAddressId], [Value], [Ship], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (6, 0, NULL, 3, 4, 8, 7417468, 33000, CAST(N'2022-05-20T13:41:37.160' AS DateTime), NULL, CAST(N'2022-05-20T13:41:37.160' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [IsDelete], [VoucherId], [StatusId], [UserId], [UserAddressId], [Value], [Ship], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (7, 0, NULL, 1, 4, 8, 144929, 33000, CAST(N'2022-05-20T13:49:28.990' AS DateTime), NULL, CAST(N'2022-05-20T13:49:28.990' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [IsDelete], [VoucherId], [StatusId], [UserId], [UserAddressId], [Value], [Ship], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (8, 0, NULL, 1, 4, 8, 144929, 33000, CAST(N'2022-05-20T13:50:01.850' AS DateTime), NULL, CAST(N'2022-05-20T13:50:01.850' AS DateTime), NULL)
INSERT [dbo].[Order] ([Id], [IsDelete], [VoucherId], [StatusId], [UserId], [UserAddressId], [Value], [Ship], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (9, 0, 3, 1, 4, 7, 170845, 33000, CAST(N'2022-05-28T15:20:01.120' AS DateTime), NULL, CAST(N'2022-05-28T15:20:01.120' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (1, 89, 3, NULL, CAST(N'2022-05-20T11:30:00.770' AS DateTime), NULL, CAST(N'2022-05-20T11:30:00.770' AS DateTime), 1065, 5)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (2, 86, 4, NULL, CAST(N'2022-05-20T11:30:00.787' AS DateTime), NULL, CAST(N'2022-05-20T11:30:00.787' AS DateTime), 1076, 5)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (3, 86, 2, NULL, CAST(N'2022-05-20T13:41:37.180' AS DateTime), NULL, CAST(N'2022-05-20T13:41:37.180' AS DateTime), 1076, 6)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (4, 88, 5, NULL, CAST(N'2022-05-20T13:41:37.190' AS DateTime), NULL, CAST(N'2022-05-20T13:41:37.190' AS DateTime), 1178, 6)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (5, 86, 1, NULL, CAST(N'2022-05-20T13:49:29.010' AS DateTime), NULL, CAST(N'2022-05-20T13:49:29.010' AS DateTime), 1076, 7)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (6, 86, 1, NULL, CAST(N'2022-05-20T13:50:01.853' AS DateTime), NULL, CAST(N'2022-05-20T13:50:01.853' AS DateTime), 1076, 8)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (7, 88, 9, NULL, CAST(N'2022-05-28T15:20:01.130' AS DateTime), NULL, CAST(N'2022-05-28T15:20:01.130' AS DateTime), 1178, 9)
INSERT [dbo].[OrderDetail] ([Id], [ProductId], [Quantity], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [ProductPriceId], [OrderId]) VALUES (8, 86, 8, NULL, CAST(N'2022-05-28T15:20:01.133' AS DateTime), NULL, CAST(N'2022-05-28T15:20:01.133' AS DateTime), 1076, 9)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (1, N'Đạt', NULL, NULL, NULL, NULL, N'http://dummyimage.com/230x100.png/5fa2dd/ffffff', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', NULL, NULL, NULL, NULL, NULL, 11, 0, NULL, CAST(N'2022-05-17T11:46:18.333' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.333' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (2, N'Sơn', NULL, NULL, NULL, NULL, N'http://dummyimage.com/121x100.png/dddddd/000000', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', NULL, NULL, NULL, NULL, NULL, 47, 0, NULL, CAST(N'2022-05-17T11:46:18.340' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.340' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (3, N'Tuấn', NULL, NULL, NULL, NULL, N'http://dummyimage.com/233x100.png/dddddd/000000', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', NULL, NULL, NULL, NULL, NULL, 10, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (4, N'Nguyễn Ngọc Trường Sơn', NULL, NULL, NULL, NULL, N'http://dummyimage.com/200x100.png/ff4444/ffffff', N'In congue. Etiam justo. Etiam pretium iaculis justo.', NULL, NULL, NULL, NULL, NULL, 71, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (5, N'Phạm Lê Thảo Nguyên', NULL, NULL, NULL, NULL, N'http://dummyimage.com/240x100.png/ff4444/ffffff', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', NULL, NULL, NULL, NULL, NULL, 83, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (6, N'Lê Quang Liêm', NULL, NULL, NULL, NULL, N'http://dummyimage.com/157x100.png/dddddd/000000', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', NULL, NULL, NULL, NULL, NULL, 62, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (7, N'Rath, Jakubowski and Heathcote', NULL, NULL, NULL, NULL, N'http://dummyimage.com/142x100.png/5fa2dd/ffffff', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', NULL, NULL, NULL, NULL, NULL, 71, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (8, N'Padberg Inc', NULL, NULL, NULL, NULL, N'http://dummyimage.com/129x100.png/ff4444/ffffff', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (9, N'Rice-Schneider', NULL, NULL, NULL, NULL, N'http://dummyimage.com/125x100.png/5fa2dd/ffffff', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', NULL, NULL, NULL, NULL, NULL, 58, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (10, N'Bergnaum LLC', NULL, NULL, NULL, NULL, N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', NULL, NULL, NULL, NULL, NULL, 96, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (11, N'Willms and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/103x100.png/5fa2dd/ffffff', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', NULL, NULL, NULL, NULL, NULL, 93, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (12, N'Kessler, Wehner and Rogahn', NULL, NULL, NULL, NULL, N'http://dummyimage.com/196x100.png/dddddd/000000', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', NULL, NULL, NULL, NULL, NULL, 42, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (13, N'Johnson, Goyette and Simonis', NULL, NULL, NULL, NULL, N'http://dummyimage.com/227x100.png/5fa2dd/ffffff', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', NULL, NULL, NULL, NULL, NULL, 84, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (14, N'Klein, Kris and Walter', NULL, NULL, NULL, NULL, N'http://dummyimage.com/223x100.png/ff4444/ffffff', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', NULL, NULL, NULL, NULL, NULL, 25, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (15, N'Parisian-Wyman', NULL, NULL, NULL, NULL, N'http://dummyimage.com/104x100.png/cc0000/ffffff', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', NULL, NULL, NULL, NULL, NULL, 65, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (16, N'Hackett-Johns', NULL, NULL, NULL, NULL, N'http://dummyimage.com/232x100.png/cc0000/ffffff', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', NULL, NULL, NULL, NULL, NULL, 29, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (17, N'Konopelski-Bayer', NULL, NULL, NULL, NULL, N'http://dummyimage.com/138x100.png/dddddd/000000', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', NULL, NULL, NULL, NULL, NULL, 36, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (18, N'Stroman, Lebsack and Grady', NULL, NULL, NULL, NULL, N'http://dummyimage.com/193x100.png/cc0000/ffffff', N'Fusce consequat. Nulla nisl. Nunc nisl.', NULL, NULL, NULL, NULL, NULL, 27, 0, NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.343' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (19, N'Stanton LLC', NULL, NULL, NULL, NULL, N'http://dummyimage.com/226x100.png/ff4444/ffffff', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', NULL, NULL, NULL, NULL, NULL, 14, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (20, N'McKenzie-Boyle', NULL, NULL, NULL, NULL, N'http://dummyimage.com/135x100.png/dddddd/000000', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', NULL, NULL, NULL, NULL, NULL, 71, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (21, N'Hirthe, Abernathy and Dooley', NULL, NULL, NULL, NULL, N'http://dummyimage.com/139x100.png/ff4444/ffffff', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, NULL, NULL, NULL, 69, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (22, N'Hessel-Jacobson', NULL, NULL, NULL, NULL, N'http://dummyimage.com/191x100.png/dddddd/000000', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', NULL, NULL, NULL, NULL, NULL, 86, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (23, N'Heathcote, Rice and Bayer', NULL, NULL, NULL, NULL, N'http://dummyimage.com/196x100.png/ff4444/ffffff', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', NULL, NULL, NULL, NULL, NULL, 42, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (24, N'Quigley, Ernser and Stoltenberg', NULL, NULL, NULL, NULL, N'http://dummyimage.com/135x100.png/dddddd/000000', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', NULL, NULL, NULL, NULL, NULL, 10, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (25, N'Abernathy, Hyatt and Tremblay', NULL, NULL, NULL, NULL, N'http://dummyimage.com/233x100.png/ff4444/ffffff', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, NULL, NULL, NULL, NULL, 9, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (26, N'Pagac-Lockman', NULL, NULL, NULL, NULL, N'http://dummyimage.com/144x100.png/ff4444/ffffff', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', NULL, NULL, NULL, NULL, NULL, 63, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (27, N'Zemlak LLC', NULL, NULL, NULL, NULL, N'http://dummyimage.com/139x100.png/5fa2dd/ffffff', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', NULL, NULL, NULL, NULL, NULL, 97, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (28, N'Schmidt, Pagac and Kris', NULL, NULL, NULL, NULL, N'http://dummyimage.com/143x100.png/5fa2dd/ffffff', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', NULL, NULL, NULL, NULL, NULL, 60, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (29, N'Gerhold Inc', NULL, NULL, NULL, NULL, N'http://dummyimage.com/164x100.png/dddddd/000000', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', NULL, NULL, NULL, NULL, NULL, 25, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (30, N'Kassulke Inc', NULL, NULL, NULL, NULL, N'http://dummyimage.com/165x100.png/ff4444/ffffff', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', NULL, NULL, NULL, NULL, NULL, 98, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (31, N'Halvorson-Waelchi', NULL, NULL, NULL, NULL, N'http://dummyimage.com/102x100.png/ff4444/ffffff', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', NULL, NULL, NULL, NULL, NULL, 65, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (32, N'Ernser-Johnson', NULL, NULL, NULL, NULL, N'http://dummyimage.com/210x100.png/5fa2dd/ffffff', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', NULL, NULL, NULL, NULL, NULL, 40, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (33, N'Murazik LLC', NULL, NULL, NULL, NULL, N'http://dummyimage.com/241x100.png/dddddd/000000', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', NULL, NULL, NULL, NULL, NULL, 20, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (34, N'Leuschke, White and McDermott', NULL, NULL, NULL, NULL, N'http://dummyimage.com/156x100.png/dddddd/000000', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', NULL, NULL, NULL, NULL, NULL, 59, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (35, N'Torphy, Barrows and Marquardt', NULL, NULL, NULL, NULL, N'http://dummyimage.com/204x100.png/5fa2dd/ffffff', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', NULL, NULL, NULL, NULL, NULL, 46, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (36, N'Pollich Group', NULL, NULL, NULL, NULL, N'http://dummyimage.com/245x100.png/dddddd/000000', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', NULL, NULL, NULL, NULL, NULL, 37, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (37, N'DuBuque-Zieme', NULL, NULL, NULL, NULL, N'http://dummyimage.com/221x100.png/5fa2dd/ffffff', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', NULL, NULL, NULL, NULL, NULL, 52, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (38, N'Maggio-Schmeler', NULL, NULL, NULL, NULL, N'http://dummyimage.com/225x100.png/ff4444/ffffff', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', NULL, NULL, NULL, NULL, NULL, 57, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (39, N'Robel, Boyle and Kilback', NULL, NULL, NULL, NULL, N'http://dummyimage.com/241x100.png/5fa2dd/ffffff', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', NULL, NULL, NULL, NULL, NULL, 73, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (40, N'Hyatt, Kirlin and O''Keefe', NULL, NULL, NULL, NULL, N'http://dummyimage.com/207x100.png/5fa2dd/ffffff', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', NULL, NULL, NULL, NULL, NULL, 16, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (41, N'Abernathy, Kirlin and Jast', NULL, NULL, NULL, NULL, N'http://dummyimage.com/108x100.png/ff4444/ffffff', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', NULL, NULL, NULL, NULL, NULL, 44, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (42, N'Cole, Raynor and Carter', NULL, NULL, NULL, NULL, N'http://dummyimage.com/227x100.png/cc0000/ffffff', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', NULL, NULL, NULL, NULL, NULL, 5, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (43, N'Harris Inc', NULL, NULL, NULL, NULL, N'http://dummyimage.com/124x100.png/ff4444/ffffff', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', NULL, NULL, NULL, NULL, NULL, 85, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (44, N'Rempel-Schoen', NULL, NULL, NULL, NULL, N'http://dummyimage.com/216x100.png/dddddd/000000', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', NULL, NULL, NULL, NULL, NULL, 45, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (45, N'Johnston and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/141x100.png/dddddd/000000', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (46, N'Nitzsche, Doyle and Grimes', NULL, NULL, NULL, NULL, N'http://dummyimage.com/155x100.png/5fa2dd/ffffff', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', NULL, NULL, NULL, NULL, NULL, 74, 0, NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.347' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (47, N'Hoppe and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/247x100.png/dddddd/000000', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', NULL, NULL, NULL, NULL, NULL, 87, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (48, N'Runolfsson and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/234x100.png/dddddd/000000', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', NULL, NULL, NULL, NULL, NULL, 8, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (49, N'Windler, Little and Senger', NULL, NULL, NULL, NULL, N'http://dummyimage.com/221x100.png/5fa2dd/ffffff', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', NULL, NULL, NULL, NULL, NULL, 96, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (50, N'Klein-Cormier', NULL, NULL, NULL, NULL, N'http://dummyimage.com/136x100.png/5fa2dd/ffffff', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', NULL, NULL, NULL, NULL, NULL, 96, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (51, N'Wilderman, Zboncak and O''Conner', NULL, NULL, NULL, NULL, N'http://dummyimage.com/101x100.png/ff4444/ffffff', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', NULL, NULL, NULL, NULL, NULL, 81, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (52, N'Kilback, Hettinger and Osinski', NULL, NULL, NULL, NULL, N'http://dummyimage.com/227x100.png/ff4444/ffffff', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', NULL, NULL, NULL, NULL, NULL, 34, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (53, N'Labadie, Bechtelar and Robel', NULL, NULL, NULL, NULL, N'http://dummyimage.com/151x100.png/ff4444/ffffff', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', NULL, NULL, NULL, NULL, NULL, 16, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (54, N'Renner, Hyatt and Cremin', NULL, NULL, NULL, NULL, N'http://dummyimage.com/102x100.png/ff4444/ffffff', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (55, N'Satterfield, Stokes and Bechtelar', NULL, NULL, NULL, NULL, N'http://dummyimage.com/170x100.png/ff4444/ffffff', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', NULL, NULL, NULL, NULL, NULL, 31, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (56, N'Littel LLC', NULL, NULL, NULL, NULL, N'http://dummyimage.com/219x100.png/cc0000/ffffff', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', NULL, NULL, NULL, NULL, NULL, 5, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (57, N'McLaughlin Inc', NULL, NULL, NULL, NULL, N'http://dummyimage.com/106x100.png/5fa2dd/ffffff', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', NULL, NULL, NULL, NULL, NULL, 86, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (58, N'Stokes-Prohaska', NULL, NULL, NULL, NULL, N'http://dummyimage.com/250x100.png/cc0000/ffffff', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', NULL, NULL, NULL, NULL, NULL, 17, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (59, N'Heathcote-Upton', NULL, NULL, NULL, NULL, N'http://dummyimage.com/163x100.png/cc0000/ffffff', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', NULL, NULL, NULL, NULL, NULL, 64, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (60, N'Swift, Ward and Wolff', NULL, NULL, NULL, NULL, N'http://dummyimage.com/144x100.png/ff4444/ffffff', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', NULL, NULL, NULL, NULL, NULL, 100, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (61, N'Stiedemann-Stracke', NULL, NULL, NULL, NULL, N'http://dummyimage.com/208x100.png/cc0000/ffffff', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', NULL, NULL, NULL, NULL, NULL, 57, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (62, N'Wyman, Pfeffer and Casper', NULL, NULL, NULL, NULL, N'http://dummyimage.com/112x100.png/cc0000/ffffff', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', NULL, NULL, NULL, NULL, NULL, 12, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (63, N'Jerde, Kunze and Maggio', NULL, NULL, NULL, NULL, N'http://dummyimage.com/132x100.png/cc0000/ffffff', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', NULL, NULL, NULL, NULL, NULL, 27, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (64, N'Anderson, Klein and Schumm', NULL, NULL, NULL, NULL, N'http://dummyimage.com/217x100.png/dddddd/000000', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', NULL, NULL, NULL, NULL, NULL, 23, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (65, N'Roob, Brekke and Bahringer', NULL, NULL, NULL, NULL, N'http://dummyimage.com/193x100.png/dddddd/000000', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', NULL, NULL, NULL, NULL, NULL, 25, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (66, N'Fisher, Cummings and Kunze', NULL, NULL, NULL, NULL, N'http://dummyimage.com/109x100.png/5fa2dd/ffffff', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', NULL, NULL, NULL, NULL, NULL, 66, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (67, N'Bartoletti, Torphy and Orn', NULL, NULL, NULL, NULL, N'http://dummyimage.com/126x100.png/5fa2dd/ffffff', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', NULL, NULL, NULL, NULL, NULL, 41, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (68, N'Watsica and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/126x100.png/5fa2dd/ffffff', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', NULL, NULL, NULL, NULL, NULL, 16, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (69, N'Nienow-Hirthe', NULL, NULL, NULL, NULL, N'http://dummyimage.com/141x100.png/cc0000/ffffff', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', NULL, NULL, NULL, NULL, NULL, 83, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (70, N'Muller, Rohan and Kautzer', NULL, NULL, NULL, NULL, N'http://dummyimage.com/141x100.png/dddddd/000000', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', NULL, NULL, NULL, NULL, NULL, 71, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (71, N'Fadel-Herman', NULL, NULL, NULL, NULL, N'http://dummyimage.com/102x100.png/cc0000/ffffff', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', NULL, NULL, NULL, NULL, NULL, 42, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (72, N'Stoltenberg-Rowe', NULL, NULL, NULL, NULL, N'http://dummyimage.com/220x100.png/dddddd/000000', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', NULL, NULL, NULL, NULL, NULL, 51, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (73, N'Greenfelder Group', NULL, NULL, NULL, NULL, N'http://dummyimage.com/187x100.png/ff4444/ffffff', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', NULL, NULL, NULL, NULL, NULL, 19, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (74, N'Huel, Treutel and Huels', NULL, NULL, NULL, NULL, N'http://dummyimage.com/145x100.png/5fa2dd/ffffff', N'Fusce consequat. Nulla nisl. Nunc nisl.', NULL, NULL, NULL, NULL, NULL, 84, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (75, N'Kessler and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/112x100.png/dddddd/000000', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', NULL, NULL, NULL, NULL, NULL, 95, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (76, N'Harvey Group', NULL, NULL, NULL, NULL, N'http://dummyimage.com/145x100.png/5fa2dd/ffffff', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', NULL, NULL, NULL, NULL, NULL, 20, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (77, N'Hane-Bartell', NULL, NULL, NULL, NULL, N'http://dummyimage.com/157x100.png/dddddd/000000', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', NULL, NULL, NULL, NULL, NULL, 26, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (78, N'Hagenes-Moen', NULL, NULL, NULL, NULL, N'http://dummyimage.com/181x100.png/ff4444/ffffff', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', NULL, NULL, NULL, NULL, NULL, 45, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (79, N'Jones, Schneider and Rohan', NULL, NULL, NULL, NULL, N'http://dummyimage.com/102x100.png/dddddd/000000', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', NULL, NULL, NULL, NULL, NULL, 49, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (80, N'Bogan Inc', NULL, NULL, NULL, NULL, N'http://dummyimage.com/177x100.png/5fa2dd/ffffff', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', NULL, NULL, NULL, NULL, NULL, 69, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (81, N'Nikolaus and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/229x100.png/5fa2dd/ffffff', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', NULL, NULL, NULL, NULL, NULL, 44, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (82, N'Lowe-Douglas', NULL, NULL, NULL, NULL, N'http://dummyimage.com/133x100.png/dddddd/000000', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', NULL, NULL, NULL, NULL, NULL, 89, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (83, N'Larkin and Sons', NULL, NULL, NULL, NULL, N'http://dummyimage.com/125x100.png/dddddd/000000', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', NULL, NULL, NULL, NULL, NULL, 74, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (84, N'Willms, Dicki and Welch', NULL, NULL, NULL, NULL, N'http://dummyimage.com/226x100.png/5fa2dd/ffffff', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', NULL, NULL, NULL, NULL, NULL, 32, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (85, N'Rutherford-Bauch', NULL, NULL, NULL, NULL, N'http://dummyimage.com/137x100.png/dddddd/000000', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', NULL, NULL, NULL, NULL, NULL, 46, 0, NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.350' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (86, N'Mertz, Lang and Glover', NULL, NULL, NULL, NULL, N'https://cdn.noron.vn/2021/11/10/2508818161574-1636549765.jpg', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', NULL, NULL, NULL, NULL, NULL, 78, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (87, N'Dooley-Hirthe', NULL, NULL, NULL, NULL, N'https://ggstore.vn/apt-upload/image/cache/data/Boardgame/carcassone3-476x360.jpg', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', NULL, NULL, NULL, NULL, NULL, 19, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (88, N'Hammes-Littel', NULL, NULL, NULL, NULL, N'https://cdn.noron.vn/2021/11/10/2508818161574-1636549765.jpg', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', NULL, NULL, NULL, NULL, NULL, 57, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (89, N'Bogan Group', NULL, NULL, NULL, NULL, N'https://cth.edu.vn/wp-content/uploads/www.teachervision.com/sites/default/files/inline-images/Clue-USE.jpg', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', NULL, NULL, NULL, NULL, NULL, 79, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (90, N'Pollich Group', NULL, NULL, NULL, NULL, N'https://cdn.noron.vn/2021/11/10/2508818161574-1636549765.jpg', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', NULL, NULL, NULL, NULL, NULL, 77, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (91, N'Jenkins and Sons', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', NULL, NULL, NULL, NULL, NULL, 92, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (92, N'Rogahn-Watsica', NULL, NULL, NULL, NULL, N'https://tiepthigiadinh.vn/wp-content/uploads/2021/02/Boardgame_mockup2.png', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', NULL, NULL, NULL, NULL, NULL, 49, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (93, N'Schoen Inc', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', NULL, NULL, NULL, NULL, NULL, 84, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (94, N'Aufderhar and Sons', NULL, NULL, NULL, NULL, N'https://tiepthigiadinh.vn/wp-content/uploads/2021/02/Boardgame_mockup2.png', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', NULL, NULL, NULL, NULL, NULL, 86, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (95, N'Heidenreich, Koelpin and Tromp', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', NULL, NULL, NULL, NULL, NULL, 78, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (96, N'Mante LLC', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', NULL, NULL, NULL, NULL, NULL, 44, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (97, N'Sipes, Tromp and Beatty', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', NULL, NULL, NULL, NULL, NULL, 37, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (98, N'Corwin-Ratke', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', NULL, NULL, NULL, NULL, NULL, 76, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (99, N'Denesik, Dickens and Zboncak', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', NULL, NULL, NULL, NULL, NULL, 22, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
GO
INSERT [dbo].[Product] ([Id], [Name], [Players], [PlayersSuggest], [Time], [AgeSuggest], [MainImage], [ShortDesc], [Description], [Brand], [Origin], [Weight], [Size], [Amount], [IsDelete], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt]) VALUES (100, N'Homenick Group', NULL, NULL, NULL, NULL, N'https://hocvienBoardgame.vn/wp-content/uploads/2019/08/huong-dan-cach-choi-board-game-xom-chim-chi-tiet-4.jpg', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', NULL, NULL, NULL, NULL, NULL, 17, 0, NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime), NULL, CAST(N'2022-05-17T11:46:18.353' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (93, 2, 1, CAST(N'2022-05-20T08:53:50.463' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.463' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (94, 3, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (95, 4, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (96, 5, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (97, 6, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (98, 7, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (99, 8, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (100, 9, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (101, 10, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (102, 11, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (103, 12, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (104, 13, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (105, 14, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (106, 15, 1, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.467' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (107, 16, 1, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (108, 17, 1, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (109, 18, 1, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (110, 19, 1, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (111, 99, 7, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (112, 35, 9, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (113, 64, 4, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (114, 54, 6, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (115, 62, 2, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (116, 93, 4, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (117, 30, 10, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (118, 40, 5, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (119, 90, 2, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (120, 48, 4, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (121, 32, 2, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (122, 51, 6, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (123, 48, 7, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (124, 26, 10, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (125, 1, 9, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.470' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (127, 65, 2, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (128, 47, 8, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (129, 46, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (130, 88, 4, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (131, 52, 5, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (132, 52, 4, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (133, 79, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (135, 44, 9, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (136, 46, 3, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (137, 43, 9, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (138, 36, 2, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (139, 47, 2, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (140, 83, 10, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (141, 47, 6, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (142, 50, 2, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (143, 91, 8, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (144, 33, 10, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (145, 68, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (146, 54, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (147, 82, 4, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (148, 32, 3, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (149, 33, 6, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (150, 66, 9, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (151, 82, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (152, 57, 2, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (153, 27, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (154, 83, 3, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (155, 45, 5, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (156, 30, 9, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (157, 49, 4, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (158, 25, 9, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (159, 86, 8, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (160, 41, 7, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (162, 31, 5, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (163, 42, 2, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (164, 64, 10, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.480' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (165, 43, 5, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (166, 72, 3, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (167, 49, 2, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (168, 78, 8, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (169, 62, 4, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (170, 54, 10, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (171, 28, 8, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (172, 30, 4, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (173, 37, 4, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (174, 41, 5, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (175, 91, 4, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (176, 65, 3, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (177, 58, 6, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (178, 45, 10, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (179, 79, 5, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (180, 28, 9, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (181, 40, 7, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (182, 70, 2, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (183, 37, 7, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
INSERT [dbo].[ProductCategory] ([Id], [ProductId], [CategoryId], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (184, 32, 1, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL, CAST(N'2022-05-20T08:53:50.483' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1020, 1, 1463082, CAST(N'2022-04-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1021, 26, 4783248, CAST(N'2022-05-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1022, 24, 2750009, CAST(N'2022-03-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1023, 30, 4000117, CAST(N'2021-05-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1024, 13, 3341447, CAST(N'2021-10-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1025, 25, 2136103, CAST(N'2021-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1026, 69, 1642701, CAST(N'2021-08-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1027, 14, 2276765, CAST(N'2022-03-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1028, 41, 763359, CAST(N'2021-09-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1029, 86, 4745752, CAST(N'2021-05-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1030, 64, 2762564, CAST(N'2021-11-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1031, 33, 486875, CAST(N'2021-07-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1032, 38, 2205246, CAST(N'2022-05-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1033, 27, 4065551, CAST(N'2022-04-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1034, 6, 2862319, CAST(N'2021-10-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1035, 80, 4135939, CAST(N'2021-04-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1036, 89, 928145, CAST(N'2021-11-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1037, 50, 3100699, CAST(N'2021-12-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1038, 34, 501793, CAST(N'2022-02-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1039, 29, 3231385, CAST(N'2022-03-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1040, 68, 2859273, CAST(N'2021-04-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1041, 5, 4914661, CAST(N'2021-09-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1042, 49, 4325363, CAST(N'2022-05-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1043, 30, 3571480, CAST(N'2021-07-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1044, 66, 2273072, CAST(N'2022-04-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1045, 76, 4625876, CAST(N'2021-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1046, 4, 2029401, CAST(N'2021-09-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1047, 52, 3820576, CAST(N'2021-08-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1048, 40, 4615519, CAST(N'2021-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1049, 41, 4733442, CAST(N'2021-06-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1050, 81, 2455683, CAST(N'2021-05-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1051, 8, 3747273, CAST(N'2021-08-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1052, 91, 1212710, CAST(N'2021-07-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1053, 33, 2834820, CAST(N'2021-08-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1054, 100, 2878593, CAST(N'2021-05-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1055, 26, 4523928, CAST(N'2021-08-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1056, 38, 1324350, CAST(N'2022-01-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1057, 90, 4619740, CAST(N'2022-02-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1058, 35, 673825, CAST(N'2021-07-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1059, 74, 3314247, CAST(N'2021-08-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1060, 99, 261561, CAST(N'2022-01-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1061, 81, 75178, CAST(N'2021-10-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1062, 8, 1235108, CAST(N'2021-10-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1063, 20, 3843817, CAST(N'2022-01-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1064, 57, 4112465, CAST(N'2021-10-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1065, 89, 3912947, CAST(N'2022-05-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1066, 32, 1902378, CAST(N'2022-05-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1067, 29, 1220264, CAST(N'2021-10-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1068, 86, 1062913, CAST(N'2021-05-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1069, 86, 2001401, CAST(N'2022-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1070, 56, 2891302, CAST(N'2021-04-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1071, 22, 1889230, CAST(N'2021-06-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1072, 44, 4688531, CAST(N'2021-05-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1073, 81, 1381370, CAST(N'2021-05-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1074, 5, 3823447, CAST(N'2021-08-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1075, 34, 3801566, CAST(N'2022-02-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1076, 86, 111929, CAST(N'2022-05-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1077, 2, 1379059, CAST(N'2021-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1078, 92, 3627073, CAST(N'2021-12-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1079, 99, 3765543, CAST(N'2021-06-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1080, 76, 269079, CAST(N'2021-08-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1081, 63, 3418781, CAST(N'2021-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1082, 7, 3666058, CAST(N'2022-02-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1083, 85, 2904646, CAST(N'2021-10-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1084, 36, 3298242, CAST(N'2022-02-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1085, 44, 4655553, CAST(N'2022-04-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1086, 12, 3508424, CAST(N'2022-05-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1087, 12, 4561928, CAST(N'2022-04-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1088, 63, 765051, CAST(N'2021-09-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1089, 24, 2241791, CAST(N'2022-01-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1090, 92, 871876, CAST(N'2021-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1091, 53, 4602506, CAST(N'2022-01-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1092, 18, 3189515, CAST(N'2021-10-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1093, 53, 877383, CAST(N'2022-02-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1094, 43, 2189418, CAST(N'2021-06-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1095, 7, 538665, CAST(N'2022-01-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1096, 48, 3148067, CAST(N'2022-01-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1097, 21, 2158877, CAST(N'2021-12-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1098, 77, 143104, CAST(N'2021-10-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1099, 54, 4630886, CAST(N'2022-01-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1100, 59, 1620413, CAST(N'2022-01-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1101, 34, 1439446, CAST(N'2021-09-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1102, 24, 4612194, CAST(N'2021-11-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1103, 81, 620500, CAST(N'2021-11-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1104, 11, 717397, CAST(N'2021-12-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1105, 92, 2676768, CAST(N'2022-03-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1106, 85, 1381555, CAST(N'2021-05-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1107, 25, 2471495, CAST(N'2021-10-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1108, 56, 448753, CAST(N'2021-07-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1109, 78, 139310, CAST(N'2021-08-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1110, 94, 4272277, CAST(N'2022-03-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1111, 81, 1787538, CAST(N'2021-11-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1112, 82, 330234, CAST(N'2021-08-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1113, 92, 3060011, CAST(N'2022-03-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1114, 17, 1142700, CAST(N'2022-01-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1115, 25, 3962328, CAST(N'2021-04-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1116, 39, 862215, CAST(N'2022-03-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1117, 51, 259792, CAST(N'2021-05-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1118, 71, 4482281, CAST(N'2021-04-25T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1119, 51, 612494, CAST(N'2021-05-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1120, 69, 1097939, CAST(N'2021-07-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1121, 1, 4822325, CAST(N'2022-01-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1122, 79, 4216467, CAST(N'2022-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1123, 46, 2521027, CAST(N'2021-06-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1124, 11, 3265713, CAST(N'2021-06-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1125, 36, 3819637, CAST(N'2021-08-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1126, 14, 2876936, CAST(N'2022-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1127, 76, 893387, CAST(N'2022-03-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1128, 23, 4703660, CAST(N'2021-05-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1129, 21, 2504847, CAST(N'2022-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1130, 56, 2686394, CAST(N'2021-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1131, 65, 427837, CAST(N'2021-05-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1132, 91, 3648706, CAST(N'2021-09-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1133, 40, 4394002, CAST(N'2021-12-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1134, 84, 2462386, CAST(N'2021-08-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1135, 51, 4198021, CAST(N'2022-04-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1136, 91, 3427152, CAST(N'2021-04-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1137, 62, 2554769, CAST(N'2022-01-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1138, 72, 4799965, CAST(N'2021-08-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1139, 82, 2673935, CAST(N'2022-03-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1140, 51, 630285, CAST(N'2021-05-25T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1141, 72, 1997743, CAST(N'2021-09-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1142, 64, 3355264, CAST(N'2021-09-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1143, 10, 3585225, CAST(N'2021-08-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1144, 57, 4903454, CAST(N'2021-11-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1145, 77, 459553, CAST(N'2022-03-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1146, 26, 3838881, CAST(N'2021-10-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1147, 74, 2151532, CAST(N'2021-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1148, 12, 1097447, CAST(N'2021-10-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1149, 60, 3284770, CAST(N'2021-06-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1150, 50, 4567703, CAST(N'2022-03-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1151, 25, 4407359, CAST(N'2021-05-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1152, 13, 3888184, CAST(N'2021-11-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1153, 24, 4253794, CAST(N'2021-04-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1154, 56, 603051, CAST(N'2021-07-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1155, 32, 4991056, CAST(N'2022-04-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1156, 6, 4820991, CAST(N'2021-12-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1157, 62, 1900899, CAST(N'2022-04-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1158, 52, 709078, CAST(N'2022-02-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1159, 57, 3829592, CAST(N'2021-12-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1160, 40, 4207179, CAST(N'2022-03-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1161, 36, 4911059, CAST(N'2021-12-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1162, 38, 393367, CAST(N'2021-12-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1163, 97, 1474201, CAST(N'2021-05-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1164, 62, 3820278, CAST(N'2022-01-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1165, 48, 3932425, CAST(N'2021-10-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1166, 5, 3355367, CAST(N'2022-02-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1167, 40, 1632198, CAST(N'2021-08-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1168, 1, 2489311, CAST(N'2022-05-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1169, 33, 2730903, CAST(N'2021-06-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1170, 97, 4159615, CAST(N'2021-05-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1171, 50, 1160848, CAST(N'2021-05-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1172, 81, 458848, CAST(N'2022-02-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1173, 25, 1860482, CAST(N'2022-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1174, 33, 165051, CAST(N'2021-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1175, 39, 4948302, CAST(N'2021-10-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1176, 54, 3998970, CAST(N'2021-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1177, 75, 2373589, CAST(N'2022-04-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1178, 88, 1432122, CAST(N'2021-08-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1179, 67, 3246640, CAST(N'2021-12-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1180, 78, 1095592, CAST(N'2021-04-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1181, 24, 684291, CAST(N'2022-01-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1182, 2, 3417298, CAST(N'2022-01-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1183, 42, 341425, CAST(N'2022-04-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1184, 77, 3277021, CAST(N'2021-05-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1185, 7, 2992626, CAST(N'2022-03-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1186, 50, 3488075, CAST(N'2022-02-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1187, 31, 2094211, CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1188, 33, 1217654, CAST(N'2021-08-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1189, 5, 4616102, CAST(N'2021-06-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1190, 58, 3382621, CAST(N'2022-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1191, 86, 167708, CAST(N'2021-09-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1192, 57, 3540180, CAST(N'2022-01-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1193, 49, 2708175, CAST(N'2021-10-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1194, 53, 1885267, CAST(N'2021-07-24T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1195, 4, 2269125, CAST(N'2021-05-29T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1196, 79, 175847, CAST(N'2021-10-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1197, 34, 778240, CAST(N'2021-06-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1198, 81, 2963926, CAST(N'2021-11-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1199, 44, 3772981, CAST(N'2022-01-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1200, 80, 2533075, CAST(N'2022-02-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1201, 75, 3596396, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1202, 58, 2846821, CAST(N'2022-01-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1203, 57, 1286885, CAST(N'2022-03-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1204, 10, 4979422, CAST(N'2021-10-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1205, 25, 856854, CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1206, 91, 1196571, CAST(N'2021-12-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1207, 36, 4815219, CAST(N'2021-08-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1208, 73, 436648, CAST(N'2021-09-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1209, 60, 389390, CAST(N'2021-05-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1210, 84, 3944870, CAST(N'2021-05-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1211, 63, 1453246, CAST(N'2021-08-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1212, 40, 142126, CAST(N'2022-04-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1213, 19, 3115021, CAST(N'2021-10-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1214, 83, 3699187, CAST(N'2021-08-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1215, 100, 4908453, CAST(N'2021-05-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1216, 51, 1074137, CAST(N'2021-12-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1217, 45, 945519, CAST(N'2022-02-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1218, 71, 4865851, CAST(N'2021-09-04T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Price], [CreatedAt], [CreatedBy]) VALUES (1219, 28, 4910192, CAST(N'2022-05-05T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (1, N'Mới tạo', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Status] ([Id], [Name], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'Đã xác nhận', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Status] ([Id], [Name], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'Hoàn thành', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Status] ([Id], [Name], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (4, N'Từ chối', 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Status] ([Id], [Name], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (5, N'Huỷ', 5, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [FullName], [Email], [Password], [Role], [IsDelete], [DOB], [Gender], [Phone], [Avatar], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsLock]) VALUES (3, N'kuro', NULL, N'kuro@gmail.com', N'123456', 1, 0, NULL, NULL, NULL, NULL, CAST(N'2022-05-16T21:25:34.233' AS DateTime), NULL, CAST(N'2022-05-16T21:25:34.233' AS DateTime), NULL, 0)
INSERT [dbo].[User] ([Id], [Username], [FullName], [Email], [Password], [Role], [IsDelete], [DOB], [Gender], [Phone], [Avatar], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [IsLock]) VALUES (4, N'BoardgameKTPM', N'Ha Phuong Hoang Mai', N'haphuonghoangmai@gmail.com', N'$2b$10$db4Ig0GT/ss7IOd11aHmYuXYqmEc8x2NGMpkkORRLu4CYZoDHyBYi', 0, 0, CAST(N'2022-04-06' AS Date), 1, N'0947471823', N'http://localhost:3000/upload\avatar\d48d1c3b2ce42fbf7390ce632d4d54a7', CAST(N'2022-05-16T22:13:06.710' AS DateTime), NULL, CAST(N'2022-05-28T15:16:40.670' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAddress] ON 

INSERT [dbo].[UserAddress] ([Id], [UserId], [Fullname], [Phone], [Address], [IsDefault]) VALUES (1, 4, N'Hà Phương Hoàng Mai', N'0947471823', N'100 abc, Phường Vỹ Dạ, Thành phố Huế, Tỉnh Thừa Thiên Huế', 0)
INSERT [dbo].[UserAddress] ([Id], [UserId], [Fullname], [Phone], [Address], [IsDefault]) VALUES (6, 4, N'Hà Phương Hoàng Mai', N'0947471823', N'100 Phạm Văn Đồng, Phường Phan Thiết, Thành phố Tuyên Quang, Tỉnh Tuyên Quang', 0)
INSERT [dbo].[UserAddress] ([Id], [UserId], [Fullname], [Phone], [Address], [IsDefault]) VALUES (7, 4, N'abc', N'0947471823', N'123 ABC, Phường Phú Thuận, Thành phố Huế, Tỉnh Thừa Thiên Huế', 0)
INSERT [dbo].[UserAddress] ([Id], [UserId], [Fullname], [Phone], [Address], [IsDefault]) VALUES (8, 4, N'123', N'0947471823', N'123 ABC, Phường Nguyễn Thị Minh Khai, Thành Phố Bắc Kạn, Tỉnh Bắc Kạn', 1)
INSERT [dbo].[UserAddress] ([Id], [UserId], [Fullname], [Phone], [Address], [IsDefault]) VALUES (9, 4, N'Ha Phuong Hoang Mai', N'0947471823', N'123 ABC, Thị trấn Nà Phặc, Huyện Ngân Sơn, Tỉnh Bắc Kạn', 0)
SET IDENTITY_INSERT [dbo].[UserAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([Id], [Code], [Expired], [IsDelete], [Amount], [Status], [Type], [Value], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (2, N'GIAMGIA10', CAST(N'2023-01-01' AS Date), 0, 100, 1, 1, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[Voucher] ([Id], [Code], [Expired], [IsDelete], [Amount], [Status], [Type], [Value], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy]) VALUES (3, N'GIAMGIA99', CAST(N'2023-12-19' AS Date), 0, 10, 1, 1, 99, CAST(N'2022-05-17T16:37:22.243' AS DateTime), NULL, CAST(N'2022-05-17T16:37:22.243' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
/****** Object:  Index [ProductCategory_UN]    Script Date: 6/17/2022 3:46:59 PM ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [ProductCategory_UN] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_UpdateAt]  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[CartProduct] ADD  CONSTRAINT [DF_CartProduct_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[CartProduct] ADD  CONSTRAINT [DF_CartProduct_UpdateAt]  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[FeedbackImages] ADD  CONSTRAINT [DF_FeedbackImages_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[FeedbackImages] ADD  CONSTRAINT [DF_FeedbackImages_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_StatusId]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Ship]  DEFAULT ((33000)) FOR [Ship]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_UpdateAt]  DEFAULT (getdate()) FOR [UpdateAt]
GO
ALTER TABLE [dbo].[ProductImages] ADD  CONSTRAINT [DF_ProductImages_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ProductImages] ADD  CONSTRAINT [DF_ProductImages_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [DF_Status_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [DF_Status_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Role]  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsLock]  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [DF_Voucher_UpdatedAt]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD  CONSTRAINT [FK_CartProduct_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([Id])
GO
ALTER TABLE [dbo].[CartProduct] CHECK CONSTRAINT [FK_CartProduct_Cart]
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD  CONSTRAINT [FK_CartProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[CartProduct] CHECK CONSTRAINT [FK_CartProduct_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Order]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Rate_Product]
GO
ALTER TABLE [dbo].[FeedbackImages]  WITH CHECK ADD  CONSTRAINT [FK_RateImages_Rate] FOREIGN KEY([FeedbackId])
REFERENCES [dbo].[Feedback] ([Id])
GO
ALTER TABLE [dbo].[FeedbackImages] CHECK CONSTRAINT [FK_RateImages_Rate]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserAddress] FOREIGN KEY([UserAddressId])
REFERENCES [dbo].[UserAddress] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserAddress]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Voucher] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Voucher] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Voucher]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductPrice] FOREIGN KEY([ProductPriceId])
REFERENCES [dbo].[ProductPrice] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductPrice]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Product]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_Product]
GO
ALTER TABLE [dbo].[ProductViews]  WITH CHECK ADD  CONSTRAINT [FK_ProductViews_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductViews] CHECK CONSTRAINT [FK_ProductViews_Product]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_UserAddress_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [FK_UserAddress_User]
GO
/****** Object:  StoredProcedure [dbo].[Category_Create]    Script Date: 6/17/2022 3:46:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Create]
	@Name nvarchar(max),
	@CreatedBy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [dbo].[Category]
           ([Name]
           ,[IsDelete]
           ,[CreateBy]
           ,[CreateAt]
           )
     VALUES
           (@Name
           ,0
           ,@CreatedBy
           ,GETDATE()
         )



END
GO
/****** Object:  StoredProcedure [dbo].[Category_Delete]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Delete]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



UPDATE Category SET IsDelete = 1 WHERE Id = @Id





END
GO
/****** Object:  StoredProcedure [dbo].[Category_Edit]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Edit]
	@Id int,
	@Name nvarchar(max),
	@UpdatedBy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



UPDATE [dbo].[Category]
   SET [Name] = @Name
      ,[UpdatedBy] = @UpdatedBy
      ,[UpdatedAt] = GETDATE()
 WHERE Id = @Id






END
GO
/****** Object:  StoredProcedure [dbo].[Category_Get]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Get]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



SELECT * FROM Category WHERE Id = @Id and IsDelete = 0





END
GO
/****** Object:  StoredProcedure [dbo].[Category_GetList]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_GetList]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Category WHERE IsDelete = 0
END
GO
/****** Object:  StoredProcedure [dbo].[Order_Create]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Order_Create] 
	@VoucherId int,
	@UserId int,
	@UserAddressId int,
	@Code nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[Order]
           (
            [IsDelete]
           ,[VoucherId]
           ,[StatusId]
           ,[UserId]
           ,[UserAddressId]
		   ,[CreatedAt]
           ,[CreatedBy]
        )
     VALUES
           (0
           ,@VoucherId
           ,1
           ,@UserId
           ,@UserAddressId
           ,GETDATE()
           ,@UserId
           )

SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_Create]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrderDetail_Create]
	@ProductId int,
	@Quantity int,
	@CreateBy int,
	@ProductPriceId int,
	@OrderId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [dbo].[OrderDetail]
           ([ProductId]
           ,[Quantity]
           ,[CreatedBy]
           ,[CreatedAt]
           ,[ProductPriceId]
           ,[OrderId])
     VALUES
           (@ProductId
           ,@Quantity
           ,@CreateBy
           ,GETDATE()
           ,@ProductPriceId
           ,@OrderId)



END
GO
/****** Object:  StoredProcedure [dbo].[proc_Address_Update]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_Address_Update]
	@Id int
	,@FullName nvarchar(250)
	,@Phone nvarchar(50)
	,@Address nvarchar(500)
	,@IsDefault bit
AS
BEGIN
	SET NOCOUNT ON
	UPDATE UserAddress 
	SET Fullname = ISNULL(@FullName, Fullname)
		,Phone = ISNULL(@Phone, Phone)
		,Address = ISNULL(@Address, Address)
		,IsDefault = ISNULL(@IsDefault, IsDefault)
	WHERE Id = @Id

END

GO
/****** Object:  StoredProcedure [dbo].[proc_Cart_AddItem]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_Cart_AddItem]
    @CartId int
    ,@ProductId int
    ,@Amount int
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT * FROM Cart WHERE Id = @CartId) 
        AND @Amount <= (
        SELECT ISNULL((p.Amount - SUM(od.Quantity)), p.Amount) AS SoConLai
        FROM Product AS p
             LEFT JOIN OrderDetail AS od ON p.Id = od.ProductId 
        WHERE p.Id = @ProductId
        GROUP BY p.Id , p.Amount 
    )
        BEGIN 
            INSERT INTO CartProduct (CartId, ProductId, Amount)
            OUTPUT Inserted.ID
              VALUES (@CartId, @ProductId, @Amount)        
        END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Cart_Get]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_Cart_Get]
	@UserID	int
AS
BEGIN
	SET NOCOUNT ON

	SELECT 	p.Id , p.Name, cp.Amount , pp.Price, p.MainImage , isnull(slcl.SoConLai, p.Amount) 
	FROM 	Cart AS c 
	LEFT 	JOIN CartProduct AS cp ON c.Id = cp.CartId 
			JOIN Product AS p ON cp.ProductId  = p.Id 
			JOIN ProductPrice pp ON pp.ProductId = p.Id 
			LEFT JOIN (
				SELECT Product.Id , (Product.Amount - SUM(OrderDetail.Quantity)) AS SoConLai
				FROM Product 
				JOIN OrderDetail ON Product.Id = OrderDetail.ProductId 
				GROUP BY Product.Id , Product.Amount 
			) AS slcl ON slcl.Id = p.Id  
	WHERE	c.UserId = @UserID
	GROUP BY p.Id, p.Name, cp.Amount , pp.Price, pp.CreatedAt, p.MainImage , slcl.SoConLai, p.Amount 
	HAVING pp.CreatedAt >= ALL (
				SELECT  CreatedAt
				FROM 	ProductPrice 
				WHERE	p.Id  = ProductPrice.ProductId 
				)
	END

GO
/****** Object:  StoredProcedure [dbo].[proc_Cart_UpdateItem]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_Cart_UpdateItem]
	@Id int
	,@Amount int
AS
BEGIN
	SET NOCOUNT ON
	IF @Amount <= (
		SELECT (p.Amount - isnull(SUM(od.Quantity), 0)) AS SoConLai
		FROM Product AS p
			 LEFT JOIN OrderDetail AS od ON p.Id = od.ProductId 
			 JOIN CartProduct AS cp ON cp.ProductId = p.Id 
		WHERE cp.Id = @Id
		GROUP BY p.Id , p.Amount 
	)
	BEGIN 
		UPDATE  CartProduct  
		SET		Amount = @Amount
				,UpdateAt = GETDATE() 
		WHERE	Id = @Id	
	END

END

GO
/****** Object:  StoredProcedure [dbo].[proc_Feedback_Add]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Feedback_Add]
	@OrderId int
	,@ProductId int
	,@Stars int
	,@Comment nvarchar(500)
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS 
		(SELECT * FROM OrderDetail
		WHERE OrderId=@OrderId AND ProductId=@ProductId)
		AND NOT EXISTS 
		(SELECT * FROM Feedback
		WHERE OrderId=@OrderId AND ProductId=@ProductId)
	BEGIN 
		INSERT INTO Feedback (OrderId, ProductId, Stars, Comment)
		Values (@OrderId, @ProductId, @Stars, @Comment)		
	END
	
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Order_Cancel]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Order_Cancel]
	@OrderId int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [Order]
	SET		StatusId = (SELECT Id FROM Status s WHERE [Type] = 5)
	WHERE Id = @OrderId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Order_Confirm]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Order_Confirm]
	@OrderId int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE [Order] 
	SET		StatusId = 6
	WHERE Id = @OrderId
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Order_Get_Product]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Order_Get_Product]
    @OrderId        int
AS
BEGIN
    SET NOCOUNT ON
    SELECT    p.Id, p.Name , p.MainImage , pp.Price , od.Quantity 
    FROM     [Order] AS o
            JOIN OrderDetail AS od ON o.Id = od.OrderId 
            JOIN Product AS p ON od.ProductId = p.Id 
            JOIN ProductPrice AS pp ON pp.Id = od.ProductPriceId 
    WHERE     o.Id = @OrderId
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Order_Getall]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Order_Getall]
	@Page			int,
	@PageSize		int,
	@Type			int
AS
BEGIN
	SET NOCOUNT ON
	IF (@Type IS NULL)
		BEGIN
			SELECT	Id, CreatedAt, Username , Phone, [Type], IsDelete
					,Total
			FROM
			(
				SELECT 	o.Id, o.CreatedAt, u.Username , u.Phone, s.[Type], o.IsDelete 
						,SUM(od.Quantity * pp.Price) AS Total
						,ROW_NUMBER() OVER (ORDER BY o.Id) AS RowNumber
  				FROM 	[Order] o
				      JOIN [User] u ON o.UserId = u.Id 		
				      JOIN OrderDetail od ON o.Id = od.OrderId
				      JOIN ProductPrice pp ON od.ProductPriceId = pp.Id 
				      JOIN Status s ON o.StatusId = s.Id 
				GROUP BY o.Id, o.CreatedAt, u.Username , u.Phone, s.[Type], o.IsDelete
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND IsDelete = 0
		END
	ELSE 
		BEGIN 
			SELECT	Id, CreatedAt, Username , Phone, [Type], IsDelete
					,Total
			FROM
			(
				SELECT 	o.Id, o.CreatedAt, u.Username , u.Phone, s.[Type], o.IsDelete
						,SUM(od.Quantity * pp.Price) AS Total
						,ROW_NUMBER() OVER (ORDER BY o.Id) AS RowNumber
  				FROM 	[Order] o
				      JOIN [User] u ON o.UserId = u.Id 		
				      JOIN OrderDetail od ON o.Id = od.OrderId
				      JOIN ProductPrice pp ON od.ProductPriceId = pp.Id 
				      JOIN Status s ON o.StatusId = s.Id 
				WHERE [Type] = @Type
				GROUP BY o.Id, o.CreatedAt, u.Username , u.Phone, s.[Type], o.IsDelete
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize
					 AND IsDelete = 0
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Order_Getall_User]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Order_Getall_User]
    @UserId            int,
    @Page            int,
    @PageSize        int,
    @Type            int
AS
BEGIN
    SET NOCOUNT ON
    IF (@Type IS NULL)
        BEGIN
            SELECT    Id ,CreatedAt,[Type],  Name , Value, VoucherId, VoucherValue
            FROM
            (
                SELECT     o.Id ,o.CreatedAt, s.[Type] 
                        , s.Name , o.Value, o.IsDelete 
                        ,v.Id AS VoucherId, v.Value AS VoucherValue
                        ,ROW_NUMBER() OVER (ORDER BY o.Id) AS RowNumber
                  FROM     [Order] o
                          JOIN Status s ON o.StatusId = s.Id 
                          LEFT JOIN Voucher v ON o.VoucherId = v.Id 
                  WHERE     o.UserId = @UserId
            ) AS t
            WHERE    t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND IsDelete = 0
        END
    ELSE 
        BEGIN 
            SELECT    Id ,CreatedAt, [Type], Name , Value, VoucherId, VoucherValue
                    
            FROM
            (
                SELECT     o.Id ,o.CreatedAt, s.[Type] , s.Name , o.Value, o.IsDelete 
                        ,v.Id AS VoucherId, v.Value AS VoucherValue
                        ,ROW_NUMBER() OVER (ORDER BY o.Id) AS RowNumber
                  FROM     [Order] o
                          JOIN Status s ON o.StatusId = s.Id 
                          LEFT JOIN Voucher v ON o.VoucherId = v.Id 
                  WHERE     o.UserId = @UserId AND s.[Type] = @Type
            ) AS t
            WHERE    t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize
                     AND IsDelete = 0
        END
END
GO
/****** Object:  StoredProcedure [dbo].[proc_OrderDetail_Add]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_OrderDetail_Add]
	@OrderId int
	,@ProductId int
	,@ProductPriceId int
	,@Quantity int
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS (SELECT * FROM [Order] WHERE Id = @OrderId) 
	AND EXISTS (SELECT * FROM ProductPrice WHERE Id = @ProductPriceId )
		AND @Quantity <= (
		SELECT ISNULL((p.Amount - SUM(od.Quantity)), p.Amount) AS SoConLai
		FROM Product AS p
			 LEFT JOIN OrderDetail AS od ON p.Id = od.ProductId 
		WHERE p.Id = @ProductId
		GROUP BY p.Id , p.Amount 
	)
		BEGIN 
			INSERT INTO OrderDetail (OrderId, ProductId, ProductPriceId, Quantity)
  			VALUES (@OrderId, @ProductId, @ProductPriceId, @Quantity)		
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Product_Count]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Product_Count]
	@CategoryId int,
	@Key		nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON
	IF (@CategoryId IS NULL AND @Key IS NULL)
		BEGIN 
			SELECT 	COUNT(Id) AS CountProduct
			FROM 	Product
			WHERE	IsDelete = 0
		END
	ELSE
		BEGIN 
			SELECT 	COUNT(p.Id) AS CountProduct
			FROM	Product p
					JOIN ProductCategory pc ON pc.ProductId = p.Id 
					JOIN Category c ON pc.CategoryId = c.Id 
			WHERE	p.IsDelete = 0
					AND (c.Id = @CategoryId OR @CategoryId IS NULL)
					AND (p.Name LIKE '%'+@Key+'%' OR @Key IS NULL)
			GROUP BY CASE WHEN c.Id is not null THEN 1 ELSE 0 END
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Product_Get]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Product_Get]
	@ProductId int
AS
BEGIN
	SET NOCOUNT ON
	SELECT 	p.Id , p.Name , isnull(pp.Price, 0) as Price, pp.Id as PriceId, p.MainImage, p.Players, p.PlayersSuggest, p.[Time]
		,p.AgeSuggest, p.Description, p.Brand, p.Origin, p.Weight
		,p.[Size], p.Amount , ISNULL(slcl.SoConLai, p.Amount) AS RemainingAmount
	FROM 	Product AS p
			LEFT JOIN ProductPrice pp ON pp.ProductId = p.Id 
			LEFT JOIN (
				SELECT Product.Id , (Product.Amount - SUM(OrderDetail.Quantity)) AS SoConLai
				FROM Product 
				JOIN OrderDetail ON Product.Id = OrderDetail.ProductId 
				GROUP BY Product.Id , Product.Amount 
			) AS slcl ON slcl.Id = p.Id  
	WHERE p.Id = @ProductId
	GROUP BY p.Id, p.Name, pp.Price, pp.CreatedAt, p.MainImage, p.Amount , slcl.SoConLai, p.Amount
			,p.Players, p.PlayersSuggest, p.[Time]
			,p.AgeSuggest, p.MainImage, p.Description, p.Brand, p.Origin, p.Weight, p.[Size], pp.Id
	HAVING pp.CreatedAt >= ALL (
				SELECT  CreatedAt
				FROM 	ProductPrice 
				WHERE	p.Id  = ProductPrice.ProductId 
				)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_Product_Get_Feedback]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Product_Get_Feedback]
	@ProductId int
AS
BEGIN
	SET NOCOUNT ON
	SELECT 	*
	FROM	Product p
			JOIN Feedback fb ON p.Id = fb.ProductId 
	WHERE	p.Id = @ProductId
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Product_GetAll]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Moi nhat: 0, gia thap: 1, gia cao: 2
CREATE PROCEDURE [dbo].[proc_Product_GetAll]
	@CategoryId		int,
	@Filter			int,
	@Key			nvarchar(250),
	@Page			int,
	@PageSize		int
AS
BEGIN
	SET NOCOUNT ON
	IF (@Filter	= 0 OR @Filter IS NULL)
		BEGIN 
			SELECT 	Id ,Name, MainImage , ShortDesc , Price
			FROM
			(
				SELECT 	p.Id ,p.Name, p.MainImage , p.ShortDesc , ISNULL(pp.Price, 0) AS Price, p.IsDelete
						,ROW_NUMBER() OVER (ORDER BY p.CreatedAt DESC) AS RowNumber
				FROM 	Product p 
						LEFT JOIN ProductCategory pc ON p.Id = pc.ProductId  
						LEFT JOIN Category c ON pc.CategoryId  = c.Id
						LEFT JOIN ProductPrice pp ON p.Id = pp.ProductId  
				WHERE	(c.Id = @CategoryId OR @CategoryId IS NULL)
						AND (p.Name LIKE '%'+@Key+'%' OR @Key IS NULL) 
				
				GROUP BY p.Id ,p.Name, p.MainImage , p.ShortDesc 
						, pp.Price, pp.CreatedAt, p.IsDelete, p.CreatedAt
				HAVING pp.CreatedAt >= ALL (
							SELECT  CreatedAt
							FROM 	ProductPrice 
							WHERE	p.Id  = ProductPrice.ProductId 
							)
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND IsDelete = 0
		END
	ELSE IF (@Filter = 1)
		BEGIN 
			SELECT 	Id ,Name, MainImage , ShortDesc , Price
			FROM
			(
				SELECT 	p.Id ,p.Name, p.MainImage , p.ShortDesc , ISNULL(pp.Price, 0) AS Price, p.IsDelete
						,ROW_NUMBER() OVER (ORDER BY pp.Price) AS RowNumber
				FROM 	Product p 
						LEFT JOIN ProductCategory pc ON p.Id = pc.ProductId  
						LEFT JOIN Category c ON pc.CategoryId  = c.Id
						LEFT JOIN ProductPrice pp ON p.Id = pp.ProductId  
				WHERE	(c.Id = @CategoryId OR @CategoryId IS NULL)
						AND (p.Name LIKE '%'+@Key+'%' OR @Key IS NULL) 
				
				GROUP BY p.Id ,p.Name, p.MainImage , p.ShortDesc 
						, pp.Price, pp.CreatedAt, p.IsDelete, p.CreatedAt
				HAVING pp.CreatedAt >= ALL (
							SELECT  CreatedAt
							FROM 	ProductPrice 
							WHERE	p.Id  = ProductPrice.ProductId 
							)
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND IsDelete = 0
		END
	ELSE IF (@Filter = 2)
		BEGIN 
			SELECT 	Id ,Name, MainImage , ShortDesc , Price
			FROM
			(
				SELECT 	p.Id ,p.Name, p.MainImage , p.ShortDesc , ISNULL(pp.Price, 0) AS Price, p.IsDelete
						,ROW_NUMBER() OVER (ORDER BY pp.Price DESC) AS RowNumber
				FROM 	Product p 
						LEFT JOIN ProductCategory pc ON p.Id = pc.ProductId  
						LEFT JOIN Category c ON pc.CategoryId  = c.Id
						LEFT JOIN ProductPrice pp ON p.Id = pp.ProductId  
				WHERE	(c.Id = @CategoryId OR @CategoryId IS NULL)
						AND (p.Name LIKE '%'+@Key+'%' OR @Key IS NULL) 
				
				GROUP BY p.Id ,p.Name, p.MainImage , p.ShortDesc 
						, pp.Price, pp.CreatedAt, p.IsDelete, p.CreatedAt
				HAVING pp.CreatedAt >= ALL (
							SELECT  CreatedAt
							FROM 	ProductPrice 
							WHERE	p.Id  = ProductPrice.ProductId 
							)
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND IsDelete = 0
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_User_ChangePass]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_User_ChangePass]
	@Id int
	,@newPass nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON
	UPDATE  [User]  
	SET		Password = @newPass
			,UpdatedAt = GETDATE() 
	WHERE	Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[proc_User_Getall]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_User_Getall]
	@Page			int,
	@PageSize		int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	t.Id, t.FullName, t.Email, t.DOB, t.Gender, t.Phone, t.Avatar, t.CreatedAt
			,t.CreatedBy, t.UpdatedAt, t.UpdatedBy, t.Role, t.IsLock
	FROM
	(
		SELECT	*,
				ROW_NUMBER() OVER (ORDER BY u.Id) AS RowNumber
		FROM	[User] AS u
	) AS t
	WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND t.IsDelete = 0
END

GO
/****** Object:  StoredProcedure [dbo].[proc_User_Lock]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_User_Lock]
	@UserID	int
AS
BEGIN
	SET NOCOUNT ON

	UPDATE	[User]
	SET		IsLock = 1
			,UpdatedAt = GETDATE() 
	WHERE	Id = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[proc_User_Signup]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[proc_User_Signup]
	@Username	nvarchar(250)
	,@Password	nvarchar(250)
	,@Email		nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [User] (Username, Password, Email, [Role])
  	VALUES (@Username, @Password, @Email, 0)
  	
END
GO
/****** Object:  StoredProcedure [dbo].[proc_User_Update]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_User_Update]
	@UserID	int,
	@FullName	nvarchar(250),
	@Phone	nvarchar(200),
	@DOB	Date,
	@Gender	bit,
	@Email	nvarchar(50),
	@Avatar	nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE	[User]
	SET		Phone = @Phone
			,Gender = @Gender
			,FullName = @FullName
			,Email = @Email
			,DOB = @DOB
			,Avatar = @Avatar
			,UpdatedAt = GETDATE() 
	WHERE	Id = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Voucher_Add]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Voucher_Add]
	@Code nvarchar(250)
	,@Expired date
	,@Amount int
	,@Value int
	,@CreateBy int
--	,@OutPut int Out 
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS 
		(SELECT * FROM [User]
		WHERE Id= @CreateBy) 
	BEGIN 
		INSERT INTO Voucher(Code, Expired, Amount, Value, CreatedBy, UpdatedBy)
		OUTPUT Inserted.ID
		Values (@Code, @Expired, @Amount, @Value, @CreateBy, @CreateBy)		
--		SET @OutPut = 1;
	END
	
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Voucher_Delete]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Voucher_Delete]
	@Id int
AS
BEGIN
	SET NOCOUNT ON
	UPDATE Voucher 
	SET		IsDelete = 1
			,UpdatedAt = GETDATE() 
	WHERE	Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Voucher_Getall]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Voucher_Getall]
	@Page			int,
	@PageSize		int,
	@Status			nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON
	IF (@Status IS NULL)
		BEGIN
			SELECT	*
			FROM
			(
				SELECT	*,
						ROW_NUMBER() OVER (ORDER BY v.Expired) AS RowNumber
				FROM	Voucher AS v
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND IsDelete = 0
		END
	ELSE 
		BEGIN 
			SELECT	*
			FROM
			(
				SELECT	*,
						ROW_NUMBER() OVER (ORDER BY v.Expired) AS RowNumber
				FROM	Voucher AS v
			) AS t
			WHERE	t.RowNumber BETWEEN (@Page - 1) * @PageSize + 1 AND @Page * @PageSize AND t.Status = @Status
					AND IsDelete = 0
		END
END

GO
/****** Object:  StoredProcedure [dbo].[proc_Voucher_Update]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[proc_Voucher_Update]
	@Id int
	,@Status bit
	,@Expired date
	,@Amount int
	,@Value int
	,@Type bit
	,@UpdateBy int
AS
BEGIN
	SET NOCOUNT ON
	IF EXISTS 
		(SELECT * FROM [User]
		WHERE Id= @UpdateBy) 
	BEGIN 
		UPDATE	Voucher 
		SET		Status = ISNULL(@Status, Status)
				,Expired = ISNULL(@Expired, Expired)
				,Amount = ISNULL(@Amount, Amount)
				,Value = ISNULL(@Value, Value)
				,Type = ISNULL(@Type, Type)
				,UpdatedBy = @UpdateBy
				,UpdatedAt = GETDATE() 
		WHERE	Id = @Id		
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Product_Create]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Product_Create]
	@Name nvarchar(max),
	@Players nvarchar(max),
	@PlayersSuggest int,
	@Time nvarchar(max),
	@AgeSuggest int,
	@CategoryId int,
	@MainImage nvarchar(max),
	@ShortDesc nvarchar(max),
	@Description nvarchar(max),
	@Price float,
	@Brand nvarchar(max),
	@Origin nvarchar(max),
	@Weight nvarchar(max),
	@Size nvarchar(max),
	@CreatedBy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


INSERT INTO [dbo].[Product]
           ([Name]
           ,[Players]
           ,[PlayersSuggest]
           ,[Time]
           ,[AgeSuggest]
           ,[CategoryId]
           ,[MainImage]
           ,[ShortDesc]
           ,[Description]
   
           ,[Brand]
           ,[Origin]
           ,[Weight]
           ,[Size]
           ,[IsDelete]
           ,[CreatedBy],
		   [CreatedAt])
     VALUES
           (@Name
           ,@Players
           ,@PlayersSuggest
           ,@Time
           ,@AgeSuggest
           ,@CategoryId
           ,@MainImage
           ,@ShortDesc
           ,@Description

           ,@Brand
           ,@Origin
           ,@Weight
           ,@Size
           ,0
           ,@CreatedBy
           ,GETDATE()
         )


INSERT INTO [dbo].[ProductPrice]
           ([ProductId]
           ,[Price]
           ,[CreatedAt]
           ,[CreatedBy])
     VALUES
           (SCOPE_IDENTITY()
           ,@Price
           ,GETDATE()
           ,@CreatedBy )

		 	


END
GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Product_Delete]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Product SET IsDelete = 1 WHERE Id= @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Edit]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Product_Edit]
	@Id int,
	@Name nvarchar(max),
	@Players nvarchar(max),
	@PlayersSuggest int,
	@Time nvarchar(max),
	@AgeSuggest int,
	@CategoryId int,
	@MainImage nvarchar(max),
	@ShortDesc nvarchar(max),
	@Description nvarchar(max),
	@Price float,
	@Brand nvarchar(max),
	@Origin nvarchar(max),
	@Weight nvarchar(max),
	@Size nvarchar(max),
	@UpdateBy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


UPDATE [dbo].[Product]
   SET [Name] =@Name
      ,[Players] = @Players
      ,[PlayersSuggest] =  @PlayersSuggest
      ,[Time] = @Time
      ,[AgeSuggest] = @AgeSuggest
      ,[CategoryId] = @CategoryId
      ,[MainImage] = @MainImage
      ,[ShortDesc] = @ShortDesc
      ,[Description] =@Description
      ,[Brand] = @Brand
      ,[Origin] = @Origin
      ,[Weight] = @Weight
      ,[Size] = @Size
      ,[UpdatedBy] = @UpdateBy
      ,[UpdatedAt] = GETDATE()
 WHERE Id = @Id
 DECLARE @PriceOrigin as float
 SET @PriceOrigin = ( SELECT TOP(1) Price 
					 FROM ProductPrice 
					 WHERE ProductId = 3   
					 ORDER BY convert(datetime, ProductPrice.CreatedAt, 103) DESC )

 IF(@Price <> @PriceOrigin)
	BEGIN
	INSERT INTO [dbo].[ProductPrice]
           ([ProductId]
           ,[Price]
           ,[CreatedAt]
           ,[CreatedBy])
     VALUES
           (@Id
           ,@Price
           ,GETDATE()
           ,@UpdateBy )
	END


END
GO
/****** Object:  StoredProcedure [dbo].[Product_Get]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Product_Get]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT p.[Id]
      ,[Name]
      ,[Players]
      ,[PlayersSuggest]
      ,[Time]
      ,[AgeSuggest]
      ,[CategoryId]
      ,[MainImage]
      ,[ShortDesc]
      ,[Description]
      ,[Brand]
      ,[Origin]
      ,[Weight]
      ,[Size]
      ,[IsDelete]
      ,p.[CreatedBy]
      ,p.[CreatedAt]
      ,[UpdatedBy]
      ,[UpdatedAt]
	  ,pp.Price
  FROM [Boardgame].[dbo].[Product] as P
  JOIN ProductPrice as pp on p.Id = pp.ProductId
  WHERE p.Id = @Id
  GROUP BY  p.[Id]
      ,[Name]
      ,[Players]
      ,[PlayersSuggest]
      ,[Time]
      ,[AgeSuggest]
      ,[CategoryId]
      ,[MainImage]
      ,[ShortDesc]
      ,[Description]
	  ,pp.Price
      ,[Brand]
      ,[Origin]
      ,[Weight]
      ,[Size]
      ,[IsDelete]
      ,p.[CreatedBy]
      ,p.[CreatedAt]
      ,[UpdatedBy]
      ,[UpdatedAt]
  HAVING pp.Price =
				  (
				  SELECT TOP(1) ProductPrice.Price
				  FROM ProductPrice JOIN Product on ProductPrice.ProductId = Product.Id  
				  WHERE Product.Id =p.Id  and ProductPrice.CreatedAt <GETDATE()
				  ORDER BY convert(datetime, ProductPrice.CreatedAt, 103) DESC
				)

END
GO
/****** Object:  StoredProcedure [dbo].[Product_GetImages]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Product_GetImages]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Path
	FROM ProductImages 
	WHERE ProductId = @Id and IsDelete =0
END
GO
/****** Object:  StoredProcedure [dbo].[Product_GetList]    Script Date: 6/17/2022 3:47:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Product_GetList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT p.[Id]
      ,[Name]
      ,[Players]
      ,[PlayersSuggest]
      ,[Time]
      ,[AgeSuggest]
      ,[CategoryId]
      ,[MainImage]
      ,[ShortDesc]
      ,[Description]
      ,[Brand]
      ,[Origin]
      ,[Weight]
      ,[Size]
      ,[IsDelete]
      ,p.[CreatedBy]
      ,p.[CreatedAt]
      ,[UpdatedBy]
      ,[UpdatedAt]
	  ,pp.Price
  FROM [Boardgame].[dbo].[Product] as P
  JOIN ProductPrice as pp on p.Id = pp.ProductId
  WHERE IsDelete = 0
  GROUP BY  p.[Id]
      ,[Name]
      ,[Players]
      ,[PlayersSuggest]
      ,[Time]
      ,[AgeSuggest]
      ,[CategoryId]
      ,[MainImage]
      ,[ShortDesc]
      ,[Description]
	  ,pp.Price
      ,[Brand]
      ,[Origin]
      ,[Weight]
      ,[Size]
      ,[IsDelete]
      ,p.[CreatedBy]
      ,p.[CreatedAt]
      ,[UpdatedBy]
      ,[UpdatedAt]
  HAVING pp.Price =
				  (
				  SELECT TOP(1) ProductPrice.Price
				  FROM ProductPrice JOIN Product on ProductPrice.ProductId = Product.Id  
				  WHERE Product.Id =p.Id  and ProductPrice.CreatedAt <GETDATE()
				  ORDER BY convert(datetime, ProductPrice.CreatedAt, 103) DESC
				)

 
END
GO
-- Create Cart when user sign up 
IF EXISTS 
	(SELECT * FROM sys.[triggers]
	WHERE name = 'trg_User_Add')
DROP TRIGGER trg_User_Add;
GO

CREATE TRIGGER trg_User_Add ON [User]  AFTER INSERT AS 
BEGIN
	INSERT INTO Cart (UserId)
	SELECT ID FROM INSERTED
END
GO

USE [master]
GO
ALTER DATABASE [Boardgame] SET  READ_WRITE 
GO
