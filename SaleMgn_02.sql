/****** Object:  Table [dbo].[City]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[CustomerType] [int] NOT NULL,
	[PhoneNumber1] [nvarchar](255) NULL,
	[PhoneNumber2] [nvarchar](255) NULL,
	[Email] [nvarchar](512) NULL,
	[FaxNumber] [nvarchar](255) NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[CityId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[ReferUserId] [int] NOT NULL,
	[ApprovedUserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerShipping]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerShipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Gender] [bit] NOT NULL,
	[PhoneNumber1] [nvarchar](255) NULL,
	[PhoneNumber2] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CityId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataVersion]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataVersion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_DataVersion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Export]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Export] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExportDetail]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExportId] [int] NOT NULL,
	[StorageId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ExportDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](1000) NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeatureMapping]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeatureMapping](
	[FeatureId] [int] NOT NULL,
	[UserGroupId] [int] NOT NULL,
 CONSTRAINT [PK_FeatureGroup] PRIMARY KEY CLUSTERED 
(
	[FeatureId] ASC,
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Import]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[ProviderId] [int] NOT NULL,
	[StockId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatebBy] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StockImport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImportDetail]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImportId] [int] NOT NULL,
	[StorageId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ImportDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[ReferUserId] [int] NULL,
	[CustomerId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[IsSeen] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[TotalQuantity] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderPayment]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_OrderPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ProductGroupId] [int] NOT NULL,
	[ProductUnitId] [int] NOT NULL,
	[SafeQuantity] [int] NOT NULL,
	[Size] [nvarchar](255) NULL,
	[Picture] [image] NULL,
	[Price] [float] NOT NULL,
	[IsSurface] [bit] NOT NULL,
	[AllowSurface] [bit] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provider]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PhoneNumber1] [nvarchar](255) NULL,
	[PhoneNumber2] [nvarchar](255) NULL,
	[FaxNumber] [nvarchar](255) NULL,
	[Email] [nvarchar](1000) NULL,
	[Address] [nvarchar](1000) NULL,
	[CityId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[LastRenewDate] [datetime] NOT NULL,
	[IPAddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](255) NOT NULL,
	[PhoneNumber1] [nvarchar](255) NULL,
	[PhoneNumber2] [nvarchar](255) NULL,
	[FaxNumber] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NULL,
	[CityId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Storage]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Gender] [bit] NOT NULL,
	[ReferUserId] [int] NULL,
	[Status] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 3/18/2014 11:43:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[PhoneNumber1] [nvarchar](255) NULL,
	[PhoneNumber2] [nvarchar](255) NULL,
	[Email] [nvarchar](512) NULL,
	[Address] [nvarchar](max) NULL,
	[CityId] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Image] [image] NULL,
	[StartDate] [datetime] NOT NULL,
	[SocialInsuranceNumber] [nvarchar](255) NULL,
	[TaxNumber] [nvarchar](255) NULL,
	[SocialNumber] [nvarchar](50) NULL,
	[SocialIssuedDate] [datetime] NOT NULL,
	[SocialIssudePlace] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (1, N'101', N'Hà Nội', 0, 0, CAST(0x0000A2A600000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (2, N'102', N'Hà Giang', 0, 0, CAST(0x0000A2A700000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (3, N'104', N'Cao Bằng', 0, 0, CAST(0x0000A2A800000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (4, N'106', N'Bắc Kạn', 0, 0, CAST(0x0000A2A900000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (5, N'108', N'Tuyên Quang', 0, 0, CAST(0x0000A2AA00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (6, N'110', N'Lào Cai', 0, 0, CAST(0x0000A2AB00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (7, N'111', N'Điện Biên', 0, 0, CAST(0x0000A2AC00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (8, N'112', N'Lai Châu', 0, 0, CAST(0x0000A2AD00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (9, N'114', N'Sơn La', 0, 0, CAST(0x0000A2AE00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (10, N'115', N'Yên Bái', 0, 0, CAST(0x0000A2AF00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (11, N'117', N'Hoà Bình', 0, 0, CAST(0x0000A2B000000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (12, N'119', N'Thái Nguyên', 0, 0, CAST(0x0000A2B100000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (13, N'120', N'Lạng Sơn', 0, 0, CAST(0x0000A2B200000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (14, N'122', N'Quảng Ninh', 0, 0, CAST(0x0000A2B300000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (15, N'124', N'Bắc Giang', 0, 0, CAST(0x0000A2B400000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (16, N'125', N'Phú Thọ', 0, 0, CAST(0x0000A2B500000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (17, N'126', N'Vĩnh Phúc', 0, 0, CAST(0x0000A2B600000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (18, N'127', N'Bắc Ninh', 0, 0, CAST(0x0000A2B700000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (19, N'128', N'Hà Tây', 0, 0, CAST(0x0000A2B800000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (20, N'130', N'Hải Dương', 0, 0, CAST(0x0000A2B900000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (21, N'131', N'Hải Phòng', 0, 0, CAST(0x0000A2BA00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (22, N'133', N'Hưng Yên', 0, 0, CAST(0x0000A2BB00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (23, N'134', N'Thái Bình', 0, 0, CAST(0x0000A2BC00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (24, N'135', N'Hà Nam', 0, 0, CAST(0x0000A2BD00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (25, N'136', N'Nam Định', 0, 0, CAST(0x0000A2BE00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (26, N'137', N'Ninh Bình', 0, 0, CAST(0x0000A2BF00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (27, N'138', N'Thanh Hoá', 0, 0, CAST(0x0000A2C000000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (28, N'140', N'Nghệ An', 0, 0, CAST(0x0000A2C100000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (29, N'142', N'Hà Tĩnh', 0, 0, CAST(0x0000A2C200000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (30, N'144', N'Quảng Bình', 0, 0, CAST(0x0000A2C300000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (31, N'145', N'Quảng Trị', 0, 0, CAST(0x0000A2C400000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (32, N'146', N'Huế', 0, 0, CAST(0x0000A2C500000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (33, N'148', N'Đà Nẵng', 0, 0, CAST(0x0000A2C600000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (34, N'149', N'Quảng Nam', 0, 0, CAST(0x0000A2C700000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (35, N'151', N'Quảng Ngãi', 0, 0, CAST(0x0000A2C800000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (36, N'152', N'Bình Định', 0, 0, CAST(0x0000A2C900000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (37, N'154', N'Phú Yên', 0, 0, CAST(0x0000A2CA00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (38, N'156', N'Khánh Hoà', 0, 0, CAST(0x0000A2CB00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (39, N'158', N'Ninh Thuận', 0, 0, CAST(0x0000A2CC00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (40, N'160', N'Bình Thuận', 0, 0, CAST(0x0000A2CD00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (41, N'162', N'Kon Tum', 0, 0, CAST(0x0000A2CE00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (42, N'164', N'Gia Lai', 0, 0, CAST(0x0000A2CF00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (43, N'166', N'Đăk Lăk', 0, 0, CAST(0x0000A2D000000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (44, N'167', N'Đăk Nông', 0, 0, CAST(0x0000A2D100000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (45, N'168', N'Lâm Đồng', 0, 0, CAST(0x0000A2D200000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (46, N'170', N'Bình Phước', 0, 0, CAST(0x0000A2D300000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (47, N'172', N'Tây Ninh', 0, 0, CAST(0x0000A2D400000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (48, N'174', N'Bình Dương', 0, 0, CAST(0x0000A2D500000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (49, N'175', N'Đồng Nai', 0, 0, CAST(0x0000A2D600000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (50, N'177', N'Bà Rịa - Vũng Tàu', 0, 0, CAST(0x0000A2D700000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (51, N'179', N'Hồ Chí Minh', 0, 0, CAST(0x0000A2D800000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (52, N'180', N'Long An', 0, 0, CAST(0x0000A2D900000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (53, N'182', N'Tiền Giang', 0, 0, CAST(0x0000A2DA00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (54, N'183', N'Bến Tre', 0, 0, CAST(0x0000A2DB00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (55, N'184', N'Trà Vinh', 0, 0, CAST(0x0000A2DC00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (56, N'186', N'Vĩnh Long', 0, 0, CAST(0x0000A2DD00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (57, N'187', N'Đồng Tháp', 0, 0, CAST(0x0000A2DE00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (58, N'189', N'An Giang', 0, 0, CAST(0x0000A2DF00000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (59, N'191', N'Kiên Giang', 0, 0, CAST(0x0000A2E000000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (60, N'192', N'Cần Thơ', 0, 0, CAST(0x0000A2E100000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (61, N'193', N'Hậu Giang', 0, 0, CAST(0x0000A2E200000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (62, N'194', N'Sóc Trăng', 0, 0, CAST(0x0000A2E300000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (63, N'195', N'Bạc Liêu', 0, 0, CAST(0x0000A2E400000000 AS DateTime))
INSERT [dbo].[City] ([Id], [Code], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (64, N'196', N'Cà Mau', 0, 0, CAST(0x0000A2E500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[DataVersion] ON 

INSERT [dbo].[DataVersion] ([Id], [Name], [Value]) VALUES (1, N'Product', N'20140225014357')
INSERT [dbo].[DataVersion] ([Id], [Name], [Value]) VALUES (2, N'ProductGroup', N'20140225124726')
INSERT [dbo].[DataVersion] ([Id], [Name], [Value]) VALUES (3, N'Customer', N'20140225012851')
INSERT [dbo].[DataVersion] ([Id], [Name], [Value]) VALUES (4, N'Stock', N'20140225011556')
INSERT [dbo].[DataVersion] ([Id], [Name], [Value]) VALUES (5, N'UserGroup', N'20140225125225')
INSERT [dbo].[DataVersion] ([Id], [Name], [Value]) VALUES (6, N'Users', N'20140302124354')
SET IDENTITY_INSERT [dbo].[DataVersion] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'Manage', N'Quản Lý', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (2, N'ManageUser', N'Quản Lý\Quản Lý Người Dùng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (3, N'ManagePermission', N'Quản Lý\Quản Lý Phân Quyền', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (4, N'ManageStock', N'Quản Lý\Quản Lý Kho Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (5, N'ManageCustomer', N'Quản Lý\Quản Lý Khách Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (6, N'ManageProduct', N'Quản Lý\Quản Lý Sản Phẩm', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (7, N'ManageProductGroup', N'Quản Lý\Quản Lý Nhóm Sản Phẩm', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (8, N'Stock', N'Kho Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (9, N'ImportStock', N'Kho Hàng\Nhập Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (10, N'EditImportStock', N'Kho Hàng\Chỉnh Sửa Đơn Nhập Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (11, N'ManageImportStock', N'Kho Hàng\Quản Lý Đơn Nhập Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (12, N'ExportStock', N'Kho Hàng\Xuất Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (13, N'EditExportStock', N'Kho Hàng\Chỉnh Sửa Đơn Xuất Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (14, N'ManageExportStock', N'Kho Hàng\Quản Lý Đơn Xuất Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (15, N'ManageStorageStock', N'Kho Hàng\Quản Lý Tồn Kho', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (16, N'Sale', N'Bán Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (17, N'CreateOrder', N'Bán Hàng\Tạo Đơn Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (18, N'EditOrder', N'Bán Hàng\Chinh Sửa Đơn Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (19, N'ManageOrder', N'Bán Hàng\Quản Lý Đơn Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (20, N'Report', N'Báo Cáo', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (21, N'PrintProductList', N'Báo Cáo\Danh Sách Sản Phẩm', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (22, N'PrintProductGroups', N'Báo Cáo\Danh Sách Nhóm Sản Phẩm', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (23, N'PrintProductStorageList', N'Báo Cáo\Danh Sách Sản Phẩm Tồn Kho', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (24, N'PrintImportList', N'Báo Cáo\Danh Sách Nhập Sản Phẩm', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (25, N'PrintProductExportList', N'Báo Cáo\Danh Sách Xuất Sản Phẩm', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
INSERT [dbo].[Feature] ([Id], [Name], [Code], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (26, N'PrintExportSum', N'Báo Cáo\Báo Cáo Tổng Hợp Xuất Hàng', 0, CAST(0x0000A2DD001AECFB AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Feature] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [Name], [Note], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (1, N'Administrators', N'Group ADMIN', 0, 0, CAST(0x0000A2C500000000 AS DateTime))
INSERT [dbo].[Group] ([Id], [Name], [Note], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (2, N'Users', N'Group USERS', 0, 1, CAST(0x0000A2DD000E65A5 AS DateTime))
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[ProductUnit] ON 

INSERT [dbo].[ProductUnit] ([Id], [Name], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (1, N'N/A', 0, 0, CAST(0x0000A2C500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductUnit] OFF
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([Id], [Code], [Name], [PhoneNumber1], [PhoneNumber2], [FaxNumber], [Email], [Address], [CityId], [Note], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (1, N'PRV_DEFAULT', N'N/A', N'0', N'0', N'0', NULL, N'0', 51, N'Nhà Cung Cấp Mặc Định', 0, CAST(0x0000A2C500000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Provider] OFF
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([Id], [Token], [UserId], [StartDate], [LastRenewDate], [IPAddress]) VALUES (1, N'fec8ec09-3502-42e2-99ec-33fec056b7de', 1, CAST(0x0000A2EE011F1828 AS DateTime), CAST(0x0000A2EE011F35A4 AS DateTime), N'192.168.136.1')
INSERT [dbo].[Session] ([Id], [Token], [UserId], [StartDate], [LastRenewDate], [IPAddress]) VALUES (2, N'4e81a9c3-366c-43da-bb5d-6e700338716e', 2, CAST(0x0000A2E200D33393 AS DateTime), CAST(0x0000A2E200D333A1 AS DateTime), N'192.168.136.1')
SET IDENTITY_INSERT [dbo].[Session] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([Id], [Name], [Code], [PhoneNumber1], [PhoneNumber2], [FaxNumber], [Address], [CityId], [Note], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (5, N'Kho Hàng 1', N'STK_1', NULL, NULL, NULL, NULL, 51, NULL, 0, CAST(0x0000A2DD0014D925 AS DateTime), 1)
INSERT [dbo].[Stock] ([Id], [Name], [Code], [PhoneNumber1], [PhoneNumber2], [FaxNumber], [Address], [CityId], [Note], [Status], [LastModifiedDate], [LastModifiedBy]) VALUES (6, N'Kho Hàng 2', N'STK_2', NULL, NULL, NULL, NULL, 51, NULL, 0, CAST(0x0000A2DD0014D925 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Stock] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [GroupId], [Name], [Password], [FirstName], [LastName], [Gender], [ReferUserId], [Status], [LastModifiedBy], [LastModifiedDate]) VALUES (1, 1, N'administrator', N'oRGL7ooUX0FF147wisGXdw/L5b3/PUYyQg==', N'Van A Chau', N'ADMIN', 0, NULL, 0, 0, CAST(0x0000A2C500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomerType]  DEFAULT ((0)) FOR [CustomerType]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CityId]  DEFAULT ((51)) FOR [CityId]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_ApprovedBy]  DEFAULT ((1)) FOR [ApprovedUserId]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_SafeQuantity]  DEFAULT ((0)) FOR [SafeQuantity]
GO
ALTER TABLE [dbo].[Provider] ADD  CONSTRAINT [DF_Provider_CityId]  DEFAULT ((51)) FOR [CityId]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_CityId]  DEFAULT ((51)) FOR [CityId]
GO
ALTER TABLE [dbo].[Storage] ADD  CONSTRAINT [DF_Storage_CreatedDate]  DEFAULT (((2014)-(2))-(24)) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Storage] ADD  CONSTRAINT [DF_Storage_LastModifiedDate]  DEFAULT (((2014)-(2))-(24)) FOR [LastModifiedDate]
GO
ALTER TABLE [dbo].[Storage] ADD  CONSTRAINT [DF_Storage_LastModifiedBy]  DEFAULT ((1)) FOR [LastModifiedBy]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_FirstName]  DEFAULT (N'FIRSTNAME') FOR [FirstName]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_LastName]  DEFAULT (N'LASTNAME') FOR [LastName]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CityId]  DEFAULT ((51)) FOR [CityId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_City]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User] FOREIGN KEY([ApprovedUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User]
GO
ALTER TABLE [dbo].[CustomerShipping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerContact_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomerShipping] CHECK CONSTRAINT [FK_CustomerContact_Customer]
GO
ALTER TABLE [dbo].[CustomerShipping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerShipping_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[CustomerShipping] CHECK CONSTRAINT [FK_CustomerShipping_City]
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD  CONSTRAINT [FK_Export_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Export] CHECK CONSTRAINT [FK_Export_Order]
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD  CONSTRAINT [FK_Export_Stock] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([Id])
GO
ALTER TABLE [dbo].[Export] CHECK CONSTRAINT [FK_Export_Stock]
GO
ALTER TABLE [dbo].[Export]  WITH CHECK ADD  CONSTRAINT [FK_Export_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Export] CHECK CONSTRAINT [FK_Export_User]
GO
ALTER TABLE [dbo].[ExportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExportDetail_Export] FOREIGN KEY([ExportId])
REFERENCES [dbo].[Export] ([Id])
GO
ALTER TABLE [dbo].[ExportDetail] CHECK CONSTRAINT [FK_ExportDetail_Export]
GO
ALTER TABLE [dbo].[ExportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExportDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ExportDetail] CHECK CONSTRAINT [FK_ExportDetail_Product]
GO
ALTER TABLE [dbo].[ExportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExportDetail_Storage] FOREIGN KEY([StorageId])
REFERENCES [dbo].[Storage] ([Id])
GO
ALTER TABLE [dbo].[ExportDetail] CHECK CONSTRAINT [FK_ExportDetail_Storage]
GO
ALTER TABLE [dbo].[FeatureMapping]  WITH CHECK ADD  CONSTRAINT [FK_FeatureMapping_Feature] FOREIGN KEY([FeatureId])
REFERENCES [dbo].[Feature] ([Id])
GO
ALTER TABLE [dbo].[FeatureMapping] CHECK CONSTRAINT [FK_FeatureMapping_Feature]
GO
ALTER TABLE [dbo].[FeatureMapping]  WITH CHECK ADD  CONSTRAINT [FK_FeatureMapping_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[FeatureMapping] CHECK CONSTRAINT [FK_FeatureMapping_UserGroup]
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD  CONSTRAINT [FK_Import_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([Id])
GO
ALTER TABLE [dbo].[Import] CHECK CONSTRAINT [FK_Import_Provider]
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD  CONSTRAINT [FK_Import_Stock] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([Id])
GO
ALTER TABLE [dbo].[Import] CHECK CONSTRAINT [FK_Import_Stock]
GO
ALTER TABLE [dbo].[Import]  WITH CHECK ADD  CONSTRAINT [FK_Import_User] FOREIGN KEY([CreatebBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Import] CHECK CONSTRAINT [FK_Import_User]
GO
ALTER TABLE [dbo].[ImportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetail_Import] FOREIGN KEY([ImportId])
REFERENCES [dbo].[Import] ([Id])
GO
ALTER TABLE [dbo].[ImportDetail] CHECK CONSTRAINT [FK_ImportDetail_Import]
GO
ALTER TABLE [dbo].[ImportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ImportDetail] CHECK CONSTRAINT [FK_ImportDetail_Product]
GO
ALTER TABLE [dbo].[ImportDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetail_Storage] FOREIGN KEY([StorageId])
REFERENCES [dbo].[Storage] ([Id])
GO
ALTER TABLE [dbo].[ImportDetail] CHECK CONSTRAINT [FK_ImportDetail_Storage]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([ReferUserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User1]
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
ALTER TABLE [dbo].[OrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderPayment] CHECK CONSTRAINT [FK_OrderPayment_Order]
GO
ALTER TABLE [dbo].[OrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[OrderPayment] CHECK CONSTRAINT [FK_OrderPayment_PaymentType]
GO
ALTER TABLE [dbo].[OrderPayment]  WITH CHECK ADD  CONSTRAINT [FK_OrderPayment_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[OrderPayment] CHECK CONSTRAINT [FK_OrderPayment_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductGroup] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroup] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductGroup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductUnit] FOREIGN KEY([ProductUnitId])
REFERENCES [dbo].[ProductUnit] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductUnit]
GO
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_ProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_ProductCategory]
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD  CONSTRAINT [FK_Provider_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Provider] CHECK CONSTRAINT [FK_Provider_City]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_City]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Product]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Stock] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([Id])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Stock]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_City]
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_User]
GO
