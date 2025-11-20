-- ==========================================
-- DATABASE: AirDW_DDS
-- Dimensional Data Store (Star Schema)
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
    DateKey INT PRIMARY KEY, -- Format: YYYYMMDD
    FullDate DATE NOT NULL,
    
    -- Date Attributes
    DayOfWeek INT, -- 1=Sunday, 7=Saturday
    DayName VARCHAR(10),
    DayOfMonth INT,
    DayOfYear INT,
    
    -- Week Attributes
    WeekOfYear INT,
    WeekStartDate DATE,
    WeekEndDate DATE,
    
    -- Month Attributes
    Month INT,
    MonthName VARCHAR(10),
    MonthShortName VARCHAR(3),
    MonthYear VARCHAR(7), -- Format: 2015-01
    
    -- Quarter Attributes
    Quarter INT,
    QuarterName VARCHAR(2), -- Q1, Q2, Q3, Q4
    QuarterYear VARCHAR(7), -- Format: 2015-Q1
    
    -- Year Attributes
    Year INT,
    
    -- Fiscal Attributes (if different from calendar)
    FiscalYear INT,
    FiscalQuarter INT,
    FiscalMonth INT,
    
    -- Business Day Flags
    IsWeekend BIT,
    IsHoliday BIT,
    HolidayName VARCHAR(50),
    
    -- Season (for weather analysis)
    Season VARCHAR(10), -- Spring, Summer, Fall, Winter
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Time of Day Dimension
-- ========================
CREATE TABLE dim_Time (
    TimeKey INT PRIMARY KEY, -- Format: HHMM (0000-2359)
    TimeValue TIME,
    
    -- Time Attributes
    Hour INT,
    Minute INT,
    HourName VARCHAR(20), -- "00:00", "01:00", etc.
    
    -- Time Band (for analysis)
    TimeBand VARCHAR(20), -- Night, Morning, Afternoon, Evening
    TimeBandSort INT,
    
    -- Business Hour Flag
    IsBusinessHour BIT, -- 06:00-18:00
    IsPeakHour BIT, -- 07:00-09:00, 17:00-19:00
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Populate Time Dimension
;WITH TimeGenerator AS (
    SELECT 0 AS TimeMinutes
    UNION ALL
    SELECT TimeMinutes + 1
    FROM TimeGenerator
    WHERE TimeMinutes < 1439 -- 24 hours * 60 minutes - 1
)
INSERT INTO dim_Time (TimeKey, TimeValue, Hour, Minute, HourName, TimeBand, TimeBandSort, IsBusinessHour, IsPeakHour)
SELECT 
    (TimeMinutes / 60) * 100 + (TimeMinutes % 60) AS TimeKey,
    CAST(DATEADD(MINUTE, TimeMinutes, '00:00:00') AS TIME) AS TimeValue,
    TimeMinutes / 60 AS Hour,
    TimeMinutes % 60 AS Minute,
    FORMAT(DATEADD(MINUTE, TimeMinutes, '00:00:00'), 'HH:mm') AS HourName,
    CASE 
        WHEN TimeMinutes / 60 BETWEEN 0 AND 5 THEN 'Night'
        WHEN TimeMinutes / 60 BETWEEN 6 AND 11 THEN 'Morning'
        WHEN TimeMinutes / 60 BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS TimeBand,
    CASE 
        WHEN TimeMinutes / 60 BETWEEN 0 AND 5 THEN 1
        WHEN TimeMinutes / 60 BETWEEN 6 AND 11 THEN 2
        WHEN TimeMinutes / 60 BETWEEN 12 AND 17 THEN 3
        ELSE 4
    END AS TimeBandSort,
    CASE WHEN TimeMinutes / 60 BETWEEN 6 AND 17 THEN 1 ELSE 0 END AS IsBusinessHour,
    CASE 
        WHEN TimeMinutes / 60 BETWEEN 7 AND 8 THEN 1
        WHEN TimeMinutes / 60 BETWEEN 17 AND 18 THEN 1
        ELSE 0 
    END AS IsPeakHour
FROM TimeGenerator
OPTION (MAXRECURSION 1440);

-- ========================
-- DIM: Airline Dimension
-- ========================
CREATE TABLE dim_Airline (
    AirlineKey INT PRIMARY KEY,
    AirlineCode VARCHAR(10) NOT NULL,
    AirlineName NVARCHAR(100) NOT NULL,
    
    -- Additional Attributes (can be enriched)
    AirlineCountry NVARCHAR(50),
    AirlineType VARCHAR(50), -- Legacy, Low-Cost, Regional
    FleetSize INT,
    
    -- SCD Type 2 Support
    EffectiveDate DATETIME,
    ExpiryDate DATETIME,
    IsCurrent BIT DEFAULT 1,
    
    -- Audit
    SourceSystemKey INT,
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Airport Dimension
-- ========================
CREATE TABLE dim_Airport (
    AirportKey INT PRIMARY KEY,
    AirportCode VARCHAR(10) NOT NULL,
    AirportName NVARCHAR(200) NOT NULL,
    
    -- Location Attributes
    CityName NVARCHAR(100),
    StateName NVARCHAR(50),
    StateCode VARCHAR(2),
    CountryName NVARCHAR(50),
    CountryCode VARCHAR(3),
    Region NVARCHAR(50), -- Northeast, Southeast, Midwest, Southwest, West
    
    -- Geographic Coordinates
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    
    -- Airport Characteristics
    AirportType VARCHAR(50), -- Hub, Regional, International
    TimeZone VARCHAR(50),
    Elevation INT,
    RunwayCount INT,
    
    -- Traffic Classification (for analysis)
    TrafficCategory VARCHAR(20), -- High, Medium, Low
    IsHub BIT DEFAULT 0,
    
    -- SCD Type 2
    EffectiveDate DATETIME,
    ExpiryDate DATETIME,
    IsCurrent BIT DEFAULT 1,
    
    -- Audit
    SourceSystemKey INT,
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Aircraft Dimension
-- ========================
CREATE TABLE dim_Aircraft (
    AircraftKey INT PRIMARY KEY,
    TailNumber VARCHAR(50) NOT NULL,
    -- AircraftType VARCHAR(50),
    -- Manufacturer VARCHAR(50),
    -- Model VARCHAR(50),
    -- ManufactureYear INT,
    -- SeatCapacity INT,
    
    -- SCD Type 2
    EffectiveDate DATETIME,
    ExpiryDate DATETIME,
    IsCurrent BIT DEFAULT 1,
    
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);

-- ========================
-- DIM: Delay Cause Dimension
-- ========================
CREATE TABLE dim_DelayCause (
    DelayCauseKey INT IDENTITY(1,1) PRIMARY KEY,
    DelayCauseCode VARCHAR(20) NOT NULL,
    DelayCauseName NVARCHAR(100) NOT NULL,
    DelayCauseCategory NVARCHAR(50), -- Controllable, Uncontrollable
    DelayCauseDescription NVARCHAR(500),
    ResponsibilityArea NVARCHAR(50), -- Airline, Airport, ATC, Weather, Security
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Seed Delay Causes
INSERT INTO dim_DelayCause (DelayCauseCode, DelayCauseName, DelayCauseCategory, ResponsibilityArea)
VALUES 
    ('AIR_SYSTEM', 'Air System Delay', 'Uncontrollable', 'ATC'),
    ('SECURITY', 'Security Delay', 'Uncontrollable', 'Security'),
    ('AIRLINE', 'Airline Delay', 'Controllable', 'Airline'),
    ('LATE_AIRCRAFT', 'Late Aircraft Delay', 'Controllable', 'Airline'),
    ('WEATHER', 'Weather Delay', 'Uncontrollable', 'Weather');

-- ========================
-- DIM: Cancellation Reason Dimension
-- ========================
CREATE TABLE dim_CancellationReason (
    CancellationReasonKey INT PRIMARY KEY,
    CancellationCode VARCHAR(10) NOT NULL,
    ReasonDescription NVARCHAR(200),
    ReasonCategory NVARCHAR(50),
    IsControllable BIT,
    
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Seed Cancellation Reasons
INSERT INTO dim_CancellationReason (CancellationReasonKey, CancellationCode, ReasonDescription, ReasonCategory, IsControllable)
VALUES 
    (1, 'A', 'Airline/Carrier', 'Airline', 1),
    (2, 'B', 'Weather', 'Weather', 0),
    (3, 'C', 'National Air System', 'NAS', 0),
    (4, 'D', 'Security', 'Security', 0),
    (-1, 'N/A', 'Not Cancelled', 'None', NULL);

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
    AircraftKey INT,
    CancellationReasonKey INT,
    
    -- Degenerate Dimensions (no separate dimension table)
    FlightNumber INT NOT NULL,
    FlightDate DATE NOT NULL,
    
    -- Measures: Time (in minutes)
    ScheduledDepartureTime INT,
    ActualDepartureTime INT,
    ScheduledArrivalTime INT,
    ActualArrivalTime INT,
    ScheduledElapsedTime INT,
    ActualElapsedTime INT,
    AirTime INT,
    
    -- Measures: Delay (in minutes)
    DepartureDelayMinutes INT DEFAULT 0,
    ArrivalDelayMinutes INT DEFAULT 0,
    TotalDelayMinutes INT DEFAULT 0,
    
    -- Delay Breakdown (in minutes)
    AirSystemDelayMinutes INT DEFAULT 0,
    SecurityDelayMinutes INT DEFAULT 0,
    AirlineDelayMinutes INT DEFAULT 0,
    LateAircraftDelayMinutes INT DEFAULT 0,
    WeatherDelayMinutes INT DEFAULT 0,
    
    -- Measures: Ground Operations (in minutes)
    TaxiOutMinutes INT,
    TaxiInMinutes INT,
    TotalTaxiMinutes INT,
    WheelsOffTime INT,
    WheelsOnTime INT,
    
    -- Measures: Distance
    DistanceMiles INT,
    
    -- Semi-Additive/Non-Additive Measures
    OnTimePerformanceFlag BIT, -- 1 if |ArrivalDelay| < 5
    SevereDelayFlag BIT, -- 1 if ArrivalDelay > 15
    CancelledFlag BIT DEFAULT 0,
    DivertedFlag BIT DEFAULT 0,
    
    -- Audit
    LoadDate DATETIME DEFAULT GETDATE(),
    SourceRecordID BIGINT,
    
    -- Foreign Key Constraints
    CONSTRAINT FK_Flight_Date FOREIGN KEY (DateKey) REFERENCES dim_Date(DateKey),
    CONSTRAINT FK_Flight_Airline FOREIGN KEY (AirlineKey) REFERENCES dim_Airline(AirlineKey),
    CONSTRAINT FK_Flight_OriginAirport FOREIGN KEY (OriginAirportKey) REFERENCES dim_Airport(AirportKey),
    CONSTRAINT FK_Flight_DestinationAirport FOREIGN KEY (DestinationAirportKey) REFERENCES dim_Airport(AirportKey),
    CONSTRAINT FK_Flight_Aircraft FOREIGN KEY (AircraftKey) REFERENCES dim_Aircraft(AircraftKey),
    CONSTRAINT FK_Flight_ScheduledDepartureTime FOREIGN KEY (ScheduledDepartureTimeKey) REFERENCES dim_Time(TimeKey),
    CONSTRAINT FK_Flight_CancellationReason FOREIGN KEY (CancellationReasonKey) REFERENCES dim_CancellationReason(CancellationReasonKey)
);

-- Indexes for Query Performance
CREATE COLUMNSTORE INDEX IX_FlightPerformance_ColumnStore ON fact_FlightPerformance 
(
    DateKey, AirlineKey, OriginAirportKey, DestinationAirportKey,
    DepartureDelayMinutes, ArrivalDelayMinutes, TotalDelayMinutes,
    OnTimePerformanceFlag, SevereDelayFlag, CancelledFlag
);

CREATE INDEX IX_FlightPerformance_Date ON fact_FlightPerformance(DateKey);
CREATE INDEX IX_FlightPerformance_Airline ON fact_FlightPerformance(AirlineKey);
CREATE INDEX IX_FlightPerformance_OriginAirport ON fact_FlightPerformance(OriginAirportKey);
CREATE INDEX IX_FlightPerformance_DestinationAirport ON fact_FlightPerformance(DestinationAirportKey);

-- ========================
-- FACT: Flight Delay Details (Factless Fact / Bridge Table)
-- ========================
CREATE TABLE fact_FlightDelayDetails (
    FlightDelayKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    FlightKey BIGINT NOT NULL,
    DelayCauseKey INT NOT NULL,
    DelayMinutes INT NOT NULL,
    
    CONSTRAINT FK_FlightDelay_Flight FOREIGN KEY (FlightKey) REFERENCES fact_FlightPerformance(FlightKey),
    CONSTRAINT FK_FlightDelay_Cause FOREIGN KEY (DelayCauseKey) REFERENCES dim_DelayCause(DelayCauseKey)
);

-- ========================
-- AGGREGATE FACT: Daily Airport Performance (Pre-aggregated)
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
    
    -- Aggregated Measures
    AvgDepartureDelay DECIMAL(10,2),
    AvgArrivalDelay DECIMAL(10,2),
    AvgTaxiOutTime DECIMAL(10,2),
    AvgTaxiInTime DECIMAL(10,2),
    TotalDelayMinutes INT,
    
    -- Derived KPIs
    OnTimePerformancePct DECIMAL(5,2),
    CancellationRate DECIMAL(5,2),
    SevereDelayRate DECIMAL(5,2),
    
    LoadDate DATETIME DEFAULT GETDATE(),
    
    CONSTRAINT FK_DailyAirportPerf_Date FOREIGN KEY (DateKey) REFERENCES dim_Date(DateKey),
    CONSTRAINT FK_DailyAirportPerf_Airport FOREIGN KEY (AirportKey) REFERENCES dim_Airport(AirportKey)
);

CREATE INDEX IX_DailyAirportPerf_Date ON fact_DailyAirportPerformance(DateKey);
CREATE INDEX IX_DailyAirportPerf_Airport ON fact_DailyAirportPerformance(AirportKey);

-- ========================
-- AGGREGATE FACT: Monthly Airline Performance
-- ========================
CREATE TABLE fact_MonthlyAirlinePerformance (
    MonthlyAirlinePerfKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    YearMonth VARCHAR(7) NOT NULL, -- Format: 2015-01
    AirlineKey INT NOT NULL,
    
    -- Counts
    TotalFlights INT,
    CancelledFlights INT,
    OnTimeFlights INT,
    DelayedFlights INT,
    
    -- KPIs
    OnTimePerformancePct DECIMAL(5,2),
    CancellationRate DECIMAL(5,2),
    AvgDelayMinutes DECIMAL(10,2),
    
    LoadDate DATETIME DEFAULT GETDATE(),
    
    CONSTRAINT FK_MonthlyAirlinePerf_Airline FOREIGN KEY (AirlineKey) REFERENCES dim_Airline(AirlineKey)
);

GO