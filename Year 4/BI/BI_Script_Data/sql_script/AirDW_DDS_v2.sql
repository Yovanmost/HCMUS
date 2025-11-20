-- ==========================================
-- DATABASE: AirDW_DDS
-- Dimensional Data Store (Star Schema)
-- Tối ưu cho SSIS ETL và BI Reporting
-- ==========================================

USE master
GO
IF DB_ID('AirDW_DDS') IS NOT NULL
BEGIN
    ALTER DATABASE AirDW_DDS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AirDW_DDS;
END
GO
CREATE DATABASE AirDW_DDS;
GO
USE AirDW_DDS;
GO

-- ==========================================
-- DIMENSION TABLES
-- ==========================================

-- ========================
-- DIM: Date Dimension (Conformed Dimension)
-- ========================
CREATE TABLE dim_Date (
    DateKey INT PRIMARY KEY, -- Format: YYYYMMDD (e.g., 20150101)
    FullDate DATE NOT NULL,
    
    -- Date Attributes
    DayOfWeek INT, -- 1=Sunday, 7=Saturday
    DayName VARCHAR(10),
    DayOfMonth INT,
    DayOfYear INT,
    
    -- Week Attributes
    WeekOfYear INT,
    
    -- Month Attributes
    Month INT,
    MonthName VARCHAR(10),
    MonthYear VARCHAR(7), -- Format: 2015-01
    
    -- Quarter Attributes
    Quarter INT,
    QuarterName VARCHAR(2), -- Q1, Q2, Q3, Q4
    
    -- Year Attributes
    Year INT,
    
    -- Business Flags
    IsWeekend BIT,
    
    -- Season (for weather/delay analysis)
    Season VARCHAR(10), -- Spring, Summer, Fall, Winter
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- ======================== 
-- DIM: Time of Day Dimension
-- ========================
CREATE TABLE dim_Time (
    TimeKey INT PRIMARY KEY, -- Format: HHMM (0-2359)
    Hour INT,
    Minute INT,
    HourName VARCHAR(5), -- "00:00", "01:00", etc.
    
    -- Time Band (for business analysis)
    TimeBand VARCHAR(20), -- Night (00-05), Morning (06-11), Afternoon (12-17), Evening (18-23)
    TimeBandSort INT, -- 1=Night, 2=Morning, 3=Afternoon, 4=Evening
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Airline Dimension
-- ========================
CREATE TABLE dim_Airline (
    AirlineKey INT PRIMARY KEY, -- Surrogate Key from NDS
    AirlineCode VARCHAR(10) NOT NULL,
    AirlineName NVARCHAR(100) NOT NULL,
    
    -- Audit
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Airport Dimension (Denormalized)
-- ========================
CREATE TABLE dim_Airport (
    AirportKey INT PRIMARY KEY, -- Surrogate Key from NDS
    AirportCode VARCHAR(10) NOT NULL,
    AirportName NVARCHAR(200) NOT NULL,
    
    -- Location Hierarchy (denormalized for easy filtering)
    CityName NVARCHAR(100),
    StateName NVARCHAR(50),
    StateCode VARCHAR(2), -- Derived: CA, TX, NY, etc.
    CountryName NVARCHAR(50),
    
    -- Geographic Region (derived từ State)
    Region NVARCHAR(50), -- Northeast, Southeast, Midwest, Southwest, West
    
    -- Coordinates
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    
    -- Audit
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Cancellation Reason Dimension
-- ========================
CREATE TABLE dim_CancellationReason (
    CancellationReasonKey INT PRIMARY KEY,
    CancellationCode VARCHAR(10) NOT NULL,
    ReasonDescription NVARCHAR(200),
    ReasonCategory NVARCHAR(50), -- Airline, Weather, NAS, Security, None
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- ==========================================
-- FACT TABLES
-- ==========================================

-- ========================
-- FACT: Flight Performance (Transaction Grain)
-- ========================
CREATE TABLE fact_FlightPerformance (
    FlightKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    -- Foreign Keys (Dimensions)
    DateKey INT NOT NULL,
    ScheduledDepartureTimeKey INT,
    ActualDepartureTimeKey INT,
    ScheduledArrivalTimeKey INT,
    ActualArrivalTimeKey INT,
    AirlineKey INT NOT NULL,
    OriginAirportKey INT NOT NULL,
    DestinationAirportKey INT NOT NULL,
    CancellationReasonKey INT,
    
    -- Degenerate Dimensions (không tách dimension riêng)
    FlightNumber INT NOT NULL,
    TailNumber VARCHAR(50),
    
    -- Time Measures (in minutes from midnight)
    ScheduledDepartureTime INT,
    ActualDepartureTime INT,
    ScheduledArrivalTime INT,
    ActualArrivalTime INT,
    WheelsOffTime INT,
    WheelsOnTime INT,
    
    -- Scheduled vs Actual Time (in minutes)
    ScheduledElapsedTime INT,
    ActualElapsedTime INT,
    AirTime INT,
    
    -- Delay Measures (in minutes)
    DepartureDelayMinutes INT,
    ArrivalDelayMinutes INT,
    
    -- Delay Breakdown (in minutes)
    AirSystemDelayMinutes INT,
    SecurityDelayMinutes INT,
    AirlineDelayMinutes INT,
    LateAircraftDelayMinutes INT,
    WeatherDelayMinutes INT,
    
    -- Ground Operations (in minutes)
    TaxiOutMinutes INT,
    TaxiInMinutes INT,
    
    -- Distance
    DistanceMiles INT,
    
    -- Status Flags
    IsCancelled BIT,
    IsDiverted BIT,
    
    -- Derived Flags (pre-calculated for performance)
    IsOnTime BIT, -- ABS(ArrivalDelayMinutes) < 5 AND NOT Cancelled
    IsSevereDelay BIT, -- ArrivalDelayMinutes > 15
    IsDelayed BIT, -- ArrivalDelayMinutes > 0
    
    -- Audit
    LoadDate DATETIME DEFAULT GETDATE(),
    SourceRecordID BIGINT, -- Link back to NDS FlightFactKey
    
    -- Foreign Key Constraints
    -- CONSTRAINT FK_Flight_Date 
    --     FOREIGN KEY (DateKey) REFERENCES dim_Date(DateKey),
    CONSTRAINT FK_Flight_Airline 
        FOREIGN KEY (AirlineKey) REFERENCES dim_Airline(AirlineKey),
    CONSTRAINT FK_Flight_OriginAirport 
        FOREIGN KEY (OriginAirportKey) REFERENCES dim_Airport(AirportKey),
    CONSTRAINT FK_Flight_DestinationAirport 
        FOREIGN KEY (DestinationAirportKey) REFERENCES dim_Airport(AirportKey),
    -- CONSTRAINT FK_Flight_ScheduledDepartureTime 
    --     FOREIGN KEY (ScheduledDepartureTimeKey) REFERENCES dim_Time(TimeKey),
    CONSTRAINT FK_Flight_CancellationReason 
        FOREIGN KEY (CancellationReasonKey) REFERENCES dim_CancellationReason(CancellationReasonKey)
);

-- Indexes for Query Performance
CREATE INDEX IX_FlightPerformance_Date ON fact_FlightPerformance(DateKey);
CREATE INDEX IX_FlightPerformance_Airline ON fact_FlightPerformance(AirlineKey);
CREATE INDEX IX_FlightPerformance_OriginAirport ON fact_FlightPerformance(OriginAirportKey);
CREATE INDEX IX_FlightPerformance_DestinationAirport ON fact_FlightPerformance(DestinationAirportKey);
CREATE INDEX IX_FlightPerformance_Status ON fact_FlightPerformance(IsCancelled, IsOnTime);

-- Columnstore Index for Analytics (SQL Server 2012+)
CREATE NONCLUSTERED COLUMNSTORE INDEX IX_FlightPerformance_Analytics
ON fact_FlightPerformance
(
    DateKey, AirlineKey, OriginAirportKey, DestinationAirportKey,
    ArrivalDelayMinutes, DepartureDelayMinutes,
    AirSystemDelayMinutes, SecurityDelayMinutes, AirlineDelayMinutes,
    LateAircraftDelayMinutes, WeatherDelayMinutes,
    IsOnTime, IsSevereDelay, IsCancelled
);

-- ========================
-- AGGREGATE FACT: Daily Airport Performance
-- ========================
CREATE TABLE fact_DailyAirportPerformance (
    DailyAirportPerfKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT NOT NULL,
    AirportKey INT NOT NULL,
    
    -- Counts
    TotalFlights INT,
    TotalDepartures INT,
    TotalArrivals INT,
    CancelledFlights INT,
    DivertedFlights INT,
    OnTimeFlights INT,
    DelayedFlights INT,
    SevereDelayedFlights INT,
    
    -- Aggregated Delay Measures (in minutes)
    TotalDepartureDelayMinutes INT,
    TotalArrivalDelayMinutes INT,
    AvgDepartureDelay DECIMAL(10,2),
    AvgArrivalDelay DECIMAL(10,2),
    
    -- Ground Operations
    AvgTaxiOutTime DECIMAL(10,2),
    AvgTaxiInTime DECIMAL(10,2),
    
    -- Derived KPIs (%)
    OnTimePerformancePct DECIMAL(5,2),
    CancellationRate DECIMAL(5,2),
    SevereDelayRate DECIMAL(5,2),
    
    LoadDate DATETIME DEFAULT GETDATE(),
    
    -- CONSTRAINT FK_DailyAirportPerf_Date 
    --     FOREIGN KEY (DateKey) REFERENCES dim_Date(DateKey),
    CONSTRAINT FK_DailyAirportPerf_Airport 
        FOREIGN KEY (AirportKey) REFERENCES dim_Airport(AirportKey),
    CONSTRAINT UC_DailyAirportPerf UNIQUE (DateKey, AirportKey)
);

CREATE INDEX IX_DailyAirportPerf_Date ON fact_DailyAirportPerformance(DateKey);
CREATE INDEX IX_DailyAirportPerf_Airport ON fact_DailyAirportPerformance(AirportKey);

-- ========================
-- AGGREGATE FACT: Monthly Airline Performance
-- ========================
CREATE TABLE fact_MonthlyAirlinePerformance (
    MonthlyAirlinePerfKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    YearMonth VARCHAR(7) NOT NULL, -- Format: 2015-01
    Year INT NOT NULL,
    Month INT NOT NULL,
    AirlineKey INT NOT NULL,
    
    -- Counts
    TotalFlights INT,
    CancelledFlights INT,
    OnTimeFlights INT,
    DelayedFlights INT,
    SevereDelayedFlights INT,
    
    -- Aggregated Delay (in minutes)
    TotalDelayMinutes INT,
    AvgDelayMinutes DECIMAL(10,2),
    
    -- KPIs (%)
    OnTimePerformancePct DECIMAL(5,2),
    CancellationRate DECIMAL(5,2),
    SevereDelayRate DECIMAL(5,2),
    
    LoadDate DATETIME DEFAULT GETDATE(),
    
    CONSTRAINT FK_MonthlyAirlinePerf_Airline 
        FOREIGN KEY (AirlineKey) REFERENCES dim_Airline(AirlineKey),
    CONSTRAINT UC_MonthlyAirlinePerf UNIQUE (YearMonth, AirlineKey)
);

CREATE INDEX IX_MonthlyAirlinePerf_YearMonth ON fact_MonthlyAirlinePerformance(YearMonth);
CREATE INDEX IX_MonthlyAirlinePerf_Airline ON fact_MonthlyAirlinePerformance(AirlineKey);
GO
-- ==========================================
-- CONTROL & AUDIT TABLES (for SSIS)
-- ==========================================

-- -- ETL Control Table - SSIS sẽ đọc để biết cần load data nào
-- CREATE TABLE ctl_ETL_Config (
--     ConfigKey VARCHAR(50) PRIMARY KEY,
--     ConfigValue NVARCHAR(500),
--     Description NVARCHAR(500),
--     ModifiedDate DATETIME DEFAULT GETDATE()
-- );

-- -- Insert default config
-- INSERT INTO ctl_ETL_Config (ConfigKey, ConfigValue, Description)
-- VALUES 
--     ('LastProcessedDate', '2014-12-31', 'Last date successfully processed in ETL'),
--     ('IncrementalLoadEnabled', 'TRUE', 'Enable incremental load vs full load'),
--     ('AggregateRefreshEnabled', 'TRUE', 'Enable aggregate table refresh');

-- -- ETL Execution Log - SSIS ghi log mỗi lần chạy
-- CREATE TABLE ctl_ETL_Execution_Log (
--     ExecutionLogID BIGINT IDENTITY(1,1) PRIMARY KEY,
--     PackageName VARCHAR(100),
--     ExecutionStartTime DATETIME,
--     ExecutionEndTime DATETIME,
--     ExecutionStatus VARCHAR(20), -- Success, Failed, Running
--     RowsProcessed INT,
--     ErrorMessage NVARCHAR(MAX),
--     CreatedDate DATETIME DEFAULT GETDATE()
-- );

-- GO

-- Control Table: Lưu watermark (last successful load time)
CREATE TABLE ctl_ETL_Watermark (
    TableName VARCHAR(100) PRIMARY KEY,
    LastLoadDate DATETIME NOT NULL,
    LastLoadedID BIGINT NULL,
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Insert initial watermarks
INSERT INTO ctl_ETL_Watermark (TableName, LastLoadDate, LastLoadedID)
VALUES 
    ('dim_Airline', '1900-01-01', 0),
    ('dim_Airport', '1900-01-01', 0),
    ('fact_FlightPerformance', '1900-01-01', 0);

-- Execution Log: Track mỗi lần chạy package
CREATE TABLE ctl_ETL_Execution_Log (
    ExecutionID BIGINT IDENTITY(1,1) PRIMARY KEY,
    PackageName VARCHAR(100),
    TableName VARCHAR(100),
    StartTime DATETIME,
    EndTime DATETIME,
    RowsRead INT,
    RowsInserted INT,
    RowsUpdated INT,
    Status VARCHAR(20), -- Running, Success, Failed
    ErrorMessage NVARCHAR(MAX),
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO