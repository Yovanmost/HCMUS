-- =============================================
-- Database: Stage (Dữ liệu trung gian, sau Extract & làm sạch)
-- =============================================
CREATE DATABASE Stage;
GO
USE Stage;
GO

-- Các bảng stage tương ứng hai nguồn ERP/CRM
-- Dữ liệu ở đây đã chuẩn hoá cấu trúc, loại bỏ lỗi định dạng cơ bản

CREATE TABLE Stg_Tour (
    SourceSystem NVARCHAR(10),    -- ERP hoặc CRM
    TourCode NVARCHAR(10),
    TourName NVARCHAR(100),
    Price DECIMAL(18,2),
    StartDate DATE,
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Stg_Customer (
    SourceSystem NVARCHAR(10),
    CustomerCode NVARCHAR(10),
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Birthday DATE NULL,
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Stg_Booking (
    SourceSystem NVARCHAR(10),
    BookingCode NVARCHAR(10),
    CustomerCode NVARCHAR(10),
    TourCode NVARCHAR(10),
    Quantity INT,
    BookingDate DATE,
    LoadDate DATETIME DEFAULT GETDATE()
);
GO
