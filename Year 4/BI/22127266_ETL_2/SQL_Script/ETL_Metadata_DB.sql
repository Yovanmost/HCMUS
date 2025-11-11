-- =============================================
-- Database: ETL_Metadata
-- =============================================
CREATE DATABASE ETL_Metadata;
GO
USE ETL_Metadata;
GO

-- Ghi log mỗi lần chạy pipeline
CREATE TABLE ETL_BatchLog (
    BatchID INT IDENTITY(1,1) PRIMARY KEY,
    BatchName NVARCHAR(100),
    SourceSystem NVARCHAR(50),
    StartTime DATETIME,
    EndTime DATETIME,
    Status NVARCHAR(20),           -- Success / Failed / Partial
    TotalRecords INT,
    InsertedRecords INT,
    UpdatedRecords INT,
    ErrorRecords INT
);
GO

-- Lưu LSET/CET phục vụ incremental load
CREATE TABLE ETL_Watermark (
    SourceSystem NVARCHAR(50),
    EntityName NVARCHAR(50),
    LastSuccessfulLoad DATETIME,
    CurrentLoad DATETIME
);
GO

-- Log lỗi tổng thể trong quá trình ETL
CREATE TABLE ETL_ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    BatchID INT,
    StepName NVARCHAR(100),
    ErrorMessage NVARCHAR(500),
    ErrorTime DATETIME DEFAULT GETDATE()
);
GO
