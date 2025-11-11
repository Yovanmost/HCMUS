-- =============================================
-- Database: NDS (Normalized Data Store - dữ liệu hợp nhất)
-- =============================================
CREATE DATABASE NDS;
GO
USE NDS;
GO

-- Các bảng đã hợp nhất và chuẩn hoá từ ERP + CRM

CREATE TABLE NDS_Tour (
    TourID INT IDENTITY(1,1) PRIMARY KEY,
    UnifiedTourCode NVARCHAR(20),
    TourName NVARCHAR(100),
    Price DECIMAL(18,2),
    StartDate DATE,
    SourceSystem NVARCHAR(10),
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE NDS_Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    UnifiedCustomerCode NVARCHAR(20),
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Birthday DATE NULL,
    SourceSystem NVARCHAR(10),
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE NDS_Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    UnifiedBookingCode NVARCHAR(20),
    UnifiedCustomerCode NVARCHAR(20),
    UnifiedTourCode NVARCHAR(20),
    Quantity INT,
    BookingDate DATE,
    SourceSystem NVARCHAR(10),
    LoadDate DATETIME DEFAULT GETDATE()
);
GO
