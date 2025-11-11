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
