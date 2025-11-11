-- ==========================================
-- DATABASE: METADATA
-- ==========================================
-- Xóa DB cũ nếu tồn tại
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

-- 1) Danh mục dataset (meta_dataset)
CREATE TABLE meta_dataset (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Khóa chính tự tăng (thay cho SERIAL)
    name VARCHAR(200) NOT NULL,
    domain VARCHAR(100),
    format VARCHAR(50),
    location VARCHAR(MAX), -- Sử dụng VARCHAR(MAX) thay vì TEXT
    system_type VARCHAR(50),
    confidentiality VARCHAR(50),
    description VARCHAR(MAX),
    UNIQUE (name)
);

-- 2) Mỗi lần chạy (RUN) + kèm lineage nguồn→đích (meta_flow_run)
CREATE TABLE meta_flow_run (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Khóa chính tự tăng
    flow_name VARCHAR(200) NOT NULL,
    source_dataset_id INT REFERENCES meta_dataset(id),
    target_dataset_id INT REFERENCES meta_dataset(id),
    start_time DATETIME DEFAULT GETDATE(), -- Sử dụng DATETIME và GETDATE()
    end_time DATETIME,
    status VARCHAR(20),
    records_in BIGINT,
    records_out BIGINT,
    error_count BIGINT DEFAULT 0,
    provenance_ref VARCHAR(MAX),
    notes VARCHAR(MAX)
);

-- Indexes
CREATE INDEX idx_meta_flow_run_flow ON meta_flow_run(flow_name);
CREATE INDEX idx_meta_flow_run_src ON meta_flow_run(source_dataset_id);
CREATE INDEX idx_meta_flow_run_tgt ON meta_flow_run(target_dataset_id);
GO


-- ==========================================
-- DATABASE: DATA QUALITY
-- ==========================================
-- Xóa DB cũ nếu tồn tại
IF DB_ID('AirDW_DQ') IS NOT NULL
BEGIN
    ALTER DATABASE AirDW_DQ SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE AirDW_DQ;
END
GO
CREATE DATABASE AirDW_DQ;
GO
USE AirDW_DQ;
GO

-- Thư viện quy tắc dùng chung (dq_rule)
CREATE TABLE dq_rule (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Khóa chính tự tăng
    code VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(MAX)
);

-- Kết quả DQ theo từng run & dataset (dq_result)
CREATE TABLE dq_result (
    id INT IDENTITY(1,1) PRIMARY KEY, -- Khóa chính tự tăng
    flow_run_id INT, -- Không thể REFERENCES meta_flow_run(id) trực tiếp nếu DB khác, phải dùng T-SQL sau
    dataset_id INT, -- Không thể REFERENCES meta_dataset(id) trực tiếp nếu DB khác
    rule_id INT REFERENCES dq_rule(id),
    status VARCHAR(10),
    checked_rows BIGINT,
    failed_rows BIGINT,
    details VARCHAR(MAX) -- Sử dụng VARCHAR(MAX)
);

-- Indexes
CREATE INDEX idx_dq_result_run ON dq_result(flow_run_id);
CREATE INDEX idx_dq_result_ds ON dq_result(dataset_id);
GO

-- ==========================================
-- FOREIGN KEY CROS-DATABASE (TÙY CHỌN, KHÔNG KHUYẾN NGHỊ)
-- ==========================================
-- Nếu muốn tạo FK giữa các DB khác nhau, bạn phải tạo thủ công sau khi các DB đã tồn tại.
-- Tuy nhiên, trong môi trường Data Warehouse/ETL, việc quản lý quan hệ này thường được thực hiện
-- ở cấp độ logic trong các ứng dụng (SSIS) hoặc báo cáo, không dùng FK vật lý giữa các DB.
-- Nếu bạn muốn giữ lại tham chiếu (REFERENCES) trong mã, bạn cần đảm bảo các DB
-- được tạo trên cùng một Server và người dùng có quyền truy cập.

/*
-- Ví dụ tạo FK sau khi tất cả các bảng đã được tạo:
USE AirDW_DQ;
ALTER TABLE dq_result
ADD CONSTRAINT FK_dq_result_flow_run
FOREIGN KEY (flow_run_id)
REFERENCES AirDW_Metadata.dbo.meta_flow_run(id);

ALTER TABLE dq_result
ADD CONSTRAINT FK_dq_result_dataset
FOREIGN KEY (dataset_id)
REFERENCES AirDW_Metadata.dbo.meta_dataset(id);
*/