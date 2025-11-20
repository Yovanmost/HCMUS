-- ==========================================
-- DATABASE: AirDW_NDS_Simple
-- Simplified Normalized Data Store (close to stage)
-- - Keeps structure near stage tables
-- - No SCD Type 2, minimal lookups and FKs
-- - Intended for quick ETL from `stg_` tables
-- ==========================================

USE master
GO
IF DB_ID('AirDW_NDS_Simple') IS NOT NULL
BEGIN
    ALTER DATABASE AirDW_NDS_Simple SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AirDW_NDS_Simple;
END
GO
CREATE DATABASE AirDW_NDS_Simple;
GO
USE AirDW_NDS_Simple;
GO

-- =======================
-- Master / Lookup Tables (simple, SCD1-like)
-- =======================
CREATE TABLE nds_Airlines (
    AirlineKey INT IDENTITY(1,1) PRIMARY KEY,
    AirlineCode VARCHAR(10) NOT NULL UNIQUE,
    AirlineName NVARCHAR(100),
    LoadDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE nds_Airports (
    AirportKey INT IDENTITY(1,1) PRIMARY KEY,
    AirportCode VARCHAR(10) NOT NULL UNIQUE,
    AirportName NVARCHAR(200),
    City NVARCHAR(100),
    State NVARCHAR(50),
    Country NVARCHAR(50),
    Latitude FLOAT NULL,
    Longitude FLOAT NULL,
    LoadDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE nds_CancellationReasons (
    CancellationReasonKey INT IDENTITY(1,1) PRIMARY KEY,
    CancellationCode VARCHAR(10) NOT NULL UNIQUE,
    ReasonDescription NVARCHAR(200)
);

INSERT INTO nds_CancellationReasons (CancellationCode, ReasonDescription)
VALUES ('A','Airline/Carrier'), ('B','Weather'), ('C','NAS'), ('D','Security'), ('N/A','Not Cancelled');

-- =======================
-- Fact Table (keeps stage columns, minimal transformations)
-- - Keys reference simple lookup tables above
-- - Keeps tail number and most numeric columns as-is
-- =======================
CREATE TABLE nds_Flights (
    FlightKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    FlightDate DATE NOT NULL,
    AirlineKey INT NULL,
    OriginAirportKey INT NULL,
    DestinationAirportKey INT NULL,
    TailNumber VARCHAR(50),
    FlightNumber INT NULL,

    ScheduledDeparture INT NULL,
    DepartureTime INT NULL,
    DepartureDelay INT NULL,
    TaxiOut INT NULL,
    WheelsOff INT NULL,
    ScheduledTime INT NULL,
    ElapsedTime INT NULL,
    AirTime INT NULL,
    Distance INT NULL,
    WheelsOn INT NULL,
    TaxiIn INT NULL,
    ScheduledArrival INT NULL,
    ArrivalTime INT NULL,
    ArrivalDelay INT NULL,

    Diverted BIT DEFAULT 0,
    Cancelled BIT DEFAULT 0,
    CancellationReasonKey INT NULL,

    AirSystemDelay INT NULL,
    SecurityDelay INT NULL,
    AirlineDelay INT NULL,
    LateAircraftDelay INT NULL,
    WeatherDelay INT NULL,

    LoadDate DATETIME DEFAULT GETDATE(),
    SourceSystem VARCHAR(50) DEFAULT 'Stage_Flights',

    CONSTRAINT FK_NDS_Flights_Airline FOREIGN KEY (AirlineKey) REFERENCES nds_Airlines(AirlineKey),
    CONSTRAINT FK_NDS_Flights_OriginAirport FOREIGN KEY (OriginAirportKey) REFERENCES nds_Airports(AirportKey),
    CONSTRAINT FK_NDS_Flights_DestinationAirport FOREIGN KEY (DestinationAirportKey) REFERENCES nds_Airports(AirportKey),
    CONSTRAINT FK_NDS_Flights_CancelReason FOREIGN KEY (CancellationReasonKey) REFERENCES nds_CancellationReasons(CancellationReasonKey)
);

CREATE INDEX IX_NDS_Flights_FlightDate ON nds_Flights(FlightDate);
CREATE INDEX IX_NDS_Flights_Airline ON nds_Flights(AirlineKey);
CREATE INDEX IX_NDS_Flights_Origin ON nds_Flights(OriginAirportKey);
CREATE INDEX IX_NDS_Flights_Destination ON nds_Flights(DestinationAirportKey);

-- =======================
-- ETL / Audit table (simple)
-- =======================
CREATE TABLE nds_ETL_Log (
    LogID BIGINT IDENTITY(1,1) PRIMARY KEY,
    ProcessName VARCHAR(100),
    TableName VARCHAR(100),
    StartTime DATETIME,
    EndTime DATETIME,
    RowsProcessed INT,
    Status VARCHAR(20),
    ErrorMessage NVARCHAR(MAX),
    CreatedDate DATETIME DEFAULT GETDATE()
);

GO

-- Notes:
-- - This simplified NDS keeps table/column names and types close to the stage (`stg_` tables).
-- - No SCD2 complexity: updates overwrite existing lookup rows (SCD1 style) — suitable for rapid ingest.
-- - If you want SCD2 later, we can adapt `nds_Airlines` and `nds_Airports` to include Effective/Expiry/IsCurrent.
-- - Typical ETL flow: load `stg_*` into stage, dedupe/lookup to fill `nds_` master tables, then insert facts into `nds_Flights`.
