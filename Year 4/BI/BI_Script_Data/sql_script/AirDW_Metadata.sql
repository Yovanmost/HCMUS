-- ==========================================
-- DATABASE: AirDW_Metadata
-- Purpose: Store ETL control & metadata tables
-- ==========================================

USE master
GO
IF DB_ID('AirDW_Metadata') IS NOT NULL
BEGIN
    ALTER DATABASE AirDW_Metadata SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AirDW_Metadata;
END
GO
CREATE DATABASE AirDW_Metadata;
GO
USE AirDW_Metadata;
GO

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
    ('stage', '1900-01-01', 0),
    ('dim_Airline', '1900-01-01', 0),
    ('dim_Airport', '1900-01-01', 0),
    ('dim_CancellationReason', '1900-01-01', 0),
    ('fact_FlightPerformance', '1900-01-01', 0),

    ('nds_Airlines', '1900-01-01', 0),
    ('nds_Airports', '1900-01-01', 0),
    ('nds_CancellationReasons', '1900-01-01', 0),
    ('nds_FlightFacts', '1900-01-01', 0);

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