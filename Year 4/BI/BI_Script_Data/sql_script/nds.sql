-- ==========================================
-- DATABASE: AirDW_NDS
-- =========================================
-- Xóa DB cũ nếu tồn tại
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

-- =======================
-- NDS - Airlines
-- =======================
CREATE TABLE NDS_Airline (
  AirlineID INT IDENTITY(1,1) PRIMARY KEY,
  IATA_CODE VARCHAR(10) UNIQUE,
  AirlineName NVARCHAR(200)
);

-- =======================
-- NDS - Airports
-- =======================
CREATE TABLE NDS_Airport (
  AirportID INT IDENTITY(1,1) PRIMARY KEY,
  IATA_CODE VARCHAR(10) UNIQUE,
  AirportName NVARCHAR(200),
  City NVARCHAR(100),
  State NVARCHAR(50),
  Country NVARCHAR(50),
  Latitude FLOAT,
  Longitude FLOAT
);

-- =======================
-- NDS - Delay Reasons
-- =======================
CREATE TABLE NDS_DelayReason (
  ReasonCode VARCHAR(10) PRIMARY KEY,
  Description NVARCHAR(200)
);

-- =======================
-- NDS - Flights
-- =======================
CREATE TABLE NDS_Flight (
  FlightID BIGINT IDENTITY(1,1) PRIMARY KEY,
  FlightDate DATE NOT NULL,
  AirlineCode VARCHAR(10) NOT NULL,
  FlightNumber INT,
  TailNumber VARCHAR(50),
  OriginAirportCode VARCHAR(10),
  DestAirportCode VARCHAR(10),
  ScheduledDeparture INT,
  DepartureTime INT,
  DepartureDelay INT,
  WheelsOff DATETIME NULL,
  TaxiOut INT,
  ScheduledArrival INT,
  ArrivalTime INT,
  ArrivalDelay INT,
  WheelsOn INT,
  TaxiIn INT,
  ElapsedTime INT,
  AirTime INT,
  Distance INT,
  Diverted BIT,
  Cancelled BIT,
  CancellationReason VARCHAR(10),
  AirSystemDelay INT,
  SecurityDelay INT,
  AirlineDelay INT,
  LateAircraftDelay INT,
  WeatherDelay INT,
  Created DATETIME,
  Modified DATETIME,
  LoadBatchID INT
);

-- Flight -> Airline
ALTER TABLE NDS_Flight
ADD CONSTRAINT FK_Flight_Airline
FOREIGN KEY (AirlineCode)
REFERENCES NDS_Airline (IATA_CODE);

-- Flight -> Airport (Origin)
ALTER TABLE NDS_Flight
ADD CONSTRAINT FK_Flight_OriginAirport
FOREIGN KEY (OriginAirportCode)
REFERENCES NDS_Airport (IATA_CODE);

-- Flight -> Airport (Destination)
ALTER TABLE NDS_Flight
ADD CONSTRAINT FK_Flight_DestAirport
FOREIGN KEY (DestAirportCode)
REFERENCES NDS_Airport (IATA_CODE);

-- Flight -> DelayReason (CancellationReason)
ALTER TABLE NDS_Flight
ADD CONSTRAINT FK_Flight_CancelReason
FOREIGN KEY (CancellationReason)
REFERENCES NDS_DelayReason (ReasonCode);

CREATE TABLE Status_NDS(
	[StatusID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Status_Name] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
);