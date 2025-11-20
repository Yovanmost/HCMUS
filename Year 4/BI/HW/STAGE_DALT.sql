USE [master]
GO
-- Kiểm tra và XÓA Database Stage_DALT nếu tồn tại
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Stage_DALT')
BEGIN
    ALTER DATABASE [Stage_DALT] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [Stage_DALT];
END
GO

-- TẠO Database Stage_DALT
CREATE DATABASE [Stage_DALT];
GO
USE [Stage_DALT]
GO

-- Stage cho Customer (từ cả Jade và WebTower9)
CREATE TABLE [dbo].[Stage_Customer](
    [MaKH] [varchar](4) NOT NULL,
    [TenKH] [varchar](50) NULL,
    [DiaChi] [varchar](50) NULL,
    [TenNuoc] [varchar](50) NULL,  -- WebTower9 có TenNuoc
    [GioiTinh] [char](1) NULL,
    [SoThich] [varchar](30) NULL,
    [NgheNghiep] [varchar](30) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho Product (từ Jupiter)
CREATE TABLE [dbo].[Stage_Product](
    [MaSP] [varchar](4) NOT NULL,
    [TenSP] [varchar](50) NULL,
    [GiaSP] [int] NULL,
    [LoaiSP] [varchar](4) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho Store (từ Jupiter)
CREATE TABLE [dbo].[Stage_Store](
    [MaCH] [varchar](4) NOT NULL,
    [TenCH] [varchar](50) NULL,
    [LoaiCH] [varchar](4) NULL,
    [Nuoc] [varchar](4) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho Bill (từ cả Jade và WebTower9)
CREATE TABLE [dbo].[Stage_Bill](
    [MaHD] [varchar](4) NOT NULL,
    [MaKH] [varchar](4) NULL,
    [MaCH] [varchar](4) NULL,
    [NgayBan] [datetime] NULL,
    [SourceID] [int] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho BillDetail (từ cả Jade và WebTower9)
CREATE TABLE [dbo].[Stage_BillDetail](
    [MaChiTiet] [int] NOT NULL,
    [MaHD] [varchar](4) NULL,
    [MaSP] [varchar](4) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho ProductType (từ Jupiter)
CREATE TABLE [dbo].[Stage_ProductType](
    [MaLoaiSP] [varchar](4) NOT NULL,
    [TenLoaiSP] [varchar](50) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho StoreType (từ Jupiter)
CREATE TABLE [dbo].[Stage_StoreType](
    [MaLoaiCH] [varchar](4) NOT NULL,
    [TenLoaiCH] [varchar](50) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Stage cho Country (từ Jupiter)
CREATE TABLE [dbo].[Stage_Country](
    [MaNuoc] [varchar](4) NOT NULL,
    [TenNuoc] [varchar](50) NULL,
    [SourceID] [int] NULL,
    [NgayTao] [datetime] NULL,
    [NgayCapNhat] [datetime] NULL,
    [TrangThai] [int] NULL,
    [LoadDate] [datetime] DEFAULT GETDATE(),
    [IsProcessed] [bit] DEFAULT 0
)

-- Bảng log ETL
CREATE TABLE [dbo].[ETL_Log](
    [LogID] [int] IDENTITY(1,1) PRIMARY KEY,
    [PackageName] [varchar](100),
    [SourceTable] [varchar](100),
    [TargetTable] [varchar](100),
    [RowsExtracted] [int],
    [RowsLoaded] [int],
    [RowsRejected] [int],
    [StartTime] [datetime],
    [EndTime] [datetime],
    [Status] [varchar](20),
    [ErrorMessage] [varchar](max)
)