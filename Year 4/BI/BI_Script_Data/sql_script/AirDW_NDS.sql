-- ==========================================
-- DATABASE: AirDW_NDS
-- Normalized Data Store (3NF)
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
-- MASTER TABLES (Slowly Changing Dimension Type 2)
-- ==========================================

-- ========================
-- NDS: Airlines (SCD Type 2)
-- ========================
CREATE TABLE nds_Airlines (
    AirlineKey INT IDENTITY(1,1) PRIMARY KEY,
    AirlineCode VARCHAR(10) NOT NULL,
    AirlineName NVARCHAR(100) NOT NULL,
    
    -- SCD Type 2 Attributes
    EffectiveDate DATETIME NOT NULL DEFAULT GETDATE(),
    ExpiryDate DATETIME NULL,
    IsCurrent BIT NOT NULL DEFAULT 1,
    
    -- Audit Columns
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE(),
    SourceSystem VARCHAR(50) DEFAULT 'CSV_Import',
    
    -- Business Key Index
    CONSTRAINT UC_Airline_BusinessKey UNIQUE (AirlineCode, EffectiveDate)
);

CREATE INDEX IX_Airlines_Current ON nds_Airlines(AirlineCode, IsCurrent) 
WHERE IsCurrent = 1;

-- ========================
-- NDS: Airports (SCD Type 2)
-- ========================
CREATE TABLE nds_Airports (
    AirportKey INT IDENTITY(1,1) PRIMARY KEY,
    AirportCode VARCHAR(10) NOT NULL,
    AirportName NVARCHAR(200) NOT NULL,
    CityName NVARCHAR(100),
    StateName NVARCHAR(50),
    CountryName NVARCHAR(50),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    
    -- SCD Type 2 Attributes
    EffectiveDate DATETIME NOT NULL DEFAULT GETDATE(),
    ExpiryDate DATETIME NULL,
    IsCurrent BIT NOT NULL DEFAULT 1,
    
    -- Audit Columns
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE(),
    SourceSystem VARCHAR(50) DEFAULT 'CSV_Import',
    
    CONSTRAINT UC_Airport_BusinessKey UNIQUE (AirportCode, EffectiveDate)
);

CREATE INDEX IX_Airports_Current ON nds_Airports(AirportCode, IsCurrent) 
WHERE IsCurrent = 1;

-- -- ========================
-- -- NDS: Aircraft (Tail Numbers)
-- -- ========================
-- CREATE TABLE nds_Aircraft (
--     AircraftKey INT IDENTITY(1,1) PRIMARY KEY,
--     TailNumber VARCHAR(50) NOT NULL,
--     AircraftType VARCHAR(50),
--     ManufactureYear INT,
    
--     -- SCD Type 2
--     EffectiveDate DATETIME NOT NULL DEFAULT GETDATE(),
--     ExpiryDate DATETIME NULL,
--     IsCurrent BIT NOT NULL DEFAULT 1,
    
--     CreatedDate DATETIME DEFAULT GETDATE(),
--     ModifiedDate DATETIME DEFAULT GETDATE(),
    
--     CONSTRAINT UC_Aircraft_BusinessKey UNIQUE (TailNumber, EffectiveDate)
-- );

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
INSERT INTO nds_CancellationReasons (CancellationCode, ReasonDescription, ReasonCategory)
VALUES 
    ('A', 'Airline/Carrier', 'Airline'),
    ('B', 'Weather', 'Weather'),
    ('C', 'National Air System', 'NAS'),
    ('D', 'Security', 'Security'),
    ('N/A', 'Not Cancelled', 'None');

-- ==========================================
-- FACT TABLE (Normalized)
-- ==========================================

-- ========================
-- NDS: Flight Facts
-- ========================
CREATE TABLE nds_FlightFacts (
    FlightFactKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    -- Foreign Keys
    FlightDateKey INT NOT NULL, -- Link to Date Dimension
    AirlineKey INT NOT NULL,
    OriginAirportKey INT NOT NULL,
    DestinationAirportKey INT NOT NULL,
    -- AircraftKey INT NULL,
    TailNumber VARCHAR(50) NOT NULL,
    CancellationReasonKey INT NULL,
    
    -- Flight Identifiers
    FlightNumber INT NOT NULL,
    FlightDate DATE NOT NULL,
    
    -- Time Attributes (in minutes from midnight)
    ScheduledDeparture INT,
    ActualDeparture INT,
    ScheduledArrival INT,
    ActualArrival INT,
    
    -- Delay Measures (in minutes)
    DepartureDelay INT DEFAULT 0,
    ArrivalDelay INT DEFAULT 0,
    
    -- Delay Breakdown (in minutes)
    AirSystemDelay INT DEFAULT 0,
    SecurityDelay INT DEFAULT 0,
    AirlineDelay INT DEFAULT 0,
    LateAircraftDelay INT DEFAULT 0,
    WeatherDelay INT DEFAULT 0,
    
    -- Time Measures (in minutes)
    ScheduledElapsedTime INT,
    ActualElapsedTime INT,
    AirTime INT,
    TaxiOut INT,
    TaxiIn INT,
    WheelsOff INT,
    WheelsOn INT,
    
    -- Distance
    Distance INT,
    
    -- Status Flags
    IsCancelled BIT DEFAULT 0,
    IsDiverted BIT DEFAULT 0,
    
    -- Derived Business Metrics (Pre-calculated for performance)
    IsOnTime BIT, -- |ArrivalDelay| < 5
    IsSevereDelay BIT, -- ArrivalDelay > 15
    TotalDelayMinutes AS (
        CASE 
            WHEN IsCancelled = 0 AND ArrivalDelay > 0 
            THEN ArrivalDelay 
            ELSE 0 
        END
    ) PERSISTED,
    TotalTaxiTime AS (ISNULL(TaxiOut,0) + ISNULL(TaxiIn,0)) PERSISTED,
    
    -- Audit
    LoadDate DATETIME DEFAULT GETDATE(),
    SourceSystem VARCHAR(50) DEFAULT 'Stage_Flights',
    
    -- Constraints
    CONSTRAINT FK_FlightFacts_Airline 
        FOREIGN KEY (AirlineKey) REFERENCES nds_Airlines(AirlineKey),
    CONSTRAINT FK_FlightFacts_OriginAirport 
        FOREIGN KEY (OriginAirportKey) REFERENCES nds_Airports(AirportKey),
    CONSTRAINT FK_FlightFacts_DestinationAirport 
        FOREIGN KEY (DestinationAirportKey) REFERENCES nds_Airports(AirportKey),
    -- CONSTRAINT FK_FlightFacts_Aircraft 
    --     FOREIGN KEY (AircraftKey) REFERENCES nds_Aircraft(AircraftKey),
    CONSTRAINT FK_FlightFacts_CancellationReason 
        FOREIGN KEY (CancellationReasonKey) REFERENCES nds_CancellationReasons(CancellationReasonKey)
);

-- Indexes for Query Performance
CREATE INDEX IX_FlightFacts_FlightDate ON nds_FlightFacts(FlightDate);
CREATE INDEX IX_FlightFacts_Airline ON nds_FlightFacts(AirlineKey);
CREATE INDEX IX_FlightFacts_OriginAirport ON nds_FlightFacts(OriginAirportKey);
CREATE INDEX IX_FlightFacts_DestinationAirport ON nds_FlightFacts(DestinationAirportKey);
CREATE INDEX IX_FlightFacts_Status ON nds_FlightFacts(IsCancelled, IsDiverted);

-- ==========================================
-- AUDIT & METADATA TABLES
-- ==========================================

CREATE TABLE nds_ETL_Log (
    LogID BIGINT IDENTITY(1,1) PRIMARY KEY,
    ProcessName VARCHAR(100),
    TableName VARCHAR(100),
    StartTime DATETIME,
    EndTime DATETIME,
    RowsProcessed INT,
    Status VARCHAR(20), -- Success, Failed, Warning
    ErrorMessage NVARCHAR(MAX),
    CreatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE nds_DataQuality_Log (
    QualityLogID BIGINT IDENTITY(1,1) PRIMARY KEY,
    TableName VARCHAR(100),
    ColumnName VARCHAR(100),
    RuleDescription NVARCHAR(500),
    FailedRecords INT,
    CheckDate DATETIME DEFAULT GETDATE()
);

GO