-- Sử dụng Database
USE [NDS_DALT]
GO

-- Xóa dữ liệu cũ (Tùy chọn, để đảm bảo sạch sẽ trước khi chèn mới)
-- Bắt đầu từ các bảng phụ thuộc vào Bill_NDS và BillDetail_NDS
DELETE FROM [dbo].[BillDetail_NDS];
DELETE FROM [dbo].[Bill_NDS];
DELETE FROM [dbo].[Customer_NDS];
DELETE FROM [dbo].[Product_NDS];
DELETE FROM [dbo].[Store_NDS];
-- Xóa dữ liệu từ các bảng độc lập hơn
DELETE FROM [dbo].[Country_NDS];
DELETE FROM [dbo].[ProductType_NDS];
DELETE FROM [dbo].[StoreType_NDS];
DELETE FROM [dbo].[Status_NDS];
DELETE FROM [dbo].[Source_NDS];
GO

---------------------------------------------------
-- 1. Source_NDS (Không phụ thuộc, cần chèn đầu tiên)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Source_NDS] ON
GO
INSERT INTO [dbo].[Source_NDS] ([SourceID], [SourceName], [CreatedDate], [UpdatedDate]) VALUES
(1, 'Online Sales', GETDATE(), NULL),
(2, 'Retail Store', GETDATE(), NULL),
(3, 'Wholesale Channel', GETDATE(), NULL);
GO
SET IDENTITY_INSERT [dbo].[Source_NDS] OFF
GO

---------------------------------------------------
-- 2. Status_NDS (Không phụ thuộc, cần chèn đầu tiên)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Status_NDS] ON
GO
INSERT INTO [dbo].[Status_NDS] ([StatusID], [Status_Name], [CreatedDate], [UpdatedDate]) VALUES
(1, 'Active', GETDATE(), NULL),
(2, 'Inactive', GETDATE(), NULL),
(3, 'Pending', GETDATE(), NULL);
GO
SET IDENTITY_INSERT [dbo].[Status_NDS] OFF
GO

---------------------------------------------------
-- 3. Country_NDS (Phụ thuộc vào Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Country_NDS] ON
GO
INSERT INTO [dbo].[Country_NDS] ([CountryID], [CountryNK], [CountryName], [SourceID], [CreatedDate], [UpdatedDate], [Status]) VALUES
(1, 'VN', 'Vietnam', 2, GETDATE(), NULL, 1),
(2, 'US', 'United States', 1, GETDATE(), NULL, 1),
(3, 'JP', 'Japan', 3, GETDATE(), NULL, 1);
GO
SET IDENTITY_INSERT [dbo].[Country_NDS] OFF
GO

---------------------------------------------------
-- 4. ProductType_NDS (Phụ thuộc vào Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[ProductType_NDS] ON
GO
INSERT INTO [dbo].[ProductType_NDS] ([ProductTypeID], [ProductTypeNK], [ProductTypeName], [SourceID], [CreatedDate], [UpdatedDate], [Status]) VALUES
(10, 'ELEC', 'Electronics', 1, GETDATE(), NULL, 1),
(20, 'BOOK', 'Books', 2, GETDATE(), NULL, 1),
(30, 'CLOT', 'Clothing', 3, GETDATE(), NULL, 1);
GO
SET IDENTITY_INSERT [dbo].[ProductType_NDS] OFF
GO

---------------------------------------------------
-- 5. StoreType_NDS (Phụ thuộc vào Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[StoreType_NDS] ON
GO
INSERT INTO [dbo].[StoreType_NDS] ([StoreTypeID], [StoreTypeNK], [SourceID], [StoreTypeName], [CreatedDate], [UpdatedDate], [Status]) VALUES
(100, 'MALL', 2, 'Shopping Mall Store', GETDATE(), NULL, 1),
(200, 'ECOM', 1, 'E-Commerce Warehouse', GETDATE(), NULL, 1),
(300, 'FLAG', 2, 'Flagship Store', GETDATE(), NULL, 1);
GO
SET IDENTITY_INSERT [dbo].[StoreType_NDS] OFF
GO

---------------------------------------------------
-- 6. Customer_NDS (Phụ thuộc vào Country_NDS, Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Customer_NDS] ON
GO
INSERT INTO [dbo].[Customer_NDS] ([CusID], [CusNK], [CusName], [Address], [CountryID], [SourceID], [CreatedDate], [UpdatedDate], [Status], [Sex], [Hobby], [Job]) VALUES
(1001, 'C001', 'Nguyen Van A', '123 ABC Street', 1, 2, GETDATE(), NULL, 1, 'M', 'Reading', 'Engineer'),
(1002, 'C002', 'Tran Thi B', '456 XYZ Street', 1, 1, GETDATE(), NULL, 1, 'F', 'Travelling', 'Teacher'),
(1003, 'C003', 'John Smith', '789 Elm Road', 2, 1, GETDATE(), NULL, 1, 'M', 'Gaming', 'Consultant'),
(1004, 'C004', 'Mary Brown', '101 Pine Ave', 2, 3, GETDATE(), NULL, 2, 'F', 'Cooking', 'Doctor');
GO
SET IDENTITY_INSERT [dbo].[Customer_NDS] OFF
GO

---------------------------------------------------
-- 7. Product_NDS (Phụ thuộc vào ProductType_NDS, Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Product_NDS] ON
GO
INSERT INTO [dbo].[Product_NDS] ([ProductID], [ProductNK], [ProductName], [ProductPrice], [ProductType], [SourceID], [CreatedDate], [UpdatedDate], [Status]) VALUES
(501, 'P001', 'Laptop X1', 25000000, 10, 1, GETDATE(), NULL, 1),
(502, 'P002', 'Novel Y', 250000, 20, 2, GETDATE(), NULL, 1),
(503, 'P003', 'T-Shirt Pro', 450000, 30, 3, GETDATE(), NULL, 1),
(504, 'P004', 'Smartphone Z', 15000000, 10, 1, GETDATE(), NULL, 1);
GO
SET IDENTITY_INSERT [dbo].[Product_NDS] OFF
GO

---------------------------------------------------
-- 8. Store_NDS (Phụ thuộc vào Country_NDS, StoreType_NDS, Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Store_NDS] ON
GO
INSERT INTO [dbo].[Store_NDS] ([StoreID], [StoreNK], [SourceID], [StoreName], [StoreType], [Country], [CreatedDate], [UpdatedDate], [Status]) VALUES
(10, 'S001', 2, 'Mega Mall HCMC', 100, 1, GETDATE(), NULL, 1),
(20, 'S002', 1, 'Global E-Warehouse', 200, 2, GETDATE(), NULL, 1),
(30, 'S003', 2, 'Tokyo Flagship', 300, 3, GETDATE(), NULL, 1);
GO
SET IDENTITY_INSERT [dbo].[Store_NDS] OFF
GO

---------------------------------------------------
-- 9. Bill_NDS (Phụ thuộc vào Customer_NDS, Store_NDS, Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[Bill_NDS] ON
GO
INSERT INTO [dbo].[Bill_NDS] ([Bill_ID], [Bill_NK], [CusID], [StoreID], [SourceID], [CreatedDate], [UpdatedDate], [SaleDate], [Status]) VALUES
(10001, 'B0001', 1001, 10, 2, GETDATE(), NULL, DATEADD(day, -5, GETDATE()), 1),
(10002, 'B0002', 1002, 20, 1, GETDATE(), NULL, DATEADD(day, -3, GETDATE()), 1),
(10003, 'B0003', 1003, 20, 1, GETDATE(), NULL, DATEADD(day, -1, GETDATE()), 1);
GO
SET IDENTITY_INSERT [dbo].[Bill_NDS] OFF
GO

---------------------------------------------------
-- 10. BillDetail_NDS (Phụ thuộc vào Bill_NDS, Product_NDS, Source_NDS, Status_NDS)
---------------------------------------------------
SET IDENTITY_INSERT [dbo].[BillDetail_NDS] ON
GO
INSERT INTO [dbo].[BillDetail_NDS] ([BillDetail_ID], [BillDetail_NK], [Bill_ID], [ProductID], [SourceID], [CreatedDate], [UpdatedDate], [Status]) VALUES
(20001, 1, 10001, 502, 2, GETDATE(), NULL, 1), -- Bill 1: Novel Y
(20002, 2, 10001, 503, 2, GETDATE(), NULL, 1), -- Bill 1: T-Shirt Pro
(20003, 1, 10002, 501, 1, GETDATE(), NULL, 1), -- Bill 2: Laptop X1
(20004, 2, 10002, 504, 1, GETDATE(), NULL, 1), -- Bill 2: Smartphone Z
(20005, 1, 10003, 504, 1, GETDATE(), NULL, 1); -- Bill 3: Smartphone Z
GO
SET IDENTITY_INSERT [dbo].[BillDetail_NDS] OFF
GO