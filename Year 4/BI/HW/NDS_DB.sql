create database [NDS_DALT]
go
USE [NDS_DALT]
GO
/****** Object:  Table [dbo].[Country_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country_NDS](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryNK] [varchar](4) NULL,
	[CountryName] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer_NDS](
	[CusID] [int] IDENTITY(1,1) NOT NULL,
	[CusNK] [varchar](4) NOT NULL,
	[CusName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[CountryID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[Sex] [char](1) NULL,
	[Hobby] [varchar](30) NULL,
	[Job] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_NDS](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductNK] [varchar](4) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[ProductPrice] [int] NULL,
	[ProductType] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType_NDS](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeNK] [varchar](4) NOT NULL,
	[ProductTypeName] [varchar](50) NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Source_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Source_NDS](
	[SourceID] [int] NOT NULL,
	[SourceName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Store_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Store_NDS](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[StoreNK] [varchar](4) NULL,
	[SourceID] [int] NULL,
	[StoreName] [varchar](50) NULL,
	[StoreType] [int] NULL,
	[Country] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StoreType_NDS]    Script Date: 20/11/2020 1:56:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoreType_NDS](
	[StoreTypeID] [int] IDENTITY(1,1) NOT NULL,
	[StoreTypeNK] [varchar](4) NULL,
	[SourceID] [int] NULL,
	[StoreTypeName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object: Bill */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill_NDS](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[Bill_NK] [varchar](5) NULL,
	[CusID] [int] NULL,
	[StoreID] [int] NOT NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[SaleDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object: BillDetail */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillDetail_NDS](
	[BillDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[BillDetail_NK] [int] NULL,
	[Bill_ID] int NULL,
	[ProductID] [int] NOT NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object: Status_NDS ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status_NDS](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status_Name] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
--FK OF TABLE [Status_NDS]
--FK [Country_NDS] - [Status]
ALTER TABLE [dbo].[Country_NDS]  WITH CHECK ADD  CONSTRAINT [FK_C_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[Country_NDS] CHECK CONSTRAINT [FK_C_STA]
GO
--FK [Customer_NDS] - [Status]
ALTER TABLE [dbo].[Customer_NDS]  WITH CHECK ADD  CONSTRAINT [FK_CUS_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[Customer_NDS] CHECK CONSTRAINT [FK_CUS_STA]
GO
--FK [Customer_NDS] - [Country]
ALTER TABLE [dbo].[Customer_NDS]  WITH CHECK ADD  CONSTRAINT [FK_CUS_C] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country_NDS] ([CountryID])
GO
ALTER TABLE [dbo].[Customer_NDS] CHECK CONSTRAINT [FK_CUS_C]
GO
--FK [Product_NDS] - [Status]
ALTER TABLE [dbo].[Product_NDS]  WITH CHECK ADD  CONSTRAINT [FK_P_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[Product_NDS] CHECK CONSTRAINT [FK_P_STA]
GO
--FK [ProductType_NDS] - [Status]
ALTER TABLE [dbo].[ProductType_NDS]  WITH CHECK ADD  CONSTRAINT [FK_PR_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[ProductType_NDS] CHECK CONSTRAINT [FK_PR_STA]
GO
--FK [Store_NDS] - [Status]
ALTER TABLE [dbo].[Store_NDS]  WITH CHECK ADD  CONSTRAINT [FK_STO_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[Store_NDS] CHECK CONSTRAINT [FK_STO_STA]
GO
--FK [StoreType_NDS] - [Status]
ALTER TABLE [dbo].[StoreType_NDS]  WITH CHECK ADD  CONSTRAINT [FK_STOT_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[StoreType_NDS] CHECK CONSTRAINT [FK_STOT_STA]
GO
--FK [Bill_NDS]  - [Status]
ALTER TABLE [dbo].[Bill_NDS]  WITH CHECK ADD  CONSTRAINT [FK_B_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[Bill_NDS] CHECK CONSTRAINT [FK_B_STA]
GO
--FK [BillDetail_NDS] - [Status]
ALTER TABLE [dbo].[BillDetail_NDS]  WITH CHECK ADD  CONSTRAINT [FK_BD_STA] FOREIGN KEY([Status])
REFERENCES [dbo].[Status_NDS] ([StatusID])
GO
ALTER TABLE [dbo].[BillDetail_NDS] CHECK CONSTRAINT [FK_BD_STA]
GO


--FK OF TABLE [Bill_NDS]
------------------------------------------------------
--FK Bill_NDS, Source_NDS
ALTER TABLE [dbo].[Bill_NDS]  WITH CHECK ADD  CONSTRAINT [FK_B_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[Bill_NDS] CHECK CONSTRAINT [FK_B_S]
GO
--FK Bill_NDS, Store_NDS
ALTER TABLE [dbo].[Bill_NDS]  WITH CHECK ADD  CONSTRAINT [FK_B_ST] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store_NDS] ([StoreID])
GO
ALTER TABLE [dbo].[Bill_NDS] CHECK CONSTRAINT [FK_B_ST]
GO
--FK Bill_NDS, Customer_NDS
ALTER TABLE [dbo].[Bill_NDS]  WITH CHECK ADD  CONSTRAINT [FK_B_C] FOREIGN KEY([CusID])
REFERENCES [dbo].[Customer_NDS] ([CusID])
GO
ALTER TABLE [dbo].[Bill_NDS] CHECK CONSTRAINT [FK_B_C]
GO
------------------------------------------------------
--FK Bill_NDS, Status_NDS

--FK OF TABLE [BillDetail_NDS]
------------------------------------------------------
----FK [BillDetail_NDS], [Source_NDS]
ALTER TABLE [dbo].[BillDetail_NDS]  WITH CHECK ADD  CONSTRAINT [FK_BD_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[BillDetail_NDS] CHECK CONSTRAINT [FK_BD_S]
GO
----FK [BillDetail_NDS], [Bill_NDS]
ALTER TABLE [dbo].[BillDetail_NDS]  WITH CHECK ADD  CONSTRAINT [FK_BD_B] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bill_NDS] ([Bill_ID])
GO
ALTER TABLE [dbo].[BillDetail_NDS] CHECK CONSTRAINT [FK_BD_B]
GO
----FK [BillDetail_NDS], [Product_NDS]
ALTER TABLE [dbo].[BillDetail_NDS]  WITH CHECK ADD  CONSTRAINT [FK_BD_P] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product_NDS] ([ProductID])
GO
ALTER TABLE [dbo].[BillDetail_NDS] CHECK CONSTRAINT [FK_BD_P]
GO
------------------------------------------------------


---Set foreign key
---- FK [Country_NDS], [Source_NDS]
ALTER TABLE [dbo].[Country_NDS]  WITH CHECK ADD  CONSTRAINT [FK_C_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[Country_NDS] CHECK CONSTRAINT [FK_C_S]
GO
---- FK [Customer_NDS], [Source_NDS]
ALTER TABLE [dbo].[Customer_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Cus_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[Customer_NDS] CHECK CONSTRAINT [FK_Cus_S]
GO
----FK [Product_NDS], [ProductType_NDS]
ALTER TABLE [dbo].[Product_NDS]  WITH CHECK ADD  CONSTRAINT [FK_P_ProductType] FOREIGN KEY([ProductType])
REFERENCES [dbo].[ProductType_NDS] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Product_NDS] CHECK CONSTRAINT [FK_P_ProductType]
GO
----FK [Product_NDS], [Source_NDS]
ALTER TABLE [dbo].[Product_NDS]  WITH CHECK ADD  CONSTRAINT [FK_P_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[Product_NDS] CHECK CONSTRAINT [FK_P_S]
GO
----FK [ProductType_NDS], [Source_NDS]
ALTER TABLE [dbo].[ProductType_NDS]  WITH CHECK ADD  CONSTRAINT [FK_PT_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[ProductType_NDS] CHECK CONSTRAINT [FK_PT_S]
GO
----FK [Store_NDS], [Country_NDS]
ALTER TABLE [dbo].[Store_NDS]  WITH CHECK ADD  CONSTRAINT [FK_S_Country] FOREIGN KEY([Country])
REFERENCES [dbo].[Country_NDS] ([CountryID])
GO
ALTER TABLE [dbo].[Store_NDS] CHECK CONSTRAINT [FK_S_Country]
GO
----FK [Store_NDS], [Source_NDS]
ALTER TABLE [dbo].[Store_NDS]  WITH CHECK ADD  CONSTRAINT [FK_S_Source] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[Store_NDS] CHECK CONSTRAINT [FK_S_Source]
GO
----FK [Store_NDS], [StoreType_NDS]
ALTER TABLE [dbo].[Store_NDS]  WITH CHECK ADD  CONSTRAINT [FK_S_StoreType] FOREIGN KEY([StoreType])
REFERENCES [dbo].[StoreType_NDS] ([StoreTypeID])
GO
ALTER TABLE [dbo].[Store_NDS] CHECK CONSTRAINT [FK_S_StoreType]
GO
----FK [StoreType_NDS], [Source_NDS]
ALTER TABLE [dbo].[StoreType_NDS]  WITH CHECK ADD  CONSTRAINT [FK_ST_S] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([SourceID])
GO
ALTER TABLE [dbo].[StoreType_NDS] CHECK CONSTRAINT [FK_ST_S]
GO
