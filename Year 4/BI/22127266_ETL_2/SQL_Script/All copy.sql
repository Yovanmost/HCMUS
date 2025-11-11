/* ======================================================
   CLEANUP PHASE – XÓA TOÀN BỘ DB NẾU TỒN TẠI
====================================================== */
USE master;
GO
ALTER DATABASE ERP SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE CRM SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE Stage SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE NDS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE DQ SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE ETL_Metadata SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE DDS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE IF EXISTS ERP;
DROP DATABASE IF EXISTS CRM;
DROP DATABASE IF EXISTS Stage;
DROP DATABASE IF EXISTS NDS;
DROP DATABASE IF EXISTS DQ;
DROP DATABASE IF EXISTS ETL_Metadata;
DROP DATABASE IF EXISTS DDS;
GO

-- =============================================
-- Database: ERP (Nguồn A - hệ thống ERP cũ)
-- =============================================
CREATE DATABASE ERP;
GO
USE ERP;
GO

-- Bảng Tour_A: danh sách tour tại ERP
CREATE TABLE Tour_A (
    MaTour NVARCHAR(10) PRIMARY KEY,          -- Mã tour
    TenTour NVARCHAR(100),                    -- Tên tour
    Gia NVARCHAR(20),                         -- Giá tour (chuỗi, do dữ liệu ERP cũ không đồng nhất)
    NgayDi NVARCHAR(20)                       -- Ngày đi (ERP dùng định dạng 'yyyy/MM/dd')
);
GO

-- Bảng KhachHang_A: thông tin khách hàng
CREATE TABLE KhachHang_A (
    MaKH NVARCHAR(10) PRIMARY KEY,            -- Mã khách hàng
    TenKH NVARCHAR(100),                      -- Tên khách hàng
    Email NVARCHAR(100)                       -- Email (có thể null hoặc trống)
);
GO

-- Bảng DangKyTour_A: thông tin đăng ký tour
CREATE TABLE DangKyTour_A (
    MaDK NVARCHAR(10) PRIMARY KEY,            -- Mã đăng ký
    MaKH NVARCHAR(10),                        -- Mã khách hàng
    MaTour NVARCHAR(10),                      -- Mã tour
    SoLuong INT,                              -- Số lượng vé
    NgayDangKy NVARCHAR(20),                  -- Ngày đăng ký (định dạng khác CRM)
    FOREIGN KEY (MaKH) REFERENCES KhachHang_A(MaKH),
    FOREIGN KEY (MaTour) REFERENCES Tour_A(MaTour)
);
GO

-- Dữ liệu mẫu
INSERT INTO Tour_A VALUES
('TA01', N'Đà Nẵng 3 ngày', N'2tr', '2025/11/01'),
('TA02', N'Sapa', N'4.5tr', '2025/11/05');

INSERT INTO KhachHang_A VALUES
('A001', N'Lê Văn A', 'leva@gmail.com'),
('A002', N'Nguyễn Thị B', NULL);

INSERT INTO DangKyTour_A VALUES
('DKA1', 'A001', 'TA01', 2, '2025/10/20');
GO

-- =============================================
-- Database: CRM (Nguồn B - hệ thống CRM mới)
-- =============================================
CREATE DATABASE CRM;
GO
USE CRM;
GO

-- Bảng Tour_B
CREATE TABLE Tour_B (
    TourCode NVARCHAR(10) PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(18,2) NULL,        -- CRM có chuẩn hơn ERP
    StartDate DATETIME NULL          -- Có giờ khởi hành
);
GO

-- Bảng KhachHang_B
CREATE TABLE KhachHang_B (
    CustomerID NVARCHAR(10) PRIMARY KEY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Birthday DATE
);
GO

-- Bảng Booking_B
CREATE TABLE Booking_B (
    BookingID NVARCHAR(10) PRIMARY KEY,
    CustomerID NVARCHAR(10),
    TourCode NVARCHAR(10),
    Quantity INT,
    BookedAt DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES KhachHang_B(CustomerID),
    FOREIGN KEY (TourCode) REFERENCES Tour_B(TourCode)
);
GO

-- Dữ liệu mẫu
INSERT INTO Tour_B VALUES
('TB01', N'Tour Hạ Long', 3000000, '2025-11-07 08:00:00'),
('TB02', N'Tour Nha Trang', NULL, NULL);

INSERT INTO KhachHang_B VALUES
('B001', N'Trần Văn C', 'c@gmail.com', '1990-01-01'),
('B002', NULL, 'b002@gmail.com', '1995-05-10');

INSERT INTO Booking_B VALUES
('BK01', 'B002', 'TB02', 1, '2025-10-25T09:00:00Z');
GO

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

-- =============================================
-- Database: DQ (Data Quality)
-- =============================================
CREATE DATABASE DQ;
GO
USE DQ;
GO

-- Ghi lại các bản ghi lỗi do vi phạm quy tắc chất lượng dữ liệu
-- Ví dụ: Email null, tên trống, giá null, ngày sai định dạng

CREATE TABLE DQ_ErrorRecords (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    SourceSystem NVARCHAR(10),
    EntityName NVARCHAR(50),
    RecordKey NVARCHAR(50),
    FieldName NVARCHAR(50),
    ErrorType NVARCHAR(100),
    ErrorDescription NVARCHAR(255),
    ErrorTime DATETIME DEFAULT GETDATE(),
    BatchID INT NULL
);
GO


-- =============================================
-- Database: ETL_Metadata
-- =============================================
CREATE DATABASE ETL_Metadata;
GO
USE ETL_Metadata;
GO

-- Ghi log mỗi lần chạy pipeline
CREATE TABLE ETL_BatchLog (
    BatchID INT IDENTITY(1,1) PRIMARY KEY,
    BatchName NVARCHAR(100),
    SourceSystem NVARCHAR(50),
    StartTime DATETIME,
    EndTime DATETIME,
    Status NVARCHAR(20),           -- Success / Failed / Partial
    TotalRecords INT,
    InsertedRecords INT,
    UpdatedRecords INT,
    ErrorRecords INT
);
GO

-- -- Lưu LSET/CET phục vụ incremental load
-- CREATE TABLE ETL_Watermark (
--     SourceSystem NVARCHAR(50),
--     EntityName NVARCHAR(50),
--     LastSuccessfulLoad DATETIME,
--     CurrentLoad DATETIME
-- );
-- GO

-- -- Log lỗi tổng thể trong quá trình ETL
-- CREATE TABLE ETL_ErrorLog (
--     ErrorID INT IDENTITY(1,1) PRIMARY KEY,
--     BatchID INT,
--     StepName NVARCHAR(100),
--     ErrorMessage NVARCHAR(500),
--     ErrorTime DATETIME DEFAULT GETDATE()
-- );
GO

-- =============================================
-- Database: DDS (Data Delivery Store / Data Mart)
-- =============================================
CREATE DATABASE DDS;
GO
USE DDS;
GO

-- Dimension tables

-- -- Dimension: Date (useful for facts)
-- CREATE TABLE DimDate (
--     DateKey INT PRIMARY KEY,           -- YYYYMMDD
--     CalendarDate DATE NOT NULL,
--     YearNum INT, Quarter INT, MonthNum INT, DayNum INT,
--     WeekdayName NVARCHAR(20)
-- );
-- GO

-- Dim_Tour: SCD Type 2
CREATE TABLE Dim_Tour (
    TourKey INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    UnifiedTourCode NVARCHAR(20),
    TourName NVARCHAR(100),
    Price DECIMAL(18,2),
    StartDate DATE,
    SourceSystem NVARCHAR(10),
    EffectiveDate DATETIME DEFAULT GETDATE(),
    EndDate DATETIME NULL,
    IsCurrent BIT DEFAULT 1,
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

-- Dim_Customer: SCD Type 1
CREATE TABLE Dim_Customer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    UnifiedCustomerCode NVARCHAR(20),
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Birthday DATE,
    SourceSystem NVARCHAR(10),
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

-- Fact_Booking
CREATE TABLE Fact_Booking (
    BookingKey INT IDENTITY(1,1) PRIMARY KEY,
    UnifiedBookingCode NVARCHAR(20),
    CustomerKey INT,
    TourKey INT,
    Quantity INT,
    BookingDate DATE,
    SourceSystem NVARCHAR(10),
    LoadDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (CustomerKey) REFERENCES Dim_Customer(CustomerKey),
    FOREIGN KEY (TourKey) REFERENCES Dim_Tour(TourKey)
);
GO

