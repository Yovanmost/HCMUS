-- ==========================================
-- DATABASE: AirDW_NDS
-- Normalized Data Store (3NF) - SIMPLIFIED
-- Bám sát cấu trúc Stage, chỉ làm sạch và chuẩn hóa
-- ==========================================

USE master
GO
IF DB_ID('AirDW_NDS') IS NOT NULL
BEGIN
    ALTER DATABASE AirDW_NDS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AirDW_NDS;
END
GO
CREATE DATABASE AirDW_NDS;
GO
USE AirDW_NDS;
GO

-- ==========================================
-- MASTER TABLES - Đơn giản, không SCD Type 2
-- ==========================================

-- ========================
-- NDS: Airlines
-- ========================
CREATE TABLE nds_Airlines (
    AirlineKey INT IDENTITY(1,1) PRIMARY KEY,
    AirlineCode VARCHAR(10) NOT NULL UNIQUE,
    AirlineName NVARCHAR(100) NOT NULL,
    
    -- Audit
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- NDS: Airports
-- ========================
CREATE TABLE nds_Airports (
    AirportKey INT IDENTITY(1,1) PRIMARY KEY,
    AirportCode VARCHAR(10) NOT NULL UNIQUE,
    AirportName NVARCHAR(200) NOT NULL,
    CityName NVARCHAR(100),
    StateName NVARCHAR(50),
    CountryName NVARCHAR(50),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    
    -- Audit
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- NDS: Cancellation Reasons (Reference Data)
-- ========================
CREATE TABLE nds_CancellationReasons (
    CancellationReasonKey INT IDENTITY(1,1) PRIMARY KEY,
    CancellationCode VARCHAR(10) NOT NULL UNIQUE,
    ReasonDescription NVARCHAR(200),
    ReasonCategory NVARCHAR(50), -- Weather, Airline, NAS, Security
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Seed Reference Data
-- https://www.bts.gov/topics/airlines-and-airports/number-15-gate-departure-time
INSERT INTO nds_CancellationReasons (CancellationCode, ReasonDescription, ReasonCategory)
VALUES 
    ('A', 'Airline/Carrier', 'Airline'),
    ('B', 'Weather', 'Weather'),
    ('C', 'National Air System', 'NAS'),
    ('D', 'Security', 'Security'),
    ('', 'Not Cancelled', 'None');

-- ==========================================
-- FACT TABLE - Bám sát cấu trúc Stage
-- ==========================================

-- ========================
-- NDS: Flight Facts
-- ========================
CREATE TABLE nds_FlightFacts (
    FlightFactKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    -- Foreign Keys
    AirlineKey INT NOT NULL,
    OriginAirportKey INT NOT NULL,
    DestinationAirportKey INT NOT NULL,
    CancellationReasonKey INT NULL,
    
    -- Flight Info (giữ nguyên từ Stage)
    FlightDate DATE NOT NULL,
    FlightNumber INT NOT NULL,
    TailNumber VARCHAR(50),
    
    -- Time Fields (in minutes from midnight - giữ nguyên từ Stage)
    ScheduledDeparture INT,
    DepartureTime INT,
    ScheduledArrival INT,
    ArrivalTime INT,
    WheelsOff INT,
    WheelsOn INT,
    
    -- Delay Fields (in minutes - giữ nguyên từ Stage)
    DepartureDelay INT,
    ArrivalDelay INT,
    AirSystemDelay INT,
    SecurityDelay INT,
    AirlineDelay INT,
    LateAircraftDelay INT,
    WeatherDelay INT,
    
    -- Time Measures (in minutes - giữ nguyên từ Stage)
    ScheduledTime INT,
    ElapsedTime INT,
    AirTime INT,
    TaxiOut INT,
    TaxiIn INT,
    
    -- Distance (giữ nguyên từ Stage)
    Distance INT,
    
    -- Status Flags (giữ nguyên từ Stage)
    Diverted BIT,
    Cancelled BIT,
    
    -- Audit
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE(),
    
    -- Constraints
    CONSTRAINT FK_FlightFacts_Airline 
        FOREIGN KEY (AirlineKey) REFERENCES nds_Airlines(AirlineKey),
    CONSTRAINT FK_FlightFacts_OriginAirport 
        FOREIGN KEY (OriginAirportKey) REFERENCES nds_Airports(AirportKey),
    CONSTRAINT FK_FlightFacts_DestinationAirport 
        FOREIGN KEY (DestinationAirportKey) REFERENCES nds_Airports(AirportKey),
    CONSTRAINT FK_FlightFacts_CancellationReason 
        FOREIGN KEY (CancellationReasonKey) REFERENCES nds_CancellationReasons(CancellationReasonKey)
);

-- Indexes for Performance
-- CREATE INDEX IX_FlightFacts_FlightDate ON nds_FlightFacts(FlightDate);
-- CREATE INDEX IX_FlightFacts_Airline ON nds_FlightFacts(AirlineKey);
-- CREATE INDEX IX_FlightFacts_OriginAirport ON nds_FlightFacts(OriginAirportKey);
-- CREATE INDEX IX_FlightFacts_DestinationAirport ON nds_FlightFacts(DestinationAirportKey);

-- ==========================================
-- DATA QUALITY & AUDIT
-- ==========================================

-- -- Log bảng để SSIS ghi kết quả ETL
-- CREATE TABLE nds_ETL_Log (
--     LogID BIGINT IDENTITY(1,1) PRIMARY KEY,
--     PackageName VARCHAR(100),
--     TaskName VARCHAR(100),
--     StartTime DATETIME,
--     EndTime DATETIME,
--     RowsRead INT,
--     RowsInserted INT,
--     RowsUpdated INT,
--     RowsErrored INT,
--     Status VARCHAR(20), -- Success, Failed, Warning
--     ErrorMessage NVARCHAR(MAX),
--     CreatedDate DATETIME DEFAULT GETDATE()
-- );

-- GO