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