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
    IsCurrent BIT DEFAULT 1
);
GO

-- Dim_Customer: SCD Type 1
CREATE TABLE Dim_Customer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    UnifiedCustomerCode NVARCHAR(20),
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Birthday DATE,
    SourceSystem NVARCHAR(10)
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
    FOREIGN KEY (CustomerKey) REFERENCES Dim_Customer(CustomerKey),
    FOREIGN KEY (TourKey) REFERENCES Dim_Tour(TourKey)
);
GO

