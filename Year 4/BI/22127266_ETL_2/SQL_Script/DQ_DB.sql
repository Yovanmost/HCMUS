-- =============================================
-- Database: DQ (Data Quality)
-- =============================================
CREATE DATABASE DQ;
GO
USE DQ;
GO

-- Ghi lại các bản ghi lỗi do vi phạm quy tắc chất lượng dữ liệu
-- Ví dụ: Email null, tên trống, giá null, ngày sai định dạng

CREATE TABLE DQ_ErrorRecords (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    SourceSystem NVARCHAR(10),
    EntityName NVARCHAR(50),
    RecordKey NVARCHAR(50),
    FieldName NVARCHAR(50),
    ErrorType NVARCHAR(100),
    ErrorDescription NVARCHAR(255),
    ErrorTime DATETIME DEFAULT GETDATE(),
    BatchID INT NULL
);
GO
