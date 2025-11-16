-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : Webtower9
-- Version   : Microsoft SQL Server  9.00.1399.06


--
-- Dropping table ChiTietHoaDon_WebTower9 : 
--
create database Webtower9
go
use Webtower9
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[ChiTietHoaDon_WebTower9]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[ChiTietHoaDon_WebTower9]
GO

--
-- Dropping table HoaDon_WebTower9 : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[HoaDon_WebTower9]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[HoaDon_WebTower9]
GO

--
-- Dropping table KhachHang_WebTower9 : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[KhachHang_WebTower9]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[KhachHang_WebTower9]
GO

--
-- Dropping stored procedure sp_alterdiagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_alterdiagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_alterdiagram]
GO

--
-- Dropping stored procedure sp_creatediagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_creatediagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_creatediagram]
GO

--
-- Dropping stored procedure sp_dropdiagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_dropdiagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_dropdiagram]
GO

--
-- Dropping stored procedure sp_helpdiagramdefinition : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_helpdiagramdefinition]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_helpdiagramdefinition]
GO

--
-- Dropping stored procedure sp_helpdiagrams : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_helpdiagrams]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_helpdiagrams]
GO

--
-- Dropping stored procedure sp_renamediagram : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_renamediagram]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_renamediagram]
GO

--
-- Dropping table sysdiagrams : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sysdiagrams]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[sysdiagrams]
GO

--
-- Dropping user-defined data type sysname : 
--

IF EXISTS (SELECT * FROM dbo.systypes WHERE name = N'sysname')
  DROP TYPE [sys].[sysname]
GO

--
-- Dropping user-defined function fn_diagramobjects : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[fn_diagramobjects]') AND xtype IN (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbo].[fn_diagramobjects]
GO

--
-- Dropping stored procedure sp_upgraddiagrams : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_upgraddiagrams]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbo].[sp_upgraddiagrams]
GO

--
-- Definition for table KhachHang_WebTower9 : 
--

CREATE TABLE [dbo].[KhachHang_WebTower9] (
  [MaKH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [TenKH] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [TenNuoc] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayTao] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL,
  [GioiTinh] char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [SoThich] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgheNghiep] varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table HoaDon_WebTower9 : 
--

CREATE TABLE [dbo].[HoaDon_WebTower9] (
  [MaHD] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [MaKH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [MaCH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayBan] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL
)
ON [PRIMARY]
GO

--
-- Definition for table ChiTietHoaDon_WebTower9 : 
--

CREATE TABLE [dbo].[ChiTietHoaDon_WebTower9] (
  [MaChiTiet] int NOT NULL,
  [MaHD] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [MaSP] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayTao] datetime NULL,
  [NgayCapNhat] datetime NULL,
  [TrangThai] int NULL
)
ON [PRIMARY]
GO

--
-- Definition for table sysdiagrams : 
--

CREATE TABLE [dbo].[sysdiagrams] (
  [name] sysname COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [principal_id] int NOT NULL,
  [diagram_id] int IDENTITY(1, 1) NOT NULL,
  [version] int NULL,
  [definition] varbinary(max) NULL
)
ON [PRIMARY]
GO

--
-- Definition for user-defined function fn_diagramobjects : 
--
GO
	CREATE FUNCTION dbo.fn_diagramobjects() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
GO

--
-- Definition for stored procedure sp_alterdiagram : 
--
GO
	CREATE PROCEDURE dbo.sp_alterdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
GO

--
-- Definition for stored procedure sp_creatediagram : 
--
GO
	CREATE PROCEDURE dbo.sp_creatediagram
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
GO

--
-- Definition for stored procedure sp_dropdiagram : 
--
GO
	CREATE PROCEDURE dbo.sp_dropdiagram
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
GO

--
-- Definition for stored procedure sp_helpdiagramdefinition : 
--
GO
	CREATE PROCEDURE dbo.sp_helpdiagramdefinition
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
GO

--
-- Definition for stored procedure sp_helpdiagrams : 
--
GO
	CREATE PROCEDURE dbo.sp_helpdiagrams
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
GO

--
-- Definition for stored procedure sp_renamediagram : 
--
GO
	CREATE PROCEDURE dbo.sp_renamediagram
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
GO

--
-- Definition for stored procedure sp_upgraddiagrams : 
--
GO
	CREATE PROCEDURE dbo.sp_upgraddiagrams
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
GO

--
-- Data for table dbo.ChiTietHoaDon_WebTower9  (LIMIT 0,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1, N'QH5', N'RUVT', '20090802 23:24:43.710', '20100404 18:12:46.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (2, N'U17F', N'ES3N', '20100524 12:52:51.210', '20110317 20:04:47.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (3, N'SBHI', N'5QE5', '20100923 13:48:23.830', '20110311 18:25:27.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (4, N'KN09', N'ZGEP', '20090525 16:46:50.680', '20090926 06:41:52.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (5, N'73KG', N'3WMY', '20100213 14:20:22.460', '20100217 04:34:04.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (6, N'02GY', N'B0EN', '20090512 15:23:47.190', '20090528 23:37:26.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (7, N'WQCP', N'SWPM', '20090702 09:26:58.160', '20100127 20:52:39.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (8, N'G1DV', N'G79S', '20101122 12:45:18.030', '20110406 04:56:48.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (9, N'Z79I', N'839Q', '20090912 04:51:09.550', '20100131 22:15:07.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (10, N'9PN', N'0DMD', '20091004 23:44:26.900', '20100517 14:26:41.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (11, N'AEWT', N'RLGL', '20100102 00:42:15.510', '20100314 16:16:08.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (12, N'H23K', N'0R2K', '20100814 02:16:40.070', '20110207 03:31:11.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (13, N'NCA', N'0B1T', '20100522 15:56:03.540', '20100914 09:40:13.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (14, N'H25', N'IVS', '20090123 01:44:18.230', '20090707 05:34:33.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (15, N'ZJE0', N'DXY7', '20090301 19:50:29.800', '20091022 10:31:14.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (16, N'0VZO', N'A0QM', '20101021 23:09:13.230', '20110329 11:59:53.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (17, N'VGL8', N'PKIK', '20090331 23:50:06.300', '20090911 03:14:30.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (18, N'ZWAZ', N'8K2B', '20100916 13:07:01.960', '20110206 03:35:49.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (19, N'OLKY', N'QMGC', '20100707 20:49:54.570', '20110228 12:09:48.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (20, N'BGS0', N'32N7', '20091214 03:42:28.360', '20100830 04:16:10.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (21, N'TYW6', N'2TBW', '20090607 02:43:46.490', '20090919 15:08:17.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (22, N'V3OC', N'C6E6', '20100302 18:44:47.680', '20101106 14:24:59.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (23, N'ZSC4', N'BR7C', '20091230 17:03:19.600', '20100719 02:05:44.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (24, N'0XJZ', N'QMGC', '20090228 19:16:37.140', '20090707 19:20:24.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (25, N'PLQX', N'W78D', '20101226 14:18:31.820', '20110123 04:27:21.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (26, N'JHCL', N'TBR2', '20091129 07:15:25.970', '20091229 00:10:26.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (27, N'XK5R', N'NYLM', '20100110 04:56:01.950', '20100502 03:05:58.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (28, N'P2LN', N'XF1Z', '20100203 08:35:13.380', '20100325 04:09:45.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (29, N'K5SI', N'3IAR', '20091001 16:57:02.060', '20100415 04:57:22.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (30, N'2ZZV', N'P87Y', '20091229 10:48:49.970', '20100330 05:09:43.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (31, N'6S4A', N'XEB4', '20090803 19:19:58.270', '20100218 22:56:56.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (32, N'GH97', N'ZBKF', '20090627 13:06:34.960', '20091126 15:10:55.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (33, N'ANG1', N'3JRV', '20100103 02:00:06.170', '20101001 18:48:34.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (34, N'ZPOJ', N'19R5', '20090216 11:28:07.840', '20090315 03:01:05.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (35, N'NR60', N'CC6X', '20100519 04:19:21.290', '20100531 00:05:20.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (36, N'RY0H', N'UVE8', '20101013 23:32:12.330', '20110721 21:00:35.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (37, N'0CS', N'P44D', '20100111 18:10:36.950', '20100424 21:28:34.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (38, N'DZLE', N'R0JW', '20091107 04:33:53.310', '20091209 06:57:48.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (39, N'CONZ', N'P3OJ', '20100917 16:16:47.680', '20100926 02:57:23.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (40, N'Y8UU', N'38C7', '20100427 18:29:00.850', '20100705 08:53:22.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (41, N'IPR1', N'1CU7', '20100813 04:33:55.800', '20110201 23:08:21.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (42, N'Q569', N'9OFQ', '20100205 13:04:21.590', '20101011 17:24:05.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (43, N'4EVD', N'9FNG', '20100902 00:07:13.250', '20110102 06:26:28.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (44, N'080J', N'IES1', '20100323 20:03:33.210', '20101027 16:02:00.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (45, N'WU0C', N'YP3N', '20091223 08:08:51.820', '20091228 03:38:57.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (46, N'T9GV', N'KL6E', '20091115 08:14:52.090', '20100218 12:59:25.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (47, N'CHIE', N'0GR9', '20090918 20:29:40.910', '20100416 06:25:25.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (48, N'GREK', N'I5GG', '20100103 13:35:47.180', '20100608 12:40:39.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (49, N'5BYR', N'CC8N', '20091117 16:35:53.930', '20100427 23:19:03.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (50, N'7DBD', N'I1PR', '20100327 09:25:43.070', '20101107 09:22:22.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (51, N'F6G0', N'NGDT', '20100708 00:39:52.910', '20110327 11:09:30.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (52, N'Q9NT', N'MMZU', '20090221 15:12:36.370', '20090728 02:12:59.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (53, N'MLQ9', N'2NXK', '20100807 06:35:59.300', '20110112 07:59:41.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (54, N'HPW3', N'W78D', '20090314 06:42:25.930', '20090613 03:24:45.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (55, N'6WPC', N'LT05', '20100803 23:51:36.160', '20110529 17:51:04.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (56, N'VSR4', N'FM3E', '20100602 04:39:56.030', '20110325 03:47:48.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (57, N'UBBN', N'2OAT', '20090525 19:49:31.610', '20090830 17:59:04.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (58, N'QSGS', N'FR1M', '20100726 18:31:46.680', '20100904 23:05:04.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (59, N'VEIR', N'32N7', '20090530 02:28:18.870', '20090903 02:14:32.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (60, N'OMDR', N'AFDW', '20090318 07:04:56.490', '20091217 04:23:38.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (61, N'MWYT', N'NYLM', '20100502 10:27:45.250', '20101122 20:31:29.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (62, N'7AMU', N'VJM2', '20100529 00:51:44.780', '20101104 16:42:54.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (63, N'WDDB', N'CGMY', '20100221 19:48:15.960', '20101018 23:59:26.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (64, N'WDIK', N'JZ0Z', '20100913 18:02:19.580', '20101103 17:05:25.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (65, N'36FB', N'2XSC', '20090304 04:24:28.620', '20090329 15:29:45.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (66, N'UMTW', N'SDSY', '20090708 11:35:40.550', '20100213 01:05:13.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (67, N'614W', N'XG2M', '20090812 00:16:33.900', '20100305 08:42:38.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (68, N'NRH7', N'YUY', '20100406 04:27:55.690', '20100703 06:39:08.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (69, N'UDDS', N'5XT7', '20090905 21:24:56.940', '20100206 05:29:13.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (70, N'7B2E', N'JYP3', '20090518 20:18:17.480', '20100127 13:30:40.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (71, N'ZZTW', N'LPKF', '20091011 04:58:36.280', '20091205 14:31:20.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (72, N'HGES', N'YLQI', '20100524 19:16:12.990', '20101002 20:16:42.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (73, N'NX1T', N'KF4H', '20101229 20:50:14.290', '20110513 00:38:27.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (74, N'QB81', N'NCDH', '20090313 02:20:53.720', '20090827 03:16:26.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (75, N'TP7E', N'1PHE', '20100502 23:08:32.570', '20100728 05:07:50.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (76, N'3KIP', N'T9CQ', '20100501 13:39:24.900', '20101004 21:44:13.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (77, N'QKNU', N'2OUE', '20100630 18:37:34.430', '20101104 07:58:32.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (78, N'1Q6R', N'U19C', '20101008 20:59:46.390', '20110718 10:03:45.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (79, N'4NNF', N'RSH7', '20100308 11:07:45.330', '20100710 15:41:27.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (80, N'WO9Y', N'C7O', '20100211 06:03:39.720', '20101001 15:27:56.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (81, N'6TCI', N'SN65', '20090313 10:45:45.060', '20090711 17:45:01.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (82, N'HAE', N'5QE5', '20090107 15:20:14.760', '20090920 14:25:19.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (83, N'K1B0', N'LF82', '20090319 15:59:19.440', '20090924 04:50:42.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (84, N'C01Y', N'MEAF', '20100707 07:31:18.990', '20110403 19:35:01.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (85, N'OECD', N'1PI4', '20100623 10:08:57.060', '20101029 18:00:14.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (86, N'H245', N'AYHB', '20090613 04:07:21.890', '20090725 20:43:57.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (87, N'UJ0A', N'WSFW', '20091120 06:30:35.670', '20100910 07:11:15.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (88, N'2KMJ', N'76SX', '20091022 19:17:40.230', '20100421 15:23:50.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (89, N'T8W4', N'G38T', '20090715 11:36:31.690', '20090812 09:10:01.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (90, N'S29J', N'WVFV', '20101216 23:39:25.260', '20110101 20:17:33.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (91, N'XPNY', N'RXEO', '20100522 03:42:40.710', '20101122 03:01:31.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (92, N'AGVC', N'8W7S', '20100617 23:38:50.280', '20100819 22:23:30.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (93, N'JCXT', N'NZQY', '20090611 02:05:34.440', '20100202 04:43:17.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (94, N'O8ZB', N'E9Y5', '20100703 09:11:51.190', '20100806 22:33:45.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (95, N'CB2G', N'FZ6X', '20101226 08:01:15.600', '20110608 12:21:54.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (96, N'A9WP', N'5QE5', '20090318 03:42:11.010', '20090331 06:25:27.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (97, N'U3XU', N'XEB4', '20101214 17:16:05.630', '20101223 17:24:39.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (98, N'7GC0', N'QMBS', '20101219 06:04:53.670', '20110228 13:21:03.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (99, N'6R7L', N'F4M5', '20100120 15:39:04.580', '20100801 00:32:15.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (100, N'2GD', N'6DVJ', '20090617 20:33:11.260', '20090911 02:33:45.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (101, N'24Q0', N'MTKM', '20090406 07:58:18.190', '20091013 04:16:48.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (102, N'PD8B', N'1PHE', '20100614 16:01:45.220', '20101013 23:46:18.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (103, N'NA2S', N'BF45', '20090430 16:10:50.230', '20090503 07:11:26.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (104, N'XCTM', N'T8P5', '20090702 20:17:36.450', '20100126 09:48:24.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (105, N'1KHT', N'VYUT', '20090617 04:27:06.790', '20091203 18:51:03.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (106, N'XD26', N'P2GH', '20090214 05:23:39.910', '20090625 14:52:48.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (107, N'2FN', N'2J5T', '20090222 18:22:22.090', '20090317 01:34:33.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (108, N'WJ4B', N'FSC1', '20100528 04:15:05.570', '20110315 04:43:16.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (109, N'OM2B', N'UR2X', '20091111 07:33:53.360', '20091115 22:16:55.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (110, N'3ELK', N'SCDW', '20090405 10:12:11.250', '20090825 20:06:52.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (111, N'5DO6', N'CU5U', '20101202 10:02:21.600', '20110520 19:49:16.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (112, N'3T5Q', N'8P8O', '20090816 22:49:45.220', '20091209 07:55:20.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (113, N'MF8Y', N'O9IB', '20090521 07:24:01.350', '20091223 07:23:38.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (114, N'Y2HF', N'R441', '20100417 20:24:39.160', '20100928 10:46:36.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (115, N'HTZC', N'IEUA', '20090105 20:19:11.430', '20090608 10:38:38.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (116, N'5CHJ', N'I5GG', '20100425 19:07:30.480', '20101230 06:06:11.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (117, N'0ISE', N'A7QG', '20100312 08:52:25.330', '20101208 11:52:13.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (118, N'L72L', N'QMR9', '20100817 12:16:56.980', '20110513 04:24:26.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (119, N'7LJU', N'I17C', '20090324 07:53:22.510', '20091101 23:05:12.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (120, N'ML03', N'S5YU', '20100921 00:17:06.730', '20110630 18:45:49.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (121, N'04T2', N'VL5Z', '20100818 05:05:04.880', '20110331 17:53:59.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (122, N'D8RF', N'Q9A', '20101020 04:58:53.670', '20101113 17:18:48.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (123, N'V4KJ', N'JO6K', '20090922 16:51:23.990', '20091121 21:29:07.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (124, N'27I6', N'9D9U', '20090919 21:45:31.690', '20100204 09:11:41.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (125, N'A1W3', N'RBH0', '20091227 16:35:36.770', '20100307 10:29:09.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (126, N'PR0E', N'C7O', '20100425 05:19:46', '20110211 16:07:50.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (127, N'YBOD', N'ASMM', '20091214 17:10:38.550', '20100627 15:33:26.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (128, N'0Y2H', N'5I9W', '20090629 11:38:23.090', '20091007 02:04:42.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (129, N'E4EU', N'6Z8W', '20090317 18:19:38.120', '20090320 14:54:33.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (130, N'3EDY', N'VRT2', '20100215 19:26:21.560', '20100429 22:42:23.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (131, N'A0V1', N'VS3Z', '20100517 20:23:19.270', '20101012 04:19:34.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (132, N'IPVC', N'CGF6', '20100712 12:32:40.770', '20100905 18:37:29.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (133, N'JO1O', N'F61J', '20090919 05:20:41.800', '20091218 09:31:30.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (134, N'20OC', N'LSEB', '20090921 14:34:34.060', '20091030 13:07:43', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (135, N'4SWD', N'PWA', '20091107 22:05:21.520', '20091220 11:11:08.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (136, N'I94P', N'R20', '20090928 18:43:59.840', '20100724 17:58:44.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (137, N'V1TZ', N'UM8S', '20100908 23:09:24.540', '20110520 07:13:53.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (138, N'MHJI', N'RX41', '20100916 19:41:43', '20110624 19:02:19.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (139, N'3Q99', N'Q8UP', '20100121 03:04:12.190', '20100502 00:43:58.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (140, N'R59A', N'DCTI', '20100510 04:45:17.150', '20110303 03:07:26.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (141, N'ERB2', N'8JW7', '20090421 09:44:59.800', '20090511 19:09:24.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (142, N'XJCV', N'HEM7', '20100625 02:15:30.110', '20100628 02:27:59.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (143, N'4SWD', N'D35', '20101211 11:43:46.870', '20110605 17:06:55.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (144, N'0NF5', N'O4LC', '20090412 01:24:20.430', '20091014 13:03:10.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (145, N'MJ1U', N'KI4X', '20090115 13:37:03.650', '20090611 00:28:17.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (146, N'UF74', N'JWH3', '20091006 04:52:55.480', '20091214 19:06:12.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (147, N'OWEC', N'LIMP', '20100128 16:14:48.930', '20100624 14:59:52.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (148, N'4AQR', N'WS72', '20100223 05:40:55.290', '20100506 17:56:41.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (149, N'67BI', N'VTLY', '20100628 12:52:39.760', '20101226 11:55:08.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (150, N'6Q84', N'YCDM', '20090902 12:53:45.120', '20100406 06:15:43.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (151, N'431J', N'VIKA', '20100105 18:49:45.680', '20100216 18:33:15.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (152, N'8P26', N'6WB4', '20090430 04:59:08.650', '20090609 13:00:13.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (153, N'ZXER', N'8SBJ', '20100927 22:11:31.160', '20110223 14:15:52.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (154, N'L6W5', N'N1HZ', '20100501 15:21:57.850', '20101127 05:46:27.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (155, N'2A86', N'AIPO', '20091030 15:28:06.390', '20100408 08:39:46.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (156, N'9BS3', N'WV0D', '20090617 02:59:24.530', '20091129 10:58:01.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (157, N'URMC', N'JNM8', '20090922 23:10:21.220', '20091123 02:17:11.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (158, N'5K9O', N'1ZA4', '20100810 18:25:18.550', '20110122 21:59:46.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (159, N'NS05', N'1VDT', '20100706 03:41:59.680', '20101120 23:19:16.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (160, N'IX69', N'KI8Y', '20100221 23:07:20.790', '20100818 02:43:13.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (161, N'YX7D', N'DVK8', '20100302 12:13:01.360', '20101024 23:19:23.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (162, N'2MAG', N'WZNF', '20100826 06:43:59.010', '20110405 23:29:51.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (163, N'IW0K', N'8KPG', '20100313 09:55:27.440', '20101226 13:48:43.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (164, N'5KHA', N'YRR2', '20100925 12:07:31.810', '20110514 23:34:33.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (165, N'TW3N', N'WD3A', '20091118 13:48:51.980', '20100909 15:47:19.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (166, N'0YU1', N'0DMD', '20090523 21:29:40.830', '20090915 01:11:48.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (167, N'LC99', N'TXK5', '20101127 17:29:03.430', '20101221 22:23:50.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (168, N'KDEY', N'2KGH', '20100829 16:49:27.290', '20110222 18:15:56.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (169, N'OEK7', N'199X', '20090610 22:19:17.630', '20091009 23:35:29.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (170, N'ZV97', N'RA7M', '20100409 01:35:11.590', '20100910 16:39:54.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (171, N'AXS8', N'NGDT', '20100816 19:58:05.950', '20110607 22:52:19.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (172, N'2D6L', N'J53Y', '20100625 13:10:42.340', '20110411 16:49:55.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (173, N'GZ4M', N'0ED1', '20090728 09:12:44.790', '20100112 03:40:29.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (174, N'HL6I', N'474A', '20091114 03:08:05.370', '20100627 19:57:46.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (175, N'7ADX', N'KAQ4', '20100602 14:32:06.930', '20110219 23:36:25.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (176, N'2JY8', N'EY5J', '20090224 02:49:34.770', '20091004 15:26:00.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (177, N'7WID', N'D5JS', '20101108 17:15:06.800', '20110406 00:11:53.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (178, N'5FJ7', N'V9BL', '20090613 15:27:03.550', '20091205 08:25:58.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (179, N'G95F', N'PRQ4', '20090905 08:08:28.030', '20100623 08:43:25.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (180, N'GD1J', N'86RW', '20090324 11:42:41.280', '20090324 15:22:57.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (181, N'0JBB', N'R9OY', '20090328 13:04:57.070', '20090821 01:07:58.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (182, N'E5GP', N'EKYR', '20101021 11:29:43.270', '20110220 21:36:46.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (183, N'0JMR', N'9QXE', '20091231 22:45:43.330', '20100807 14:09:35.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (184, N'71V0', N'8SBJ', '20100715 05:25:53.010', '20101010 08:38:50.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (185, N'X0E6', N'0BNF', '20090211 00:36:35.870', '20090314 04:09:08.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (186, N'0THI', N'PAYT', '20100118 15:24:10.620', '20100505 15:19:21.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (187, N'ISSS', N'3IAR', '20101014 14:21:09.610', '20110509 04:21:37.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (188, N'YL1M', N'S6YW', '20100520 13:58:43.950', '20101117 03:45:04.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (189, N'ZT1X', N'AD2K', '20101121 23:06:27.680', '20110520 04:27:57.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (190, N'0DMU', N'SZO3', '20090524 19:05:56.980', '20091118 00:13:08.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (191, N'NX6R', N'80GS', '20090106 19:33:38.610', '20090901 15:41:33.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (192, N'9ZUU', N'SI0H', '20090130 04:44:05.980', '20090428 09:14:07.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (193, N'YQC7', N'QA5G', '20090314 15:59:43.310', '20090804 19:43:04.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (194, N'LQHG', N'5RT5', '20101129 03:56:51.400', '20110710 22:00:45.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (195, N'SGQX', N'ZIKQ', '20090310 16:32:15.780', '20090510 03:48:04.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (196, N'BZYM', N'BMDB', '20090826 03:01:00.800', '20091201 19:39:34.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (197, N'FK7H', N'8JW7', '20090414 16:20:02.670', '20090429 12:39:17.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (198, N'Z4AK', N'EDEU', '20090318 23:36:15.060', '20091118 17:32:23.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (199, N'W2DK', N'REMV', '20100524 11:35:28.460', '20101130 21:15:52.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (200, N'Z2Z2', N'K35S', '20100824 16:07:22.820', '20100925 23:16:30.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (201, N'8UGF', N'PKIK', '20091108 11:23:52.060', '20091223 20:42:23.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (202, N'4VSN', N'J53Y', '20100531 23:25:21.640', '20110225 20:43:57.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (203, N'WEAF', N'V9T6', '20090915 07:21:37.650', '20100524 18:21:13.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (204, N'6FWM', N'4Q2E', '20090322 11:17:28.170', '20090417 19:15:14.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (205, N'VWM7', N'B1YX', '20100116 16:55:39.180', '20100825 07:23:25.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (206, N'K3DJ', N'D2FT', '20100713 05:39:03.350', '20100903 01:43:21.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (207, N'SYQW', N'6GXZ', '20101002 19:46:23.860', '20110324 09:19:45.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (208, N'IWR', N'4KZP', '20091114 19:03:25.780', '20100625 18:18:07.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (209, N'D1D0', N'31ZJ', '20101129 00:49:50.930', '20110803 06:10:02.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (210, N'0KEQ', N'VUKK', '20090906 12:38:31.610', '20100501 17:13:47.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (211, N'0Y2H', N'KAQ4', '20090808 09:44:17.740', '20090825 10:46:09.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (212, N'PCIK', N'O2EQ', '20090412 07:43:17.660', '20091015 17:51:14.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (213, N'4KAK', N'CKLU', '20091206 10:16:50.510', '20100529 13:16:22.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (214, N'1WZK', N'TWBS', '20100414 15:59:18.390', '20100830 07:56:19.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (215, N'4Z9O', N'SWG0', '20091127 10:02:23.720', '20091229 01:35:15.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (216, N'LH62', N'ZBKF', '20100512 00:43:18.100', '20100903 01:42:38.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (217, N'951I', N'N7TU', '20090826 07:58:15.670', '20090830 09:20:16.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (218, N'BE5F', N'ZO1S', '20100829 04:29:34.430', '20110318 05:09:54.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (219, N'86TK', N'YGCO', '20100815 11:30:55.930', '20110303 19:25:25.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (220, N'SXLX', N'76SX', '20101030 22:24:41.370', '20110507 00:27:58.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (221, N'4W54', N'X1WJ', '20090809 07:08:31.220', '20100304 20:50:11.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (222, N'MHHP', N'1LV8', '20090711 03:30:19.470', '20091201 18:38:47.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (223, N'KOAO', N'S03X', '20101007 17:42:59.610', '20110801 13:48:00.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (224, N'NZID', N'8JW7', '20090118 03:13:20.640', '20090918 23:22:22.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (225, N'CNO5', N'JWH3', '20100403 06:01:32.970', '20101106 00:58:21.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (226, N'0L8P', N'V4P7', '20100718 15:13:59.960', '20110210 13:38:12.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (227, N'3IRA', N'SLYN', '20100413 21:10:59.020', '20100907 21:06:51.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (228, N'VRZ4', N'UM8S', '20090829 05:15:53.390', '20100430 05:39:44.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (229, N'Q0FH', N'4P4I', '20090906 10:35:49.590', '20100218 16:09:43.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (230, N'WAJ0', N'7VOT', '20091008 11:31:06.130', '20100322 03:56:52.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (231, N'NUW3', N'61JI', '20101111 10:29:32.110', '20110607 02:46:44.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (232, N'6ZZC', N'YTGE', '20100823 17:38:51.740', '20110315 06:39:31.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (233, N'9D73', N'3SXW', '20100120 03:51:35.100', '20101031 11:10:07.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (234, N'H3BB', N'5XT7', '20100111 16:01:05.220', '20100927 09:26:55.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (235, N'6YB0', N'JK5', '20100516 00:18:49.230', '20110125 18:40:35.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (236, N'W2Y3', N'8KPG', '20091027 13:39:35.440', '20100421 04:24:02.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (237, N'HV2U', N'JW1L', '20100206 04:08:05.610', '20100727 03:15:33.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (238, N'NJ5P', N'4W30', '20091012 11:28:15.160', '20100422 18:54:22.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (239, N'BRO2', N'XR4R', '20090629 12:30:13.820', '20091213 01:15:26.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (240, N'DK2H', N'NQA9', '20090731 18:57:32.530', '20100507 02:25:47.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (241, N'8A1N', N'IWTZ', '20100417 19:37:46.760', '20101208 05:59:36.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (242, N'0HWY', N'YY6V', '20091130 19:17:43.830', '20100910 10:03:31.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (243, N'MG4P', N'PBPN', '20100621 13:08:53.030', '20110209 21:35:02.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (244, N'00BJ', N'ES3N', '20100318 10:27:56.070', '20101115 11:14:11.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (245, N'ZJTT', N'95Q1', '20101016 09:21:39.250', '20110325 13:27:00.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (246, N'YL1B', N'KZII', '20100926 11:50:20.960', '20101116 21:50:20.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (247, N'5LFG', N'FSC1', '20100223 18:27:15.480', '20100925 19:57:46.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (248, N'6WPC', N'W78D', '20091130 00:00:24.920', '20091205 11:46:45.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (249, N'3DWE', N'DCSP', '20100102 17:54:27.680', '20100713 20:25:30.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (250, N'6U4U', N'07C8', '20091029 15:48:57.680', '20100703 02:05:27.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (251, N'4MBY', N'P44D', '20101230 19:02:45.130', '20110403 10:19:18.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (252, N'3XSD', N'8P8O', '20090816 11:50:28.240', '20091208 07:29:24.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (253, N'QP9S', N'FZJ4', '20090803 12:05:19.130', '20090916 22:06:58.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (254, N'3NWE', N'KKGV', '20100724 13:10:47.090', '20100726 20:47:54.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (255, N'UQ0L', N'MT21', '20100116 08:58:51.590', '20100521 02:26:19.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (256, N'5WQ2', N'O2Z7', '20090501 07:53:32.580', '20091119 02:03:37.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (257, N'L974', N'QY16', '20100824 05:42:22.040', '20110523 06:55:58.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (258, N'86FP', N'N1HZ', '20090829 04:08:17', '20090905 18:58:51.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (259, N'ULFC', N'M4DI', '20091219 05:15:55.200', '20100407 18:16:53.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (260, N'VEOA', N'GHK9', '20100701 01:41:39.230', '20100714 17:45:13.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (261, N'GA78', N'KXXU', '20090401 08:28:04.320', '20091023 04:36:30.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (262, N'1CGC', N'C00K', '20100204 14:30:30.460', '20100921 03:40:02.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (263, N'TJ88', N'ZVWK', '20090311 08:27:36.190', '20090508 02:08:24.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (264, N'GX97', N'V9T6', '20100221 13:18:44.800', '20100515 02:13:11.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (265, N'CJDS', N'Q8SY', '20091026 02:08:59.500', '20091124 14:27:03.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (266, N'STOB', N'LAW0', '20091215 16:05:26', '20100408 04:06:38.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (267, N'FPG8', N'KGTW', '20100323 03:51:42.560', '20101011 06:41:08.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (268, N'NSP3', N'6KM7', '20101124 18:15:45.300', '20110628 03:49:27.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (269, N'2JR9', N'ASMM', '20101129 15:40:29.170', '20110531 13:15:44.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (270, N'MEP3', N'KVMA', '20090131 20:22:48.270', '20090706 21:11:14.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (271, N'3B61', N'GC7B', '20090405 20:35:12.480', '20091204 22:27:05.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (272, N'MURY', N'IEIF', '20101113 20:30:00.510', '20110305 14:25:55.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (273, N'ZRY6', N'1VDT', '20100302 15:59:20.610', '20100406 03:54:28.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (274, N'VQJ6', N'ASMM', '20100115 16:33:23.400', '20100824 16:59:38.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (275, N'K0PW', N'PAQS', '20090716 02:46:54.600', '20100326 18:28:22.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (276, N'50K8', N'Y0RQ', '20100908 11:50:47.400', '20110420 10:46:40.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (277, N'87BH', N'CN1Z', '20100119 14:21:26.450', '20100817 21:03:45.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (278, N'KMDO', N'DJ46', '20090723 07:15:03.540', '20090917 02:33:50.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (279, N'5Y8F', N'Z372', '20090403 17:51:41.400', '20090626 09:55:23.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (280, N'DYOF', N'YSZ', '20100707 18:11:12.020', '20101220 03:08:02.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (281, N'VJ6N', N'F91K', '20090525 20:46:44.480', '20100314 17:40:27.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (282, N'323R', N'WD3A', '20090515 21:10:34.090', '20091004 09:20:07.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (283, N'T0CB', N'HSYO', '20100826 11:21:25.720', '20101017 09:14:14.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (284, N'JA23', N'4FUZ', '20101107 18:46:51.910', '20110614 14:04:16.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (285, N'UEYL', N'JZ0Z', '20091008 16:28:21', '20091218 17:37:34.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (286, N'K1YH', N'XG2M', '20100328 22:39:03.870', '20100630 19:17:21.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (287, N'4RF8', N'JPBV', '20100121 05:33:32.610', '20100629 08:32:33.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (288, N'5TKK', N'KI4X', '20100628 14:40:48.020', '20110406 14:22:13.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (289, N'NENM', N'K35S', '20101226 07:02:13.630', '20110509 07:00:36.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (290, N'KDO4', N'V7O5', '20100115 16:25:16.640', '20100309 16:36:59.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (291, N'0JBB', N'IB2M', '20100305 07:57:13.400', '20100924 21:28:05.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (292, N'8OD1', N'WCVM', '20090610 23:59:48.600', '20091121 08:16:43', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (293, N'THOQ', N'K206', '20101024 06:12:19.970', '20110115 00:37:30.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (294, N'9BS3', N'I17P', '20091229 10:48:34.600', '20100531 07:30:13.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (295, N'X7O1', N'2V01', '20090502 10:29:28.200', '20090715 21:49:18.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (296, N'1D10', N'6FHL', '20090314 05:07:16.300', '20090320 02:19:35.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (297, N'6V64', N'YZPZ', '20090922 10:50:07.630', '20100506 07:55:07.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (298, N'6ELD', N'TWBS', '20090430 23:50:08.220', '20090928 19:21:51.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (299, N'O70R', N'P311', '20090524 08:18:56.560', '20091222 20:47:08.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (300, N'73AT', N'P0NF', '20091101 17:16:13.250', '20091218 09:20:22.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (301, N'JTC8', N'0GND', '20090707 07:58:38.390', '20091203 15:09:13.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (302, N'6R7L', N'8W7S', '20100401 00:11:30.190', '20110124 16:08:19.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (303, N'SHVC', N'LOUM', '20091231 08:19:55.760', '20100502 22:31:02.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (304, N'HJXI', N'SWG0', '20091202 21:31:39.400', '20100107 23:14:17.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (305, N'8SXC', N'KL6E', '20090726 19:13:45.190', '20090730 03:38:23.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (306, N'G09J', N'6SD1', '20090216 22:32:44.610', '20091125 19:53:23.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (307, N'4F5J', N'6TT2', '20100615 19:51:07.630', '20100903 03:34:56.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (308, N'92NL', N'4UXA', '20100718 19:31:55.730', '20101119 05:07:20.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (309, N'KSM8', N'V79', '20100109 10:23:52.490', '20100227 02:19:33.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (310, N'PORE', N'P3OJ', '20100509 21:08:04.200', '20101126 15:39:40.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (311, N'NOG7', N'B0EN', '20100411 17:32:06.140', '20110128 04:59:52.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (312, N'0CS', N'DE1H', '20100201 22:27:18.500', '20100906 04:22:09.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (313, N'5CBO', N'O2Z7', '20090528 10:16:35.600', '20100107 09:03:29.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (314, N'1DGD', N'N5U0', '20100613 11:04:43.190', '20110212 15:08:52.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (315, N'6SB', N'0XDW', '20100206 04:54:54.750', '20100227 00:04:47.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (316, N'4LI3', N'OF2U', '20101116 11:17:30.240', '20110118 19:16:24.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (317, N'4JLR', N'UYVQ', '20100611 03:09:04.750', '20101204 18:25:48.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (318, N'A275', N'VHQW', '20090503 13:40:44.290', '20090919 12:04:09.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (319, N'3O89', N'C00K', '20090516 20:50:23.800', '20090528 08:35:37.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (320, N'THNK', N'SL4Q', '20100730 03:29:55.640', '20110322 19:09:43.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (321, N'7Y67', N'1U41', '20101124 10:31:53.400', '20110805 19:34:05.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (322, N'5KHA', N'ZXWH', '20100924 13:10:54.550', '20110502 16:18:55.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (323, N'0ALP', N'NGDT', '20101129 11:13:31.670', '20110218 20:48:51.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (324, N'G94P', N'FZ6X', '20091114 23:15:12.530', '20100324 20:38:45.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (325, N'3DWE', N'2FK4', '20091128 12:25:34.880', '20100807 23:43:10', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (326, N'8T9O', N'KI52', '20101025 20:35:23.890', '20110113 14:10:23.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (327, N'U8OI', N'YLQI', '20090121 14:17:40.540', '20090219 13:48:26.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (328, N'JNUW', N'KZME', '20090305 05:10:46', '20090902 20:24:16.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (329, N'Y2FS', N'7VOT', '20090916 06:03:55.190', '20100209 19:10:21.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (330, N'6OVY', N'IXLP', '20090504 21:39:38.290', '20100107 16:08:47.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (331, N'XVWM', N'YVHP', '20091218 01:00:39.760', '20101012 02:51:33.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (332, N'V6OM', N'JO1H', '20090921 14:31:18.230', '20091120 01:41:54.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (333, N'2A86', N'P3Z6', '20090301 22:56:06.970', '20090723 05:46:42.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (334, N'H0LA', N'AD2K', '20100602 00:35:28.150', '20100709 00:35:01.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (335, N'UYQX', N'Y7HD', '20100101 10:12:33.620', '20100117 11:58:49.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (336, N'D5P8', N'5XT7', '20100223 20:35:14.290', '20101215 01:32:08.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (337, N'KCKP', N'B14G', '20100515 12:50:38.340', '20100603 10:49:05.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (338, N'B4Q0', N'OXND', '20090924 13:49:46.320', '20091010 09:59:57.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (339, N'FJ0F', N'L1VQ', '20100414 23:33:06.710', '20101116 10:25:54.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (340, N'E7TP', N'CFFP', '20090822 17:55:36.380', '20091119 21:44:12.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (341, N'FKWJ', N'QRRC', '20101013 02:47:56.240', '20101027 15:42:25.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (342, N'O7UF', N'EADQ', '20100705 10:01:36.880', '20100810 03:25:14.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (343, N'M8Q1', N'P69G', '20090620 04:16:55.520', '20100208 12:02:41', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (344, N'XHV', N'UYVQ', '20090819 09:54:09.430', '20100409 15:20:57.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (345, N'WZD9', N'KQY1', '20101005 22:53:10.510', '20101206 11:37:07.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (346, N'ARMI', N'4KZP', '20090201 09:29:54.900', '20091115 17:05:57.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (347, N'OQID', N'8MBW', '20090114 13:43:13', '20090910 23:13:14.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (348, N'CO1O', N'WH1E', '20090513 19:07:36.770', '20090929 09:28:38.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (349, N'CCUI', N'GHZ6', '20101122 05:53:39.860', '20110403 07:25:27.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (350, N'BRO2', N'F6SF', '20090615 23:11:57.970', '20090627 02:32:54.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (351, N'68UK', N'BI5D', '20091003 01:58:11.560', '20100209 07:53:47.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (352, N'WX7V', N'3IAR', '20090522 21:09:23.340', '20090817 19:50:59.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (353, N'A275', N'I95C', '20101215 02:59:44.430', '20110503 10:46:15.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (354, N'0DMU', N'VUMU', '20091025 04:49:00.920', '20100729 01:37:25.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (355, N'Y08Y', N'MTKM', '20091208 06:44:19.850', '20100310 13:46:17.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (356, N'9MCW', N'0GR9', '20091012 18:47:43.850', '20100529 22:50:18.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (357, N'79E9', N'MBR4', '20100502 12:57:58.520', '20101205 19:19:29.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (358, N'C6XT', N'5ABG', '20090216 09:04:43.220', '20091206 01:52:17.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (359, N'6SB', N'QNHO', '20090105 09:06:04.520', '20090329 23:31:08.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (360, N'7ADX', N'03P0', '20090930 22:38:21.310', '20100512 13:28:00.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (361, N'59LG', N'8CEI', '20090127 08:15:04.070', '20091007 06:04:58.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (362, N'LRY6', N'MPTO', '20100413 14:40:21.630', '20101028 07:10:41.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (363, N'WUH0', N'X52E', '20091102 13:28:00.540', '20100806 09:56:59.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (364, N'4KAK', N'CHW9', '20090907 12:44:14.190', '20091217 10:10:46.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (365, N'RUEW', N'Q6JL', '20090523 20:07:24.430', '20091212 12:48:07.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (366, N'T2XR', N'S6EE', '20090722 03:00:47.900', '20100311 03:17:59.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (367, N'B67', N'P1M', '20091203 23:31:11.520', '20100214 22:35:27.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (368, N'3O89', N'D5JS', '20091226 09:41:07.460', '20100701 08:28:29.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (369, N'50K8', N'P3Z6', '20090613 00:52:09.560', '20100127 03:10:03.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (370, N'82ZH', N'V79', '20101213 08:19:40.460', '20110108 22:32:40.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (371, N'L8HQ', N'D35', '20090704 22:26:51.890', '20090818 08:27:19.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (372, N'6O62', N'6DVJ', '20090917 13:19:18.420', '20100225 08:25:52.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (373, N'VHEI', N'ASMM', '20100118 14:07:37.580', '20100830 01:38:15.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (374, N'852S', N'ZO1S', '20100924 02:54:47.430', '20110504 10:51:26.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (375, N'DTR1', N'1Y7W', '20101017 00:41:59.410', '20110526 03:27:19.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (376, N'LXG7', N'O5AK', '20090523 00:30:16.510', '20091227 16:08:52.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (377, N'3ELK', N'B1YX', '20100407 08:53:59.020', '20110119 04:16:15.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (378, N'2VAO', N'SINJ', '20100413 01:19:22.240', '20100908 05:27:55.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (379, N'JS3', N'VP80', '20100209 00:22:02.020', '20100418 09:01:38.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (380, N'86FP', N'XZ4O', '20091028 02:55:39.970', '20100720 06:37:13.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (381, N'5PO3', N'BCJL', '20101012 06:52:10.890', '20110301 14:57:10.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (382, N'HG3O', N'1Y7W', '20100909 19:10:03.780', '20110319 04:19:48.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (383, N'5KE1', N'40GG', '20090412 23:17:06.150', '20090601 12:58:50.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (384, N'5JPH', N'SWG0', '20090403 06:51:57.220', '20090816 16:37:28.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (385, N'ZLYU', N'6T1V', '20100801 19:41:26.740', '20101128 08:15:01.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (386, N'11NX', N'VE3P', '20090729 03:51:16.420', '20100225 07:00:35.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (387, N'3FVA', N'0XID', '20091007 11:31:33.810', '20100515 14:55:40.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (388, N'0YU1', N'SMP5', '20100507 18:07:06.060', '20101021 04:09:18.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (389, N'J3CY', N'OF2U', '20090625 17:51:08.290', '20100225 10:48:45.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (390, N'LBOY', N'XHW8', '20090322 15:24:49.770', '20090617 13:08:31.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (391, N'B68F', N'KQ3G', '20101024 07:37:15.780', '20110109 06:12:40.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (392, N'7JDD', N'5CBY', '20100330 03:45:55.110', '20100425 08:56:48.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (393, N'49Q7', N'Y56U', '20090920 04:43:41.790', '20100510 10:28:50.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (394, N'8BES', N'KXXU', '20090716 00:54:45.400', '20100503 20:57:54.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (395, N'SISQ', N'40GG', '20090727 09:40:32.310', '20091210 15:39:14.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (396, N'UHUR', N'3XMP', '20090702 12:07:34.610', '20091027 08:31:45.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (397, N'RMWR', N'HIEO', '20090902 20:33:36.340', '20091031 17:28:15.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (398, N'861J', N'CB7S', '20101012 15:32:41.340', '20110222 01:51:55.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (399, N'693G', N'4VQ5', '20090329 13:46:45', '20090429 02:32:50.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (400, N'4MBY', N'S0Y4', '20100317 19:52:22.600', '20100725 08:19:09.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (401, N'6G5K', N'GAJ6', '20100228 09:58:43.390', '20100930 18:30:30.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (402, N'LFO5', N'VKG2', '20100119 04:02:05.540', '20100312 14:44:45.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (403, N'2M5W', N'7OE6', '20101130 18:15:27.210', '20110629 06:18:36.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (404, N'A2S7', N'LOUM', '20101209 21:33:59.410', '20110325 08:52:47.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (405, N'7R4K', N'1YKM', '20101212 00:45:06.080', '20110904 18:05:35.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (406, N'EP3N', N'554Z', '20090116 12:38:53.130', '20091011 23:27:56.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (407, N'1CGC', N'SMP5', '20100504 07:01:45.760', '20101014 18:12:45.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (408, N'4WES', N'IEUA', '20090324 00:04:57', '20091026 23:54:49.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (409, N'HM83', N'UB44', '20100108 04:07:01.520', '20100304 22:10:07.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (410, N'CD4T', N'YUG1', '20090719 06:14:03.330', '20100108 21:37:26.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (411, N'ME1K', N'PR9R', '20100707 09:53:44.830', '20110306 18:34:03.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (412, N'FCP7', N'TRZU', '20090120 11:38:36.280', '20090330 13:51:34.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (413, N'1CWJ', N'9OFQ', '20100107 08:42:41.200', '20100819 16:50:39.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (414, N'AN9P', N'SLYN', '20100310 06:10:24.550', '20100706 16:53:55.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (415, N'DIRR', N'P69G', '20091219 15:46:10.430', '20100312 22:30:51.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (416, N'4WES', N'61JI', '20090519 13:05:00.290', '20090721 01:45:10.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (417, N'JH58', N'ITDT', '20100101 15:23:15.480', '20100529 18:11:52.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (418, N'RTRP', N'40AG', '20090802 06:36:03.310', '20091221 17:19:32.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (419, N'DRUO', N'5FLX', '20100205 17:02:47.450', '20101115 01:55:46.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (420, N'QBIQ', N'UR2X', '20101025 16:16:08.010', '20110813 05:47:33.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (421, N'GLD5', N'R3UK', '20101014 15:29:14.100', '20101026 12:22:19.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (422, N'3486', N'VSHL', '20100729 05:24:05.470', '20110220 18:26:10.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (423, N'LP1V', N'PCJN', '20090703 15:49:59.160', '20100302 21:39:45.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (424, N'15JZ', N'RAMP', '20090324 09:27:19.790', '20090812 14:01:32.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (425, N'SP4X', N'AYHB', '20090220 00:42:24.670', '20091027 16:20:00.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (426, N'CVOE', N'75YM', '20100406 18:40:56.780', '20100424 23:30:31.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (427, N'598H', N'8F2W', '20101228 08:35:36.630', '20110813 21:57:02.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (428, N'PYJK', N'QY16', '20090706 13:12:52.180', '20100223 04:40:21.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (429, N'GZ12', N'VJM2', '20100228 17:14:15.110', '20100525 19:12:13.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (430, N'73AT', N'Y5Z2', '20100417 12:34:24.790', '20100730 18:55:34.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (431, N'92JG', N'6QH9', '20100919 03:56:40.180', '20110225 22:40:37.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (432, N'FLTW', N'YUY', '20100625 17:21:17.690', '20101127 02:24:21.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (433, N'2UD9', N'NO1Z', '20100115 11:32:37.230', '20100513 02:55:05.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (434, N'F55', N'3JZZ', '20101124 04:29:39.430', '20110721 00:42:29.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (435, N'TX8G', N'I95C', '20100829 16:56:56.590', '20101019 12:06:43.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (436, N'7A2Q', N'FUNM', '20090924 02:50:05.340', '20091221 00:12:25.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (437, N'RJD2', N'UHOT', '20101010 00:54:36.570', '20110716 22:01:13.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (438, N'8203', N'JNM8', '20090504 01:43:06.750', '20100103 04:06:03.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (439, N'X9QV', N'QZER', '20090422 06:06:51.140', '20091007 22:31:53.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (440, N'LM7K', N'1GOX', '20100717 07:02:33.610', '20101214 08:47:05.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (441, N'75DZ', N'2OUE', '20100326 20:49:30.660', '20100513 12:47:50.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (442, N'1RUX', N'JWH3', '20090717 11:26:36.810', '20090720 15:00:52.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (443, N'K9JD', N'YLQI', '20090430 14:00:04.530', '20090819 05:59:12.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (444, N'5QUJ', N'PCU1', '20101207 11:37:04.960', '20110216 13:11:20.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (445, N'YNYC', N'80GS', '20090915 05:31:04.950', '20100206 18:34:29.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (446, N'G3MK', N'QPJ0', '20101004 19:58:39.500', '20101012 16:21:06.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (447, N'FSTI', N'VS1M', '20090323 19:03:13.900', '20090703 16:06:10.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (448, N'G09J', N'5ABG', '20100712 22:33:17.250', '20101103 17:34:55.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (449, N'1XAJ', N'VJM2', '20100727 09:08:34.970', '20110220 22:27:04.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (450, N'BE5F', N'Y4MI', '20090310 20:35:32.010', '20090523 13:54:04.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (451, N'B68F', N'M4DI', '20100630 20:44:19.140', '20110326 14:19:54.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (452, N'9HF6', N'D43U', '20090201 13:57:33.020', '20090907 00:08:44.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (453, N'VHOT', N'6KM7', '20090906 22:29:53.880', '20100203 23:56:10.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (454, N'GIVI', N'AB4S', '20090603 21:30:36.990', '20090712 20:45:18.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (455, N'OBAJ', N'0SWW', '20100603 04:23:08.500', '20100928 19:56:51.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (456, N'3FVA', N'KU01', '20100802 04:34:37.920', '20100810 00:04:21.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (457, N'ZSOQ', N'6GXZ', '20090719 12:12:06.380', '20091106 17:05:01.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (458, N'P9P1', N'GXQ', '20100909 08:48:07.420', '20101117 16:17:04.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (459, N'1Q6R', N'A4QV', '20101020 20:51:34.730', '20110325 16:32:47.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (460, N'72VU', N'V1FX', '20090907 06:04:09.290', '20100513 18:35:04.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (461, N'PN7V', N'X5XO', '20090119 04:03:16.500', '20090228 01:30:54.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (462, N'AIA5', N'1XJP', '20091029 17:48:53.580', '20100618 13:32:25.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (463, N'FWVC', N'MS4', '20100123 06:50:41.890', '20100603 04:42:37.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (464, N'XRMV', N'VTUT', '20100922 15:32:36.730', '20110601 03:14:33.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (465, N'J6OQ', N'S6YW', '20091030 02:17:23.160', '20091112 22:56:49.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (466, N'5DO6', N'QXOX', '20090112 16:32:27.130', '20090410 16:09:43.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (467, N'IT30', N'6AO9', '20100105 00:05:59.050', '20100913 10:56:29.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (468, N'E1C', N'5XT7', '20100213 04:13:01.780', '20101125 16:08:10.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (469, N'DRUO', N'AN02', '20100711 13:13:27.960', '20100917 04:47:12.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (470, N'JAWW', N'8W7S', '20090328 12:56:05.090', '20100117 22:18:27.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (471, N'E047', N'BR7C', '20090809 12:10:23.730', '20091031 03:43:58.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (472, N'AEP1', N'ZGEP', '20090831 13:40:08.720', '20100323 14:05:49.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (473, N'EMHB', N'DIZG', '20090413 00:29:12.170', '20100110 18:47:40.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (474, N'T4DD', N'41J8', '20100722 10:00:13.850', '20101201 17:08:41.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (475, N'QJF0', N'RUMC', '20090801 19:26:37.350', '20100402 16:59:44', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (476, N'F2YJ', N'7PZQ', '20100331 04:02:37.290', '20100408 21:21:28.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (477, N'JTKR', N'XG2M', '20100331 15:24:00.930', '20100705 12:26:59', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (478, N'FOCR', N'ZVWK', '20090727 04:12:54.200', '20100114 08:28:25.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (479, N'2KMJ', N'JWH3', '20100709 03:56:14.850', '20110501 19:27:04.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (480, N'CD2Z', N'L2IF', '20090518 04:43:45.170', '20100114 23:58:55.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (481, N'X3PM', N'BEJI', '20100114 23:37:42.880', '20100819 07:24:22.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (482, N'SJX1', N'2RQT', '20090618 10:02:19.380', '20091011 04:22:08.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (483, N'2KCL', N'V7O5', '20091210 04:04:17.210', '20100102 06:13:18.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (484, N'C6RG', N'XIPU', '20091221 20:38:43.100', '20100103 05:18:09.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (485, N'82UZ', N'CFFP', '20101017 15:50:05.660', '20110302 04:35:41.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (486, N'2EFN', N'TRZU', '20100818 13:59:07.160', '20110417 22:31:54.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (487, N'9ZIP', N'SI0H', '20091019 18:51:23.810', '20091024 02:28:11.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (488, N'6G5K', N'CU5U', '20090814 14:02:00.240', '20091101 06:09:48.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (489, N'51N2', N'2NXK', '20090624 00:06:30.930', '20091023 04:45:39.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (490, N'QD57', N'XIPU', '20090128 12:22:18.670', '20090312 12:02:23.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (491, N'D8RX', N'95H2', '20090308 14:37:58.950', '20091211 07:07:24.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (492, N'8P26', N'DXY7', '20090131 16:06:29.140', '20090830 05:44:09.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (493, N'6O62', N'8MB2', '20090714 04:51:32.020', '20091010 11:33:16.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (494, N'17VW', N'VTLY', '20100815 00:02:41.850', '20110323 03:56:49.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (495, N'W03', N'4HAT', '20100629 02:59:17.100', '20101017 07:16:11.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (496, N'NY58', N'0KXL', '20090529 03:00:37.070', '20090921 23:15:26.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (497, N'HM83', N'WS72', '20100624 04:35:54.920', '20101213 10:18:15.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (498, N'5FJ7', N'2J5T', '20090807 22:27:27.800', '20100114 02:44:39.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (499, N'NPP0', N'X5XO', '20100208 09:19:41.800', '20100406 14:14:31.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (500, N'SVI3', N'I1PR', '20090903 12:58:37.810', '20091030 02:24:46.360', 1)
GO

--
-- Data for table dbo.ChiTietHoaDon_WebTower9  (LIMIT 500,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (501, N'56PJ', N'KU01', '20090930 19:52:40.450', '20091126 05:24:37.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (502, N'1CWJ', N'Q6JL', '20100207 14:50:12.130', '20100603 23:58:00.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (503, N'0SVU', N'UVE8', '20090102 09:19:49.280', '20090217 12:47:43.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (504, N'AVT8', N'MP6R', '20100501 20:12:29.880', '20101201 00:08:37.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (505, N'922F', N'MEAF', '20100801 08:25:08.280', '20110519 10:10:06.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (506, N'0HWY', N'MGYN', '20091031 07:04:10.410', '20100104 00:14:05.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (507, N'5WQ5', N'ZOJ', '20101021 13:28:20.860', '20110623 05:21:05.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (508, N'HE8V', N'2FK4', '20100215 12:29:40.030', '20100305 06:47:30.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (509, N'0047', N'JIEW', '20101102 02:03:59.650', '20110205 03:45:35.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (510, N'D80N', N'TBR2', '20090306 00:20:31.200', '20090622 22:35:24.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (511, N'04T2', N'N1B0', '20090504 13:10:36.980', '20091202 11:37:23.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (512, N'L3PN', N'6KM7', '20101223 07:59:12.190', '20110819 08:36:36.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (513, N'MHRP', N'XG4', '20090304 04:51:52.570', '20090515 20:50:01.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (514, N'Q85B', N'Q1IX', '20100605 16:07:49.550', '20110105 16:33:53.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (515, N'YPPT', N'K05', '20100823 06:26:26.420', '20100924 11:10:42.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (516, N'XA28', N'UBIC', '20100802 18:00:57.130', '20110315 21:08:47.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (517, N'5BYR', N'6T1V', '20101119 13:44:36.370', '20110616 07:19:07.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (518, N'GLD5', N'PAYT', '20090202 10:11:58.780', '20090531 23:24:28.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (519, N'PQ22', N'K9YB', '20101205 23:42:31.070', '20110331 22:38:53.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (520, N'CVOE', N'YLQI', '20100313 12:18:16.010', '20100524 00:24:56.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (521, N'N0W4', N'YF7X', '20100325 21:41:03.320', '20100617 13:41:33.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (522, N'234L', N'TI56', '20090524 10:03:58.800', '20091113 04:46:42.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (523, N'IB5S', N'3CYZ', '20090823 04:06:30.840', '20100203 11:22:32.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (524, N'O0BB', N'DILT', '20100614 00:51:09.290', '20100708 16:44:50.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (525, N'XI7', N'ZTGI', '20090120 22:18:06.130', '20090207 15:11:03.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (526, N'BTT8', N'Y73D', '20090709 20:03:54.590', '20091228 21:59:50.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (527, N'3UUF', N'R20', '20090218 08:48:36.700', '20090614 02:32:34.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (528, N'H39A', N'I17C', '20090829 00:26:30.330', '20091020 14:50:51.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (529, N'055O', N'ZO1S', '20090124 07:00:56.740', '20090215 09:52:30.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (530, N'IQ8T', N'R4IE', '20090306 16:26:00.270', '20090712 17:44:18.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (531, N'5Y8F', N'BB3D', '20101006 23:26:42.370', '20110220 11:03:13.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (532, N'XBMY', N'V54A', '20090824 16:56:33.130', '20100418 09:42:20.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (533, N'SWUG', N'2TBO', '20100617 18:53:12.400', '20101009 18:13:55.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (534, N'AF6S', N'1MGK', '20091105 14:57:37.030', '20100703 17:02:19.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (535, N'52SA', N'0C10', '20100817 08:51:04.730', '20110218 18:34:18.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (536, N'VNF6', N'M5E7', '20101207 08:47:30.750', '20110317 07:26:23.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (537, N'6EBE', N'8CEI', '20090617 00:42:30.090', '20090824 15:34:26.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (538, N'4AQR', N'8O6W', '20100810 07:51:47.340', '20101128 06:04:41.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (539, N'L00L', N'BEJI', '20100522 12:13:34.830', '20100612 19:08:03.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (540, N'2GDQ', N'QCZD', '20091218 08:45:55.250', '20100227 04:21:36.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (541, N'9ZUU', N'U2GN', '20101028 00:30:46.300', '20110821 17:10:50.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (542, N'AZ4S', N'Q8SY', '20100903 06:21:43.790', '20110616 19:40:42.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (543, N'QG8G', N'UB44', '20091012 11:58:00.590', '20100723 02:24:14.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (544, N'DZLE', N'9D9U', '20090420 23:45:59.720', '20090503 06:10:16.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (545, N'ABY6', N'ALJZ', '20100925 23:11:41.690', '20110204 00:25:00.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (546, N'0JMR', N'2OAT', '20090316 06:38:46.760', '20090423 22:30:48.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (547, N'93FD', N'GHZ6', '20101129 11:14:36.580', '20110416 08:54:08.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (548, N'CW4C', N'JNM8', '20100207 12:43:42.470', '20100731 18:59:23.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (549, N'JNAY', N'CKLU', '20101222 17:36:15.430', '20110628 16:46:07.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (550, N'YF15', N'A7BE', '20101126 08:58:19.980', '20110530 10:07:25.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (551, N'YQYJ', N'TZOE', '20090709 13:16:00.700', '20100201 15:56:19.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (552, N'87BH', N'7KC2', '20100522 18:23:56.140', '20100715 10:53:48', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (553, N'JLJV', N'JO6K', '20090901 22:44:56.730', '20091015 04:05:47.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (554, N'8AW9', N'YJRS', '20101127 21:01:25.800', '20110909 13:49:36.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (555, N'5V7J', N'JYP3', '20100610 15:17:34.500', '20110310 12:43:14.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (556, N'9PN', N'QZER', '20090510 09:48:41.640', '20091110 00:37:56.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (557, N'EZMA', N'MOFH', '20090618 10:43:41.280', '20100225 12:35:29.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (558, N'W8G6', N'HVNP', '20090721 08:28:40', '20090811 20:02:53.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (559, N'M9PO', N'MS4', '20100411 21:54:23.740', '20101024 08:57:34.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (560, N'XP9G', N'OF2U', '20100123 12:21:13.690', '20100522 12:10:16.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (561, N'D1AW', N'VBET', '20090912 22:15:33.700', '20100519 21:41:32.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (562, N'DS46', N'IT82', '20100223 13:01:50.530', '20100903 14:30:14.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (563, N'JNUW', N'2PTR', '20100123 05:28:43.280', '20101114 20:55:00.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (564, N'7WID', N'RUMC', '20100829 09:37:59.380', '20110523 10:01:17.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (565, N'3W32', N'IETJ', '20090530 00:53:48.830', '20100226 11:32:12.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (566, N'0ALP', N'RX41', '20100909 20:14:03.860', '20110612 01:55:04.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (567, N'7B2E', N'3ILZ', '20090708 13:05:59.780', '20091110 14:22:42.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (568, N'BWGU', N'VPU3', '20100428 13:54:15.540', '20100908 03:47:43.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (569, N'AEP1', N'PMF8', '20101019 07:16:44.830', '20101116 21:59:36.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (570, N'3HBO', N'XM2T', '20100915 21:38:55.670', '20110506 03:44:20.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (571, N'3NWE', N'MA33', '20100216 17:18:27.030', '20100723 05:34:22', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (572, N'ITM', N'Y7HD', '20090412 05:52:49.030', '20090720 01:14:27.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (573, N'9EIC', N'DM43', '20090912 21:58:23.960', '20091219 04:16:26.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (574, N'68KL', N'TG88', '20091219 14:56:35.810', '20100202 18:17:17.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (575, N'07WB', N'4IFI', '20100516 11:47:29.710', '20100729 07:14:06.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (576, N'598H', N'8ICH', '20100722 15:19:19.540', '20101027 18:00:51.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (577, N'HFDJ', N'ZFLS', '20100811 22:05:58.220', '20110217 02:22:29.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (578, N'5RB6', N'U319', '20090505 04:20:31.120', '20091004 05:12:17.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (579, N'I1EI', N'2GX8', '20100918 01:39:27.610', '20110330 16:19:51.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (580, N'WXBA', N'X8KE', '20101106 15:39:19.380', '20110812 16:40:16.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (581, N'VPX0', N'I9BY', '20090810 08:49:18.010', '20090913 13:05:43.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (582, N'JCXT', N'80GS', '20100110 20:04:54.230', '20100909 07:33:11.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (583, N'17VW', N'4Q2E', '20090906 06:50:14.900', '20100217 22:04:44.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (584, N'XZCR', N'PINY', '20090227 22:02:36.770', '20090714 23:45:06.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (585, N'3RI2', N'X8KE', '20100828 03:09:59.570', '20110406 01:47:59.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (586, N'IX4T', N'3ILZ', '20090518 05:02:46.230', '20090809 00:09:26.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (587, N'K56Z', N'BVRP', '20101222 18:11:36.400', '20110704 05:36:34.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (588, N'U6TA', N'4FUZ', '20100720 21:51:46.610', '20101126 04:24:19.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (589, N'9T81', N'IXEF', '20100527 23:40:02.540', '20110219 04:19:05.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (590, N'JJ4Q', N'9IC8', '20100409 23:02:23.080', '20100411 17:56:22.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (591, N'0ACL', N'ZBKF', '20100621 22:03:49.470', '20101116 18:50:55.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (592, N'9D73', N'R3UK', '20101126 16:13:50.100', '20110112 19:31:33.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (593, N'5PO3', N'MG0V', '20090501 09:57:23.590', '20091201 21:07:07.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (594, N'N9A5', N'NWBF', '20090429 23:52:21.140', '20091118 06:57:47.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (595, N'7AJW', N'V5NR', '20090407 10:30:21.550', '20090807 06:40:05.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (596, N'AN9P', N'BMDB', '20090904 11:28:55.770', '20091219 02:40:36.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (597, N'L6W5', N'NGDT', '20090812 00:53:00.500', '20100529 22:45:43.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (598, N'2KI5', N'2CZ4', '20100213 02:20:01.220', '20100301 16:22:57.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (599, N'4QOB', N'REMV', '20101121 22:52:10.900', '20101231 18:38:05', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (600, N'C6XT', N'JO1H', '20090117 02:57:37.820', '20090621 22:29:57.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (601, N'I94P', N'Z35T', '20100907 17:32:46.980', '20110409 08:08:06.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (602, N'2OL1', N'L32Z', '20090803 21:20:21.030', '20090809 05:06:26.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (603, N'5IA3', N'TJ7N', '20100421 05:26:57.650', '20100913 20:59:48.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (604, N'Z8OJ', N'F61J', '20090408 19:57:19.760', '20091220 13:01:48.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (605, N'9E67', N'P0NF', '20091010 15:39:52.950', '20091108 04:33:04.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (606, N'JTC8', N'VPAM', '20090330 07:23:11.670', '20090716 14:41:53.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (607, N'00BJ', N'UB8G', '20090909 20:25:32.180', '20100524 06:37:22.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (608, N'FLJT', N'PRQ4', '20100913 07:48:20.920', '20110708 09:48:30.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (609, N'43HN', N'TZOE', '20090715 09:13:56.080', '20100212 06:35:31.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (610, N'0ACL', N'AIZV', '20101118 23:58:14.960', '20110513 18:42:23.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (611, N'9R9T', N'REMV', '20090928 11:42:43.430', '20100719 22:15:27.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (612, N'7AMU', N'SINJ', '20090214 06:23:10.160', '20090525 07:23:12.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (613, N'EN00', N'F42', '20091102 06:49:12.400', '20100310 03:43:02.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (614, N'PBMX', N'PMF8', '20100605 06:15:04.370', '20110107 16:17:19.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (615, N'DZUR', N'69EY', '20090616 03:31:55.670', '20090908 23:04:34.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (616, N'9GKT', N'NJZS', '20100902 02:10:39.480', '20100909 14:08:21.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (617, N'O4B6', N'DM43', '20090620 06:11:35.620', '20090717 16:25:30.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (618, N'3Q99', N'DM0A', '20091126 07:26:06.510', '20100503 21:09:55.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (619, N'IIR7', N'UVE8', '20090102 06:27:59.800', '20090217 08:13:18.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (620, N'KSM8', N'EN1A', '20090112 19:51:02.600', '20090721 11:22:46.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (621, N'7DBD', N'G2NH', '20100918 02:02:27.460', '20101208 20:18:30.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (622, N'KDO4', N'Z372', '20091218 15:14:13.180', '20101011 09:58:24.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (623, N'GZ4M', N'DE1H', '20101201 14:14:13.010', '20110515 23:28:38.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (624, N'T161', N'FYHJ', '20090712 08:14:21.740', '20090808 04:03:14.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (625, N'N3YC', N'YGCO', '20090327 23:35:06.200', '20090620 08:53:26.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (626, N'D4VF', N'V5TD', '20100323 01:04:36.940', '20100710 10:02:49.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (627, N'GSKU', N'BVRP', '20101211 19:55:25.450', '20110614 04:07:20.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (628, N'TEZT', N'QAFE', '20090516 22:06:02.810', '20091127 21:18:39.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (629, N'5CHJ', N'YKJF', '20090914 04:26:14.260', '20100425 11:37:12.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (630, N'Q320', N'SWPM', '20090912 00:18:33.930', '20100607 04:33:30.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (631, N'UEPP', N'LP5L', '20091211 14:26:19.030', '20100327 19:15:09.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (632, N'93FD', N'X83W', '20090629 19:45:56.990', '20091219 09:59:33.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (633, N'AY8W', N'2NXK', '20090613 05:28:20.230', '20091003 10:34:13.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (634, N'YLJ0', N'K9YB', '20100901 22:41:49.780', '20101009 17:49:55.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (635, N'OIKG', N'Y5Z2', '20090301 22:06:32.390', '20090506 08:32:10.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (636, N'RCS1', N'X96E', '20090107 11:28:56.970', '20090205 07:59:17.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (637, N'4887', N'EXZX', '20100921 14:37:56.580', '20101226 10:33:24.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (638, N'QTG7', N'Q6JL', '20090531 10:52:55.130', '20091226 09:02:57.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (639, N'OSNQ', N'0ML2', '20100520 06:22:43.820', '20100905 19:12:02.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (640, N'J6OQ', N'1CAK', '20100531 19:46:47.900', '20100921 11:06:07.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (641, N'3TT0', N'9FZA', '20100907 08:37:14.050', '20110111 17:32:04.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (642, N'M1C3', N'MR6C', '20090411 10:23:15.470', '20091023 19:48:04.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (643, N'VMS5', N'AD2K', '20100106 12:37:50.520', '20100810 21:48:49.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (644, N'M9PO', N'7OE6', '20100708 23:41:47.580', '20101008 09:36:43.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (645, N'4Q9J', N'ILB8', '20090713 11:19:39.650', '20090720 19:40:55.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (646, N'E897', N'6WB4', '20100508 15:40:39.310', '20100625 11:27:43.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (647, N'XT53', N'C4IK', '20100125 09:24:37.700', '20100901 15:48:31.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (648, N'1YYB', N'WZJC', '20091126 03:42:19.230', '20100920 04:49:48.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (649, N'JZBH', N'HSYO', '20101113 20:20:25.470', '20110311 07:53:14.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (650, N'1AFN', N'7KZY', '20090805 08:19:42.080', '20091127 16:31:45.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (651, N'NIOC', N'Y7HD', '20090318 05:17:20.140', '20090604 10:15:06.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (652, N'KVS7', N'9ITH', '20100915 17:26:54', '20110126 01:35:49.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (653, N'LSBS', N'7LW6', '20100211 19:52:01.410', '20101109 08:09:39.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (654, N'K0PW', N'D35', '20101110 03:01:08.290', '20110409 07:15:19.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (655, N'X3TC', N'2TBW', '20090501 00:55:10.370', '20090714 02:11:27.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (656, N'9T81', N'ZY4V', '20090921 02:18:33.800', '20100425 22:09:43.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (657, N'XSJG', N'75YM', '20090902 07:06:08.030', '20100120 05:37:49.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (658, N'DBNF', N'DVYM', '20091010 21:12:35.910', '20100206 16:56:34.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (659, N'D1AW', N'H08Q', '20090112 20:22:13.560', '20090703 04:08:22.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (660, N'LGGQ', N'TLDE', '20100720 14:35:16.010', '20110224 18:30:16.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (661, N'CZY9', N'KF01', '20090418 11:27:46.230', '20091128 10:34:33.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (662, N'0K31', N'40AG', '20090426 22:19:29.360', '20090627 09:18:44.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (663, N'5IA3', N'R441', '20091231 03:22:06.660', '20100315 22:11:18.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (664, N'922F', N'0QKV', '20101102 08:55:22.160', '20110704 02:02:01.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (665, N'HZDC', N'PR9R', '20091209 09:31:55.930', '20100216 23:27:15.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (666, N'A0TU', N'UHOT', '20090401 15:56:46.440', '20090801 12:15:55.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (667, N'3486', N'PY27', '20100903 00:54:49.940', '20110617 20:49:00.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (668, N'FWIM', N'V9BL', '20100302 08:07:22.620', '20100531 09:53:08.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (669, N'6TCI', N'RE3O', '20100406 08:08:31.980', '20100904 07:45:10.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (670, N'BLXC', N'8VZM', '20090609 16:02:58.690', '20090804 15:05:18.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (671, N'HGES', N'8MK9', '20101211 11:32:42.900', '20110711 03:34:58.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (672, N'GA78', N'O4WK', '20090120 19:18:40.490', '20090519 07:22:34.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (673, N'MG4P', N'CNYQ', '20100709 01:03:22.690', '20100828 01:57:53.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (674, N'5LCZ', N'T91O', '20090803 10:41:11.910', '20100324 21:07:12.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (675, N'254L', N'4V8D', '20090507 11:13:48.550', '20090709 17:50:43.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (676, N'BEKS', N'TJ7N', '20100609 15:39:11.990', '20101213 00:30:26.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (677, N'3EDY', N'P0NF', '20101212 02:36:22.670', '20110302 12:09:36.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (678, N'JCV5', N'5AU9', '20090526 14:32:25.420', '20090808 13:51:56.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (679, N'CZ02', N'XHW8', '20101229 20:54:42.100', '20110118 08:22:19.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (680, N'EU8U', N'RIPB', '20091119 07:54:26.890', '20091225 21:25:44.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (681, N'FWIM', N'JIEW', '20090226 15:39:59.230', '20090904 18:14:18.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (682, N'4EVD', N'FC25', '20100116 16:13:06.210', '20100721 23:17:32.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (683, N'7W06', N'8OIQ', '20090703 01:45:37.350', '20090918 13:25:26.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (684, N'4RF8', N'R20', '20090209 20:06:32.180', '20090529 19:05:28.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (685, N'2LZQ', N'UYVQ', '20090627 19:01:13.780', '20100103 18:18:25.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (686, N'20OC', N'BMDB', '20100327 20:59:25.040', '20101226 17:39:21.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (687, N'QQUC', N'PKIK', '20100517 23:53:55.580', '20101206 01:49:54.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (688, N'KGCG', N'PWTT', '20090803 02:27:11.940', '20100422 03:18:55.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (689, N'IHWE', N'H2JU', '20100504 21:46:39.410', '20110123 15:38:29.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (690, N'EP1O', N'Y73D', '20100610 19:47:58.600', '20101106 10:22:27.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (691, N'TNF7', N'Q8JL', '20100507 04:22:48.950', '20101112 02:21:29.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (692, N'4OWO', N'0Q0L', '20091212 17:25:20.660', '20100915 17:36:50.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (693, N'H23K', N'8ZDT', '20090519 14:30:41.570', '20090626 04:54:35.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (694, N'SCLR', N'73BW', '20101030 15:47:27.820', '20110508 00:41:47.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (695, N'MXR5', N'I8T8', '20100213 08:19:01.670', '20100821 00:31:34.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (696, N'FKWJ', N'5ABG', '20100514 10:17:44.690', '20100718 08:13:21.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (697, N'FOI1', N'VIKA', '20100411 07:01:08.820', '20100809 21:36:47.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (698, N'N8Y0', N'9K9A', '20100306 03:42:28.370', '20101203 19:46:48.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (699, N'XSKY', N'INSL', '20090731 14:09:51.650', '20090822 10:09:28.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (700, N'PZSV', N'O97G', '20090413 19:22:53.210', '20091016 07:25:01.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (701, N'FH6K', N'HNYC', '20100904 14:45:49.370', '20101103 14:38:43.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (702, N'H0LA', N'HDZD', '20101125 01:17:15.080', '20110403 05:55:24.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (703, N'379R', N'561Q', '20100821 19:33:47.260', '20110115 21:04:39.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (704, N'AEWT', N'89B3', '20100607 04:17:26.770', '20100807 16:47:57.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (705, N'MJ1U', N'YYWY', '20090824 20:46:59.180', '20100315 12:56:48.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (706, N'Q407', N'A7KC', '20090226 09:58:39.650', '20091113 02:52:33.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (707, N'AE0U', N'X4X7', '20090310 16:23:31.300', '20090531 23:37:56.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (708, N'OVC7', N'ES3N', '20090712 09:10:49.490', '20090818 11:02:28.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (709, N'ELGZ', N'80GS', '20100706 15:47:19.730', '20101001 13:24:36.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (710, N'WMNV', N'9FZA', '20091121 09:15:58.380', '20100528 01:41:01.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (711, N'O947', N'BEJI', '20091009 23:42:11.130', '20100223 10:00:08.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (712, N'VV63', N'1Q2Y', '20090409 16:33:42.610', '20090614 15:45:53.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (713, N'KVS7', N'GBSC', '20091012 00:17:53.820', '20100119 08:34:16.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (714, N'XZSQ', N'PFCI', '20100223 12:27:46.670', '20100708 06:42:39.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (715, N'IIR7', N'ALJZ', '20100524 22:55:16.770', '20100623 00:15:58.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (716, N'4NER', N'4FUZ', '20100401 19:14:40.020', '20100509 11:17:01.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (717, N'T5SM', N'VBET', '20101024 20:33:52.020', '20110804 19:53:19.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (718, N'78KC', N'03P0', '20091121 07:15:34.470', '20100814 03:05:50.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (719, N'5WQ2', N'69C1', '20100508 13:54:08.370', '20100701 07:43:37.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (720, N'K5SI', N'E04B', '20100913 12:32:30.900', '20101218 05:47:55.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (721, N'K56Z', N'4VQ5', '20091114 16:02:50.860', '20100622 10:26:02.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (722, N'X1XE', N'00F1', '20100131 22:27:37.990', '20100226 17:30:06.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (723, N'M2G', N'ES3N', '20101028 10:20:43.220', '20110303 18:14:40.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (724, N'MJ7O', N'TBR2', '20101026 12:20:33.380', '20101028 21:22:44.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (725, N'PNEA', N'JZ0Z', '20100202 11:40:09.750', '20100719 12:43:49.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (726, N'NUG7', N'7OE6', '20091230 18:07:22.230', '20100822 09:58:08.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (727, N'OEK7', N'ES3N', '20100903 04:47:58.920', '20101123 02:27:59.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (728, N'PD8B', N'5AU9', '20100908 09:15:54.880', '20110216 01:16:07', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (729, N'HPX', N'BEJI', '20100620 02:22:10.250', '20100803 20:35:38.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (730, N'Z58U', N'ZGCQ', '20091224 00:56:03.870', '20101018 09:37:23.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (731, N'OCN0', N'Y4MI', '20090301 08:38:03.160', '20090506 02:53:40.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (732, N'FRRV', N'F42', '20091008 22:53:54.300', '20100124 16:22:48.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (733, N'EFVB', N'NHZV', '20101026 00:22:33.780', '20101217 03:42:28.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (734, N'9MCW', N'9K9A', '20100918 01:31:48.890', '20110130 00:57:19.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (735, N'9GKT', N'A40I', '20100316 17:08:37.520', '20101218 06:47:02.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (736, N'WIGY', N'1Q2Y', '20090403 14:22:44.160', '20090603 12:18:55.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (737, N'FDXB', N'9R3S', '20100527 20:39:18.960', '20100706 02:12:54.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (738, N'MBJ4', N'0GND', '20100125 21:28:10.580', '20100210 20:37:30.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (739, N'VFYO', N'RX41', '20100617 23:19:33', '20110110 06:08:41.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (740, N'O0OA', N'KXXU', '20090502 09:02:34.130', '20091218 15:25:52.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (741, N'6LA8', N'F405', '20100118 04:35:53.730', '20100728 18:01:25.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (742, N'1G7O', N'ALJZ', '20091106 14:43:06.090', '20100420 14:47:27.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (743, N'MHHP', N'I7ON', '20100127 10:39:52.210', '20100721 13:54:19.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (744, N'58SD', N'6Z2B', '20090614 12:30:41.020', '20090829 13:57:28.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (745, N'CZY9', N'MTKM', '20090901 20:05:47.460', '20090914 00:22:20.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (746, N'LP1V', N'OF2U', '20100128 11:49:06.330', '20100531 10:35:36.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (747, N'KQMW', N'L9ER', '20090303 17:07:26.840', '20090828 09:02:35.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (748, N'FWXJ', N'KKJQ', '20100326 02:02:54.910', '20101014 22:11:57.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (749, N'PR0E', N'WGSX', '20090608 16:52:11.040', '20091116 00:25:49.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (750, N'OSWL', N'DCTI', '20101113 13:04:21.650', '20110413 13:14:34.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (751, N'AG61', N'A2H4', '20100720 13:43:52.670', '20101009 12:20:02.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (752, N'OSNQ', N'VE3P', '20090521 23:45:34.340', '20091023 18:30:57.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (753, N'GXVH', N'3H4T', '20101028 13:48:20', '20110604 12:03:12.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (754, N'I8IP', N'4FUZ', '20091117 01:37:20.750', '20100701 04:21:34.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (755, N'5V7J', N'JO1H', '20100530 03:20:02.350', '20110219 20:58:59.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (756, N'UR8Z', N'HNYC', '20090804 16:18:11.370', '20090907 21:08:37.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (757, N'BKLK', N'2DTQ', '20090128 14:56:31.860', '20090131 11:40:44.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (758, N'F8Q7', N'C4IK', '20101026 07:13:13.880', '20110319 23:41:55.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (759, N'QXHL', N'PAYT', '20090505 16:37:17.020', '20091116 04:04:08.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (760, N'4F5J', N'RAMP', '20100825 02:39:36.950', '20110520 02:58:40.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (761, N'68KL', N'VS1M', '20090625 05:10:40.740', '20091221 00:24:34.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (762, N'JP18', N'RHEY', '20090702 07:07:36.430', '20100208 22:21:50.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (763, N'6YQ3', N'2XSC', '20100122 06:48:39.250', '20101110 14:26:51.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (764, N'Q0FH', N'8MB2', '20090714 14:51:15.860', '20091011 03:47:14.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (765, N'FYIR', N'BF5M', '20090923 00:37:55.210', '20100122 22:47:21.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (766, N'2MAG', N'WV0D', '20090102 00:48:16.830', '20090130 17:37:21.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (767, N'S3TP', N'EXZX', '20090614 16:11:08.830', '20090628 12:03:26.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (768, N'81LJ', N'6GKZ', '20100123 22:46:04.940', '20101016 07:36:57.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (769, N'614W', N'F4M5', '20101209 19:19:09.150', '20110516 23:55:38.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (770, N'MBJ4', N'8U7C', '20100221 08:32:32.610', '20101116 11:57:04.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (771, N'PZFB', N'UXY4', '20101104 22:35:21.060', '20110830 09:04:07.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (772, N'TV81', N'UYD6', '20090929 23:05:41.430', '20100624 23:15:50.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (773, N'92NL', N'8CEI', '20100605 07:56:01.470', '20100803 20:57:10.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (774, N'TIX0', N'M83R', '20100107 04:51:34.240', '20100510 16:17:45.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (775, N'9EIC', N'Z0WK', '20090827 07:56:37.160', '20100319 11:46:30.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (776, N'D5P8', N'UFRE', '20090109 01:19:44.770', '20090304 19:38:36.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (777, N'GZ12', N'IVS', '20090105 11:47:45.780', '20090605 03:35:48.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (778, N'8AW9', N'77J5', '20100516 21:50:02.190', '20100706 04:17:12.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (779, N'F3G3', N'6LFZ', '20100224 16:14:45.920', '20101211 21:00:24.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (780, N'LPTV', N'V9BL', '20090105 23:51:03.410', '20090219 02:08:13.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (781, N'379R', N'NCDH', '20091030 00:59:55.390', '20091226 00:55:34.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (782, N'3OFH', N'UV51', '20090611 02:45:04.010', '20091206 04:16:03.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (783, N'Q4UB', N'8VZM', '20100402 16:23:43.840', '20100403 00:50:18.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (784, N'92JG', N'YF7X', '20100806 13:17:48.600', '20110216 07:21:04.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (785, N'NLV8', N'PKIK', '20100605 11:12:11.200', '20110108 21:17:21.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (786, N'068B', N'2KN2', '20101010 08:52:28.830', '20110509 08:22:44.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (787, N'9YIR', N'BD30', '20091211 09:05:34.300', '20100618 04:19:36.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (788, N'MQ0O', N'JI8O', '20091209 22:45:13.020', '20100414 23:20:54.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (789, N'JO1O', N'QZRH', '20090421 22:11:46.530', '20091007 03:58:20.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (790, N'PBMX', N'T384', '20090813 00:50:26.150', '20100412 09:38:25.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (791, N'OEAI', N'ZGCQ', '20090306 23:26:12.300', '20090504 00:38:11.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (792, N'7IBQ', N'XQXS', '20100801 13:26:05.090', '20110212 02:31:00.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (793, N'EO4D', N'BGM1', '20090923 04:50:53.550', '20100122 16:33:22.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (794, N'KCKP', N'0IHL', '20101023 20:39:56.050', '20110619 03:10:02.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (795, N'2VAO', N'P0NF', '20101107 03:51:53.390', '20101228 15:01:19.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (796, N'EO4D', N'NO1Z', '20090719 21:28:17.300', '20100415 19:39:35.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (797, N'V6WP', N'7LW6', '20101015 07:54:26.840', '20110406 00:20:36.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (798, N'79E9', N'8VZM', '20090716 19:48:36.350', '20091011 10:07:06.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (799, N'951I', N'VKOD', '20100921 11:52:45.810', '20110602 15:10:07.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (800, N'I9O9', N'Q9A', '20090831 19:17:30.620', '20100611 06:45:00.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (801, N'5OJ2', N'9DTT', '20090816 19:37:57.500', '20091203 22:32:11.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (802, N'SUHI', N'EJ6K', '20100207 18:21:21.910', '20100908 01:25:38.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (803, N'7CDQ', N'4Z84', '20100416 06:43:45.760', '20100530 22:16:20.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (804, N'O947', N'NWBF', '20100417 08:19:38.430', '20101026 12:28:46.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (805, N'JCV5', N'J53Y', '20090109 14:29:00.590', '20090611 04:10:27.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (806, N'2JY8', N'FH60', '20091021 14:38:11.230', '20100211 13:04:13.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (807, N'IWR', N'NGC8', '20091216 15:49:32.870', '20100321 21:33:48.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (808, N'O5RG', N'I7GI', '20091022 08:56:45.760', '20100125 19:45:28.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (809, N'F2YJ', N'5ABG', '20090323 17:40:43.590', '20090414 16:35:04.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (810, N'OBZ', N'P3OJ', '20100522 02:00:17.580', '20101219 01:20:24.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (811, N'BWM6', N'YUG1', '20090731 04:30:25.590', '20100130 17:32:50.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (812, N'7OCE', N'V5TD', '20090913 17:06:29.670', '20100524 07:23:33.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (813, N'Q85B', N'5BGG', '20090901 14:58:27.950', '20100203 02:41:31.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (814, N'E047', N'TXFL', '20090430 16:46:13.600', '20090928 01:55:55.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (815, N'M778', N'474A', '20091027 01:39:41.560', '20100526 02:03:07.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (816, N'2GDQ', N'1882', '20090115 02:25:36.730', '20090115 20:08:32', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (817, N'4NER', N'ITDT', '20100331 14:43:52.590', '20101107 21:31:33.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (818, N'3CBF', N'4Q2E', '20100617 17:30:50.660', '20100924 07:05:47.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (819, N'IH1W', N'JZQT', '20100208 03:39:04.660', '20100729 06:29:53.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (820, N'T6RU', N'8TM0', '20091213 15:45:26.390', '20100712 14:24:38.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (821, N'Q8WB', N'LP5L', '20100121 15:42:42.540', '20100610 13:17:45.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (822, N'LC99', N'VS1M', '20100705 17:25:55.810', '20110109 12:42:32.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (823, N'K8HM', N'FT1A', '20091005 00:34:18.400', '20100110 03:38:37.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (824, N'SISQ', N'MA33', '20100429 18:28:43', '20101201 14:17:13.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (825, N'UE0B', N'9FNG', '20091218 09:06:20.310', '20100716 11:18:53.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (826, N'F4R0', N'X52E', '20090406 09:09:15.970', '20090719 06:33:08.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (827, N'L8KD', N'JW1L', '20090107 18:14:47.880', '20090603 06:42:28.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (828, N'OCN0', N'7FN1', '20100812 11:16:05.430', '20101211 17:47:09.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (829, N'MNZY', N'XF1Z', '20100302 00:59:40.850', '20100513 01:16:27.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (830, N'VLQ8', N'BMDB', '20090208 10:28:19.850', '20090930 16:06:56.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (831, N'2FUU', N'MRD3', '20090326 17:25:17.930', '20090924 19:18:00.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (832, N'CHIE', N'95Q1', '20100621 15:59:09.440', '20100824 17:28:43.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (833, N'CHOE', N'BR7C', '20100825 09:57:16.390', '20101129 13:07:06.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (834, N'PZSV', N'H2JU', '20090626 20:57:15.300', '20090703 14:15:25.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (835, N'FQHV', N'M7D3', '20100522 04:13:05.920', '20110112 03:36:03.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (836, N'0047', N'8MZ3', '20100921 06:38:33.480', '20110212 23:29:56.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (837, N'YVIU', N'PR9R', '20100224 20:01:18.250', '20100708 05:59:44.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (838, N'FSTI', N'LZD5', '20101216 08:04:05.410', '20110403 12:21:32.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (839, N'QVFP', N'FUNM', '20100728 22:48:48.010', '20100908 03:10:38.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (840, N'6ZTL', N'9R9W', '20090815 20:33:59.970', '20091128 08:13:08.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (841, N'2ZZV', N'FJYW', '20091025 17:02:55.950', '20100218 10:48:57.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (842, N'LV3Q', N'TWBS', '20090220 00:08:48.530', '20090524 08:34:09.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (843, N'EFVB', N'DILT', '20090919 05:04:29.430', '20100101 06:45:50.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (844, N'SGQX', N'1YKM', '20091130 20:11:28.950', '20100815 02:37:57.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (845, N'K1YH', N'UFRE', '20090113 20:20:00.550', '20090313 16:05:36.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (846, N'QSGS', N'4HAT', '20100623 06:19:42.630', '20101006 17:14:39.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (847, N'FT3C', N'S6YW', '20091130 22:27:37.140', '20100109 23:49:29.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (848, N'TIIB', N'IAZQ', '20090526 12:04:39.940', '20100221 14:37:27.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (849, N'PTC8', N'WGSX', '20091228 19:00:14.490', '20100125 01:06:55.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (850, N'DGQE', N'NHQ7', '20101024 01:26:16.660', '20101213 18:52:48.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (851, N'48PO', N'4W30', '20100420 06:44:24.710', '20100607 22:08:03.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (852, N'X3HV', N'2TBO', '20090430 14:23:36.180', '20090713 17:14:50.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (853, N'Q4KM', N'Q1IX', '20100607 16:09:31.690', '20110109 03:37:13.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (854, N'4887', N'MTQU', '20091009 20:07:19.420', '20091122 00:45:29.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (855, N'SUHI', N'4NB', '20100810 03:34:48.080', '20101231 17:27:15.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (856, N'OK0Z', N'DPO7', '20100211 02:12:01.690', '20100920 09:49:39.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (857, N'JZBH', N'YP3N', '20090506 17:47:03.500', '20090829 21:47:01.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (858, N'DKP2', N'JZ0Z', '20101217 12:15:02.770', '20110425 07:59:07.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (859, N'ULFC', N'E8K8', '20090430 23:13:18.120', '20100207 01:09:53.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (860, N'11PV', N'LZD5', '20101005 05:19:44.630', '20101122 21:37:19.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (861, N'KQGF', N'WD3A', '20091014 20:23:23.350', '20100708 06:21:46.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (862, N'D4Z2', N'FLRD', '20100506 04:33:27.450', '20110204 03:46:40', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (863, N'R3PA', N'KVIZ', '20100822 07:57:04.920', '20100914 18:29:02.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (864, N'DBNF', N'TWBS', '20090213 07:12:23.740', '20090512 00:28:09.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (865, N'7LJU', N'1ZA4', '20100226 08:34:59.650', '20100327 06:02:25.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (866, N'6KDW', N'PRQ4', '20100208 12:31:16.150', '20100608 00:04:08.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (867, N'VD9L', N'JW1L', '20100119 07:09:13.290', '20100624 18:16:27.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (868, N'W443', N'P7DQ', '20090308 18:01:12.640', '20090803 12:26:07.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (869, N'K2NB', N'7WXM', '20091209 12:33:07.690', '20100712 22:19:53.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (870, N'TW5E', N'VJM2', '20100204 19:01:08.080', '20100412 02:33:11.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (871, N'2LZQ', N'BR7C', '20091120 06:24:18.490', '20100506 14:08:48.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (872, N'G94P', N'WZNF', '20100415 06:39:47.190', '20100806 09:10:01.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (873, N'UQ0L', N'PBTO', '20101119 18:42:02.660', '20110116 03:55:09.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (874, N'AVT8', N'9DTT', '20090626 07:05:04.690', '20090831 22:16:46.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (875, N'OCTO', N'TG88', '20090218 22:42:30.440', '20090525 03:35:42.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (876, N'DSJB', N'RLGL', '20091202 15:33:54.010', '20100118 04:43:37.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (877, N'FY9O', N'J53Y', '20091017 12:21:26.380', '20100109 05:56:42.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (878, N'AE0U', N'DRAY', '20101104 04:22:49.460', '20110324 01:00:41.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (879, N'0C00', N'RR14', '20100416 22:08:42.440', '20100920 22:11:38.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (880, N'3RI2', N'4VQ5', '20100627 02:46:37.680', '20101009 18:04:15.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (881, N'G0VL', N'4Q2E', '20100506 10:41:38.830', '20100709 06:43:40.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (882, N'UBBN', N'10VV', '20100814 06:10:07.940', '20110205 16:05:01.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (883, N'AZ4S', N'B1UL', '20090815 16:15:50.930', '20091117 16:40:14.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (884, N'HZDC', N'A2H4', '20100508 23:33:24.190', '20100530 06:23:39.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (885, N'RKIH', N'6QH9', '20091021 03:43:55.140', '20100424 17:58:54.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (886, N'EU8U', N'K9YB', '20101126 03:01:41.760', '20110314 02:03:10.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (887, N'LUWX', N'K5H4', '20090114 23:49:37.740', '20090612 13:51:30.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (888, N'NS05', N'PIKH', '20091116 13:49:56.960', '20100108 12:21:37.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (889, N'RUEW', N'BWFF', '20091116 17:22:27.220', '20100428 20:48:11.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (890, N'F8KK', N'8CEI', '20090411 02:01:04.220', '20090424 17:46:25.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (891, N'RKIH', N'A0XP', '20100518 12:51:29.980', '20100617 01:42:55.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (892, N'CATH', N'69EY', '20100310 07:46:15.480', '20100314 22:00:38.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (893, N'UKCD', N'7FN1', '20100818 08:50:47.290', '20101222 11:11:40.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (894, N'GX97', N'UBIC', '20101023 17:29:03.380', '20110812 05:33:20.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (895, N'H2TQ', N'DM43', '20101101 00:10:36.620', '20110319 01:51:23.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (896, N'0PNN', N'ZY4V', '20100621 12:29:28.500', '20101110 07:02:18.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (897, N'JS3', N'9DVV', '20090630 16:11:43.610', '20090908 14:05:08.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (898, N'0L8P', N'K5H4', '20090806 21:52:05.680', '20090823 06:17:42.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (899, N'M8Q1', N'ZXWH', '20101004 11:36:29.310', '20110520 20:35:33.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (900, N'W8OT', N'4P4I', '20091205 07:48:44.410', '20100801 16:01:29.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (901, N'VGZ5', N'LT05', '20090604 23:10:29.340', '20100208 22:58:12.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (902, N'K30K', N'37F0', '20090925 04:26:24.490', '20100405 11:23:22.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (903, N'D8RX', N'9R3S', '20100616 23:31:32.250', '20100811 16:17:35.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (904, N'S26L', N'0Q0L', '20101122 23:59:06.410', '20110810 22:33:45.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (905, N'VHOT', N'BD30', '20091204 19:01:58.170', '20100606 04:44:00.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (906, N'K1B0', N'8BYF', '20090106 00:04:37.520', '20090829 12:58:02.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (907, N'LIVZ', N'E5KS', '20090610 19:41:33.530', '20090627 13:19:42.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (908, N'W8G6', N'GRBP', '20091213 09:04:27', '20100511 05:20:28.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (909, N'TGHK', N'TBR2', '20090821 21:24:48.980', '20100426 21:09:48.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (910, N'H5UN', N'D8AZ', '20090908 12:00:54.070', '20091214 12:43:39.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (911, N'BV3S', N'V6WQ', '20090427 13:50:35.300', '20090912 03:52:57.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (912, N'8OCG', N'LE76', '20090702 13:24:14.040', '20100403 20:46:21.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (913, N'9NN', N'RKMG', '20090902 14:06:20.330', '20100601 09:47:29.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (914, N'VFUS', N'8VMN', '20091103 20:26:40.450', '20100430 07:05:39.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (915, N'ZLE8', N'H878', '20090601 18:38:05.790', '20100313 14:53:39.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (916, N'FOI1', N'V7O5', '20100302 14:13:15.420', '20100601 14:16:45.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (917, N'NSDJ', N'4DXO', '20090921 12:17:36.510', '20100320 11:06:26.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (918, N'KKOB', N'A2H4', '20090416 08:23:40.730', '20090418 12:05:23.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (919, N'F6G0', N'NFSU', '20100425 03:28:28.600', '20101113 06:29:16.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (920, N'RHNI', N'J53Y', '20100402 05:33:17.900', '20101109 03:59:15.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (921, N'FRRV', N'5QE5', '20100125 12:41:38.400', '20101023 10:12:38.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (922, N'M0I', N'TZOE', '20090305 17:19:16.320', '20090617 05:54:51.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (923, N'S809', N'D0CX', '20100422 00:38:45.420', '20110131 15:37:56.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (924, N'BERP', N'ZOUA', '20090831 10:32:03.470', '20100321 04:33:29.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (925, N'3JW5', N'LT05', '20100919 06:09:38.100', '20101026 00:50:16.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (926, N'016K', N'5CBY', '20100911 22:38:03.010', '20110221 16:08:11.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (927, N'VNIT', N'PIKH', '20100827 21:48:59.910', '20110610 21:58:22.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (928, N'IG83', N'V54A', '20090128 01:12:59.270', '20090402 22:21:50.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (929, N'09WT', N'VSHL', '20090825 06:54:28.070', '20100410 20:25:23.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (930, N'JJ4Q', N'TI56', '20090830 10:13:01.940', '20100510 20:33:25.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (931, N'323R', N'IG6E', '20090604 23:22:10.390', '20100308 14:38:30.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (932, N'2KI5', N'YYWY', '20090313 14:29:20.700', '20090519 23:39:01.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (933, N'1S62', N'DVK8', '20090131 16:46:20.150', '20090831 04:25:08.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (934, N'KAN8', N'NCDH', '20090513 14:19:58.030', '20091217 06:10:10.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (935, N'L8KD', N'K5H4', '20100123 03:36:08.330', '20100627 19:06:03.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (936, N'AXS8', N'1CU7', '20090812 06:15:14.340', '20100130 19:20:18.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (937, N'W443', N'REMV', '20090228 06:38:35.680', '20090627 23:47:27.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (938, N'Q8WB', N'A2JQ', '20090922 16:16:44.530', '20100202 18:06:29.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (939, N'H30G', N'YTGE', '20090605 04:31:26.010', '20091021 01:39:40.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (940, N'DTR1', N'YK1U', '20091016 03:39:17.610', '20100623 05:00:52.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (941, N'VSR4', N'5GQO', '20100618 07:20:08.220', '20100917 12:43:29.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (942, N'72DM', N'31ZJ', '20100201 14:45:10.750', '20101128 08:31:03.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (943, N'L974', N'VTLY', '20090328 16:25:07.980', '20090711 15:11:49.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (944, N'S3TP', N'YVHP', '20090311 05:21:33.150', '20090516 08:04:33.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (945, N'48PO', N'DCZC', '20101214 12:10:28.930', '20110608 13:53:28.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (946, N'7994', N'PCTX', '20091116 23:27:15.940', '20100110 04:56:34.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (947, N'FQHV', N'F14T', '20090708 17:39:55.150', '20090810 12:13:09.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (948, N'8OCG', N'YLQI', '20091015 12:24:06.830', '20100621 04:06:01.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (949, N'IWNI', N'DIZG', '20100524 22:50:57.590', '20100601 14:39:41.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (950, N'DQ8Z', N'IVS', '20090901 09:57:21.190', '20091018 11:34:38.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (951, N'VTC2', N'VKG2', '20091001 00:11:51.980', '20100619 19:55:52.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (952, N'OWEC', N'ZBKF', '20090317 07:48:02.880', '20090524 01:59:46.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (953, N'HARA', N'WH1E', '20100413 18:23:37.090', '20100805 23:48:26.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (954, N'PKCY', N'I17C', '20090705 06:03:11.400', '20090712 16:36:18.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (955, N'E4EU', N'YSDD', '20101109 19:07:06.010', '20110805 05:48:51.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (956, N'P9P1', N'RLGL', '20090402 05:51:13.020', '20090825 17:03:22.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (957, N'FOCR', N'QPJ0', '20100605 03:47:39.070', '20101229 19:45:27.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (958, N'1KHT', N'A2H4', '20091017 12:59:28.780', '20100320 11:44:07.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (959, N'43HN', N'FJYW', '20090306 17:49:28.300', '20091016 21:43:29.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (960, N'O7UF', N'5GQO', '20100324 20:23:55.160', '20100414 12:35:50.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (961, N'TP2C', N'JTYD', '20090511 02:15:37.620', '20100114 14:59:40.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (962, N'7A2Q', N'JSBH', '20090514 18:28:34.250', '20100121 14:57:53.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (963, N'MDBX', N'KZME', '20090421 02:09:58.920', '20091127 08:55:05.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (964, N'068B', N'ZR38', '20101222 11:11:47.040', '20111013 00:36:24.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (965, N'JH58', N'V5ZU', '20090406 12:38:43.680', '20090804 22:05:09.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (966, N'FRX8', N'VTUT', '20090214 23:21:14.600', '20090426 04:13:56.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (967, N'8203', N'75YM', '20090601 20:37:53.890', '20090804 16:21:14.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (968, N'2KCL', N'4HM5', '20090422 23:46:22.290', '20090616 03:37:20.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (969, N'7JDD', N'PR9R', '20101011 16:50:32.120', '20101102 11:59:36.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (970, N'S8CC', N'FEDQ', '20101020 12:22:51.460', '20110210 19:33:21.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (971, N'AY8W', N'3MFP', '20100103 07:34:39.740', '20101001 14:29:19.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (972, N'JGUT', N'UH6', '20101229 20:00:51.990', '20110214 16:59:58.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (973, N'XGO2', N'BD30', '20101111 03:52:14.720', '20110424 10:25:43.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (974, N'NX1T', N'P2GH', '20090710 23:49:10.980', '20100320 01:28:24.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (975, N'OAQ7', N'CU5U', '20101014 22:13:09.680', '20110221 15:15:47.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (976, N'PQ22', N'2PTR', '20101223 21:56:27.660', '20110921 01:41:35.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (977, N'VK89', N'Y035', '20101208 00:54:08.340', '20111002 14:43:02.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (978, N'1DGD', N'E7ZV', '20100211 19:17:12.270', '20100918 07:33:24.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (979, N'RMWR', N'MR6C', '20090916 22:21:34.550', '20091012 14:40:01.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (980, N'VBC6', N'WD3A', '20091103 06:42:22.160', '20100812 19:53:43.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (981, N'24Q0', N'R3AZ', '20100307 04:58:07.860', '20100715 03:55:02.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (982, N'744F', N'QY9', '20091113 09:24:53.070', '20091221 17:52:22.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (983, N'RXN1', N'I4OY', '20090905 02:22:01.690', '20091101 07:42:09.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (984, N'5ANG', N'DM43', '20101223 20:57:06.880', '20110623 08:50:45.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (985, N'WXAM', N'Y035', '20101129 10:01:09.960', '20110917 00:37:33.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (986, N'CW4C', N'JK5', '20090321 15:34:07.500', '20091016 12:38:45.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (987, N'BZYM', N'2GX8', '20091129 20:05:43.610', '20100809 23:50:36.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (988, N'40ZT', N'W78D', '20100729 10:43:08.750', '20110218 11:48:50.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (989, N'LXG7', N'OS1P', '20090703 19:12:52.030', '20100310 00:21:19.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (990, N'TMBF', N'S0Y4', '20091023 21:44:55.300', '20091103 02:02:42.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (991, N'8RA7', N'AYHB', '20100309 02:27:35.270', '20101127 23:34:52.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (992, N'M1C3', N'HSYO', '20100513 17:39:06.900', '20110203 12:03:20.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (993, N'YLJ0', N'UYD6', '20090719 22:27:16.230', '20100213 20:23:01.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (994, N'3IRA', N'T384', '20100313 08:07:30.860', '20100708 13:03:50.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (995, N'CATH', N'FFBV', '20090608 01:23:39.990', '20090609 14:01:13.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (996, N'THC9', N'MWPE', '20100204 12:51:33.960', '20100623 21:45:37.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (997, N'Y7KU', N'JIEW', '20091014 12:35:11.820', '20100101 23:35:58.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (998, N'CHOE', N'VYUT', '20090406 05:13:20.950', '20090725 14:35:26.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (999, N'EOPN', N'3W95', '20101204 16:42:49.480', '20110807 09:59:24.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1000, N'MC2G', N'HQLF', '20101030 12:49:14.320', '20110213 09:39:33.040', 2)
GO

--
-- Data for table dbo.ChiTietHoaDon_WebTower9  (LIMIT 1000,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1001, N'0ISE', N'I9BY', '20090618 02:49:22.040', '20100404 12:35:21.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1002, N'ADR', N'A2H4', '20090318 17:53:32.850', '20091222 08:35:50.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1003, N'RF80', N'8W7S', '20100103 19:33:34.720', '20100818 16:06:25.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1004, N'O8ZB', N'Y55A', '20100804 10:28:06.130', '20110214 19:06:20.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1005, N'B7AG', N'F0CG', '20100829 02:22:41.460', '20101112 21:05:20.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1006, N'D4Z2', N'12BM', '20091002 04:11:00', '20100505 02:55:55.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1007, N'KU0K', N'OEB4', '20090506 03:55:48.170', '20091125 15:34:03.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1008, N'71V0', N'7RDH', '20091004 18:34:26.100', '20100315 22:20:03.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1009, N'CNO5', N'4IFI', '20090920 07:50:01.730', '20100317 01:20:32.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1010, N'73KG', N'VTLY', '20101116 21:10:38.350', '20110910 04:07:17.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1011, N'PZFB', N'TRZU', '20090425 04:57:04.690', '20090919 02:20:20.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1012, N'QMJM', N'CGVE', '20090424 08:30:26.800', '20100207 12:12:03.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1013, N'6ZDF', N'O2EQ', '20090131 14:37:54.230', '20090608 21:04:06.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1014, N'SWUG', N'JWH3', '20100503 11:07:06.140', '20101231 01:49:47.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1015, N'T9GV', N'F4E7', '20090118 15:25:47.300', '20090728 08:40:48.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1016, N'VRR7', N'SJTL', '20100627 16:50:44.560', '20110123 21:07:19.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1017, N'V1TZ', N'1CU7', '20100908 16:06:32.570', '20110322 07:15:44.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1018, N'BTT8', N'6WB4', '20090428 05:12:52.040', '20090606 00:04:21.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1019, N'3HZI', N'1WWT', '20090124 01:10:37.080', '20090126 23:58:51.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1020, N'Z1H3', N'C6E6', '20090116 21:04:36.170', '20090816 09:26:25.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1021, N'YF15', N'TKEM', '20100318 03:15:30.990', '20100713 04:23:21.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1022, N'Z2Z2', N'B1UL', '20091103 09:54:45.140', '20100412 04:32:24.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1023, N'X3QT', N'GHZ6', '20101020 04:33:30.270', '20110202 03:16:01.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1024, N'U3JV', N'XGSU', '20091219 19:05:36.820', '20091231 09:56:55.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1025, N'HPX', N'491O', '20090814 09:55:16.180', '20100110 19:58:30.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1026, N'RF80', N'MPTO', '20100822 13:55:32.840', '20100828 02:25:59.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1027, N'ZPOJ', N'ZJVS', '20100612 21:33:35.760', '20101028 20:36:58.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1028, N'QXDR', N'ITDT', '20090831 19:44:43.860', '20091017 21:21:53.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1029, N'OK0Z', N'92UX', '20090202 22:25:30.990', '20091011 11:27:12.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1030, N'TNF7', N'QAKH', '20090910 09:21:35.710', '20100627 17:30:11.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1031, N'H2TQ', N'KKJQ', '20100312 09:21:15.830', '20100920 02:05:38.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1032, N'0C00', N'1PHE', '20100903 19:40:47.380', '20110311 00:07:37.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1033, N'NTNQ', N'9Y8Q', '20100310 02:34:22.790', '20101207 21:34:01.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1034, N'7GC0', N'53SM', '20091117 09:32:20.230', '20100625 05:00:29.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1035, N'UL2', N'EXZX', '20090519 03:53:00.120', '20100307 07:18:22.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1036, N'X3HV', N'H5T1', '20091220 11:04:35', '20100520 19:19:13.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1037, N'MB25', N'I4OY', '20101109 13:51:18.360', '20110301 01:45:57.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1038, N'K2NB', N'K3JT', '20100131 15:53:55.560', '20100713 12:35:49.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1039, N'LKPQ', N'YUG1', '20090427 18:34:25.420', '20090811 11:45:26.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1040, N'KIRA', N'WS72', '20100228 05:50:09.950', '20100515 21:41:39.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1041, N'PEPH', N'V54A', '20101115 11:38:19.330', '20101120 21:04:42.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1042, N'TAVR', N'UVTU', '20090226 01:31:17.500', '20090528 01:30:33.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1043, N'GABT', N'RR14', '20091109 02:53:07.020', '20091205 10:28:19.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1044, N'QP6W', N'SDSY', '20090816 22:02:13.680', '20100425 20:14:03.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1045, N'DBOZ', N'YGCO', '20090701 16:47:50.610', '20091211 23:42:23.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1046, N'T0CB', N'YKJF', '20091115 17:57:08.470', '20100817 11:22:50.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1047, N'D80J', N'TRZU', '20100413 03:01:12.660', '20100828 14:59:15.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1048, N'016K', N'BF5M', '20100318 11:20:10.090', '20101210 18:33:14.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1049, N'WEAF', N'ECXF', '20100223 16:41:43.550', '20101008 04:23:03.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1050, N'QKNU', N'NFSU', '20091211 08:32:55.440', '20100312 16:53:54.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1051, N'DGQE', N'LP5L', '20100528 20:45:01.400', '20110128 14:29:53.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1052, N'A9WP', N'BQYS', '20090619 07:22:19.780', '20090729 23:31:38.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1053, N'BV3S', N'UFRE', '20090314 04:02:43.860', '20090629 14:36:35.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1054, N'XSKY', N'RUMC', '20101118 19:38:13.310', '20101223 00:32:59.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1055, N'04T2', N'O4LC', '20090815 09:33:43.320', '20100531 05:16:12.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1056, N'0SLT', N'6QH9', '20100814 16:54:36.900', '20101223 08:02:58.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1057, N'2OL1', N'TXK5', '20090529 13:20:02.590', '20091119 05:19:49.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1058, N'XGO2', N'BI5D', '20090116 00:27:57.890', '20090819 06:09:30.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1059, N'IB5S', N'TTNQ', '20091222 00:32:49.950', '20100204 23:07:51.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1060, N'CCUI', N'S8ZT', '20090107 12:27:08.620', '20090318 18:39:22.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1061, N'VEIR', N'1ND4', '20100421 06:37:24.250', '20100707 06:18:57.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1062, N'XDS3', N'5CBY', '20100904 08:11:04.320', '20110207 18:12:10.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1063, N'MKJQ', N'YRR2', '20090901 20:08:55.110', '20100401 10:52:52.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1064, N'6KDW', N'EQHG', '20090110 22:28:26.010', '20090717 07:50:22.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1065, N'BFOB', N'BVRP', '20090907 11:49:22.520', '20091222 02:01:39.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1066, N'GREK', N'RXEO', '20090821 09:16:17.310', '20100507 02:12:43.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1067, N'0THI', N'2GLD', '20100214 05:56:04.010', '20100302 14:38:02.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1068, N'A1W3', N'IVS', '20100316 05:05:34', '20101010 16:03:38.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1069, N'CJDS', N'4HM5', '20091216 07:14:06.020', '20100822 18:31:26.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1070, N'S26L', N'Y73D', '20100129 04:21:12.300', '20100309 13:21:36.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1071, N'1AFN', N'AN02', '20100818 02:59:26.200', '20101124 19:21:22.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1072, N'KMDO', N'IBDA', '20090809 00:12:37', '20090909 18:39:55.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1073, N'33YZ', N'839Q', '20090101 10:38:26.620', '20090822 12:18:55.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1074, N'A5TM', N'554Z', '20091125 19:20:27.130', '20100710 02:17:12.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1075, N'NZID', N'HXBS', '20090303 09:26:16.840', '20090925 12:21:43.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1076, N'TEZT', N'YVHP', '20100121 01:44:13.490', '20100216 02:52:48.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1077, N'00BJ', N'K2V', '20101225 07:01:38.130', '20110507 18:04:06.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1078, N'NSP3', N'OG6C', '20100306 06:31:16.590', '20100806 07:01:59.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1079, N'GKH1', N'Z35T', '20090621 02:17:46.210', '20091116 10:14:33.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1080, N'QZSB', N'5OEJ', '20100928 15:58:07.710', '20110322 08:35:40.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1081, N'I1EI', N'SVNX', '20090512 10:54:20.170', '20091027 11:26:45.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1082, N'S8CC', N'OHWK', '20090328 10:13:25.660', '20090915 02:03:44.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1083, N'EZMA', N'41J8', '20100708 03:03:00.310', '20101105 16:58:51.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1084, N'FPG8', N'MF14', '20100222 13:52:35.560', '20100731 18:33:18.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1085, N'V8B3', N'4QD9', '20100414 12:36:34.320', '20100530 03:00:18.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1086, N'VFYO', N'88OG', '20090924 01:58:56.040', '20100222 02:34:00.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1087, N'XVCY', N'793Z', '20100623 15:38:03.520', '20100912 09:31:03.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1088, N'ZT1X', N'IT82', '20100421 06:56:09.490', '20101215 21:01:03.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1089, N'ARMI', N'I4OY', '20090404 23:58:36.910', '20091121 23:44:18.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1090, N'WJCM', N'7VOT', '20091004 10:58:23.220', '20100314 23:15:24.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1091, N'CW2V', N'N6K7', '20090724 21:44:32.410', '20100428 13:59:24.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1092, N'WO9Y', N'5P36', '20101025 13:23:20.460', '20110509 19:36:27.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1093, N'NUG7', N'Q8LO', '20090210 15:21:05.600', '20090608 13:27:58.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1094, N'0JMR', N'6LFZ', '20090421 06:07:16.790', '20090526 17:06:04.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1095, N'U3XU', N'V5NR', '20101108 23:12:45.710', '20110904 15:22:42.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1096, N'KDEY', N'PINY', '20090314 03:27:15.010', '20090810 02:52:33.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1097, N'EOPN', N'VSHL', '20100626 05:22:22.400', '20101222 14:37:42.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1098, N'9HF6', N'DCSP', '20091030 04:24:41', '20100318 02:37:57.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1099, N'ZXER', N'GHZ6', '20101209 10:12:51.160', '20110504 18:12:24.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1100, N'OLII', N'6GKZ', '20101110 07:31:33.300', '20110602 21:29:40.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1101, N'X5UL', N'VUGZ', '20101001 12:01:04.460', '20110616 20:44:48.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1102, N'D4VF', N'BCJL', '20090128 21:55:38.660', '20090914 22:55:37.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1103, N'D6L0', N'6WS4', '20090403 04:06:04.070', '20090421 00:01:49.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1104, N'3IRA', N'G7AC', '20090126 12:20:31.250', '20090801 15:01:27.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1105, N'B8D4', N'C7O', '20100425 05:33:29.240', '20110211 21:32:33.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1106, N'HARA', N'38C7', '20091020 20:32:24.390', '20100521 19:49:58.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1107, N'4LI3', N'3P75', '20090618 20:43:53.160', '20091004 11:12:43.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1108, N'VA5Q', N'PAQS', '20100418 08:42:16.740', '20101016 12:19:23.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1109, N'ANG1', N'A7BE', '20100918 10:11:56.460', '20110124 12:11:16.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1110, N'IHWE', N'P5P6', '20100725 07:49:29.840', '20110414 02:23:24.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1111, N'VQJ6', N'NHZV', '20100820 09:52:58.770', '20110613 13:58:53.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1112, N'8SXC', N'5OEJ', '20100325 06:48:46', '20100414 22:17:50.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1113, N'YVIU', N'CHW9', '20100727 22:10:11.690', '20101002 19:54:58.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1114, N'RVUA', N'O8BN', '20100325 08:34:42.240', '20100911 14:32:12.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1115, N'WDIK', N'ZFW0', '20100828 01:32:48.450', '20110318 07:12:37.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1116, N'2JR9', N'DVK8', '20100124 20:23:58.580', '20100819 04:15:14.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1117, N'MQ0O', N'1CU7', '20090228 05:08:04', '20090405 01:13:19.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1118, N'1Q6R', N'CHW9', '20100710 06:16:19.560', '20100831 16:19:35.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1119, N'2EFN', N'9MN7', '20090928 09:51:51.690', '20100217 04:50:04.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1120, N'QXHL', N'3RJC', '20101214 09:50:26.480', '20110825 23:27:40.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1121, N'QH5', N'KZII', '20100227 17:38:13.800', '20100824 16:41:41.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1122, N'E7TP', N'KRAX', '20101025 22:59:54.530', '20110111 17:37:00.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1123, N'V3R6', N'0NQ0', '20091212 05:06:57.090', '20100915 16:19:21.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1124, N'H25', N'WSFW', '20090314 20:15:42.790', '20090610 19:16:02.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1125, N'QTG7', N'B74A', '20090708 06:36:39.880', '20090907 23:22:12.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1126, N'CO1O', N'4VGH', '20101023 13:36:05.750', '20110513 23:44:56.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1127, N'V1CS', N'S5U3', '20090629 08:51:31.400', '20100129 05:11:58.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1128, N'2GD', N'1CU7', '20100912 04:31:09.830', '20110328 19:12:51.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1129, N'HL6I', N'A7KC', '20100116 20:07:41.420', '20100831 10:54:30.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1130, N'DKP2', N'S5YU', '20101220 05:59:01.840', '20110215 09:29:11.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1131, N'3JW5', N'2TBW', '20100727 20:21:51.090', '20101221 12:15:07.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1132, N'DFQE', N'69EY', '20100226 02:36:57.130', '20101217 15:26:09.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1133, N'F4OX', N'7LW6', '20100327 20:18:25.430', '20100403 12:49:36.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1134, N'SU4F', N'SN65', '20090810 18:46:12.910', '20100411 12:44:53.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1135, N'U4EN', N'9OFQ', '20101228 03:57:03.250', '20110801 11:50:52.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1136, N'XSJG', N'I4OY', '20090414 12:58:41.510', '20091209 12:31:08.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1137, N'G0N0', N'HI5Y', '20101225 06:07:21.600', '20110527 02:01:56.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1138, N'KQGF', N'OL2', '20100612 14:42:29.060', '20110201 01:57:25.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1139, N'ZXDE', N'9RM', '20101030 08:19:06.320', '20110414 21:00:46', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1140, N'VEEQ', N'1CAK', '20090625 16:04:09.930', '20091105 07:10:20.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1141, N'3JW5', N'4CBR', '20090408 05:15:02.880', '20090521 15:21:17.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1142, N'DIRR', N'JA0Y', '20090308 06:55:46.770', '20090923 21:11:40.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1143, N'693G', N'7U1Q', '20100802 20:44:13.040', '20101121 08:49:47.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1144, N'4NNF', N'SUSV', '20090910 16:09:07.070', '20100605 21:20:54.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1145, N'KN09', N'L7JE', '20100214 01:05:24.450', '20100728 09:16:32.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1146, N'GKH1', N'HIEO', '20100501 14:55:46.410', '20110113 15:41:34.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1147, N'6ZDF', N'TC8F', '20090331 15:13:08.760', '20090807 23:41:30.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1148, N'3HBO', N'1XJP', '20091118 06:46:23.360', '20100723 22:55:47.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1149, N'4OWO', N'73PC', '20090824 04:34:28.350', '20100104 09:53:28.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1150, N'QS6X', N'HSYO', '20091016 02:48:47.130', '20100117 11:07:29.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1151, N'C9B6', N'O7LP', '20090114 22:19:11', '20090508 01:39:14.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1152, N'6U4U', N'K206', '20101216 23:06:02.840', '20110422 22:18:08.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1153, N'C8L6', N'3H4T', '20090201 18:32:49.310', '20091125 21:47:53.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1154, N'1WZK', N'CGVE', '20101226 00:22:24.690', '20110705 18:44:44.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1155, N'4ZKQ', N'MDZ7', '20090913 13:53:19.500', '20091010 04:48:00.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1156, N'OLKY', N'BV37', '20101206 13:01:09.940', '20110605 03:07:49.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1157, N'R93G', N'A7QG', '20100216 16:48:41.570', '20101026 06:36:17.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1158, N'TOZG', N'A4WR', '20090120 07:50:21.270', '20090907 04:45:48.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1159, N'2LZQ', N'4UXA', '20100721 05:43:51.370', '20101123 15:39:15.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1160, N'FCH8', N'73PC', '20100702 15:57:23.490', '20100930 21:47:37.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1161, N'NC5G', N'BCUS', '20090424 11:40:52.990', '20100217 14:38:01.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1162, N'FRX8', N'2CZ4', '20091006 16:12:43.330', '20100504 15:59:52.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1163, N'Y7KU', N'EQHG', '20090402 12:34:35.310', '20091213 01:24:54.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1164, N'IG83', N'IT82', '20100929 04:12:54.620', '20101209 02:42:06.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1165, N'2MAG', N'M83R', '20101228 11:27:38.750', '20110423 14:08:18.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1166, N'XM9', N'HGK4', '20090625 07:16:01.640', '20090627 22:32:45.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1167, N'4ZKQ', N'Y5Z2', '20101228 10:30:20.580', '20110111 09:28:15.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1168, N'PDQZ', N'KI52', '20091218 03:23:58.780', '20100420 07:10:05.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1169, N'KOAO', N'EAOY', '20100328 04:37:39', '20101207 02:41:20.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1170, N'YBOD', N'IAZQ', '20100516 12:34:06.940', '20110203 18:41:30.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1171, N'BR7S', N'WRMC', '20100130 14:16:36.990', '20100325 02:13:19.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1172, N'STOB', N'DIZG', '20090917 14:25:34.950', '20091228 23:15:55.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1173, N'WDDB', N'2KN2', '20100909 21:57:13.240', '20110314 19:18:50.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1174, N'X7AZ', N'8CEI', '20090405 17:47:41.750', '20090414 21:39:45.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1175, N'800N', N'ZFW0', '20100908 04:35:23.590', '20110407 08:06:23.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1176, N'N8Y0', N'1Q2Y', '20091223 10:42:27.020', '20100927 19:30:02.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1177, N'DFQE', N'C7O', '20090326 02:15:41.480', '20091218 08:47:14.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1178, N'F8G6', N'80GS', '20090403 12:57:50.010', '20090412 18:58:27.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1179, N'3KIP', N'BVRP', '20100128 19:10:18.350', '20100909 09:59:30.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1180, N'1RUX', N'UB44', '20100308 15:40:53.470', '20100621 07:40:38.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1181, N'YL1M', N'BGM1', '20100725 22:22:56.990', '20101007 00:03:27.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1182, N'0Y2H', N'QAFE', '20100811 02:05:08.040', '20110504 06:16:11.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1183, N'GXY0', N'UEHS', '20100119 23:56:41.470', '20100325 09:19:24.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1184, N'6EBE', N'T91O', '20090403 17:18:54.290', '20090814 23:47:02.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1185, N'Y2FT', N'47D', '20101206 07:39:50.840', '20110807 07:49:57.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1186, N'VHEI', N'K9YB', '20100810 21:15:48.250', '20100830 13:56:59.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1187, N'K3DJ', N'2PTR', '20100125 08:04:07.820', '20101118 17:38:16.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1188, N'O1P5', N'V9T6', '20100401 19:56:00.740', '20100725 18:04:52.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1189, N'NRE3', N'6KNI', '20101127 04:52:53.420', '20110702 07:56:54.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1190, N'RXN1', N'XZNW', '20090122 14:55:53.300', '20090227 08:43:04.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1191, N'RCS1', N'6YJJ', '20100225 20:09:59.940', '20101210 05:54:52.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1192, N'KY6D', N'6S48', '20101205 22:17:00.330', '20110716 21:16:08.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1193, N'XXOC', N'JZ0Z', '20101122 08:58:37.700', '20110310 10:18:10.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1194, N'WC2S', N'2OAT', '20090430 16:21:42.820', '20090715 23:13:09.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1195, N'055O', N'QAKZ', '20090304 04:23:16.940', '20090715 16:32:20.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1196, N'OEAI', N'1Y7W', '20100702 13:02:19.560', '20101112 23:21:25.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1197, N'1OIQ', N'40AG', '20101205 18:21:11.470', '20110807 19:46:47.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1198, N'VRZ4', N'PW8N', '20101103 16:31:18.420', '20101213 06:07:42.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1199, N'Y162', N'6WS4', '20090913 04:41:28.320', '20100212 07:12:37.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1200, N'OAQ7', N'3JZZ', '20090822 17:49:22.800', '20100131 10:43:48.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1201, N'8MB5', N'JVDF', '20100504 04:25:25.840', '20110102 06:13:20.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1202, N'IOQT', N'9DTT', '20100413 11:49:09.980', '20100419 16:31:25.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1203, N'CZ02', N'O9IB', '20100823 02:08:44.370', '20110612 20:14:27.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1204, N'CD2Z', N'PMF8', '20100409 16:00:21.420', '20100926 15:11:58.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1205, N'IPR1', N'L8X3', '20100915 12:32:10.140', '20101025 08:54:11.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1206, N'YNYC', N'A7QG', '20100429 07:53:36.050', '20100510 02:23:20.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1207, N'4Q9J', N'H5T1', '20090409 01:08:49.600', '20091206 02:59:19.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1208, N'SIOY', N'V9T6', '20101029 00:45:07.560', '20110813 00:08:09.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1209, N'254L', N'D8AZ', '20090419 19:47:01.090', '20100125 10:38:22.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1210, N'NCTI', N'KVBM', '20100921 03:10:52.480', '20101108 09:17:59', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1211, N'9NN', N'ZOJ', '20100913 10:45:28.460', '20110414 18:20:36.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1212, N'3O89', N'2FK4', '20091116 03:50:51.550', '20100716 11:37:50.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1213, N'Z5Z3', N'YGCO', '20091222 12:40:02.920', '20091228 18:46:18.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1214, N'VMS5', N'ALVY', '20090515 14:02:57.890', '20090605 07:58:38.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1215, N'WC2S', N'VL5Z', '20101207 17:34:26.510', '20101224 21:44:11.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1216, N'58SD', N'LOUM', '20090913 09:35:44.960', '20091016 08:21:50.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1217, N'TO3B', N'86RW', '20100916 16:16:01.860', '20110209 06:40:29.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1218, N'3TT0', N'LPKF', '20101229 19:15:41.020', '20110430 01:37:52.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1219, N'F55', N'E9Y5', '20101023 20:33:03.790', '20110227 18:52:09.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1220, N'TIIB', N'22E6', '20090520 14:11:50.500', '20090825 00:11:19.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1221, N'NCA', N'EDEU', '20100530 23:11:53.830', '20100605 04:54:29.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1222, N'I2YI', N'2RN7', '20090928 14:34:19.830', '20100415 15:23:24.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1223, N'N0W4', N'DILT', '20100120 22:31:05.370', '20100814 23:13:11.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1224, N'3HZI', N'GDFX', '20100306 13:41:45.690', '20101010 17:58:17.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1225, N'3UUF', N'ALJZ', '20090321 16:24:06.990', '20091222 12:46:39.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1226, N'5JPH', N'Q6JL', '20100224 15:59:36.670', '20100705 04:57:11.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1227, N'L8HQ', N'UBIC', '20091026 05:26:57.260', '20100816 12:57:46.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1228, N'6UGS', N'ZXWH', '20100513 05:35:30.410', '20100830 20:05:41.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1229, N'ME1K', N'IG6E', '20090202 13:24:24.810', '20090728 05:07:26.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1230, N'LZNH', N'XF1Z', '20090309 15:33:04.030', '20090526 08:44:58.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1231, N'6TCI', N'XQXS', '20100117 16:21:15.560', '20100219 23:43:15.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1232, N'22N6', N'MTKM', '20090522 09:44:23.070', '20100105 02:39:32.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1233, N'JTUD', N'0SWW', '20100721 08:16:21.700', '20101225 11:45:51.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1234, N'40ZT', N'8CEI', '20090609 01:20:55.540', '20090809 23:15:43.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1235, N'ZSC4', N'B0EN', '20101104 11:15:27.640', '20110415 01:27:19.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1236, N'V1CS', N'1ZD8', '20090414 10:33:47', '20090620 07:32:02.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1237, N'75DZ', N'1ZA4', '20101218 23:56:23.670', '20110917 10:01:44.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1238, N'RXHA', N'4QD9', '20101012 07:56:20.060', '20110424 18:07:27.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1239, N'THOQ', N'8K2B', '20090719 04:46:44.150', '20091020 14:52:51.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1240, N'VV5N', N'TXK5', '20090809 23:46:14.780', '20100331 05:26:38.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1241, N'CB2G', N'2RQT', '20100504 20:06:58.650', '20100722 10:57:41.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1242, N'QEFM', N'7E22', '20100329 07:19:00.270', '20100407 17:30:07.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1243, N'50K8', N'IHJK', '20091214 00:08:59.650', '20100427 07:26:31.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1244, N'234L', N'MOFH', '20090309 01:42:00.940', '20090824 22:38:56.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1245, N'NIOC', N'Y7T2', '20090511 04:10:24.850', '20090910 14:22:28.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1246, N'NOG7', N'4KZP', '20090412 16:19:08.390', '20090527 18:17:02.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1247, N'R9NR', N'8ICH', '20091215 09:36:57.400', '20100720 02:29:51.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1248, N'6OVY', N'8ICH', '20100710 18:55:39.800', '20101006 02:19:33.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1249, N'6W9B', N'6XSG', '20090523 22:47:16.320', '20090722 01:28:58.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1250, N'1XAJ', N'4RCX', '20100620 18:47:31.990', '20100929 08:10:30.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1251, N'NMLM', N'U20Q', '20101015 20:46:17.700', '20110730 16:40:57.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1252, N'614W', N'JIEW', '20101206 23:05:30.450', '20110409 18:08:55.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1253, N'IH1W', N'BF5M', '20090111 19:58:14.620', '20090812 11:15:33.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1254, N'5RB6', N'4PGW', '20090426 14:29:37.820', '20090621 07:01:18.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1255, N'7W06', N'PNMO', '20100324 18:37:28.980', '20100828 05:49:19.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1256, N'RLU6', N'GCRH', '20090806 13:51:06', '20090919 14:49:57.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1257, N'HPW3', N'VUMU', '20090324 13:18:04.610', '20090702 17:18:14.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1258, N'68UK', N'7LJK', '20090619 12:26:58.680', '20090903 02:16:11.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1259, N'Q9NT', N'EY5J', '20100119 23:36:14.430', '20100802 02:25:20.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1260, N'WNTA', N'V5NR', '20090722 20:32:33.470', '20100217 03:57:01.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1261, N'ZV97', N'GHK9', '20090705 02:26:38.790', '20090721 13:25:35.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1262, N'7DBD', N'H878', '20091126 19:33:19.190', '20100407 06:53:38.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1263, N'ZI3O', N'D8AZ', '20100926 11:20:42.740', '20110116 19:00:44.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1264, N'RY0H', N'FT1A', '20090211 04:13:57.060', '20090902 01:53:24.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1265, N'5JPH', N'MS4', '20090904 10:49:36.910', '20090919 09:34:44', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1266, N'8MB5', N'D5JS', '20100425 01:01:05.380', '20110204 15:41:04.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1267, N'TV81', N'199X', '20100427 19:34:29.860', '20100721 23:51:59.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1268, N'2M5W', N'QAKH', '20090716 11:19:07.380', '20100317 19:30:36.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1269, N'BFOB', N'ZPEV', '20090711 02:47:30.260', '20091217 06:31:19.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1270, N'7B2E', N'TJ7N', '20100826 07:00:39.510', '20110503 14:12:10.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1271, N'0SQ3', N'JWH3', '20090925 09:39:21.290', '20091124 22:20:07.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1272, N'3CBF', N'37F0', '20101205 08:19:41.810', '20110813 12:33:03.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1273, N'T161', N'D0CX', '20100613 14:28:56.860', '20100711 10:45:02.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1274, N'UQ9C', N'KUE3', '20100316 20:46:49.010', '20100926 13:25:32.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1275, N'FW78', N'ZFLS', '20100115 18:04:51.860', '20100202 13:13:39.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1276, N'E3XS', N'6QH9', '20090304 15:52:53.560', '20091225 11:24:23.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1277, N'8RA7', N'L7JE', '20101015 14:25:20.190', '20101219 07:56:53.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1278, N'DQ8Z', N'R3UK', '20091114 20:49:04.430', '20091222 00:34:16.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1279, N'IX69', N'IF06', '20091027 09:31:20.830', '20100131 03:35:49.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1280, N'UDDS', N'60D9', '20101209 00:04:58.600', '20110727 18:29:37.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1281, N'8RA7', N'HXQ', '20090313 06:22:39.260', '20091013 02:27:21.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1282, N'0SLT', N'M5OW', '20100417 10:31:17.460', '20101110 10:38:14.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1283, N'G0GF', N'SZO3', '20091221 06:48:14.090', '20100209 18:36:44.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1284, N'1S62', N'DILT', '20090814 18:36:52.820', '20091028 20:56:56.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1285, N'W8OT', N'3CYZ', '20090524 18:46:46.340', '20090822 16:04:01.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1286, N'4TEG', N'F4M5', '20100210 17:15:45.120', '20100908 05:34:21.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1287, N'KY6D', N'B1UL', '20090511 13:46:08.440', '20090526 15:24:00.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1288, N'GSKU', N'WD3A', '20100327 17:46:43.870', '20100707 04:44:34.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1289, N'WK43', N'JNM8', '20100317 06:43:26.570', '20101008 17:26:24.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1290, N'YM31', N'V4P7', '20100331 21:24:21.630', '20100727 10:37:23.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1291, N'QB81', N'5XT7', '20090121 21:15:42.380', '20091015 14:13:48.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1292, N'0Z83', N'UM8S', '20100702 11:29:24.990', '20110115 07:45:34.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1293, N'GFS', N'QAV7', '20090923 08:20:05.630', '20090923 15:42:07.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1294, N'51I4', N'DPO7', '20101227 08:14:10.680', '20110629 10:55:51.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1295, N'6R26', N'DM43', '20090205 21:19:35.980', '20090910 16:01:03.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1296, N'6KDW', N'MDZ7', '20090609 00:33:39.450', '20100211 04:04:03.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1297, N'Y30P', N'UM8S', '20100702 19:58:17.530', '20110115 22:29:24', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1298, N'1CGC', N'2FK4', '20091102 19:55:02.590', '20100622 05:33:07.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1299, N'9PN', N'ZR38', '20100704 14:52:24.030', '20101205 13:04:13.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1300, N'3FVA', N'LHO3', '20100116 03:09:19.470', '20100601 22:41:25.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1301, N'BKLK', N'32OK', '20091215 20:44:38.540', '20100901 18:25:03.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1302, N'8R2R', N'IT82', '20090601 22:17:50.020', '20100301 06:59:15.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1303, N'XHV', N'8MBW', '20091231 16:08:09.540', '20100816 19:48:14.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1304, N'E897', N'DRAY', '20090927 15:46:36.810', '20100114 11:16:49.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1305, N'YQC7', N'M5E7', '20090926 09:08:10.690', '20091105 09:50:24.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1306, N'7AMU', N'QY16', '20101110 12:26:35.890', '20101217 04:07:55.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1307, N'LC0G', N'5QE4', '20090626 08:36:33.580', '20090930 07:23:53.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1308, N'FK7H', N'RE3O', '20091027 23:11:25.620', '20091115 21:50:01.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1309, N'66RZ', N'561Q', '20100410 20:24:45.970', '20100518 17:47:40.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1310, N'4TEG', N'JIEW', '20100121 02:44:35.410', '20100630 18:24:57.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1311, N'0L8P', N'VJM2', '20091021 23:25:45.820', '20100728 06:53:04.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1312, N'1YYB', N'52LV', '20100509 16:29:00.190', '20100711 16:43:59.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1313, N'HT3K', N'PW8N', '20100823 02:55:37.850', '20110529 22:40:22.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1314, N'7W06', N'8K2B', '20100210 23:31:15.830', '20101101 07:55:43.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1315, N'2ZZV', N'DPO7', '20090512 14:09:54.210', '20100304 01:29:40.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1316, N'LDYY', N'UVE8', '20100319 15:55:21.340', '20100707 02:47:21.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1317, N'GABI', N'O8BN', '20101206 12:45:05.110', '20110225 12:16:55.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1318, N'Y08Y', N'ZR38', '20100212 16:43:49.910', '20100321 22:03:48.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1319, N'B67', N'CC6X', '20100919 09:27:10.720', '20110110 09:49:23.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1320, N'7A2Q', N'7KC2', '20100724 17:33:51.800', '20101107 04:00:23.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1321, N'03OB', N'1X8X', '20091215 11:14:56.940', '20100912 00:17:04.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1322, N'234L', N'4W30', '20090201 01:47:45.980', '20091111 19:07:26.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1323, N'2JR9', N'73PC', '20100501 04:35:40.810', '20100609 02:04:12.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1324, N'5KE1', N'4VGH', '20100411 05:23:08.630', '20100522 19:53:57.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1325, N'1WZK', N'NP59', '20100805 09:44:57.130', '20110515 23:58:22.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1326, N'2GD', N'P3Z6', '20100325 22:09:56.310', '20100905 14:34:33.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1327, N'WCWJ', N'DCSP', '20100314 23:59:36.170', '20101120 20:50:56.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1328, N'LBOY', N'ZEBV', '20100617 06:14:46.180', '20101107 23:49:11.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1329, N'AEP1', N'6QH9', '20100208 23:27:13.020', '20101112 21:24:29.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1330, N'IOVM', N'DIZG', '20090809 17:31:12.400', '20091019 09:09:36.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1331, N'O5RG', N'C7O', '20090901 19:54:36.040', '20091209 12:55:00.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1332, N'BERP', N'ILB8', '20091213 18:30:17.600', '20100426 02:23:47.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1333, N'861J', N'R9TS', '20100513 05:56:40.400', '20101112 11:30:03.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1334, N'6V64', N'X52E', '20101011 06:22:01.370', '20110627 04:54:25.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1335, N'8VNJ', N'2RQT', '20091225 03:20:20.060', '20100922 00:04:35.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1336, N'R93G', N'Z0WK', '20101011 08:04:49.250', '20110609 19:28:06.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1337, N'WUH0', N'D8AZ', '20090417 18:23:07.910', '20100121 14:50:01.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1338, N'Z79I', N'FEDQ', '20090326 15:01:37.270', '20091123 07:19:56.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1339, N'6ELD', N'RP69', '20101118 09:28:42.140', '20101223 11:06:33.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1340, N'DW8M', N'CSYL', '20090714 06:20:10.450', '20090905 11:56:06.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1341, N'XP9G', N'8VMN', '20090818 08:39:11.530', '20091209 22:10:28.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1342, N'3W32', N'KF01', '20100714 14:34:42.830', '20110506 17:34:00.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1343, N'5CBO', N'R441', '20101216 21:21:57.910', '20110218 10:56:54.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1344, N'VA5Q', N'0120', '20090225 03:58:51.150', '20090410 23:01:28.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1345, N'U1M3', N'ZBKF', '20090610 21:58:35.800', '20091027 03:44:19.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1346, N'852S', N'0OTX', '20090914 04:46:42.190', '20100405 21:29:50.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1347, N'ML03', N'4RCX', '20101109 08:33:47.140', '20110614 09:05:12.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1348, N'22N6', N'I7ON', '20100812 08:48:49.810', '20100918 07:46:24.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1349, N'DOH4', N'00F1', '20100817 18:04:16.470', '20110222 09:26:11.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1350, N'PDNO', N'JPBV', '20091119 05:24:14.650', '20100306 13:13:43', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1351, N'CR6L', N'Y7T2', '20090703 11:48:34.350', '20091216 15:47:09.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1352, N'2FN', N'UXY4', '20090521 03:14:27.610', '20091028 00:25:36.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1353, N'4W54', N'QAKZ', '20100213 10:27:51.870', '20100611 19:43:44.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1354, N'WX7V', N'S8ZT', '20101210 21:18:32.240', '20110128 09:03:51.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1355, N'ITM', N'JYP3', '20090201 15:54:22.530', '20090717 22:24:21.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1356, N'ZI3O', N'YCDM', '20091114 18:56:52.550', '20100817 23:17:37.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1357, N'0YU1', N'B14G', '20100131 17:42:09.210', '20100922 04:55:04.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1358, N'LIVZ', N'3JZZ', '20100921 10:45:00.920', '20110326 23:54:17.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1359, N'VEOA', N'QCZD', '20100222 06:01:39.690', '20100627 11:18:27.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1360, N'SP4X', N'X5XO', '20100703 10:58:14.390', '20101226 19:15:51.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1361, N'GXL0', N'DLG2', '20090829 12:26:59.720', '20091123 07:17:00.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1362, N'FDXB', N'6KM7', '20100109 02:21:47.410', '20100918 07:34:43.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1363, N'080J', N'L7JE', '20100917 23:44:12.600', '20101030 00:25:32.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1364, N'TP7E', N'S2TY', '20090902 02:53:33.570', '20100527 08:38:04.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1365, N'KGCG', N'6JBT', '20090522 06:49:59.370', '20090723 05:29:57.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1366, N'3ELK', N'DE1H', '20101108 04:55:28.230', '20110403 04:29:17.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1367, N'WMNV', N'EADQ', '20101227 10:32:19.800', '20110625 05:13:57.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1368, N'ZQIB', N'SN65', '20101111 20:33:36.490', '20101202 17:45:57.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1369, N'GXL0', N'5CDH', '20090217 20:10:55.770', '20091207 07:51:09.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1370, N'3KIP', N'EQHG', '20090801 06:05:04.960', '20090924 06:01:35.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1371, N'JVSS', N'I4IC', '20091202 21:32:13.420', '20100412 11:57:21.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1372, N'B67', N'8KPG', '20100912 21:43:27.830', '20110130 04:57:00.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1373, N'19N8', N'8BYF', '20100327 07:15:07.780', '20100329 10:57:16.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1374, N'7CDQ', N'ZIKQ', '20100309 03:07:00.270', '20100507 21:53:17.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1375, N'Q4KM', N'YO9I', '20091207 08:54:40.270', '20100925 05:49:55.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1376, N'7N2P', N'ILB8', '20100602 20:40:14.120', '20110304 06:43:05.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1377, N'1D10', N'EADQ', '20090215 04:25:48.070', '20090923 08:10:32.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1378, N'3J6H', N'7359', '20100307 00:36:49.650', '20101226 03:02:44.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1379, N'NUSR', N'5CDH', '20091101 07:24:32.830', '20100523 16:09:39.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1380, N'E1C', N'MRD3', '20091122 04:58:14.930', '20100210 02:28:33.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1381, N'Z4AK', N'KI4X', '20100516 13:36:09.170', '20110118 05:29:22.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1382, N'AEWT', N'VIKA', '20100802 15:10:46.370', '20110304 13:04:32.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1383, N'ZOSD', N'ZBKF', '20101030 12:10:29.720', '20110712 14:23:01.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1384, N'W0I5', N'O4LC', '20090323 18:02:58.370', '20090909 08:10:47.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1385, N'DYW4', N'F8YM', '20090207 05:42:38.040', '20090830 17:22:28.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1386, N'2A86', N'I5GG', '20090414 16:40:08.420', '20091209 12:29:25.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1387, N'5TKK', N'S6EE', '20101030 08:02:25.730', '20101114 06:40:03.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1388, N'82UZ', N'YY6V', '20100602 08:38:08.170', '20101015 02:26:12.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1389, N'B68F', N'DXY7', '20100909 14:27:38.830', '20101211 06:30:05.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1390, N'9R9T', N'4KZP', '20090210 08:23:27.500', '20091202 00:46:58.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1391, N'B5PD', N'OF2U', '20090910 14:22:40.030', '20090918 14:33:03.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1392, N'TGHK', N'9DTT', '20090727 07:38:07', '20091027 14:55:44.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1393, N'XD26', N'PFCI', '20100201 08:59:57.580', '20100528 20:01:29.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1394, N'610I', N'UVE8', '20090518 22:30:27.740', '20091024 15:50:43.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1395, N'BRO2', N'ZEBV', '20101114 17:53:10.740', '20110809 04:39:07.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1396, N'NPP0', N'2FK4', '20100809 06:17:24.130', '20110117 14:35:46.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1397, N'VNF6', N'Z0WK', '20101026 14:50:30.230', '20110707 17:08:28.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1398, N'1RUX', N'YY6V', '20100416 18:28:24.340', '20100722 02:18:51.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1399, N'PKCY', N'TKEM', '20101005 21:08:51.790', '20110715 17:31:31.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1400, N'DFQE', N'MDZ7', '20090802 17:03:07.570', '20100521 23:15:02.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1401, N'3J6H', N'N1B0', '20090917 18:14:22.400', '20091011 16:15:53.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1402, N'0NF5', N'C7O', '20101228 12:00:10.660', '20110712 15:19:15.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1403, N'DIRR', N'C00K', '20100625 12:37:54.030', '20100808 23:55:15.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1404, N'RAZD', N'LTTB', '20100117 11:59:11.510', '20100601 03:24:37.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1405, N'09WT', N'1CU7', '20101217 07:52:01.230', '20110920 01:16:22.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1406, N'CH4F', N'PWTT', '20091020 14:05:06.530', '20091116 10:50:10.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1407, N'FJAE', N'MPTO', '20100223 19:59:19.830', '20100731 13:28:20.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1408, N'BNYZ', N'QY16', '20101207 07:20:51.610', '20110203 21:50:27.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1409, N'2OL1', N'TP4W', '20100104 12:23:51.960', '20100302 03:13:57.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1410, N'F8Q7', N'0QKV', '20090831 19:14:08.420', '20100311 15:41:16.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1411, N'5WQ2', N'KUE3', '20090930 14:31:04.480', '20091125 15:07:05.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1412, N'DTR1', N'3W95', '20101126 17:05:19.570', '20110724 01:52:20.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1413, N'XXOC', N'Y56U', '20091121 03:20:28.080', '20100831 07:44:39.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1414, N'7GC0', N'3JRV', '20090403 01:03:24.750', '20090518 08:49:55.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1415, N'G5U', N'DCSP', '20090217 21:22:05.210', '20091005 13:46:29.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1416, N'1S62', N'IES1', '20100126 21:16:13.350', '20100717 18:12:28.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1417, N'F55', N'73PC', '20100311 14:11:17.700', '20110102 17:11:42.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1418, N'CD2Z', N'X52E', '20100628 05:41:14.230', '20101217 16:14:45.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1419, N'IQ8T', N'D2FT', '20090726 21:10:55.520', '20090927 15:15:36.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1420, N'1KHT', N'PAQS', '20090207 14:09:50.950', '20090610 17:00:33.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1421, N'QXDR', N'LIMP', '20090109 20:53:02.500', '20090520 21:49:14.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1422, N'77FL', N'F8YM', '20090728 01:54:11.620', '20090911 02:47:45.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1423, N'66RZ', N'F4E7', '20090305 06:05:57.650', '20091019 11:15:53.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1424, N'MHRP', N'0QWV', '20090108 11:47:28.260', '20091102 07:04:12.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1425, N'BR7S', N'QSVV', '20101120 15:42:24.930', '20110105 15:28:33.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1426, N'L3PN', N'86RW', '20090509 13:54:06.420', '20090616 21:01:38.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1427, N'ZYBL', N'K115', '20090812 12:43:30.240', '20090904 08:55:31.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1428, N'DYW4', N'DSJI', '20091109 08:44:40.030', '20100401 19:06:34.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1429, N'PNEA', N'05M', '20100424 09:13:49.530', '20100725 17:14:11.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1430, N'6S4A', N'VYUT', '20100430 02:37:16.150', '20100907 15:14:09.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1431, N'7LJU', N'JYP3', '20100807 05:49:43.890', '20100827 13:34:37.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1432, N'FCP7', N'F8OA', '20091031 09:57:23.740', '20100304 05:51:42.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1433, N'AY8W', N'DSJI', '20100601 03:27:57.870', '20100612 09:31:14.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1434, N'E41F', N'K9YB', '20090401 14:21:25.250', '20091029 16:54:37.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1435, N'OM2B', N'ZOUA', '20090307 10:43:52.530', '20090502 10:12:40.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1436, N'0HWY', N'7KC2', '20100519 01:35:58.510', '20100708 14:10:07.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1437, N'73LE', N'K2V', '20090208 02:32:52.330', '20090727 13:09:17.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1438, N'ANG1', N'E04B', '20091014 00:11:18.200', '20100211 10:58:25.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1439, N'BFOB', N'ML1M', '20090406 10:10:57.140', '20091016 06:54:26.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1440, N'LQHG', N'PR9R', '20100419 15:37:31.520', '20101014 06:32:19.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1441, N'GURU', N'V8GU', '20100218 20:40:48.590', '20100510 23:01:05.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1442, N'YJL1', N'1FRY', '20101123 00:41:34.130', '20110806 08:49:37.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1443, N'DZLE', N'554Z', '20090529 20:14:16.200', '20090815 23:12:16.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1444, N'19N8', N'CU5U', '20100109 19:13:30.410', '20100729 14:48:50', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1445, N'CIB3', N'KZME', '20100512 17:52:23.030', '20110106 09:39:53.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1446, N'82QB', N'KQY1', '20091014 21:17:20.470', '20091222 12:40:43.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1447, N'REK3', N'BD30', '20100905 04:17:38.920', '20101223 07:11:06.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1448, N'5CHJ', N'LTTB', '20091101 07:56:32.820', '20100111 11:11:34.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1449, N'72DM', N'I17C', '20090401 01:08:22.530', '20091116 02:04:14.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1450, N'5OJ2', N'HXQ', '20091019 20:36:57.380', '20100123 10:26:40.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1451, N'MSBM', N'V8GU', '20090531 16:06:06.430', '20091111 21:24:04.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1452, N'UUV3', N'1YKM', '20090501 09:09:16', '20090722 00:53:43.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1453, N'431J', N'MDZ7', '20090921 21:17:28.810', '20091025 11:03:16.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1454, N'QERL', N'4KZP', '20100829 06:59:00.840', '20110205 00:30:59.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1455, N'D4Z2', N'0PCN', '20090724 20:10:05.070', '20100102 01:25:49.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1456, N'951I', N'7KZY', '20090221 16:20:10.770', '20091127 13:28:09.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1457, N'K9JD', N'XF1Z', '20101026 05:54:13.010', '20110721 04:03:23.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1458, N'ABY6', N'B0EN', '20100618 00:50:25.760', '20100803 16:51:04.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1459, N'68KL', N'V6WQ', '20100226 20:16:46.580', '20100526 11:56:04.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1460, N'UKCD', N'TC8F', '20100810 17:57:54.810', '20110406 04:14:45.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1461, N'UHUR', N'6DVJ', '20090311 01:21:36.280', '20090315 01:54:39.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1462, N'G0VL', N'8P8O', '20090417 11:14:39.790', '20090501 18:21:47.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1463, N'D6L0', N'QPJ0', '20090815 22:07:02.070', '20100509 04:36:17.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1464, N'51I4', N'XGSU', '20100906 09:46:35.820', '20110420 11:59:48.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1465, N'4NER', N'I9R0', '20100124 13:24:24.530', '20100715 02:06:39.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1466, N'IR5Q', N'4Z84', '20101130 04:33:40.740', '20110720 09:15:24.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1467, N'EOPN', N'QLVW', '20090628 13:37:21.700', '20100211 16:21:07.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1468, N'86TK', N'EN1A', '20090822 12:59:02.830', '20091102 14:50:03.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1469, N'A0V1', N'3W95', '20090127 14:19:32.220', '20091112 22:37:16.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1470, N'7R4K', N'5BOE', '20091001 19:46:06.700', '20100329 23:36:23.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1471, N'O4B6', N'YLQI', '20091219 18:43:21.010', '20091222 05:03:11.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1472, N'VGL8', N'TJ7N', '20090529 13:59:59.490', '20091122 06:13:18.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1473, N'AQYZ', N'AFDW', '20100324 19:30:17.080', '20101229 09:20:20.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1474, N'PYJK', N'NS7I', '20100408 05:33:24.010', '20101010 08:43:18.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1475, N'IX4T', N'TXFL', '20091219 17:29:02.360', '20100130 17:59:28.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1476, N'QF0L', N'KC4G', '20090216 20:11:28.370', '20090810 12:59:38.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1477, N'7IBQ', N'9QXE', '20090301 05:39:55.420', '20091123 03:35:29.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1478, N'0KEQ', N'1Y74', '20100223 10:52:27.240', '20100322 20:27:04.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1479, N'QF0L', N'GZTR', '20090828 17:55:05.240', '20091026 21:24:19.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1480, N'G95F', N'6E3O', '20100206 18:25:04.460', '20101111 02:47:50.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1481, N'5K9O', N'WZJC', '20090903 09:36:27.500', '20100420 13:50:32.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1482, N'1336', N'XZ4O', '20101011 04:46:57.420', '20110619 21:43:58.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1483, N'OVC7', N'W78D', '20090811 07:36:17.500', '20100313 17:02:20.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1484, N'BLXC', N'JK5', '20090706 12:36:52.140', '20100429 06:47:32.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1485, N'IPVC', N'0QWV', '20091130 10:31:09.720', '20100823 17:50:05.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1486, N'5K9O', N'HI5Y', '20100408 20:40:27.890', '20101203 12:40:55.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1487, N'X7O1', N'T41U', '20090209 12:39:54.920', '20090510 18:48:26.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1488, N'DYOF', N'8VMN', '20101002 20:28:57.030', '20110303 09:00:15.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1489, N'VR4W', N'JI8O', '20100907 18:11:20.180', '20101027 15:28:49.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1490, N'UHU5', N'S5YU', '20090114 18:23:41.760', '20090401 20:44:32.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1491, N'AIA5', N'A4QV', '20100723 19:41:45.510', '20101014 10:06:44.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1492, N'1YYB', N'8GJP', '20090823 01:42:26.570', '20091223 20:18:14.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1493, N'5Y8F', N'JIEW', '20100817 03:54:31.620', '20100917 23:02:21.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1494, N'RXHA', N'SZO3', '20090826 16:13:02.340', '20100508 02:39:42.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1495, N'VV63', N'JWH3', '20100209 14:15:55.230', '20100802 04:37:40.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1496, N'0047', N'MMZU', '20091104 09:26:08.790', '20100110 04:39:19.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1497, N'GABT', N'B0EN', '20100410 02:34:32.050', '20110125 04:13:21.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1498, N'20OC', N'7RDH', '20090922 10:27:40.390', '20100221 11:12:29.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1499, N'JAWW', N'V6WQ', '20101216 05:49:05.880', '20110114 12:42:11.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1500, N'5ANG', N'FDA8', '20100612 13:18:42.290', '20100619 00:24:29.820', 1)
GO

--
-- Data for table dbo.ChiTietHoaDon_WebTower9  (LIMIT 2000,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1501, N'0CFI', N'TXK5', '20090419 07:39:58.770', '20090906 20:19:37.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1502, N'6V64', N'X52E', '20100114 15:18:36.080', '20100220 16:21:04.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1503, N'PTUA', N'I7GI', '20091005 17:37:00.600', '20091226 12:34:19.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1504, N'W03', N'BR7C', '20100630 05:22:15.830', '20100819 02:27:51.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1505, N'QS6X', N'JK5', '20101031 01:53:36.370', '20110201 05:23:29.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1506, N'BWM6', N'1ND4', '20090103 02:06:06.930', '20091017 15:10:47.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1507, N'DGQE', N'RHEY', '20100206 13:38:58.920', '20100519 15:33:24.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1508, N'UJSG', N'YP3N', '20100615 15:44:04.800', '20101111 02:19:59.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1509, N'744F', N'ALVY', '20090910 13:29:58.470', '20100106 06:31:31.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1510, N'1CWJ', N'HQLF', '20090607 23:58:36.690', '20100321 12:26:11.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1511, N'HO60', N'XZ4O', '20101223 10:40:15.360', '20110104 09:52:40.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1512, N'U17F', N'VBET', '20090902 19:01:45.770', '20100501 07:36:20.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1513, N'IOVM', N'UR2X', '20091021 06:55:20.520', '20100804 19:26:45.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1514, N'FSTI', N'P311', '20090121 01:51:42.120', '20090512 09:08:14.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1515, N'7AJW', N'WS72', '20091208 08:21:27.310', '20091217 14:24:13.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1516, N'CR6L', N'8KPG', '20090530 20:34:38.860', '20090722 04:10:42.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1517, N'4TEG', N'CIZ8', '20100906 03:38:22.300', '20101215 01:19:27.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1518, N'67BI', N'7KZY', '20090210 09:30:09.920', '20091106 21:48:45.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1519, N'XQI3', N'WH1E', '20091007 23:15:26.100', '20100624 18:09:44.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1520, N'WXAM', N'0KI3', '20101017 16:43:56.650', '20110607 13:25:45.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1521, N'7994', N'BWFF', '20101021 15:53:45.810', '20110312 14:26:59.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1522, N'8P26', N'HSYO', '20090925 17:08:24.670', '20091211 07:20:52.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1523, N'P0D', N'VP80', '20091214 18:47:42.660', '20100105 23:21:14.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1524, N'LKPQ', N'BQN1', '20090113 19:55:50.450', '20090814 01:52:44.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1525, N'CHOE', N'VAFX', '20100311 00:04:21.200', '20100615 13:29:39.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1526, N'CONZ', N'QAV7', '20090429 17:00:54.430', '20091026 08:44:58.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1527, N'DZUR', N'AIPO', '20091012 10:05:27.870', '20100306 07:10:58.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1528, N'3B61', N'I95C', '20090730 03:17:14.740', '20090824 06:40:38.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1529, N'6ZZC', N'4863', '20090227 15:17:28.770', '20090311 04:05:38.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1530, N'U8OI', N'77J5', '20090215 08:02:53.560', '20091117 13:20:10.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1531, N'BNYZ', N'8MBW', '20091108 17:36:56.330', '20100512 08:46:18.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1532, N'VLQ8', N'1X8X', '20100608 19:12:15.030', '20101001 16:23:01.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1533, N'EMHB', N'6XFQ', '20100310 05:03:21.360', '20110102 07:44:53.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1534, N'6W9B', N'10VV', '20100318 04:36:22.960', '20100509 20:59:50.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1535, N'02GY', N'CHW9', '20091021 10:45:05.680', '20100307 06:28:14.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1536, N'9NN', N'ZR38', '20100819 18:17:51.420', '20110227 21:29:29.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1537, N'BV3S', N'GC7B', '20100106 11:09:56.820', '20100625 09:09:39.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1538, N'132F', N'KXXU', '20100211 02:14:01.680', '20100725 14:34:29.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1539, N'6G5K', N'00F1', '20090905 10:43:15.780', '20100328 01:24:03.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1540, N'11NX', N'Z9HB', '20091128 08:25:02.780', '20100903 02:39:19.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1541, N'5QUJ', N'PWKZ', '20090303 07:01:28.960', '20090717 21:07:31.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1542, N'G94P', N'UR2X', '20090826 20:55:50.130', '20100425 16:28:28.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1543, N'A1Y4', N'Y7T2', '20100123 06:58:58.560', '20100226 02:28:45.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1544, N'LH2V', N'1FRY', '20100402 18:12:43.480', '20100605 03:02:38.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1545, N'67BI', N'UHDP', '20090122 07:43:26.410', '20090328 10:51:52.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1546, N'D6L0', N'F4WI', '20091121 00:39:59.730', '20100412 02:30:25.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1547, N'FOI1', N'E7WI', '20101101 18:47:06.060', '20110317 00:51:29.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1548, N'GXY0', N'UBIC', '20100728 02:02:49.500', '20110305 13:54:07.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1549, N'QVFP', N'WD3A', '20100918 07:51:35.040', '20110521 12:15:30.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1550, N'GB4O', N'ACJY', '20090912 17:41:16.370', '20100112 00:26:59.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1551, N'5IA3', N'9OFQ', '20100228 05:47:46.500', '20101122 03:19:52.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1552, N'4LI3', N'38C7', '20100228 17:04:22.120', '20100321 06:24:36.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1553, N'J3CY', N'BDUP', '20101215 11:12:14.300', '20110625 17:02:45.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1554, N'DA7H', N'UHDP', '20090301 13:05:09.230', '20090605 23:16:26.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1555, N'NHYY', N'35YV', '20100821 21:24:56.480', '20110202 09:57:31.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1556, N'HON5', N'CIZ8', '20100724 14:31:34.100', '20100926 12:58:45.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1557, N'LPTV', N'12BM', '20090131 20:30:53.420', '20090215 16:59:50.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1558, N'RVWT', N'5OEJ', '20090922 21:41:10.150', '20100311 10:41:35.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1559, N'8SXC', N'GZTR', '20090422 05:17:54.620', '20091231 12:58:13.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1560, N'6ZDF', N'SN65', '20100704 08:52:41.930', '20110202 20:38:31.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1561, N'ERB2', N'R441', '20100323 16:00:39.070', '20100813 07:59:49.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1562, N'F4PN', N'9K9A', '20090711 10:21:44.180', '20090926 08:52:47.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1563, N'7N2P', N'UHDP', '20100419 00:26:36.020', '20100902 22:14:22.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1564, N'V3OC', N'38C7', '20090727 05:27:04.900', '20091216 17:11:21.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1565, N'LRY6', N'8MB2', '20100730 06:21:40.370', '20101109 03:39:54.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1566, N'610I', N'VS3Z', '20090717 15:28:00.320', '20100130 17:29:39.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1567, N'11PV', N'OSYO', '20100625 13:58:24.410', '20110222 23:51:27.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1568, N'UQ9C', N'T9CQ', '20100805 02:18:57.560', '20110327 22:26:56.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1569, N'PN7V', N'C0D3', '20100401 15:06:36.440', '20110101 02:40:01.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1570, N'FW78', N'X0B4', '20100420 14:03:35.890', '20100815 16:54:45.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1571, N'FCH8', N'SI0H', '20100524 09:24:42.050', '20101122 19:01:03.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1572, N'SW19', N'S8ZT', '20090727 01:24:20.610', '20100319 10:44:59.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1573, N'72VU', N'7KZY', '20100606 22:46:54.150', '20100811 20:24:42.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1574, N'THC9', N'XA5I', '20101109 14:50:23.320', '20110817 15:30:25.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1575, N'X5UL', N'B14G', '20100817 09:42:27.690', '20101121 16:18:15.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1576, N'GB4O', N'I4OY', '20100225 18:57:55.680', '20100913 21:58:31.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1577, N'HG3O', N'JVDF', '20100902 10:09:26.110', '20101015 04:52:07.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1578, N'5WEQ', N'UEHS', '20100913 00:34:59.180', '20110529 20:18:37.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1579, N'UYQX', N'I4IC', '20101222 12:12:24.040', '20110518 15:00:53.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1580, N'22N6', N'GHZ6', '20090420 23:24:21.460', '20091231 10:59:15.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1581, N'JP18', N'CB7S', '20090627 22:13:48.380', '20090811 07:53:30.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1582, N'693G', N'GZTR', '20100317 08:02:38.380', '20101027 17:16:51.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1583, N'X8L2', N'LSP6', '20091110 19:25:39.710', '20100129 18:25:09.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1584, N'UE0B', N'TUHX', '20100616 21:36:12.410', '20101224 03:38:39.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1585, N'GD1J', N'XMX3', '20091218 02:15:07.070', '20091226 10:00:19.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1586, N'8BES', N'52QR', '20100910 00:32:34.210', '20110221 02:21:43.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1587, N'ZRY6', N'QTL4', '20100624 08:00:00.740', '20110201 23:20:16.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1588, N'766Y', N'CNE5', '20100109 15:58:12.130', '20100730 08:28:28.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1589, N'0C00', N'Y0RQ', '20100727 07:11:26.490', '20110131 11:02:20.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1590, N'L6W5', N'ZY4V', '20100329 20:13:31.590', '20100610 17:29:29.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1591, N'C6RG', N'YKJF', '20100719 21:46:57.990', '20110113 04:29:39.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1592, N'5WQ5', N'A7BE', '20090416 13:28:46.670', '20090416 22:28:05.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1593, N'B8D4', N'3P75', '20091022 20:56:07.050', '20100522 01:36:17.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1594, N'SYQW', N'76GJ', '20100304 01:50:33.850', '20101219 04:45:33.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1595, N'6WPC', N'8CEI', '20100906 16:24:23.720', '20110120 18:39:30.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1596, N'PAHC', N'G47T', '20100822 20:39:44.780', '20101021 12:14:44.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1597, N'TOZG', N'073S', '20100509 20:29:14.110', '20100822 18:14:07.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1598, N'K8HM', N'V4P7', '20090630 01:31:53.650', '20100107 09:17:25.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1599, N'IW0K', N'SZO3', '20100903 11:51:03.120', '20110522 23:22:45.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1600, N'994O', N'YJRS', '20100707 16:15:26.100', '20101222 17:22:14.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1601, N'GXVH', N'QY9', '20100528 10:41:35.330', '20101214 02:38:58.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1602, N'LFQU', N'L8X3', '20090330 16:28:08.500', '20091017 02:24:34.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1603, N'K9JD', N'IF06', '20090428 10:56:13.050', '20091230 11:14:07.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1604, N'CVOE', N'ZIKQ', '20090531 17:47:59.140', '20091006 19:20:45.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1605, N'NX6R', N'INSL', '20100421 08:16:34.330', '20101216 05:25:57.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1606, N'VNIT', N'I5GG', '20090805 04:23:25.880', '20090905 16:34:53.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1607, N'QD57', N'VPAM', '20100923 18:17:27.970', '20110605 09:59:54.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1608, N'33YZ', N'ED4U', '20090205 20:21:50.970', '20090905 01:32:21.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1609, N'TX8G', N'JZEI', '20090715 03:22:41.540', '20090715 06:58:12.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1610, N'77FL', N'M6IB', '20090627 02:27:00.790', '20100318 11:59:01.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1611, N'CATH', N'TKEM', '20101121 04:22:07.990', '20101212 08:06:39.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1612, N'BTT8', N'6YJJ', '20090520 19:55:54.240', '20090715 20:41:14.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1613, N'2KMJ', N'OSYO', '20091001 09:28:46.110', '20091023 19:40:43.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1614, N'I8IP', N'0B1T', '20090102 05:53:33.160', '20091028 01:58:58.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1615, N'JTKR', N'GSHS', '20100107 10:38:53.550', '20100625 12:45:02.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1616, N'93FD', N'A7KC', '20090107 07:58:00.690', '20090813 14:42:58.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1617, N'D80J', N'OSTO', '20100830 14:56:04.480', '20110623 14:27:39.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1618, N'766Y', N'0GND', '20101102 02:50:23.620', '20110706 18:35:43.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1619, N'UEYL', N'5FLX', '20100809 03:11:57.840', '20101221 07:11:02.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1620, N'URMC', N'37F0', '20101119 05:49:06.160', '20110715 01:18:11.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1621, N'DYW4', N'554Z', '20100123 07:27:59.590', '20101024 18:09:23.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1622, N'GZ4M', N'BGM1', '20090616 22:00:12.280', '20090727 15:23:00.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1623, N'FWXJ', N'VAFX', '20090109 19:07:31.070', '20090225 11:24:36.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1624, N'GD1J', N'C0D3', '20090103 18:53:04.850', '20090724 09:10:32.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1625, N'40ZT', N'YF7X', '20101001 16:16:37.900', '20110529 12:25:06.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1626, N'CIB3', N'IEIF', '20100207 19:55:55.380', '20100808 20:32:58.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1627, N'9YIR', N'OXND', '20101004 04:28:13.570', '20101028 09:08:42.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1628, N'0Z83', N'0B1T', '20090405 20:56:20.300', '20090620 15:39:10.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1629, N'JJ4Q', N'PAQS', '20090305 22:25:59.600', '20090728 20:50:55.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1630, N'SCLR', N'V79', '20101225 13:02:42.910', '20110131 04:03:31.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1631, N'X3PM', N'HXQ', '20101018 22:28:41.580', '20110122 03:44:25.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1632, N'RTRP', N'OS1P', '20100306 08:37:32.460', '20100804 19:34:43.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1633, N'BEKS', N'12BM', '20090110 12:43:56.060', '20091103 20:55:52.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1634, N'58SD', N'JW1L', '20090617 19:56:57.940', '20100323 21:38:40.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1635, N'T8W4', N'PWTT', '20091123 12:42:46.140', '20100117 08:20:17.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1636, N'Y8UU', N'RKMG', '20090331 05:45:39.880', '20090822 05:28:57.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1637, N'ZOSD', N'YK1U', '20091119 21:06:25.320', '20100825 06:02:45.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1638, N'KQMW', N'MA33', '20090613 01:37:40.560', '20100219 23:04:24.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1639, N'N3YC', N'BDV8', '20090226 13:19:38.080', '20091104 22:12:42.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1640, N'6ZTL', N'GAJ6', '20090515 21:51:41.180', '20100216 17:25:26.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1641, N'IG83', N'9FZA', '20101217 06:15:06.250', '20110714 16:21:49.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1642, N'0XJZ', N'CDU', '20100519 11:38:09.760', '20100530 21:47:56.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1643, N'YM31', N'TI56', '20090628 12:35:30.580', '20100116 01:30:16.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1644, N'I9O9', N'C6E6', '20100131 04:44:25.690', '20100911 23:03:19.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1645, N'6R26', N'6GKZ', '20100508 15:51:23.600', '20100629 09:22:51.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1646, N'KCKP', N'RIPB', '20100302 01:51:03.750', '20100701 07:48:26.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1647, N'IX4T', N'MEAF', '20100716 04:00:00.560', '20110420 02:47:23.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1648, N'A275', N'3HRB', '20091021 15:02:33.890', '20100521 23:37:19.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1649, N'5ANG', N'R441', '20090225 15:11:40.290', '20090626 16:00:31.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1650, N'5KE1', N'XZNW', '20100831 08:26:23.020', '20110406 03:56:33.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1651, N'C9B6', N'RSH7', '20101223 05:43:40.310', '20110223 21:47:06.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1652, N'GB4O', N'ZJVS', '20100707 17:38:50.490', '20101212 23:38:24.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1653, N'37AR', N'PCU1', '20091120 22:19:55.820', '20100117 02:06:23.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1654, N'CW2V', N'PW8N', '20101015 06:01:56.960', '20101107 22:04:34.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1655, N'0JBB', N'T56R', '20090615 08:47:26.510', '20091225 23:12:51.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1656, N'BR7S', N'F6SF', '20091212 12:41:23.040', '20100520 11:15:59.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1657, N'3TT0', N'PNMO', '20090321 21:20:37.420', '20090822 14:59:58.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1658, N'NRH7', N'5RT5', '20090425 16:03:08.190', '20090609 02:03:35.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1659, N'4ZKQ', N'0YDC', '20090830 01:31:21.240', '20100306 06:55:40.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1660, N'31LO', N'0C10', '20090314 12:20:38.950', '20090510 08:53:00.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1661, N'G09J', N'T8P5', '20091031 23:55:12.320', '20091108 07:26:12.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1662, N'MB25', N'VHQW', '20100620 21:21:07.670', '20101216 18:20:44.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1663, N'6OVY', N'PK3Y', '20101202 21:55:51.370', '20110207 04:41:26.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1664, N'K3DJ', N'OOO0', '20090720 14:19:58.640', '20100410 02:54:41.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1665, N'JA23', N'4DI7', '20090908 03:58:19.210', '20100224 08:14:36.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1666, N'H3BB', N'554Z', '20090917 19:44:35.530', '20100306 12:31:56.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1667, N'4QOB', N'5OEJ', '20090511 07:11:58.170', '20090708 23:45:22.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1668, N'ZJTT', N'52QR', '20090416 13:31:48.160', '20090529 22:02:04.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1669, N'73LE', N'ACJY', '20100208 17:10:47.020', '20101010 17:38:42.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1670, N'0XJZ', N'P7DQ', '20091010 04:53:13.670', '20091104 07:16:06.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1671, N'JNUW', N'BVAE', '20100217 10:51:35.370', '20101015 08:40:13.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1672, N'0CFI', N'2DTQ', '20100320 13:18:23.910', '20100504 15:23:15.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1673, N'FDXB', N'PFCI', '20100906 13:30:45.540', '20110628 20:23:02.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1674, N'CB2G', N'PW8N', '20100327 05:20:16.650', '20100831 13:45:36.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1675, N'03OB', N'TXK5', '20101202 23:33:59.920', '20101231 08:56:22.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1676, N'LPTV', N'SZXN', '20100905 19:49:49.830', '20110526 20:21:28.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1677, N'73AT', N'IHJK', '20101219 09:24:41.710', '20110507 13:52:44.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1678, N'NUSR', N'JW1L', '20091209 14:23:05.380', '20100411 12:21:18.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1679, N'LFO5', N'5CDH', '20090828 03:01:41.260', '20100124 23:47:42.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1680, N'ZNSL', N'6T1V', '20090802 14:25:34.150', '20091129 04:36:41.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1681, N'3CBF', N'VS3Z', '20100725 15:55:54.820', '20110214 17:45:36.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1682, N'6EBE', N'LCZD', '20091214 13:25:39.670', '20100405 09:31:24.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1683, N'DBNF', N'95Q1', '20090209 05:44:40.010', '20091021 23:38:40.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1684, N'NHYY', N'R9OY', '20090705 13:59:36.580', '20100217 16:54:23.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1685, N'BWGU', N'38C7', '20090103 07:19:02.590', '20091004 06:16:25.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1686, N'9BS3', N'I9BY', '20090414 04:49:51.080', '20091207 04:06:01.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1687, N'KGCG', N'Z35T', '20090416 10:17:36.630', '20090719 17:28:21.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1688, N'NJ5P', N'BMDB', '20090328 06:41:59.110', '20091226 22:51:18.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1689, N'831K', N'Q9A', '20090103 11:09:31.430', '20090329 22:25:49.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1690, N'HZDC', N'ACJY', '20101212 00:01:23.110', '20110625 21:04:19.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1691, N'36FB', N'1YKM', '20090110 08:25:02.450', '20091027 14:28:59.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1692, N'SHVC', N'SKWM', '20090728 05:03:17.130', '20100319 03:59:11.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1693, N'F6G0', N'L4F7', '20101014 00:06:19.320', '20101216 16:08:45.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1694, N'CCUI', N'B14G', '20101215 00:58:59.140', '20110627 13:19:43.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1695, N'H245', N'N7TU', '20100714 21:56:28.870', '20110410 09:59:15.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1696, N'7JDD', N'EADQ', '20090629 08:53:58.570', '20090729 22:01:06.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1697, N'O8ZB', N'NGC8', '20100616 13:42:18.400', '20110216 17:06:30.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1698, N'7Y67', N'53SM', '20101208 22:15:31.950', '20110803 22:35:36.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1699, N'Z58U', N'7OE6', '20090526 00:46:06.470', '20090719 14:48:43.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1700, N'9HF6', N'0XID', '20090821 20:06:48.060', '20100219 20:50:55.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1701, N'G0N0', N'M49C', '20091022 18:39:05.570', '20091224 08:03:04.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1702, N'HO60', N'HADO', '20100401 14:28:12.400', '20101122 04:45:20.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1703, N'KU0K', N'SZO3', '20100911 21:51:46.870', '20110607 05:58:38.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1704, N'CH4F', N'1YKM', '20100518 10:18:26.630', '20100822 08:44:25.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1705, N'WCWJ', N'MAL4', '20090714 21:34:47.650', '20100418 19:16:20.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1706, N'MHRP', N'PKIK', '20091005 16:25:16.400', '20091023 06:23:51.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1707, N'E3XS', N'A7KC', '20101031 04:08:04.960', '20110412 03:15:23.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1708, N'B7AG', N'ZIUH', '20100826 16:59:39.180', '20110314 12:20:47.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1709, N'4W54', N'VPU3', '20101112 06:27:57.050', '20110903 13:08:12.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1710, N'DQZF', N'03P0', '20091009 12:57:36.680', '20100528 02:51:24.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1711, N'N3YC', N'X4L8', '20091224 03:16:41.340', '20100112 21:23:15.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1712, N'EP1O', N'6DVJ', '20100412 06:57:32.050', '20100513 02:38:41.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1713, N'CW4C', N'0DLE', '20100828 13:01:26.940', '20110311 02:15:53.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1714, N'GH97', N'UK8Q', '20090128 11:05:47.090', '20090408 02:18:59.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1715, N'FK7H', N'4FUZ', '20090819 20:24:44.130', '20100119 15:07:25.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1716, N'TO3B', N'8BYF', '20101117 10:29:32.650', '20110531 21:54:48.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1717, N'C6XT', N'MG0V', '20100512 15:36:27.660', '20101222 18:42:04.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1718, N'FY9O', N'Y7T2', '20100531 07:56:14.780', '20101017 11:47:04.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1719, N'RVUA', N'LAW0', '20090718 07:00:56.040', '20100503 20:38:16.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1720, N'I2YI', N'MTQU', '20090527 23:08:28.120', '20100115 04:08:36.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1721, N'NUW3', N'69C1', '20090604 09:26:58.900', '20090818 19:03:36.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1722, N'AZ4S', N'UBIC', '20090214 00:29:59.060', '20090510 00:54:05.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1723, N'OMDR', N'FC25', '20090414 02:22:16.720', '20091227 23:36:15.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1724, N'24Q0', N'ZY4V', '20100227 17:09:23.920', '20100416 20:34:23.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1725, N'PBMX', N'N1B0', '20090930 20:28:11.210', '20091104 16:47:07.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1726, N'OIKG', N'K35S', '20090724 05:48:18.240', '20090730 04:41:03.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1727, N'CHIE', N'I95C', '20100606 13:12:04.590', '20110314 23:14:31.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1728, N'6FWM', N'EAOY', '20100922 12:31:46.410', '20110101 07:03:19.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1729, N'D1D0', N'2KN2', '20100912 07:23:47.790', '20110319 03:46:22.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1730, N'I2YI', N'FYHJ', '20100606 14:40:01.340', '20110331 10:55:17.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1731, N'G95F', N'5P36', '20090323 06:07:31.430', '20090410 03:14:58.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1732, N'Y5FG', N'D2FT', '20090111 11:09:09.760', '20090731 15:17:09.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1733, N'66RZ', N'BCUS', '20090717 13:36:58.900', '20090923 21:32:35.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1734, N'B5PD', N'4FUZ', '20090107 06:54:53.190', '20091002 02:56:48.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1735, N'610I', N'LOUM', '20101010 19:46:28.580', '20101205 20:33:38.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1736, N'PAHC', N'F622', '20090426 01:27:42.410', '20100120 13:00:16.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1737, N'2M5W', N'S0Y4', '20100403 15:33:52.810', '20100825 03:32:46.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1738, N'JTKR', N'7359', '20090923 19:26:13.380', '20100301 14:54:15.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1739, N'E5GP', N'517H', '20101221 16:24:48.940', '20110827 21:38:03.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1740, N'XAYB', N'E9Y5', '20100330 14:53:46.190', '20101211 23:52:34.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1741, N'E1C', N'75YM', '20090614 00:41:46.130', '20090827 00:50:39.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1742, N'LUWX', N'ZIUH', '20090820 17:17:57.460', '20100303 05:07:34.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1743, N'5TKK', N'G2NH', '20090516 00:14:02.060', '20100218 09:43:06.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1744, N'6FWM', N'Q8LO', '20100326 22:11:54.750', '20100828 19:34:26.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1745, N'922F', N'DXKL', '20091219 20:44:41.760', '20100613 23:41:04.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1746, N'82QB', N'VPAM', '20090930 01:27:30.410', '20100616 11:50:19.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1747, N'0DMU', N'S6EE', '20091129 16:01:50.190', '20100108 01:43:18.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1748, N'0THI', N'QMBS', '20100916 13:00:32.230', '20110707 13:49:46.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1749, N'G0VL', N'6KNI', '20100428 04:34:15', '20100608 22:12:19.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1750, N'DNVN', N'F14T', '20100827 11:26:56.220', '20101109 12:04:27.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1751, N'JAWW', N'RX41', '20100216 17:17:30.920', '20100603 03:19:02.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1752, N'AGVC', N'P87Y', '20090117 05:46:03.610', '20090503 05:19:27.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1753, N'NZID', N'KZME', '20100524 15:14:35.900', '20110128 01:57:20.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1754, N'X8L2', N'LHO3', '20101229 01:37:38.360', '20110430 10:40:08.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1755, N'FYIR', N'V5TD', '20090320 10:39:49.160', '20090705 01:47:20.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1756, N'4NNF', N'RIPB', '20090908 18:09:06.510', '20100613 07:09:00.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1757, N'5WZ0', N'1KAZ', '20091219 12:05:55.670', '20100922 05:09:06.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1758, N'HPX', N'SZXN', '20090716 04:42:22.950', '20100221 09:24:15.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1759, N'NPP0', N'FEDQ', '20090818 13:50:15.410', '20091018 15:57:19.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1760, N'0PNN', N'2FK4', '20101221 15:46:29.410', '20110919 14:35:18.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1761, N'3XSD', N'7FN1', '20100501 03:13:11.820', '20100606 07:09:21.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1762, N'W2XI', N'WD3A', '20090208 15:36:18.540', '20090411 20:12:04.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1763, N'T3U4', N'X4X7', '20101214 09:35:51.390', '20101226 08:34:26.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1764, N'OIJH', N'G38T', '20090608 15:47:55.700', '20100402 02:12:56.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1765, N'NY58', N'UH6', '20090720 06:50:05.250', '20100217 23:36:26.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1766, N'XZSQ', N'KKJQ', '20091213 16:07:31.580', '20100411 06:06:07.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1767, N'V3R6', N'V79', '20090926 17:20:33.140', '20100616 05:06:07.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1768, N'VBC6', N'VS3Z', '20100822 06:06:33.740', '20110405 23:19:06.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1769, N'AG61', N'8W7S', '20090419 15:19:18.510', '20090503 05:45:22.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1770, N'PCIK', N'PNMO', '20090426 18:57:01.710', '20091027 02:07:09.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1771, N'0ACL', N'GDFX', '20090816 18:55:39.840', '20091007 18:22:02.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1772, N'DK2H', N'F4WI', '20090819 20:10:14.270', '20091024 03:47:50.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1773, N'K8HM', N'T384', '20100609 15:31:25.850', '20101216 14:09:01.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1774, N'QMJM', N'6S48', '20100419 16:07:09.850', '20100522 20:45:42.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1775, N'6YB0', N'FDA8', '20101213 22:26:42', '20110521 03:17:57.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1776, N'S809', N'6LFZ', '20101014 16:09:01.450', '20110413 13:56:02.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1777, N'FWVC', N'ED4U', '20101001 00:15:57', '20110115 15:10:59.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1778, N'2FUU', N'PMF8', '20100118 04:10:21.980', '20100501 04:01:49.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1779, N'DSJB', N'ML1M', '20090311 20:24:42.150', '20090830 20:53:20.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1780, N'Q320', N'R4IE', '20090101 19:00:40.800', '20090318 04:56:49.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1781, N'LXKN', N'RE3O', '20100824 13:46:28.050', '20110518 02:57:45.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1782, N'NTNQ', N'RIPB', '20100920 00:11:32.370', '20110704 09:24:46.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1783, N'254L', N'77NM', '20090528 07:57:31.410', '20090726 08:51:01.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1784, N'DRUO', N'O9IB', '20090116 19:56:51.570', '20090510 15:41:55.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1785, N'2EFN', N'O97G', '20090420 21:22:30.410', '20091029 07:36:15.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1786, N'82ZH', N'HGK4', '20090307 00:21:27.810', '20091004 21:55:31.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1787, N'RVWT', N'SK2K', '20090819 19:54:33.860', '20100429 13:19:50.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1788, N'P0D', N'QCZD', '20090719 11:59:20.550', '20100322 10:52:27.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1789, N'KDEY', N'9FZA', '20101019 20:15:04.040', '20110330 01:09:28.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1790, N'ELGZ', N'TXFL', '20100202 01:37:22.070', '20100421 13:24:39.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1791, N'QI8X', N'DKKG', '20100507 13:21:46.750', '20110224 07:51:11.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1792, N'71T0', N'YZPZ', '20090919 10:51:29.850', '20100430 18:08:32.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1793, N'27I6', N'RWT5', '20090206 05:35:57.970', '20090514 22:56:57.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1794, N'7OCE', N'2OUE', '20090101 00:38:19.520', '20091005 07:02:46.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1795, N'DKP2', N'6GKZ', '20101129 11:40:34.380', '20110707 16:43:14.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1796, N'MG4P', N'ASMM', '20090506 09:05:27.580', '20090518 04:38:35.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1797, N'DNVN', N'2KN2', '20090906 07:42:06.070', '20100307 20:33:09.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1798, N'ZFL6', N'ZXWH', '20101207 08:26:06.370', '20110914 07:30:11.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1799, N'JENA', N'VKOD', '20090907 15:21:49.490', '20100507 19:58:01.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1800, N'GREK', N'TUHX', '20090107 04:37:10.180', '20090305 17:34:58.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1801, N'H2TQ', N'0KI3', '20090104 08:06:57.260', '20091028 06:44:13.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1802, N'JGUT', N'W78D', '20100409 09:55:16.460', '20100731 02:24:13.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1803, N'KKOB', N'HNYC', '20100530 21:41:13.710', '20110307 08:04:25.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1804, N'FT3C', N'HNYC', '20100102 09:37:13.280', '20100609 20:05:11.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1805, N'L3PN', N'YK1U', '20100111 16:31:16.370', '20100202 17:42:26.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1806, N'MSBM', N'D35', '20090630 21:07:16.650', '20090810 23:31:13.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1807, N'1OIQ', N'VS3Z', '20090809 14:14:37.770', '20100313 15:10:27.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1808, N'HGES', N'DSJI', '20090204 23:07:26.050', '20090908 05:11:38.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1809, N'GXL0', N'5I9W', '20090116 03:10:56.350', '20091007 07:22:11.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1810, N'EMHB', N'OSTO', '20090605 18:30:47.720', '20100117 11:51:18.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1811, N'92JG', N'DCZC', '20091208 17:53:09.510', '20100528 15:58:01.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1812, N'EN00', N'C7O', '20101201 07:55:33.700', '20110524 01:07:17.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1813, N'77FL', N'6QHD', '20090507 08:17:40.790', '20090624 12:30:56.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1814, N'ZYBL', N'OSYO', '20090817 18:49:34.600', '20100530 11:00:31.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1815, N'M778', N'B1UL', '20090430 02:00:01.360', '20090505 11:37:33.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1816, N'P0D', N'GBSC', '20100811 03:01:39.460', '20100928 21:44:36.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1817, N'9ZIP', N'P87Y', '20100913 07:38:47.140', '20100916 11:21:04.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1818, N'TMBF', N'8VMN', '20101128 13:38:59.820', '20110614 16:52:31.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1819, N'73LE', N'S5YU', '20090218 18:25:25.280', '20090604 18:36:42.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1820, N'M2G', N'DE1H', '20090516 06:28:37.430', '20090517 01:40:55.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1821, N'07WB', N'RKMG', '20090426 20:12:57.710', '20091009 16:46:17.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1822, N'E897', N'4RCX', '20090311 05:21:12.590', '20090327 18:13:40.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1823, N'6R26', N'MMZU', '20101102 09:51:29.710', '20110106 22:09:38.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1824, N'3T5Q', N'FCT0', '20100317 13:41:56.450', '20101107 16:20:44.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1825, N'1G7O', N'BWFF', '20091220 05:35:14.970', '20100628 18:15:59.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1826, N'JLJV', N'HQLF', '20101127 08:04:10', '20110405 00:13:31.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1827, N'QD57', N'NGC8', '20090714 14:34:16.290', '20100408 04:50:53.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1828, N'VRR7', N'QMBS', '20100609 14:53:06.320', '20110108 07:06:15.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1829, N'8UGF', N'0C10', '20100521 04:26:35.470', '20100911 04:02:29.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1830, N'EN00', N'4CBR', '20100810 13:21:14.410', '20110103 22:39:22.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1831, N'RXHA', N'3ZDB', '20100208 08:26:55.370', '20101203 17:22:54.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1832, N'DQZF', N'EE7E', '20101024 15:49:50.640', '20110227 07:40:49.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1833, N'NS05', N'TXFL', '20090513 12:48:32.480', '20091021 08:03:49.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1834, N'L974', N'SLYN', '20090305 15:47:31.960', '20090628 03:18:22.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1835, N'T5SM', N'QMGC', '20101228 10:53:43.550', '20110316 22:12:36.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1836, N'XVWM', N'V7EL', '20090518 03:51:11.590', '20091019 00:33:32.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1837, N'QBIQ', N'A40I', '20090423 02:30:18.650', '20090430 01:20:22.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1838, N'9EIC', N'QMBS', '20100525 22:20:18.130', '20101212 12:45:50.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1839, N'8AW9', N'PNMO', '20100105 03:25:35.200', '20100406 21:59:30.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1840, N'UMTW', N'ASMM', '20101021 00:15:13.770', '20110320 08:05:02.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1841, N'0VZO', N'LHO3', '20100728 10:06:50.050', '20110520 06:45:05.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1842, N'323R', N'F4E7', '20090715 20:47:07.810', '20090822 08:08:13.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1843, N'8OCG', N'KZII', '20090704 08:48:24.190', '20100412 03:30:16.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1844, N'EMFK', N'LMRG', '20100517 01:44:16.320', '20110107 13:18:11.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1845, N'T8W4', N'GXQ', '20090225 07:44:12.560', '20090920 21:26:38.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1846, N'OCTO', N'0YDC', '20100606 05:26:13.050', '20101003 06:43:54.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1847, N'9P6F', N'SI0H', '20090516 02:33:49.050', '20091107 05:37:36.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1848, N'G0GF', N'3I7J', '20100621 10:46:23.370', '20101011 11:56:27.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1849, N'PGGP', N'RQRL', '20100902 22:38:18.170', '20110601 19:25:13.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1850, N'W9UJ', N'QMGC', '20090421 08:38:54.920', '20091009 18:58:39.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1851, N'6ZBM', N'MEAF', '20090823 01:26:40.450', '20090831 17:17:32.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1852, N'15JZ', N'TP4W', '20091008 18:03:06.260', '20100720 03:40:38.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1853, N'V8B3', N'7RDH', '20101019 14:00:41.080', '20110412 12:53:29.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1854, N'UKCD', N'ITDT', '20090425 08:53:12.060', '20091222 18:17:06.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1855, N'RCS1', N'1ZD8', '20100912 08:24:12.470', '20110323 00:48:42.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1856, N'UJSG', N'VS1M', '20101026 02:45:44.670', '20110802 12:30:33.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1857, N'MLQ9', N'9R9W', '20100607 00:03:46.760', '20100724 04:14:35.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1858, N'Y30P', N'1VDT', '20090316 07:59:17.260', '20090430 15:43:41.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1859, N'T3U4', N'517H', '20090114 04:01:58.300', '20091009 01:49:13.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1860, N'X9QV', N'HQLF', '20100214 08:27:06.380', '20100826 17:28:55.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1861, N'IH1W', N'Q8JL', '20101217 06:33:00.370', '20110228 18:40:21.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1862, N'AQYZ', N'5BOE', '20100301 23:21:31.450', '20100305 08:04:12.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1863, N'17VW', N'DILT', '20090916 18:40:50.580', '20091228 01:09:10.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1864, N'JCXT', N'1CAK', '20090607 13:49:41.950', '20091003 08:42:50.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1865, N'CR6L', N'KVBM', '20100427 10:03:52.350', '20101210 18:28:25.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1866, N'U3JV', N'YYWY', '20100214 02:03:18.880', '20100331 08:17:13.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1867, N'ZFL6', N'IW5Z', '20100721 19:07:01.220', '20100803 17:03:29.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1868, N'ZSOQ', N'EBCS', '20090304 16:30:08.820', '20091024 09:12:35.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1869, N'V4KJ', N'Y4MI', '20090820 07:55:51.060', '20100315 12:47:55.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1870, N'9T81', N'G79S', '20101212 22:08:49.770', '20110513 11:04:02.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1871, N'1D10', N'5P36', '20100421 00:31:20.800', '20100601 20:24:15.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1872, N'LH2V', N'YP3N', '20090421 09:18:29', '20090801 22:35:14.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1873, N'OK0Z', N'K5H4', '20091124 10:13:24.610', '20100310 18:53:02.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1874, N'TUQ1', N'HKIP', '20090430 18:10:11.520', '20100111 10:31:40.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1875, N'MBJ4', N'S6EE', '20091018 20:21:47.380', '20091023 18:55:50.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1876, N'9ZIP', N'CNE5', '20101011 23:25:49.910', '20110217 08:38:05.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1877, N'TIX0', N'L1VQ', '20100906 20:32:48.410', '20101011 14:43:25.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1878, N'V3OC', N'0XDW', '20090619 08:07:13.380', '20091027 08:51:27.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1879, N'IT30', N'YSZ', '20100121 05:57:43.880', '20100217 18:54:06.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1880, N'4F5J', N'ALVY', '20100716 00:09:01.920', '20100925 11:32:05.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1881, N'VJ6N', N'P87Y', '20100715 05:30:20.940', '20110325 18:35:55.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1882, N'5LFG', N'K5H4', '20100123 03:47:52.920', '20100627 16:54:27.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1883, N'EP1O', N'YRR2', '20101006 16:14:48.160', '20110604 11:41:03.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1884, N'RHNI', N'9Y8Q', '20100130 19:47:40.550', '20100929 09:03:50.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1885, N'0KEQ', N'INSL', '20091219 11:54:33.950', '20100506 05:21:51.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1886, N'LH2V', N'A7KC', '20090503 14:23:49.110', '20090517 13:42:16.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1887, N'4MBY', N'6FHL', '20090106 01:49:09.560', '20090913 18:47:20.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1888, N'9R9T', N'BEJI', '20090119 03:55:20.420', '20090826 13:46:43.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1889, N'QEFM', N'QMR9', '20090623 07:23:19.490', '20100201 02:29:41.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1890, N'1OIQ', N'UR2X', '20090305 08:07:58.870', '20090611 09:42:03.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1891, N'4WES', N'LIT6', '20091211 03:47:24.840', '20100327 20:18:57.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1892, N'RXN1', N'8FJX', '20090207 18:31:01.390', '20091027 09:36:41.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1893, N'TW3N', N'LIMP', '20100512 18:18:19.830', '20101231 10:56:38.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1894, N'TAVR', N'8BYF', '20101120 18:58:28.820', '20110607 04:30:35.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1895, N'X3QT', N'LHO3', '20101103 17:42:13.400', '20110119 13:24:42.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1896, N'2JY8', N'FM3E', '20090529 10:45:18.600', '20100317 22:40:54.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1897, N'YX7D', N'1JNW', '20101029 02:06:17.240', '20110621 06:59:04.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1898, N'FJ0F', N'JPBV', '20090127 18:58:42.230', '20090710 18:47:27.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1899, N'0SLT', N'0QKV', '20090120 15:40:23.960', '20090128 18:49:47.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1900, N'6U4U', N'I5GG', '20100111 05:40:53.690', '20100622 13:09:26.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1901, N'SXLX', N'JIEW', '20101115 10:19:11.840', '20110301 13:40:26.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1902, N'8A1N', N'ECXF', '20090314 10:03:40.220', '20091110 20:25:02.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1903, N'MXR5', N'5BOE', '20091102 02:50:32.310', '20100525 23:08:32.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1904, N'MGS9', N'BG3W', '20100921 00:29:28.400', '20110119 08:21:12.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1905, N'JCV5', N'KZME', '20091231 08:07:34.120', '20100509 22:34:25.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1906, N'MKJQ', N'NWBF', '20090504 16:08:11.440', '20091126 18:42:18.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1907, N'75DZ', N'9Y8Q', '20101114 07:49:41.650', '20110511 08:47:37.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1908, N'E047', N'QYZV', '20100621 19:50:29.550', '20110127 02:21:50.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1909, N'OSWL', N'QCZD', '20100707 12:31:24.680', '20110228 23:21:16.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1910, N'UJ0A', N'PR9R', '20101201 08:58:22.570', '20110202 16:10:37.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1911, N'OM2B', N'BDUP', '20090219 06:12:56.260', '20091022 21:47:09.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1912, N'2GDQ', N'8OIQ', '20091219 15:56:33.370', '20100724 19:23:09.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1913, N'QP9S', N'3097', '20100223 02:01:33.380', '20100312 20:49:36.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1914, N'RJD2', N'UHOT', '20090701 03:52:56.380', '20100113 14:17:08.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1915, N'DQZF', N'SI0H', '20100802 02:56:45.450', '20110329 22:53:00.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1916, N'MNZY', N'69EY', '20091125 02:45:07.440', '20100701 01:45:55.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1917, N'R9NR', N'6TT2', '20100526 07:06:43.300', '20100727 20:23:10.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1918, N'NA2S', N'35YV', '20100816 22:53:10.030', '20110124 16:05:20.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1919, N'OTZQ', N'JWH3', '20100619 01:55:08', '20110326 03:20:59.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1920, N'GURU', N'9R3S', '20091225 19:40:03.240', '20100727 04:46:09.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1921, N'766Y', N'SLYN', '20100209 00:14:09.310', '20100514 13:29:53.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1922, N'HJXI', N'6WS4', '20100703 15:11:40.800', '20101005 03:16:46.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1923, N'A2S7', N'O5AK', '20100911 09:06:49.330', '20100922 06:42:54.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1924, N'NOG7', N'3HRB', '20090617 23:47:52.180', '20091005 03:05:52.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1925, N'KU0K', N'V4P7', '20100102 18:21:24.930', '20100216 14:45:05.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1926, N'TP7E', N'XIPU', '20100314 06:00:19.410', '20100602 10:47:34.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1927, N'QZSB', N'DLG2', '20091209 15:00:09.180', '20100528 11:38:36.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1928, N'ITM', N'BD30', '20100103 15:14:55.800', '20100730 14:22:27.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1929, N'IPVC', N'VTUT', '20090627 00:27:58.120', '20091222 21:06:59.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1930, N'JENA', N'CIZ8', '20090523 09:36:28.780', '20090604 20:14:57', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1931, N'6ZBM', N'B1YX', '20101213 21:19:32.680', '20110625 01:39:02.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1932, N'IWNI', N'1FRY', '20100811 01:34:06.170', '20110128 19:55:58.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1933, N'11NX', N'05M', '20090530 16:26:49.420', '20090929 14:01:41.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1934, N'OMDR', N'HKIP', '20090111 00:16:50.190', '20090625 05:44:40.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1935, N'NENM', N'S5U3', '20100830 13:49:50.090', '20110522 21:51:40.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1936, N'1336', N'AIPO', '20100503 19:26:40.710', '20100515 22:10:53.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1937, N'NSDJ', N'E9Y5', '20090324 00:57:20.610', '20091129 17:45:55.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1938, N'Q320', N'NGC8', '20090116 15:45:19.750', '20090517 03:19:51.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1939, N'QH5', N'PW8N', '20090131 11:40:06.430', '20090523 10:29:26.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1940, N'K6YA', N'V1FX', '20090817 19:46:22.510', '20100406 10:39:34.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1941, N'TAVR', N'0DMD', '20090619 06:34:07.460', '20091102 04:54:40.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1942, N'BGS0', N'FT1A', '20090717 05:58:40.010', '20090817 16:25:31.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1943, N'831K', N'LOUM', '20090714 15:23:55.740', '20100423 14:25:27.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1944, N'SJX1', N'0Q0L', '20090722 22:24:56.930', '20091229 10:19:04.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1945, N'PTUA', N'JW1L', '20090115 01:55:02.610', '20090616 11:54:54.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1946, N'D1D0', N'CFFP', '20101222 11:50:51.470', '20110630 00:55:49.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1947, N'431J', N'517H', '20091215 16:29:28.010', '20100816 12:47:05.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1948, N'4RF8', N'R0JW', '20091112 14:25:23.450', '20091218 20:39:31.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1949, N'O70R', N'G17C', '20090421 16:01:43.370', '20100105 05:37:36.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1950, N'M0CR', N'F4FU', '20091210 14:57:05.960', '20100518 11:38:48.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1951, N'WQCP', N'8MK9', '20100103 03:38:35.300', '20100821 02:17:45.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1952, N'XDS3', N'YF7X', '20090315 03:13:07.200', '20090528 14:53:44.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1953, N'PDNO', N'ZTGI', '20090810 17:03:34.230', '20100210 15:26:29.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1954, N'6UGS', N'R9TS', '20100125 20:00:20.720', '20100430 14:03:39.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1955, N'5WEQ', N'PBTO', '20101202 05:26:44.380', '20110207 23:39:33.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1956, N'SGNI', N'BQN1', '20090515 19:07:31.040', '20090528 10:23:40.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1957, N'UR8Z', N'QNHO', '20090703 00:56:50.890', '20100218 13:42:08.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1958, N'WC2S', N'1Y7W', '20090518 03:02:40.120', '20090821 20:02:40.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1959, N'PDQZ', N'H5T1', '20090919 06:08:03.460', '20091203 17:36:08.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1960, N'LM7K', N'N5U0', '20101019 02:07:14.710', '20101207 11:46:51.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1961, N'Q8WB', N'9Y8Q', '20100526 01:08:02.270', '20100701 07:03:42.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1962, N'0PNN', N'YRR2', '20091111 16:34:45.850', '20100808 18:25:10.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1963, N'RF80', N'UYD6', '20091226 19:22:31.420', '20100205 05:14:51.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1964, N'EFVB', N'DSJI', '20100215 02:54:55.890', '20100927 03:06:20.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1965, N'JTUD', N'EKYR', '20101218 11:38:49.900', '20110606 14:31:36.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1966, N'RXM5', N'9R9W', '20090711 04:38:50.090', '20090924 01:51:11.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1967, N'LFO5', N'8MBW', '20090722 23:29:43.940', '20091026 05:21:28.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1968, N'V6WP', N'MCP', '20100213 01:44:43.190', '20100715 15:04:56.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1969, N'BZYM', N'25JO', '20091031 14:03:06.290', '20100619 16:25:29.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1970, N'SW19', N'I5GG', '20090401 07:30:04.730', '20091115 00:42:07.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1971, N'49Q7', N'SCDW', '20090904 01:47:46.830', '20100529 08:00:00.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1972, N'LC0G', N'KGTW', '20100510 15:21:23.550', '20110107 17:03:19.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1973, N'M2G', N'DVYM', '20100717 11:13:03.600', '20100904 05:35:54.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1974, N'8OD1', N'OUSI', '20091102 06:08:45.490', '20091220 16:41:26.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1975, N'MC2G', N'9DTT', '20090709 13:05:55.770', '20090924 23:51:29.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1976, N'71T0', N'CU5U', '20090726 18:15:29.300', '20090927 21:04:23.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1977, N'D5P8', N'M5E7', '20091220 23:47:45.050', '20100410 12:51:20.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1978, N'RLU6', N'N5U0', '20100220 10:41:52.400', '20100721 20:23:51.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1979, N'VRHW', N'KZII', '20090603 21:52:49.570', '20100215 15:10:59.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1980, N'LXG7', N'IW5Z', '20100111 06:30:33.460', '20100615 13:49:16.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1981, N'CJDS', N'SJTL', '20090330 13:30:51.400', '20090813 22:00:30.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1982, N'SGNI', N'MTKM', '20090128 00:34:45.730', '20090610 14:59:06.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1983, N'LDYY', N'VHQW', '20090914 23:13:12.420', '20100522 08:44:52.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1984, N'0ALP', N'HKIP', '20100717 09:30:52.170', '20100806 09:28:12.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1985, N'O0BB', N'3W95', '20100520 05:57:53.480', '20100810 17:57:12.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1986, N'BNYZ', N'CU5U', '20101001 18:06:25.470', '20110128 10:45:18.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1987, N'IPR1', N'1MGK', '20100101 08:30:31.930', '20101015 04:29:30.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1988, N'6YQ3', N'8VMN', '20100504 20:26:28.710', '20100531 23:58:03.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1989, N'XSKY', N'S6EE', '20090208 18:50:05.820', '20090517 06:05:07.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1990, N'QG8G', N'GDFX', '20100417 18:42:19.050', '20101226 11:28:00.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1991, N'VD9L', N'KVMA', '20091101 18:29:49.810', '20100122 08:28:46.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1992, N'5CBO', N'BVRP', '20101105 21:54:40.490', '20110409 21:43:15.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1993, N'9D73', N'6DVJ', '20100429 09:37:16.290', '20100613 09:43:44.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1994, N'ZLE8', N'2OUE', '20090414 09:32:51.720', '20090615 22:42:35.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1995, N'Z58U', N'L9ER', '20100324 18:38:20.250', '20101006 03:35:52.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1996, N'WJCM', N'1PHE', '20100807 13:59:21.620', '20110120 10:29:31.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1997, N'VLQ8', N'LE76', '20100721 10:36:08.600', '20110508 11:10:40.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1998, N'REK3', N'7KZY', '20100529 12:28:59.860', '20100727 11:19:07.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1999, N'ADR', N'MS4', '20090804 10:46:07.040', '20100520 19:47:28.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_WebTower9] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (2000, N'H245', N'92UX', '20100706 21:16:12.520', '20100922 10:03:43.940', 2)
GO

--
-- Data for table dbo.HoaDon_WebTower9  (LIMIT 0,500)
--

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0047', N'G0G6', N'YWA4', '20100621 00:31:34.160', '20101117 10:25:50.200', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'00BJ', N'NNP9', N'2437', '20100419 03:05:54.510', '20100702 21:10:57.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'016K', N'5Q7V', N'VBT8', '20090314 02:52:43.930', '20090620 20:09:26.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'02GY', N'5LZ8', N'PFPW', '20100630 17:13:35.120', '20110218 08:11:34.700', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'03OB', N'O4JD', N'1EPQ', '20090501 03:22:03.590', '20090730 20:18:16.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'04T2', N'JJ50', N'60GH', '20100219 00:39:50.170', '20101208 06:51:34.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'055O', N'P1PL', N'NH4E', '20091111 15:56:46.030', '20100111 04:23:10.240', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'068B', N'TWPS', N'L31J', '20100625 07:59:58.260', '20110316 03:11:46.680', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'07WB', N'GVOP', N'57H2', '20090207 07:52:18.160', '20091125 07:19:11.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'080J', N'0ZRG', N'OUR7', '20100618 16:12:57.890', '20110201 02:08:03.950', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'09WT', N'IE87', N'9N5L', '20101004 01:57:51.010', '20110228 02:21:31.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0ACL', N'6LRC', N'344I', '20091110 13:56:27.260', '20100704 03:29:56.430', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0ALP', N'9N5Y', N'2ALX', '20100711 01:30:56.900', '20101128 19:13:45.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0C00', N'5REP', N'FHEL', '20090711 07:26:42.580', '20090809 00:17:14.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0CFI', N'QTWJ', N'B04V', '20091018 22:09:42.090', '20100313 16:03:51.780', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0CS', N'IYLM', N'PWL1', '20100122 17:34:18.940', '20100502 08:48:40.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0DMU', N'WBJI', N'80PP', '20091128 18:47:29.760', '20100620 18:33:58.020', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0HWY', N'JDTC', N'FRV2', '20100421 00:59:29.310', '20110104 16:26:36.460', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0ISE', N'ZIZV', N'6KZQ', '20100820 22:34:59.460', '20110104 13:04:27.460', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0JBB', N'3NRW', N'WPH4', '20100309 03:16:48.590', '20100529 18:26:51.850', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0JMR', N'U46M', N'2R39', '20101202 19:54:10.210', '20110816 00:52:02.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0K31', N'OB7Q', N'UVZ1', '20101204 21:30:48.100', '20101225 01:38:46.860', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0KEQ', N'E8BM', N'FU8U', '20101022 03:25:04.790', '20110208 15:18:39.600', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0L8P', N'44K8', N'BIZ0', '20100525 14:17:49.930', '20100615 18:42:27.550', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0NF5', N'3QKC', N'MM1T', '20101114 22:44:34.580', '20110122 18:48:00.820', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0PNN', N'AS48', N'HW3H', '20100915 12:23:08.810', '20101117 23:49:30.120', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0SLT', N'5J97', N'DP6F', '20090511 21:04:12.510', '20100302 21:12:31.260', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0SQ3', N'9EI5', N'F7KE', '20091012 23:09:19.870', '20100129 08:25:30.450', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0SVU', N'1HFI', N'XL9Z', '20090331 04:36:17.520', '20090701 04:41:34.330', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0THI', N'8WSG', N'9V0C', '20101211 17:24:40.800', '20110630 04:12:47.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0VZO', N'REPR', N'A78Y', '20090324 14:38:02.700', '20091229 14:52:22.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0XG4', N'3B6R', N'YWQ5', '20090609 13:09:27.240', '20091026 17:41:02.460', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0XJZ', N'LSW4', N'NNOU', '20101224 00:36:19.080', '20110327 13:12:04.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0Y2H', N'JT4S', N'1FSY', '20101101 06:36:16.130', '20110630 15:09:13.160', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0YU1', N'OONV', N'EW4Q', '20090119 05:54:37.770', '20090731 15:03:04.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0Z83', N'2JHT', N'PWL1', '20090617 11:21:42.470', '20100122 21:54:38.480', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'11NX', N'2XQU', N'HRZS', '20091205 08:35:02.600', '20100415 12:23:38.520', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'11PV', N'CU7T', N'3W0O', '20100218 09:07:10.590', '20100303 11:22:44.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'132F', N'X3EY', N'39T3', '20090427 04:48:04.860', '20090708 20:30:22.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1336', N'RR0O', N'QNFD', '20091208 03:23:11.290', '20100131 22:49:06.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'15JZ', N'KVVZ', N'5X3C', '20100407 13:07:05.800', '20100510 23:03:06.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'17VW', N'4S0S', N'J35P', '20090409 10:56:58.570', '20091118 18:37:56.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'19N8', N'Q2KY', N'091N', '20090325 01:29:44.640', '20090529 20:39:01.760', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1AFN', N'2JHT', N'1JOV', '20101003 15:18:07.200', '20110507 19:54:33.980', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1CGC', N'H6JK', N'WIYF', '20100904 22:01:35.870', '20110424 22:50:37.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1CWJ', N'TJ4D', N'J926', '20100305 04:28:11.160', '20100912 20:36:51.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1D10', N'3B6R', N'HXF0', '20090911 19:03:30.070', '20091111 01:29:07.900', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1DGD', N'3GR', N'9SHL', '20091016 19:10:11.860', '20100321 06:25:53.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1G7O', N'YKH5', N'7OD6', '20100309 21:38:48.520', '20101226 01:02:18.520', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1KHT', N'G4Y', N'PZF1', '20101202 10:30:44.360', '20110127 12:08:59.740', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1OIQ', N'867J', N'A4WL', '20101119 22:32:57.040', '20110518 11:00:40.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1Q6R', N'9NAS', N'2M09', '20091101 07:51:07.370', '20100620 11:22:49.350', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1RUX', N'O5JB', N'1D4J', '20090721 08:20:23.070', '20091226 03:42:01.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1S62', N'7NT2', N'AATO', '20090422 19:53:42.350', '20090425 12:33:53.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1WZK', N'8GNZ', N'LGTW', '20100924 00:44:21.170', '20101029 11:53:23.860', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1XAJ', N'RHJ1', N'XCX5', '20100404 22:37:46.920', '20100712 05:54:13.180', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1YYB', N'GX7E', N'SI0V', '20090420 13:33:49.580', '20090917 19:10:04.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'20OC', N'PACT', N'FAMF', '20100625 20:44:14.850', '20100713 09:01:51.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'22N6', N'RH68', N'K11Y', '20090130 08:20:11.120', '20090704 02:58:51.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'234L', N'PKI', N'3A6B', '20090318 22:47:47.240', '20090428 00:31:28.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'24Q0', N'5WSZ', N'DRDO', '20100921 14:37:42.040', '20110103 03:04:04.640', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'254L', N'OJFY', N'61H3', '20100830 20:07:51.620', '20110128 05:48:33.860', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'27I6', N'VCKE', N'BM9B', '20100816 15:53:49.110', '20101113 09:11:40.630', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2A86', N'5P3Y', N'AIY7', '20100521 14:42:47.390', '20100616 06:32:36.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2D6L', N'5BM7', N'YDA8', '20090422 05:22:44.120', '20090803 11:38:06.580', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2EFN', N'L0DD', N'NSOR', '20090822 11:30:20.630', '20100609 04:39:03.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2FN', N'Z1HU', N'SW2Q', '20090110 05:30:12.750', '20090316 09:04:48.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2FUU', N'MA8W', N'KJ1W', '20100627 01:52:26.370', '20110323 22:01:08.740', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2GD', N'0Z7K', N'NKCD', '20100705 20:02:05.070', '20110316 12:00:23.530', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2GDQ', N'64GG', N'AJT7', '20100220 21:53:54.980', '20101030 13:52:32.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2JR9', N'4TU7', N'X8QZ', '20100311 19:34:25.970', '20100529 21:41:43.160', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2JY8', N'TC52', N'M9Z5', '20090423 23:55:24.870', '20091112 12:32:04.270', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2KCL', N'VAK6', N'7IH7', '20090113 22:27:40.260', '20090919 07:58:30.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2KI5', N'IGGD', N'BFLD', '20100101 16:06:03.290', '20100724 16:41:52.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2KMJ', N'5IA8', N'T4KA', '20100608 14:58:46.170', '20101211 11:28:25.980', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2LZQ', N'V8S4', N'XP1O', '20090812 08:10:52.990', '20100301 19:03:45.240', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2M5W', N'PY6Z', N'5CED', '20100306 07:23:37.660', '20100317 22:42:31.550', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2MAG', N'G2H3', N'MMVF', '20100620 02:15:26.880', '20110221 16:00:48.240', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2OL1', N'6DLA', N'A78Y', '20091120 21:22:52.100', '20100518 11:59:25.820', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2UD9', N'KZDU', N'BS6M', '20090530 14:29:09.630', '20090622 06:01:57.540', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2VAO', N'367U', N'7DHU', '20101124 12:01:38.860', '20110620 00:53:15.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2ZZV', N'D8HO', N'L5K6', '20090426 01:41:53.010', '20091125 19:23:12.500', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'31LO', N'JDTC', N'PAEE', '20090505 18:00:39.180', '20091109 21:40:36.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'323R', N'0F7T', N'5I9A', '20100301 08:19:14.680', '20100307 01:27:59.560', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'33YZ', N'A4UP', N'6BCS', '20101026 17:55:01.080', '20110508 19:57:59.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3486', N'6OT1', N'2AHQ', '20091014 02:43:51.720', '20100521 03:05:11.530', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'36FB', N'8I7P', N'R06L', '20091012 17:56:00.360', '20091018 12:28:23.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'379R', N'9HQW', N'LJHB', '20101210 14:16:03.480', '20110318 17:58:58.940', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'37AR', N'0A4E', N'VNV5', '20100522 12:11:07.170', '20101022 05:36:23.890', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3B61', N'6LRG', N'3W0O', '20090414 21:49:27.060', '20090612 15:45:00.430', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3CBF', N'X3E0', N'VWOP', '20091109 05:19:38.200', '20100827 09:20:26.060', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3DWE', N'Y3DN', N'QOJP', '20100507 05:21:47.010', '20101031 18:33:46.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3EDY', N'9SXE', N'0HJI', '20100304 01:24:26.990', '20100419 17:29:50.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3ELK', N'TBBP', N'4HA1', '20100708 00:18:58.670', '20101107 06:32:46.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3FVA', N'EP0C', N'6N1E', '20090418 22:21:42.420', '20090522 19:18:09.870', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3HBO', N'7FC1', N'VUSS', '20091121 07:01:01.910', '20091123 00:23:53.410', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3HZI', N'FZO0', N'L083', '20090406 02:13:48.280', '20091021 23:18:15.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3IRA', N'MVZH', N'086I', '20100113 17:33:36.470', '20100122 06:58:02.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3J6H', N'7YL7', N'UWPO', '20091021 17:40:58.530', '20100731 23:38:49.740', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3JW5', N'G2MK', N'NS6L', '20090128 04:05:20.290', '20090529 22:23:17.470', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3KIP', N'IKZ', N'T183', '20090618 11:34:00.270', '20091230 12:59:23.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3NWE', N'U3KT', N'P51T', '20091222 08:18:08.620', '20100311 02:09:45.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3O89', N'FNNY', N'LGTW', '20100615 04:28:30.610', '20110222 22:12:11.730', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3OFH', N'G1SD', N'Q3N8', '20100808 13:40:21.540', '20110424 07:35:16.130', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3Q99', N'VHSO', N'3A6B', '20100225 14:22:03.700', '20100319 22:05:37.390', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3RI2', N'E5XL', N'8X05', '20090224 20:12:03.230', '20091121 06:37:47.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3T5Q', N'GJJQ', N'63YM', '20090427 05:08:00.810', '20090613 00:18:42.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3TT0', N'FZZ1', N'WY35', '20101017 11:00:47.730', '20110707 00:32:58.870', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3UUF', N'UHVY', N'7W34', '20090214 17:34:52.910', '20091111 02:26:56.700', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3W32', N'SV1C', N'5CED', '20090209 05:13:05.330', '20091127 06:53:18.040', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3XSD', N'KQDK', N'WNZD', '20101118 15:38:54.980', '20110906 14:04:05.390', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'40ZT', N'KCL0', N'BUOA', '20100830 19:27:56.810', '20101206 13:20:33.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'431J', N'HUYH', N'CTI0', '20090126 16:56:18.190', '20090827 20:45:28.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'43HN', N'SECX', N'ET67', '20100629 11:27:44.130', '20100727 05:10:46.880', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4887', N'TOAM', N'XVZT', '20090112 10:32:52.750', '20090206 15:28:30.870', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'48PO', N'WRPG', N'LI6R', '20090213 23:40:34.220', '20090716 11:31:27.110', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'49Q7', N'857F', N'BV2I', '20090227 15:24:38.610', '20091031 21:09:17.850', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4AQR', N'36MA', N'WAZX', '20100329 00:17:58.180', '20100709 15:54:40.100', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4EVD', N'DWWK', N'LBMH', '20100323 04:30:29.420', '20100924 23:05:03.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4F5J', N'JXFV', N'M7NK', '20091012 07:36:04.310', '20091125 23:01:48.420', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4JLR', N'WVA7', N'UJ1S', '20091004 06:23:25.550', '20100702 23:18:27.840', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4KAK', N'6ZEV', N'6ZAA', '20100914 04:58:40.430', '20110213 06:42:44.890', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4LI3', N'9Y7V', N'TPN1', '20091122 15:35:16.310', '20091209 14:31:57.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4MBY', N'8URA', N'FHEL', '20100130 19:59:38.240', '20100814 22:48:19.120', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4NER', N'K8FU', N'9ZSZ', '20090518 01:09:56.690', '20090615 12:16:06.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4NNF', N'9GPD', N'I9QA', '20090620 12:32:11.300', '20100404 20:19:48.510', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4OWO', N'OJFY', N'5PR1', '20091210 15:10:56.420', '20100805 14:41:53.140', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4Q9J', N'RAL6', N'7ZEE', '20090717 21:47:19.520', '20091020 05:47:26.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4QOB', N'VY2R', N'YK01', '20101221 19:38:17.680', '20101223 22:27:52.110', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4RF8', N'CHNI', N'6HGT', '20100313 23:31:55.450', '20100319 19:58:31', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4SWD', N'XZI2', N'27GP', '20101029 05:23:27.440', '20110617 22:40:53.610', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4TEG', N'NLBL', N'DGXQ', '20100206 05:17:49.720', '20100913 23:49:20.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4VSN', N'PNIU', N'YLBO', '20090906 19:29:33.590', '20100409 11:31:22.110', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4W54', N'FWHO', N'7UXD', '20090805 05:02:07.640', '20091124 12:28:53.230', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4WES', N'KZDU', N'6N1E', '20090814 01:52:42.380', '20091222 11:20:55.810', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4Z9O', N'1VE7', N'7OD7', '20090413 04:10:33.250', '20090502 02:45:57.870', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4ZKQ', N'SED7', N'TDP4', '20100421 02:56:13.160', '20100911 01:12:11.340', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'50K8', N'Y7X7', N'P3W1', '20100905 06:24:14.030', '20110623 06:55:43.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'51I4', N'EM1Z', N'B5CT', '20100530 21:34:36.300', '20100629 00:35:13.290', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'51N2', N'EDPU', N'PTTW', '20090501 07:57:02.730', '20091029 06:11:28.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'52SA', N'6ACX', N'OW1Y', '20090602 14:47:57.350', '20100102 08:54:12.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'56PJ', N'MZP9', N'YC5U', '20100416 18:35:13', '20100725 11:29:23.110', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'58SD', N'662I', N'CEXL', '20100517 16:13:17.020', '20100524 18:38:31.900', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'598H', N'YSJP', N'DP13', '20090718 20:39:03.430', '20090908 00:07:44.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'59LG', N'KWTV', N'7IWC', '20090802 06:20:37.210', '20091122 22:43:30.550', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5ANG', N'QZQM', N'79C2', '20100322 19:17:27.920', '20100328 17:48:03.540', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5BYR', N'G2MK', N'HCQQ', '20091127 02:46:41.410', '20100403 21:20:26.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5CBO', N'965O', N'NX6D', '20100506 20:13:04.200', '20101123 21:21:25.110', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5CHJ', N'LSW4', N'TULU', '20090918 17:47:55.930', '20100608 09:50:30.950', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5DO6', N'QYF3', N'RXBD', '20101018 07:26:23.630', '20101020 19:12:51.680', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5FJ7', N'G79', N'UW3N', '20100225 20:50:14.670', '20100524 20:45:20.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5IA3', N'LSK', N'CDUR', '20090920 22:45:52.010', '20100110 17:40:29.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5JPH', N'20U9', N'TDP4', '20100629 14:21:31.010', '20110115 13:43:32.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5K9O', N'8N5Q', N'O3RW', '20100226 20:38:06.190', '20100719 15:34:44.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5KE1', N'8QO3', N'Q18O', '20100626 06:09:18.970', '20110205 00:26:56.860', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5KHA', N'GFTJ', N'6B41', '20100506 14:29:00.840', '20100627 17:26:25.460', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5LCZ', N'B9N6', N'5J9M', '20100202 18:26:04.500', '20101113 08:43:41.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5LFG', N'V06X', N'UVRI', '20100304 04:06:44.700', '20100606 03:20:04.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5OJ2', N'VFZT', N'FAMF', '20101229 03:46:02.370', '20110617 17:53:57.760', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5PO3', N'5VND', N'9LRN', '20090406 12:41:29.820', '20100131 00:30:14.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5QUJ', N'DAPB', N'MOY0', '20091018 08:46:16.570', '20091202 12:14:18.690', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5RB6', N'3QKC', N'H3K4', '20090421 14:54:36.950', '20091227 03:51:14.420', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5TKK', N'965O', N'6MHG', '20100429 00:04:53.610', '20100610 15:08:48.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5V7J', N'F5HU', N'2BH5', '20090215 14:33:49.190', '20090308 14:07:45.910', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WEQ', N'IZU', N'XW3G', '20090624 17:07:16.300', '20091130 17:42:07.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WQ2', N'BRPF', N'1VE4', '20090110 17:16:05.440', '20091102 05:03:10.940', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WQ5', N'KBD5', N'QNFD', '20100920 23:02:06.920', '20110708 12:54:37.050', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WZ0', N'P4MB', N'K3DB', '20100509 08:07:38.160', '20101230 11:56:50.260', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5Y8F', N'8VZ2', N'DGXQ', '20090626 17:42:59.150', '20090731 23:32:03.140', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'610I', N'5O1U', N'DTCN', '20091216 03:11:33.880', '20100606 22:05:29.750', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'614W', N'FUDK', N'6V7N', '20100330 02:22:22.130', '20100413 21:26:21.940', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'66RZ', N'J9VM', N'QLCX', '20090715 22:03:05.330', '20100309 01:16:21.980', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'67BI', N'T86N', N'VHPY', '20100102 02:03:02.610', '20100209 22:31:21.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'68KL', N'R1QK', N'BX49', '20100114 04:36:40.500', '20100811 07:01:48.470', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'68UK', N'Y64K', N'UVKY', '20100830 13:05:12.080', '20110429 04:24:28.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'693G', N'BQKA', N'KK03', '20101213 00:35:07.790', '20110331 09:18:15.410', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6EBE', N'ZNIZ', N'P51T', '20100622 08:01:06.910', '20110205 16:15:39.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ELD', N'EDPU', N'4CLP', '20101121 11:51:04.380', '20110714 19:32:46.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6FWM', N'213L', N'QU55', '20100910 13:25:17.800', '20110618 01:06:43.250', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6G5K', N'6OIN', N'TJVH', '20100829 15:08:40.490', '20110505 09:40:58.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6KDW', N'73E2', N'XOY6', '20090604 15:21:57.400', '20091027 23:45:03.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6LA8', N'F50K', N'44EN', '20100925 06:45:38.500', '20110403 21:39:49.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6O62', N'E2SB', N'KNA5', '20091009 00:59:00.780', '20091201 16:36:24.010', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6OVY', N'Q8H0', N'CEG6', '20100928 07:24:52.800', '20110123 17:11:55.140', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6Q84', N'5NE7', N'HRZS', '20090805 17:19:11.740', '20090905 20:29:41.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6R26', N'4UAE', N'KL23', '20100517 07:24:50.790', '20110107 23:08:39.420', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6R7L', N'0I04', N'RM60', '20090309 16:19:40.580', '20090709 20:52:43.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6S4A', N'FOGI', N'99KR', '20090502 20:22:27.730', '20090525 09:26:35.320', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6SB', N'GJRW', N'MMBM', '20090719 17:50:33.020', '20100417 01:38:27.040', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6TCI', N'WQGB', N'X4FS', '20090413 01:48:52.280', '20090729 05:37:17.360', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6U4U', N'180R', N'A4WL', '20090117 15:26:16.920', '20090902 11:10:12.760', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6UGS', N'LTT2', N'TB09', '20091023 11:19:03', '20100815 20:59:53.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6V64', N'JBSB', N'P7OD', '20091010 08:36:38.190', '20091028 11:54:17.060', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6W9B', N'0I04', N'S7EP', '20100923 14:26:28.180', '20110701 03:28:49.490', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6WPC', N'6DLA', N'LCTM', '20090509 21:31:24.230', '20091220 08:10:38.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6YB0', N'PVO4', N'9LRN', '20091121 07:23:36.490', '20100527 19:36:13.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6YQ3', N'J0RB', N'H942', '20100408 22:38:53.990', '20101202 13:10:11.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZBM', N'2NQK', N'VKW4', '20100927 06:03:45.740', '20110612 13:49:45.950', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZDF', N'NQ5S', N'PYQF', '20090627 11:28:19.900', '20100208 22:38:32.480', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZTL', N'KQDK', N'BMUR', '20101226 11:20:43.730', '20110711 07:52:32.740', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZZC', N'SPFH', N'3G8X', '20101023 20:47:56.760', '20110530 21:47:27.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'71T0', N'8SHP', N'DTO4', '20101115 02:10:59.690', '20110410 22:30:10.980', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'71V0', N'4HND', N'REKD', '20091023 16:54:24.630', '20091104 00:58:32.750', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'72DM', N'FFUL', N'7V5J', '20100325 11:59:29.230', '20100327 07:21:11.450', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'72VU', N'D6IG', N'008T', '20090218 23:21:36.210', '20090331 00:59:33.390', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'73AT', N'4CD5', N'40VN', '20100805 17:06:05.140', '20110102 21:12:22.110', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'73KG', N'OSMK', N'5UAA', '20100908 07:29:32.270', '20110215 14:26:28.260', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'73LE', N'I8BM', N'GPG5', '20100917 09:01:45.680', '20101201 09:08:41.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'744F', N'YY7W', N'48Q0', '20100118 13:04:19.340', '20101029 09:22:18.630', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'75DZ', N'IJP8', N'BN4H', '20091218 12:29:03.450', '20100626 12:45:00.740', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'766Y', N'NNZ6', N'TPN1', '20100522 04:12:57.490', '20101103 13:18:16.300', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'77FL', N'TUML', N'A6X', '20090414 13:42:47.840', '20100206 05:46:21.440', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'78KC', N'OQ1K', N'9523', '20100414 07:17:34.610', '20100422 10:05:24.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7994', N'3DN6', N'2X0D', '20100723 08:42:49.280', '20101216 19:09:13.940', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'79E9', N'6ZXM', N'SCAP', '20090511 19:12:56.760', '20091027 15:29:14.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7A2Q', N'S517', N'9ZSZ', '20091114 23:20:45.280', '20100511 04:39:44.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7ADX', N'ODXE', N'DU8X', '20100218 05:52:59.150', '20100930 06:34:13.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7AJW', N'8HBX', N'4F5M', '20100222 14:21:43.560', '20100305 22:41:56.730', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7AMU', N'FU80', N'A6K', '20091226 00:23:03.010', '20100722 15:08:03.470', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7B2E', N'SKZW', N'H6UZ', '20100109 17:43:20.810', '20100623 22:22:34.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7CDQ', N'8WEX', N'TML9', '20091007 00:59:21.770', '20100713 19:13:25.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7DBD', N'QBC0', N'BUOA', '20090823 15:57:36.860', '20091123 14:24:52.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7GC0', N'P5S2', N'KDLV', '20091224 23:33:11.850', '20100425 04:03:50.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7IBQ', N'YY7W', N'6ZAA', '20091221 17:43:34.520', '20100811 17:22:26.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7JDD', N'1P21', N'PYQF', '20090419 11:12:09.690', '20091006 02:23:00.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7LJU', N'FB29', N'QT3S', '20100506 18:23:12.500', '20101030 09:47:40.660', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7N2P', N'BME4', N'3H2W', '20101104 09:19:29.880', '20110620 16:37:00.860', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7OCE', N'IQO2', N'T4KA', '20090510 09:05:23.700', '20091019 02:47:06.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7R4K', N'5YDM', N'VHPY', '20090110 06:17:28.790', '20090224 19:09:47.230', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7W06', N'BJ4Q', N'9523', '20100318 04:39:44.730', '20101229 07:13:34.960', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7WID', N'ADPF', N'Y703', '20101015 07:57:17.200', '20110622 04:29:20.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7Y67', N'9NCX', N'NWIZ', '20100922 10:29:31.640', '20101007 22:53:24.980', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'800N', N'S76Y', N'PKUI', '20090928 21:11:24.200', '20091004 22:09:49.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'81LJ', N'682F', N'NH8L', '20100914 15:03:24.710', '20100926 16:07:30.960', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8203', N'SUHS', N'A50H', '20100703 04:25:59.100', '20100905 11:58:05.700', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'82QB', N'89EP', N'7HNP', '20090126 17:45:56.440', '20091012 20:28:23.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'82UZ', N'6V30', N'PSMC', '20100221 04:15:46.430', '20100625 15:10:35.640', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'82ZH', N'OMEK', N'PXCU', '20100307 00:18:29.290', '20100719 15:19:01.970', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'831K', N'L3GL', N'HNHX', '20090516 09:42:14.490', '20100205 23:07:31.130', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'852S', N'U0TA', N'Q125', '20090906 23:47:45.370', '20100617 19:38:35.850', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'861J', N'B5HR', N'2RNY', '20090204 13:18:26.790', '20090212 20:07:35.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'86FP', N'UEKK', N'65CQ', '20090103 13:46:09.330', '20090912 21:26:18.180', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'86TK', N'LHEF', N'M6B1', '20091101 11:21:53.590', '20100102 10:52:53.500', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'87BH', N'332P', N'O80V', '20100604 18:06:45.930', '20110112 10:13:49.940', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8A1N', N'HRVU', N'VPKR', '20100529 10:19:02.960', '20101103 15:56:00.980', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8AW9', N'S6CE', N'MIRH', '20091226 05:54:04.780', '20100408 09:29:26.420', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8BES', N'O44Q', N'X8OS', '20101115 01:04:33.870', '20110825 10:56:09.460', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8MB5', N'RVEF', N'UAX8', '20090112 22:14:38.530', '20090309 17:25:50.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8OCG', N'UWGC', N'P7OD', '20100929 22:38:10.370', '20101009 07:36:43.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8OD1', N'PXVS', N'ET67', '20090903 22:05:17.110', '20091125 04:15:10.870', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8P26', N'0FHQ', N'AA7F', '20101116 16:12:52.060', '20110510 02:44:30.780', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8R2R', N'0Z7K', N'TOZF', '20090526 07:45:26.410', '20091111 22:21:58.660', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8RA7', N'C9SU', N'NLEN', '20090609 14:41:52.920', '20100127 12:49:20.970', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8SXC', N'QN0N', N'P51T', '20090118 07:01:27.140', '20090428 22:58:56.510', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8T9O', N'5P3Y', N'L5K6', '20100719 02:26:30.580', '20110427 22:25:42.590', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8UGF', N'D18U', N'G950', '20100616 10:41:51.860', '20100618 19:07:48.330', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8VNJ', N'ZF3K', N'5X3C', '20100915 21:04:07.620', '20110228 20:19:09.910', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'922F', N'1C3O', N'EW4Q', '20100211 19:05:22.580', '20100912 13:04:01.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'92JG', N'U5WL', N'9H68', '20090228 21:12:27.790', '20091125 12:39:09.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'92NL', N'7AY0', N'I5ZC', '20101016 22:21:23.140', '20110110 17:18:32.010', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'93FD', N'SUYB', N'5PR1', '20100424 07:12:04.740', '20100612 00:15:39.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'951I', N'15TH', N'H47G', '20091011 18:10:00.270', '20100111 08:30:22.470', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'994O', N'UU2L', N'5TRB', '20100221 22:17:18.740', '20101216 09:02:50.980', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9BS3', N'A0U2', N'NH55', '20090721 02:34:11.150', '20100413 23:52:15.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9D73', N'DRP8', N'8F6H', '20091103 07:08:34.720', '20100502 05:33:12.860', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9E67', N'F8DA', N'KJ1W', '20090920 20:08:37.810', '20091031 01:46:23.720', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9EIC', N'G5F2', N'FZ2V', '20090327 23:35:39.910', '20091120 22:52:46.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9GKT', N'REPR', N'ETOR', '20100119 20:12:54.950', '20100803 05:05:12.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9HF6', N'7FC1', N'M7NK', '20100830 11:13:10.160', '20100908 18:28:13.400', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9IS9', N'2ONB', N'4HA1', '20100313 23:13:07.550', '20100409 18:06:50.720', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9MCW', N'YDM2', N'SJSH', '20101231 07:24:48.850', '20110228 01:08:51.500', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9NN', N'YVSM', N'8SKB', '20091105 15:22:24.230', '20100503 07:39:00.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9P6F', N'332P', N'MH14', '20090628 23:21:03.330', '20100311 09:23:02.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9PN', N'YXWB', N'7VB4', '20100119 23:10:47.400', '20100925 11:30:57.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9R9T', N'74Z6', N'F6NP', '20100826 15:48:59.900', '20101104 14:46:39.370', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9T81', N'0RXC', N'P3W1', '20090315 10:14:02.060', '20090810 15:21:14.260', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9YIR', N'EUUQ', N'BFQR', '20100827 19:47:58.260', '20101205 09:57:17.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9ZIP', N'6UTT', N'101H', '20101212 02:13:02.420', '20110915 18:00:03.790', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9ZUU', N'0A98', N'1YTC', '20100317 05:30:49.230', '20100504 23:49:30.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A0TU', N'LOPX', N'HCQS', '20100514 03:45:27.430', '20110203 19:34:49.530', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A0V1', N'NJHO', N'NPA8', '20091109 00:17:56.850', '20100104 07:28:42.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A1W3', N'EP0C', N'J5RI', '20091114 18:58:50.590', '20100225 01:39:19.990', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A1Y4', N'XZAK', N'3ZW0', '20090920 14:59:57.440', '20100328 07:13:06.850', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A275', N'08CL', N'HW3H', '20090123 02:10:37.750', '20090712 06:16:01.520', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A2S7', N'5IA8', N'8HJM', '20100723 22:40:13.010', '20101026 18:14:33.490', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A5TM', N'9NHE', N'5HB4', '20100825 08:31:40.930', '20110123 21:58:22.890', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A9WP', N'GTMR', N'VTTR', '20100715 04:12:13.240', '20110127 14:11:38.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ABY6', N'IT1Y', N'Z6GG', '20090217 14:57:08.830', '20090404 12:36:25.250', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ADR', N'9ID9', N'8ZCS', '20090417 14:18:11.850', '20090429 05:48:56.790', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AE0U', N'FZO0', N'63YM', '20090821 18:49:52.960', '20100111 10:47:33.850', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AEP1', N'JBVT', N'HMTP', '20100614 09:30:25.860', '20110331 03:55:42.610', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AEWT', N'QZ2U', N'A9NK', '20090905 11:49:22.050', '20091229 19:27:28.710', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AF6S', N'3PV7', N'X911', '20090218 04:26:04.980', '20090420 04:00:54.750', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AG61', N'GJWX', N'BN4H', '20100525 04:29:28.610', '20100613 19:04:28.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AGVC', N'DIOW', N'1O8Z', '20091121 00:06:17.810', '20100802 23:50:44.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AIA5', N'AQN2', N'G950', '20101108 22:03:07.910', '20110310 17:12:14.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AN9P', N'JCLA', N'K5ZN', '20090713 14:36:53.510', '20100427 22:56:38.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ANG1', N'3WTS', N'BIZ0', '20090508 03:26:01.070', '20090514 20:18:57.040', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AQYZ', N'D5NP', N'WSVS', '20101120 05:32:48.990', '20110907 16:13:58.690', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ARMI', N'HSBJ', N'49YL', '20100710 23:52:58.660', '20101114 07:52:48.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AVT8', N'PLEC', N'DRDO', '20101106 00:24:03.120', '20110326 15:43:00.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AXS8', N'TD6Q', N'EYC', '20101125 03:56:26.760', '20110421 18:32:51.420', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AY8W', N'WO5A', N'8F6H', '20091103 10:18:10.830', '20100502 13:13:24.950', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AZ4S', N'HS6Q', N'JK4Y', '20090801 07:35:53.620', '20090810 05:28:25.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B4Q0', N'RDDD', N'PX57', '20100808 16:31:23.580', '20110427 14:21:42.870', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B5PD', N'9JIY', N'DMRD', '20090107 02:12:55.950', '20090719 23:21:45.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B67', N'O4JD', N'JI4E', '20090417 06:48:10.110', '20091126 01:33:03.940', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B68F', N'16R7', N'TGTE', '20090814 03:27:13.880', '20100407 13:35:21.100', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B7AG', N'5NX', N'W5XX', '20100105 12:07:11.440', '20100210 18:50:12.990', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B8D4', N'OCP', N'FEEY', '20100920 06:27:52.740', '20101216 20:13:52.750', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BE5F', N'4CD3', N'V6GT', '20090513 22:40:05.290', '20091011 09:56:04.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BEKS', N'13LJ', N'EYC', '20100918 10:41:47.170', '20101219 09:28:41.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BERP', N'IH31', N'BM9B', '20090909 13:45:35.710', '20091227 04:07:42.910', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BFOB', N'NR4M', N'6JXQ', '20100201 16:54:18.100', '20101031 22:46:27.970', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BGS0', N'9MXX', N'UVRI', '20090214 21:58:38.040', '20090505 15:16:36.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BKLK', N'E495', N'JB10', '20090511 21:20:22.140', '20100112 20:01:09.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BLXC', N'EZ3K', N'Y0T5', '20091220 16:20:26.240', '20091225 21:50:54.190', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BNYZ', N'8AIH', N'X7F', '20100301 23:16:48.090', '20100512 14:31:44.250', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BR7S', N'74M2', N'HXPG', '20090926 05:48:00.740', '20091207 00:31:18.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BRO2', N'2SG', N'DTPA', '20091115 14:06:45.790', '20100411 16:31:10.050', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BTT8', N'R2TE', N'XQ92', '20091104 12:18:01.020', '20100801 19:13:43.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BV3S', N'IOD7', N'YFVP', '20100707 04:45:39.470', '20101219 13:34:22.270', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BWGU', N'9O3A', N'K3X6', '20090426 04:28:27.390', '20091206 06:30:55.990', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BWM6', N'KX3C', N'A9NK', '20091211 17:56:08.750', '20100625 03:26:42.440', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BZYM', N'BCEA', N'T20X', '20100819 17:54:06.850', '20110422 07:21:59.740', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C01Y', N'1HFI', N'3S3P', '20101206 08:54:14.220', '20110816 21:19:21.600', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C6RG', N'JHJZ', N'KDLV', '20100706 06:42:49.150', '20110412 08:52:01.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C6XT', N'OS09', N'N5JD', '20090411 00:28:29.870', '20091013 20:23:43.530', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C8BU', N'62LK', N'IL0', '20090216 10:00:26.630', '20090819 09:41:54.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C8L6', N'41UE', N'FRV2', '20100502 09:49:16.620', '20110125 05:43:26.570', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C9B6', N'6VAU', N'F4VX', '20100122 13:42:15.390', '20100803 17:09:11.220', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CATH', N'56OB', N'OGDF', '20090104 04:55:00.490', '20090408 02:02:54.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CB2G', N'OIR1', N'ZU4L', '20100812 20:32:35.190', '20110213 08:13:02.870', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CCUI', N'2CJZ', N'W5XX', '20091113 10:50:29.400', '20100902 02:13:35.650', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CD2Z', N'5GC0', N'ZHBA', '20090107 17:28:10.830', '20090116 00:08:58.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CD4T', N'PT1T', N'R57K', '20090130 23:15:40.920', '20090506 15:10:48.500', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CH4F', N'U46M', N'GXH7', '20100607 14:09:04.550', '20110323 16:47:51.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CHIE', N'TBFH', N'FC6Z', '20090202 22:51:54.140', '20090821 08:20:33.690', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CHOE', N'43VK', N'OS1A', '20100210 09:16:49.430', '20100612 13:27:33.300', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CIB3', N'OJIX', N'GSMA', '20090123 17:46:57.720', '20090722 14:56:29.350', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CJDS', N'TSIU', N'1V6N', '20101104 11:29:48.930', '20110703 05:30:29.470', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CNO5', N'N43H', N'TJVH', '20101222 00:53:48.620', '20110202 18:48:15.960', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CO1O', N'AGKQ', N'KABG', '20090328 21:06:40', '20091013 19:47:50.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CONZ', N'K11H', N'2CHZ', '20100217 09:00:39.600', '20100310 22:04:30.790', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CR1N', N'APA4', N'1FSY', '20091024 23:31:03.460', '20100617 02:34:51.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CR6L', N'M64A', N'SXGB', '20090120 03:45:20.560', '20090402 23:58:30.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CVOE', N'0A4E', N'EZ0O', '20091021 14:17:58.590', '20100217 07:43:51.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CW2V', N'UWNT', N'L0J1', '20091002 11:52:31.470', '20091117 13:20:36.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CW4C', N'FBLA', N'1H6R', '20091117 18:25:02.680', '20100729 21:36:29.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CZ02', N'4TU7', N'V3JV', '20091106 08:46:18.650', '20100829 03:22:22.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CZY9', N'UTLA', N'8HPB', '20090527 19:56:11.500', '20090714 03:01:42.970', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D1AW', N'KI8I', N'9MAN', '20100914 04:20:08.550', '20110123 12:48:26.710', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D1D0', N'MS24', N'WRX1', '20101219 04:06:44.180', '20110103 12:44:24.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D4VF', N'8J0U', N'UWPO', '20090914 17:11:11.840', '20100525 13:54:23.180', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D4Z2', N'KGJJ', N'F7KE', '20090220 14:29:05.180', '20090924 09:17:11.400', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D5BQ', N'4S0S', N'YIYD', '20091213 13:16:03.550', '20101005 10:27:41.790', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D5P8', N'99XA', N'AATO', '20100330 13:00:45.110', '20110108 00:27:53.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D6L0', N'WCZ', N'J6QS', '20100912 21:50:04.490', '20101102 04:11:04.710', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D80J', N'738G', N'JVRE', '20101112 11:46:13.670', '20110211 13:29:52.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D80N', N'ZCZL', N'TD6N', '20100131 19:14:30.820', '20100419 21:52:39.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D8RF', N'60J0', N'PFPW', '20100717 20:22:08.780', '20110321 12:36:10.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D8RX', N'TQ30', N'CGDI', '20100117 10:43:02.380', '20100813 12:40:55.400', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DA7H', N'8I7P', N'T7CF', '20090904 01:51:26.310', '20100518 16:49:19.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DBNF', N'J3DY', N'HCQS', '20091211 06:19:51.830', '20100429 09:20:56.860', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DBOZ', N'9FJQ', N'2CHZ', '20090909 12:07:58.620', '20100317 22:10:41.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DFQE', N'8FGA', N'TG0S', '20101202 06:12:52.620', '20101229 16:29:52.460', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DGQE', N'IOZI', N'5AM1', '20091208 14:17:42.430', '20100805 13:48:50.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DIRR', N'ZSV5', N'E7IY', '20100213 20:02:15.520', '20100920 13:13:05.640', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DK2H', N'23A1', N'0BND', '20090219 00:46:33.350', '20090327 22:26:16.880', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DKP2', N'VFZT', N'6BCS', '20091124 04:28:39.220', '20100629 18:33:41.230', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DNVN', N'HUTT', N'24T8', '20090925 10:54:33.220', '20100418 13:29:27.580', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DOH4', N'4123', N'DRT1', '20090620 17:52:27.280', '20090717 10:16:07.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DQ8Z', N'G2YG', N'C9NV', '20100113 04:59:10.070', '20100807 22:05:27.990', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DQZF', N'YVD7', N'9S13', '20090414 17:13:05.450', '20090418 21:19:35.500', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DRUO', N'08CL', N'1IY0', '20101209 21:12:28.040', '20110907 19:07:48.180', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DS46', N'3WTS', N'YCT0', '20100703 21:20:43.710', '20101214 02:28:17.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DSJB', N'Q249', N'7J9V', '20090719 01:05:51.330', '20091027 16:50:43.870', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DTR1', N'ID0R', N'L0J1', '20091208 06:13:58.280', '20100319 03:15:09.340', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DW8M', N'20DY', N'F6U', '20090705 12:56:08.050', '20090801 11:33:47.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DYOF', N'IJP8', N'K2KN', '20101206 15:23:12.620', '20110325 19:54:00.760', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DYW4', N'FFKZ', N'9V0C', '20090623 06:07:13.430', '20090821 18:34:03.680', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DZLE', N'M33Z', N'WIYF', '20090815 10:52:43.560', '20100318 13:15:34.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DZUR', N'H3OY', N'GLY1', '20090720 05:09:55.820', '20090816 12:33:23.440', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E047', N'008V', N'MIRH', '20090710 20:16:57.230', '20100401 10:14:39.010', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E1C', N'ID0R', N'VBY4', '20091228 10:26:42.600', '20100202 12:09:19.860', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E3XS', N'ZU8B', N'VNV5', '20100122 08:33:57.400', '20100317 10:07:12.390', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E41F', N'SES2', N'SDI6', '20090802 18:11:07.340', '20100327 10:27:55.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E4EU', N'CZIL', N'Q3N8', '20091110 10:23:50.320', '20091216 02:00:00.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E5GP', N'LRPZ', N'AA7F', '20100305 17:42:12.870', '20101124 20:58:08.950', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E71', N'2L0B', N'H3K4', '20100107 19:46:27.290', '20100620 20:37:41.060', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E7TP', N'0FHQ', N'I5XD', '20090710 18:49:56.910', '20090716 02:25:20.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E897', N'H3EQ', N'5LHG', '20090606 22:03:01.260', '20090831 00:05:59.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EFVB', N'YCRI', N'T7CF', '20100315 11:31:43.570', '20100708 10:28:50.600', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ELGZ', N'UWG8', N'P25Q', '20101108 11:54:02.170', '20101222 13:02:45.110', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EMFK', N'2D3T', N'RIMK', '20090221 07:09:40.370', '20090610 16:42:03.740', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EMHB', N'7T76', N'I5QM', '20090530 03:51:06.110', '20100225 16:21:00.800', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EN00', N'3MHO', N'EKOW', '20090218 05:02:28.650', '20090927 01:42:18.470', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EO4D', N'VABI', N'2H13', '20090518 06:34:39.750', '20090821 04:08:11.380', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EOPN', N'213L', N'T64J', '20101222 18:59:58.980', '20110208 02:38:03.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EP1O', N'2MOF', N'LI6R', '20100904 16:14:34.460', '20100923 18:06:59.100', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EP3N', N'1EK9', N'S215', '20091029 17:29:51.080', '20091110 02:00:22.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ERB2', N'P4VT', N'8T9K', '20090627 04:55:24.040', '20090905 13:23:37.120', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EU8U', N'CUL2', N'NWTB', '20090504 13:47:25.730', '20091119 23:52:24', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EZMA', N'JFK9', N'FAMF', '20101227 12:06:53.530', '20110614 18:28:34.250', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F2YJ', N'HBGD', N'8U93', '20100718 07:43:05.180', '20101013 21:36:17.490', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F3G3', N'KWTV', N'CI8Y', '20100302 15:02:53.170', '20101101 19:39:06.690', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F4OX', N'JIVF', N'5AM1', '20091027 02:13:41.650', '20100520 08:16:13.350', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F4PN', N'C5V7', N'T3IS', '20090410 13:22:57.010', '20090826 02:33:19.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F4R0', N'TH20', N'2X8F', '20091026 18:17:15.910', '20100608 01:51:39.370', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F55', N'951D', N'YFVP', '20090311 18:21:19.070', '20090519 16:52:49.960', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F6G0', N'OD3Q', N'4Y46', '20090711 17:21:56.490', '20091108 06:57:02.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F8G6', N'OBB9', N'RAUD', '20091202 03:54:04.120', '20100115 15:42:42.600', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F8KK', N'LAPA', N'0FGV', '20101008 11:00:11.480', '20110523 03:28:31.820', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F8Q7', N'9IYS', N'0WTR', '20100521 14:35:26.660', '20100908 11:48:07.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FCH8', N'WZP5', N'GA5G', '20100718 20:31:22.630', '20100816 12:24:26.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FCP7', N'UDA5', N'JXSR', '20100814 10:52:47.080', '20100830 16:57:12.430', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FDXB', N'7OJJ', N'Q09Q', '20090706 23:45:53.820', '20100225 10:10:06.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FH6K', N'LJJM', N'2C3', '20100125 00:10:26.130', '20100127 16:47:19.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FJ0F', N'AJRX', N'HNHX', '20100512 22:06:06.410', '20110130 15:56:45.450', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FJAE', N'8FGA', N'HNHX', '20101020 18:40:50.150', '20110123 14:56:44.590', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FK7H', N'EGJ3', N'L0J1', '20090724 14:41:25.110', '20100509 03:34:26.340', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FKWJ', N'HQAG', N'27GP', '20100205 10:34:03.730', '20100218 19:53:19.800', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FLJT', N'BJ4Q', N'4T5', '20090716 01:40:06.420', '20091117 17:50:50.810', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FLTW', N'N0U9', N'J926', '20101223 02:11:34.560', '20110504 08:47:12.780', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FOCR', N'ZY6O', N'UH80', '20091213 06:48:20.800', '20100111 23:25:01.750', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FOI1', N'RZH6', N'6BRP', '20101115 15:19:53.510', '20110613 15:34:45.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FPG8', N'M9XT', N'K5ZN', '20100420 22:48:18.100', '20101126 09:23:50.420', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FQHV', N'NDFH', N'I1LD', '20090623 22:14:57.910', '20100412 19:54:45.260', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FRRV', N'B9N6', N'T183', '20101204 01:57:27.200', '20110106 15:34:01.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FRX8', N'P4P1', N'DR2H', '20091011 09:37:47.130', '20100208 08:05:28.490', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FSTI', N'YXYE', N'DNBL', '20090725 22:07:21.810', '20090921 11:22:26.470', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FT3C', N'LYTX', N'TEVL', '20090811 04:33:06.320', '20100402 20:08:07.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FW78', N'459O', N'2O9L', '20090414 07:00:35.180', '20090618 19:04:07.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FWIM', N'NLQN', N'FLQS', '20100731 01:55:20.140', '20100912 18:39:38.830', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FWVC', N'PF0L', N'Y8J0', '20100622 10:01:38.230', '20101124 04:59:40.550', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FWXJ', N'EJBN', N'ZMGR', '20090830 08:22:01.200', '20100318 15:44:36.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FY9O', N'JT4S', N'6WB8', '20100222 02:49:20.960', '20101203 21:09:09.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FYIR', N'0RXC', N'GUI9', '20101217 04:47:22.580', '20110514 16:18:14.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G09J', N'LGMF', N'D30H', '20100103 22:37:35.650', '20100716 04:36:57.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G0GF', N'9NCX', N'N5HP', '20101211 17:18:13.960', '20110309 00:04:27.850', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G0N0', N'G4Y', N'G7UF', '20100828 08:05:54', '20101029 21:48:19.930', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G0VL', N'9WS5', N'PAEE', '20090420 01:54:19.260', '20091012 06:27:57.140', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G1DV', N'KSYQ', N'4NBW', '20090524 05:18:51.290', '20090815 12:11:22.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G3MK', N'3RTG', N'2KXX', '20090804 16:47:31.260', '20100110 05:12:38.590', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G5U', N'4QJY', N'IV8P', '20101215 09:40:33.730', '20110424 17:24:53.810', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G94P', N'E4T8', N'6ZAA', '20100415 11:09:10.780', '20100512 18:27:16.340', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G95F', N'YZLJ', N'9XLH', '20091025 23:18:56.010', '20100405 02:43:35.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GA78', N'3RT5', N'8U93', '20100312 17:20:42.870', '20101220 08:12:07.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GABI', N'6AS', N'20AQ', '20101201 01:46:02.440', '20110819 00:18:34.240', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GABT', N'9ZDE', N'167Y', '20090510 21:36:45.580', '20090819 08:47:04.200', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GB4O', N'EYTK', N'AB1I', '20100215 14:07:13.880', '20101021 14:47:16.870', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GD1J', N'VXAZ', N'J3P2', '20100910 14:21:04.380', '20101030 03:18:09.840', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GFS', N'Z0IT', N'IIIO', '20101119 16:15:44.250', '20110311 09:22:53.300', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GH97', N'5GC0', N'ZCCD', '20100310 23:44:03.130', '20100511 14:05:37.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GIVI', N'535K', N'GAJR', '20101126 10:19:46.460', '20110410 21:47:55.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GKH1', N'CK68', N'ESYN', '20101126 21:39:27.350', '20110427 13:54:55.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GLD5', N'JFMV', N'1BWX', '20100204 02:43:03.890', '20100224 16:57:35.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GREK', N'IVJ6', N'J71O', '20100206 14:41:15.010', '20100727 05:13:57.400', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GSKU', N'48IA', N'SXGB', '20091030 22:45:54.720', '20091105 23:48:55.410', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GURU', N'ZKBR', N'JEPJ', '20090725 07:28:57.480', '20090801 01:42:29.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GX97', N'PVO4', N'UWPO', '20100920 19:10:18.930', '20110605 13:09:15.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GXL0', N'35R1', N'DP6F', '20091224 12:57:31.100', '20100623 18:21:44.520', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GXVH', N'Q61T', N'8BHO', '20100802 01:45:37.060', '20101114 03:52:47.300', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GXY0', N'7TKB', N'FJT8', '20101006 18:40:33.200', '20110114 18:57:58.760', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GZ12', N'ZVU2', N'489P', '20101217 23:05:35.330', '20110902 06:13:28.360', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GZ4M', N'D50Q', N'406E', '20100115 07:37:45.400', '20101026 18:46:30.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H0LA', N'E8BM', N'4QJN', '20100108 02:21:11.410', '20101005 11:36:43.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H23K', N'UMSS', N'6QX5', '20090514 03:23:46.100', '20090706 14:02:00.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H245', N'C1I9', N'Q05F', '20090124 09:25:29.150', '20090503 14:48:39.500', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H25', N'EWS4', N'BUOA', '20090817 15:33:50.270', '20091112 13:55:31.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H2HG', N'5VND', N'LJHB', '20100114 17:54:06.800', '20100521 13:57:47.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H2TQ', N'I5PL', N'YWA4', '20091214 09:32:17.920', '20101004 18:22:47.210', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H30G', N'EGJ3', N'M9P5', '20100117 07:21:54.960', '20100521 00:16:52.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H39A', N'JQDH', N'PSG0', '20101110 15:57:56.020', '20101221 00:33:53.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H3BB', N'B5HR', N'RL66', '20100823 14:34:44.680', '20110510 06:00:41.640', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H5UN', N'IZHQ', N'4PKR', '20090430 01:38:57.440', '20090702 01:16:06.460', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HAE', N'0ZRG', N'XOY6', '20090503 02:55:04.590', '20090829 18:22:25.860', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HARA', N'GCVP', N'7LRJ', '20090706 06:56:07.240', '20091003 16:55:09.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HE8V', N'BME4', N'UUTX', '20090106 04:46:27.690', '20090222 17:16:53.240', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HFDJ', N'QD1M', N'GXH7', '20100821 00:39:20.420', '20101010 06:34:04.010', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HG3O', N'5REP', N'ITZV', '20090715 14:15:38.240', '20090720 21:46:51.160', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HGES', N'KGJJ', N'4OJ', '20100619 02:08:56.300', '20101001 08:35:57.840', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HJXI', N'0QD1', N'WWYR', '20100628 22:42:28.330', '20101217 23:46:17.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HL6I', N'WDSK', N'WHUH', '20101214 14:46:53.550', '20101230 06:41:56.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HM83', N'BGOZ', N'DRT1', '20090427 15:29:03.740', '20100203 20:49:51.590', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HO60', N'L2DP', N'EZP6', '20090923 16:44:40.330', '20091228 06:59:27.950', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HON5', N'1GOQ', N'J4VK', '20090726 11:39:02.610', '20090807 02:16:47.810', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HPW3', N'I9HJ', N'WY35', '20100531 02:36:13.250', '20101026 04:16:38.590', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HPX', N'FBLA', N'SIQ3', '20091217 19:50:19.950', '20100203 22:04:01.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HT3K', N'MTRW', N'63ZW', '20091219 19:57:53.170', '20100817 21:27:35.180', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HTZC', N'FNNY', N'J35P', '20100131 11:09:47.580', '20100717 22:21:37.650', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HV2U', N'JAG6', N'6V7N', '20100316 02:19:09.840', '20100319 03:21:28.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HZDC', N'JROV', N'BN4H', '20100930 07:17:41.070', '20110202 07:16:01.530', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I1EI', N'7K64', N'9MI8', '20100603 13:47:31.430', '20100720 00:59:21.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I2YI', N'8KSE', N'4PKR', '20090124 01:18:14.150', '20091104 01:22:32.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I8IP', N'8QO3', N'TZPF', '20091222 06:56:38.630', '20100130 18:01:40.760', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I94P', N'MAM8', N'Z9ZD', '20091124 00:21:05.780', '20100825 20:40:47.500', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I9O9', N'6HT5', N'LBMH', '20101219 06:31:48.060', '20110406 14:50:46.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IB5S', N'5O1U', N'USM5', '20100320 13:02:05.480', '20100706 14:26:28.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IG83', N'DT8J', N'5DH4', '20100310 20:19:43.550', '20100325 22:00:35.190', 2)
GO

--
-- Data for table dbo.HoaDon_WebTower9  (LIMIT 1000,500)
--

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IH1W', N'36JU', N'27GP', '20101209 03:23:05.100', '20110831 14:14:28.500', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IHWE', N'C6RA', N'OS1A', '20100529 15:00:07.410', '20101226 19:33:13.180', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IIR7', N'HJ7Y', N'LHB7', '20100919 08:28:26.870', '20101020 18:36:52.690', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IOQT', N'J3DY', N'LUS8', '20101013 01:13:20.120', '20101130 06:38:54.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IOVM', N'3SLE', N'PTTW', '20100417 12:22:34.720', '20101004 04:54:48.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IPR1', N'J87R', N'JJF', '20090518 07:37:05.540', '20100121 02:47:26.640', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IPVC', N'K11H', N'H3JN', '20090403 08:17:22.880', '20091124 01:19:16.780', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IQ8T', N'UPIC', N'AAN8', '20091028 22:27:55.710', '20100405 05:45:00.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IR5Q', N'M64A', N'FO83', '20091219 21:30:07.420', '20100527 23:14:35.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ISSS', N'4S57', N'CNKT', '20100718 20:12:48.060', '20100912 21:32:56.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IT30', N'XCXJ', N'OUR7', '20100729 00:06:33.050', '20110415 09:28:31.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ITM', N'207K', N'5AM1', '20090913 03:59:48.070', '20100301 03:09:18.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IW0K', N'BY12', N'NFTV', '20101212 01:07:01.350', '20110307 19:19:27.060', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IWNI', N'FBLP', N'FNYO', '20090202 13:20:56.070', '20090817 16:38:25.340', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IWR', N'SVIU', N'9N5L', '20090712 06:40:57.330', '20090928 06:20:19.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IX4T', N'ZYTB', N'VFDR', '20100503 18:47:22.750', '20100920 02:14:05.370', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IX69', N'008V', N'RSF4', '20090513 00:27:25.360', '20091102 14:07:17.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'J3CY', N'NBRF', N'JICJ', '20090517 06:01:36.720', '20100119 10:42:06.100', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'J6OQ', N'00XS', N'BRV1', '20100908 08:34:39.830', '20101223 00:38:08.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JA23', N'U410', N'GXH7', '20101119 16:16:39.760', '20110324 06:47:18.780', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JAWW', N'21EL', N'2437', '20090430 10:35:36.950', '20090723 07:43:21.310', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JCV5', N'UYKZ', N'BS6M', '20090921 14:05:55.020', '20100115 22:28:10.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JCXT', N'RVEF', N'QVUN', '20100817 16:27:32.940', '20110505 09:49:26.890', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JENA', N'5Q7V', N'BV2I', '20100523 10:18:55.460', '20100608 07:50:58.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JGUT', N'QB6Q', N'QHI6', '20100316 00:46:28.300', '20100730 14:25:42.270', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JH58', N'UL6W', N'4NBW', '20100410 10:43:09.110', '20100527 19:46:11.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JHCL', N'NDL', N'7IWC', '20091123 01:04:13.220', '20100616 13:04:36.370', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JJ4Q', N'H4HJ', N'IV8P', '20090614 19:28:20.620', '20100321 06:06:13.220', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JLJV', N'G7L5', N'GTUN', '20090927 04:15:42.510', '20091218 07:59:24.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JNAY', N'PKI', N'5KVS', '20090917 09:23:18.830', '20100305 23:35:19.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JNUW', N'NA5V', N'167Y', '20090916 11:46:00.250', '20100410 12:54:51.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JO1O', N'0XK7', N'HMTP', '20090727 02:16:53.220', '20090821 02:31:34.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JP18', N'8MNB', N'SIQ3', '20100920 22:20:22.290', '20110623 20:44:42.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JS3', N'DDEJ', N'167Y', '20090711 18:58:20.070', '20091209 20:26:35.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JTC8', N'064P', N'6I8M', '20090207 21:51:11.350', '20091112 15:49:47.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JTKR', N'4MW3', N'M7NK', '20090730 13:20:59.900', '20100510 14:32:07.860', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JTUD', N'4D2S', N'6YDI', '20090710 20:35:03.860', '20091017 11:49:01.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JVSS', N'3RT5', N'7IH7', '20100123 02:11:43.290', '20101006 02:42:22.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JZBH', N'P5S2', N'H787', '20101016 10:54:12.390', '20110119 05:54:18.890', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K0PW', N'7N3V', N'9CRV', '20090806 00:27:08.920', '20091114 08:00:08.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K1B0', N'IWVD', N'Y35E', '20100329 21:51:21.410', '20100624 09:40:57.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K1YH', N'33DQ', N'NSOR', '20101019 05:25:08.240', '20101126 12:04:17.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K2NB', N'4XPI', N'WRX1', '20090121 16:36:59.890', '20090305 15:19:08.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K30K', N'7T76', N'XYJ3', '20100518 06:49:39.200', '20100922 23:21:33.100', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K3DJ', N'D6KA', N'O9FI', '20091014 21:39:53.700', '20091113 15:23:44.980', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K56Z', N'IS3W', N'K6QJ', '20091026 01:46:30.180', '20100107 21:59:38.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K5SI', N'BRQ3', N'ZARR', '20101124 01:23:15.200', '20110825 17:13:36.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K6YA', N'JFMV', N'669C', '20101122 06:53:38.430', '20110627 10:40:56.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K8HM', N'F6TA', N'7HNP', '20100831 03:44:22.670', '20110115 08:02:45.940', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K9JD', N'NC74', N'WGQK', '20090701 21:00:02.800', '20091228 08:55:23.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KAN8', N'JBVT', N'ITZV', '20100708 11:59:57.420', '20110503 22:18:47.140', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KCKP', N'5TI5', N'CRKT', '20100514 23:09:16.170', '20100517 10:44:31.140', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KDEY', N'FB1N', N'MRUT', '20100117 16:52:08.590', '20100516 15:04:27.420', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KDO4', N'YWD1', N'JQ30', '20090611 08:15:51.510', '20100303 22:44:38.760', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KGCG', N'867M', N'W5XX', '20090711 22:16:07.830', '20100118 02:20:50.570', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KIRA', N'H3EQ', N'HC2V', '20090513 04:42:44.200', '20100202 15:21:13.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KKOB', N'JAG6', N'9ZSZ', '20090612 13:46:16.780', '20090801 01:26:30.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KMDO', N'2L5W', N'JICJ', '20101121 13:41:36.790', '20110303 13:37:34.750', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KN09', N'3MCM', N'MQTJ', '20100419 08:15:25.600', '20101030 17:47:03.720', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KOAO', N'RYLG', N'898P', '20091010 10:14:03.060', '20100320 22:44:59.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KQGF', N'D6KA', N'1PB8', '20100411 17:44:37.240', '20100621 20:56:34.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KQMW', N'CPWP', N'RBU2', '20090225 06:27:44.910', '20090619 14:58:33.750', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KSM8', N'FZZ1', N'9SBT', '20100212 03:13:00.930', '20101023 08:51:55.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KU0K', N'6UTT', N'CMUG', '20091224 23:22:20.800', '20100630 04:43:08.600', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KVS7', N'N5X0', N'QN1K', '20100710 09:02:11.530', '20110226 20:23:46.250', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KY6D', N'5M1I', N'3H2W', '20100911 08:44:30.430', '20110314 03:07:38.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L00L', N'HUYH', N'FEEY', '20090710 20:08:04.980', '20090808 14:44:18.540', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L3PN', N'NY21', N'PXFC', '20091028 08:16:58.580', '20091125 04:17:55.490', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L6W5', N'7GII', N'RBU2', '20101113 16:22:07.780', '20101212 19:46:13.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L72L', N'RSB8', N'9N5L', '20100502 01:14:35.980', '20100521 16:25:19.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L8HQ', N'KP5', N'TG0S', '20100409 07:10:23.810', '20100819 21:02:44.520', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L8KD', N'JBSB', N'4HNE', '20090310 09:13:35.220', '20090403 01:09:02.340', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L974', N'JFK9', N'154J', '20100312 19:20:11.430', '20100503 20:26:16.150', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LBOY', N'LMHE', N'5LHG', '20100614 08:55:58.640', '20100913 11:57:52.640', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LC0G', N'94EW', N'WVJ7', '20100718 19:53:54.490', '20110123 11:05:06.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LC99', N'20DY', N'DP13', '20100324 03:50:59.210', '20101204 10:32:58.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LDYY', N'YKKF', N'SJN0', '20100510 05:51:33.060', '20101022 21:19:11.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LFO5', N'KD5W', N'B5P8', '20100824 00:01:11.100', '20101130 20:14:20.400', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LFQU', N'IRFC', N'LDZ1', '20101113 14:34:03.780', '20110130 22:23:31.440', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LGGQ', N'2AZ4', N'EV3R', '20090610 05:47:31.470', '20090620 21:24:10.640', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LH2V', N'6LRC', N'KDLV', '20090627 11:00:05.920', '20100327 09:55:42.630', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LH62', N'ZU6I', N'47OZ', '20090521 10:23:24.730', '20090815 05:54:38.530', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LIVZ', N'NKSL', N'2RNY', '20100112 12:52:46.160', '20101028 21:38:50.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LKPQ', N'UHW', N'C06X', '20090117 01:51:36.140', '20090815 22:06:30.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LM7K', N'LOPX', N'HROX', '20090102 14:47:12.390', '20090606 08:12:40.350', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LP1V', N'X5ZX', N'CRKT', '20100213 21:07:01.050', '20100930 06:37:31.680', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LPTV', N'GX7E', N'X4FS', '20090219 18:03:16.700', '20090424 21:38:37.860', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LQHG', N'EXTZ', N'F8YN', '20101022 21:42:17.860', '20110216 04:25:27.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LRY6', N'H4Z7', N'XQCR', '20091105 10:34:34.170', '20100803 04:23:32.400', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LSBS', N'6HT5', N'5PR1', '20100530 12:33:19.100', '20100816 21:14:44.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LUWX', N'9LT6', N'IAM7', '20091226 10:17:27.880', '20100518 15:16:25.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LV3Q', N'IEPN', N'ZCCD', '20090602 23:35:11.980', '20091011 18:55:23.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LXG7', N'WXQO', N'KEGX', '20100507 05:25:13.340', '20101223 15:46:55.680', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LXKN', N'VOC7', N'W4TP', '20100108 06:09:26.610', '20100216 11:56:29.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LZNH', N'NTQS', N'D30H', '20101021 03:40:21.270', '20110302 01:18:54.930', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M0CR', N'5J3G', N'BN6N', '20091228 21:59:24.320', '20100715 05:39:51.210', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M0I', N'3RTG', N'VK3D', '20090614 00:07:50.630', '20091203 12:49:18.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M1C3', N'56HA', N'JEPJ', '20100614 14:15:49.830', '20110315 03:04:31.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M2G', N'6U2J', N'Z7L4', '20101129 13:07:06.500', '20110905 10:13:22.700', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M778', N'2L5A', N'LZGZ', '20100611 18:11:38.810', '20110212 22:19:13.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M8Q1', N'74M2', N'1FFM', '20090830 11:00:17.260', '20100308 13:50:16.660', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M9PO', N'L72J', N'GKCL', '20090516 14:17:04.770', '20100214 23:53:19.040', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MB25', N'3PIR', N'9MI8', '20100922 21:03:31.290', '20110208 01:36:09.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MBJ4', N'KI8I', N'L5K6', '20100202 05:08:53.210', '20100627 22:05:31.510', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MC2G', N'BQ0F', N'3ZW0', '20091111 09:44:06.590', '20100630 14:17:14.880', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MDBX', N'543K', N'TD6N', '20100303 03:34:36.940', '20100614 00:12:38.940', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MDRN', N'NCZY', N'8OIB', '20101026 10:34:06.090', '20110415 19:13:44.450', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ME1K', N'QZQM', N'W98U', '20090322 14:50:41.150', '20090628 16:52:23.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MEP3', N'E93I', N'65CQ', '20090618 23:10:57.190', '20090916 05:24:42.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MF8Y', N'I3NX', N'GTUN', '20101004 10:30:57.870', '20101231 14:19:41.640', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MG4P', N'VXAZ', N'AWK', '20100601 21:21:58.260', '20100704 14:36:34', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MGS9', N'IJAX', N'YCJG', '20090503 03:31:45.940', '20090823 21:24:58.630', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MHHP', N'9O3A', N'7UXD', '20100310 20:48:56.040', '20101226 03:25:29.330', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MHJI', N'B5N2', N'YZD4', '20090625 23:08:46.350', '20091124 22:43:39.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MHRP', N'OQRO', N'E415', '20101013 20:05:46.170', '20110208 11:25:19.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MJ1U', N'YHOI', N'AY71', '20100823 16:37:23.030', '20101201 18:09:54.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MJ7O', N'21EL', N'Y7F8', '20090801 11:25:29.860', '20100205 14:15:48.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MKJQ', N'FZRX', N'T64J', '20101203 04:58:25.630', '20110103 04:19:26.520', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ML03', N'RSB8', N'WIYF', '20090109 01:31:14.380', '20090213 13:54:09.480', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MLQ9', N'H4ML', N'Y7F8', '20090617 03:15:42.690', '20091114 20:04:33.120', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MNZY', N'RUCW', N'8SKB', '20090426 17:35:38.210', '20090516 22:45:55.840', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MQ0O', N'Z0CS', N'A4WL', '20100430 12:48:33.380', '20100512 21:48:03.050', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MSBM', N'QMQA', N'4MI0', '20090928 18:55:17.380', '20100405 06:47:55.240', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MURY', N'1GOQ', N'0M0O', '20090317 15:07:46.410', '20090513 10:49:14.900', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MWYT', N'J5R5', N'Q3N8', '20090704 16:54:06.150', '20100219 16:31:49.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MXR5', N'OE8M', N'GBJ0', '20091216 06:45:29.180', '20100516 22:38:03.300', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N0W4', N'BCMU', N'AATO', '20101220 11:34:45.470', '20110709 21:17:59.810', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N3YC', N'UQYU', N'WIBB', '20090222 09:32:13.900', '20090506 02:20:50.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N8Y0', N'MAMK', N'WO18', '20090106 09:39:22.930', '20090206 22:44:55.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N9A5', N'OSMK', N'5Z88', '20100903 00:33:34.670', '20110204 01:40:57.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NA2S', N'MY25', N'6I8M', '20090118 04:39:11.720', '20091005 15:16:46.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NC5G', N'OCP', N'6JXQ', '20090922 06:11:53.620', '20100304 16:25:05.530', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NCA', N'ZQNW', N'VW2H', '20091030 11:42:03.840', '20100810 02:56:53.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NCTI', N'Z381', N'1YKW', '20090826 19:44:48.260', '20100225 15:59:14.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NENM', N'4WG6', N'Q125', '20100317 16:32:03.940', '20100805 21:58:32.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NHYY', N'4QJY', N'6BUO', '20101111 15:32:27.820', '20110606 03:57:39.750', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NIOC', N'HJB4', N'VTTR', '20100615 02:35:05.240', '20101203 18:53:52.780', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NJ5P', N'VAQR', N'DRDO', '20100309 22:33:32.340', '20101107 15:03:58.050', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NLV8', N'PACT', N'6OKK', '20100102 11:59:58.670', '20100905 02:55:07.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NMLM', N'7YHW', N'7W34', '20101102 16:19:08.290', '20110505 10:50:26.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NOG7', N'PF0L', N'FK76', '20101026 18:53:08.820', '20110219 18:28:38.400', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NPP0', N'6YLS', N'RIEW', '20100810 00:43:07.910', '20110416 05:23:13.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NR60', N'MT6V', N'7UXD', '20091008 17:32:37.810', '20100322 02:29:28.120', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NRE3', N'EJBN', N'OHSW', '20100505 05:38:48.790', '20101114 04:41:30.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NRH7', N'DWWK', N'F7KE', '20100422 02:00:28.730', '20110112 15:14:00.280', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NS05', N'PLO5', N'I1LD', '20090730 20:24:20', '20090822 23:43:48.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NSDJ', N'TPO2', N'H6UZ', '20100313 16:25:32.520', '20101016 11:13:41.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NSP3', N'535K', N'8HJM', '20090918 14:28:19.120', '20100206 21:35:05.160', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NTNQ', N'WYVQ', N'PSMC', '20100617 23:35:54.780', '20110124 10:12:10.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NUG7', N'HZCZ', N'IIIO', '20100607 07:40:37.890', '20110310 02:09:33.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NUSR', N'XGLY', N'8HJM', '20100421 21:51:02.010', '20100510 09:21:59.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NUW3', N'BXRS', N'70ZD', '20100105 21:37:26.030', '20100907 13:40:08.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NX1T', N'3CND', N'AXHL', '20090728 10:24:36.990', '20091015 07:36:46.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NX6R', N'J9VM', N'9ZSZ', '20100621 04:39:23.700', '20100816 20:06:24.540', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NY58', N'ZX3S', N'4NBW', '20100621 07:10:21.090', '20101005 16:41:27.280', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NZID', N'HRX2', N'HZNO', '20090729 23:51:00.900', '20090821 20:20:43.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O0BB', N'T4XF', N'N9R6', '20100704 10:30:28.750', '20110316 10:20:17.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O0OA', N'LON9', N'O9FI', '20101121 05:08:48.200', '20110120 18:07:15.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O1P5', N'5PK0', N'MH14', '20101031 17:24:51.230', '20101228 17:14:10.540', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O4B6', N'Y36U', N'HZNO', '20090923 22:00:37.550', '20091201 17:15:57.210', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O5RG', N'CP5P', N'NPA8', '20090428 17:33:02.460', '20091111 03:01:30.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O70R', N'1PDV', N'MXA3', '20101112 08:51:25.490', '20110115 08:42:19.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O7UF', N'LS4H', N'2C3', '20100315 10:29:46.530', '20100427 21:47:52.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O8ZB', N'2BQ', N'Q1LL', '20100419 05:46:59.030', '20101003 17:31:40.650', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O947', N'JHJZ', N'H6UZ', '20090502 03:42:52.980', '20100114 19:39:42.010', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OAQ7', N'ALW2', N'Q09Q', '20090612 16:37:23.990', '20100112 04:27:00.600', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OBAJ', N'23YJ', N'W53G', '20100406 00:23:47.500', '20100725 22:43:42.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OBZ', N'AX2U', N'VKW4', '20090723 07:03:51.220', '20100212 11:27:07.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OCN0', N'9MAZ', N'HOJI', '20100815 04:13:07.750', '20100923 16:21:26.610', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OCTO', N'A6K6', N'X8QZ', '20090612 16:56:09.800', '20091115 01:31:37.340', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OEAI', N'SDRD', N'ZBE5', '20100521 13:41:30.510', '20100919 13:19:05.120', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OECD', N'56OB', N'JICJ', '20100207 19:07:14.060', '20100723 22:08:12.190', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OEK7', N'2SXQ', N'WB6Q', '20100421 23:54:06.470', '20100821 19:58:37.270', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OIJH', N'IZU', N'AQBD', '20100926 16:13:29.400', '20110203 21:49:26.570', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OIKG', N'09NB', N'REKD', '20100818 05:54:40.030', '20110501 23:46:56.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OK0Z', N'LJPZ', N'7V5J', '20091206 04:08:52.610', '20100706 07:56:56.600', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OLII', N'SKEO', N'NH55', '20090825 12:04:06.640', '20100617 11:43:25.050', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OLKY', N'513Z', N'KMM4', '20101021 14:32:06.910', '20101224 23:41:10.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OM2B', N'NRD', N'24T8', '20091028 21:44:59.740', '20100618 10:49:36.250', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OMDR', N'9MAZ', N'58VF', '20090417 13:38:58.510', '20090604 01:40:32.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OQID', N'9NAS', N'A9NK', '20090715 21:59:35.560', '20090926 18:56:07.180', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OSNQ', N'VY2R', N'YWKW', '20100715 17:10:02.440', '20101231 18:24:23.500', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OSWL', N'ONLR', N'KN1D', '20100131 12:58:48.440', '20100628 10:39:54.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OTZQ', N'VMQQ', N'KNA5', '20100509 04:45:16.590', '20101223 05:39:38.250', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OVC7', N'OIU8', N'B5CT', '20090309 16:58:56.420', '20091126 08:14:32.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OWEC', N'2D3T', N'7ZEE', '20101229 01:28:15.160', '20110815 07:30:34.280', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'P0D', N'IWVD', N'QNFD', '20091007 15:52:18.250', '20091012 03:10:26.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'P2LN', N'99AE', N'V8A0', '20100124 03:52:49.310', '20100324 20:38:46.690', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'P9P1', N'867M', N'2R39', '20090619 00:58:09.090', '20091015 21:08:02.990', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PAHC', N'U3KT', N'QT3S', '20100411 13:40:48.450', '20100914 11:54:34.610', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PBMX', N'GAF', N'48Q0', '20090428 16:10:02.810', '20090704 01:31:26.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PCIK', N'YLLN', N'9S13', '20090322 10:11:33.010', '20100101 07:46:49.950', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PCMT', N'REU2', N'7PBI', '20100110 15:12:53.930', '20100910 07:43:15.500', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PD8B', N'OET2', N'3TU5', '20100505 08:48:43.750', '20100720 17:49:01.140', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PDNO', N'HS6Q', N'5WSJ', '20101009 00:48:57.910', '20110412 05:28:32.180', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PDQZ', N'48IA', N'H3JN', '20091004 09:51:18.830', '20091229 07:59:43.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PEPH', N'33AI', N'FO83', '20101112 03:25:14.780', '20110320 07:08:05.350', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PGGP', N'11MR', N'21SN', '20090309 04:08:40.720', '20090419 12:40:03.760', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PKCY', N'GJJQ', N'SCAP', '20100122 06:22:25.130', '20100410 23:46:46.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PLQX', N'R2TE', N'3WN2', '20090523 06:09:04.330', '20090821 06:53:19.510', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PN7V', N'8MNB', N'YDA8', '20100120 16:34:05.140', '20100217 14:04:39.800', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PNEA', N'BXRS', N'B5CT', '20090331 23:17:43.120', '20100105 18:50:57.480', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PORE', N'GGK4', N'YLBO', '20090324 04:16:41.710', '20090609 16:05:32.480', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PQ22', N'PAJF', N'Q09Q', '20090829 12:54:03.260', '20100602 18:11:05.210', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PR0E', N'4MW3', N'M81I', '20090220 14:42:14.970', '20090722 21:31:55.820', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PTC8', N'ECMY', N'6HGT', '20100929 17:56:24.510', '20110318 20:18:15.290', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PTUA', N'DT8J', N'J71O', '20090924 23:23:21.690', '20091123 23:10:47.450', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PYJK', N'XUFO', N'1VE4', '20100426 01:25:04.840', '20100717 03:02:22.780', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PZFB', N'YZOV', N'NNOU', '20101126 20:33:27.720', '20110205 23:58:32.250', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PZSV', N'9MXX', N'WVJ7', '20090903 10:48:08.330', '20100418 12:48:28.400', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q0FH', N'9LD7', N'FZ2V', '20100718 06:53:48.190', '20100817 08:47:56.640', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q320', N'2XQU', N'XQCR', '20100322 06:12:30.590', '20100613 11:54:42.310', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q407', N'6LBR', N'3BUM', '20101115 12:12:41.820', '20110711 16:26:50.040', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q4KM', N'J5R5', N'NH4E', '20090122 19:09:53.250', '20090522 14:44:35.110', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q4UB', N'OQRO', N'LZGZ', '20100405 23:09:57.240', '20101014 07:28:19.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q569', N'A2F3', N'TML9', '20101028 04:17:43.300', '20110821 13:31:12.710', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q85B', N'LIC1', N'JVV5', '20100227 10:49:54.700', '20100825 07:35:48.180', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q8WB', N'GV6Q', N'P49', '20101211 15:46:43.940', '20110220 07:40:10.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q9NT', N'5428', N'WWYR', '20090925 05:10:04.300', '20100527 18:19:50.900', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QB81', N'5PK0', N'QLCX', '20090915 16:10:17.790', '20100629 17:40:56.360', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QBIQ', N'IMRQ', N'ZC74', '20090823 02:07:03.080', '20100308 17:22:35.530', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QD57', N'B5N2', N'9B1Y', '20091110 17:04:28.970', '20100509 18:59:15.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QEFM', N'JMY7', N'XQ92', '20090608 19:41:31.070', '20091103 22:52:28.440', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QERL', N'GZXX', N'HCQS', '20090329 18:15:20.180', '20091113 01:22:14.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QF0L', N'TT', N'RHVC', '20100402 19:25:54.780', '20100824 01:53:41.270', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QG8G', N'NDFH', N'A3HZ', '20101222 09:59:44.720', '20110717 11:35:48.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QH5', N'PCP4', N'DRDO', '20101015 05:08:02.360', '20110215 02:54:42.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QI8X', N'G0G6', N'NW7C', '20091013 08:47:08.880', '20091115 12:01:50.050', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QJF0', N'VU9Q', N'F94E', '20090919 23:30:47.120', '20091217 19:02:30.680', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QKNU', N'H4HJ', N'G950', '20101121 07:49:30.780', '20110402 10:05:51.680', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QMJM', N'23A1', N'2R39', '20100515 06:13:30.720', '20100813 12:38:28.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QP6W', N'9HZ6', N'4HRZ', '20100901 11:50:05.470', '20110215 18:25:26.640', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QP9S', N'2TVF', N'M9QK', '20090728 13:25:23.700', '20100506 01:37:58.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QQUC', N'4W1Y', N'AZDS', '20100911 08:53:00.030', '20110104 08:52:09.160', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QS6X', N'41UE', N'I2YX', '20091202 06:44:54.610', '20100406 03:30:54.100', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QSGS', N'5OB0', N'ZCEF', '20100121 20:01:48.690', '20100212 16:13:22.530', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QTG7', N'H6JK', N'HKC0', '20090710 13:35:39.280', '20090723 02:17:52.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QVFP', N'PXVS', N'PYQF', '20100817 02:25:19.240', '20110511 23:54:25.490', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QXDR', N'TH7H', N'5HB4', '20090720 17:08:08.200', '20091120 01:26:54.730', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QXHL', N'HJWK', N'L19T', '20101123 22:05:44.770', '20110220 09:39:13.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QZSB', N'3CND', N'DTCN', '20090516 08:22:34.730', '20100309 13:54:53.340', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R3PA', N'EYTK', N'O6QY', '20100505 18:01:39.640', '20101119 14:16:23.150', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R59A', N'JL7D', N'2C3', '20090915 16:43:51.260', '20100329 15:19:10.510', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R93G', N'V132', N'F6BT', '20100405 10:16:05.030', '20101214 03:16:30.980', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R9NR', N'ALW2', N'6HGT', '20101030 08:03:23.700', '20110513 14:27:27.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RA9D', N'4YD4', N'E415', '20100430 00:48:49.930', '20110204 14:37:34.960', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RAZD', N'IWM8', N'2X8F', '20100417 04:21:39.890', '20100622 04:51:04.770', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RCS1', N'UWGC', N'UH80', '20101230 00:33:18.820', '20110211 14:31:50.080', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'REK3', N'9LT6', N'4MI0', '20100809 00:28:00.510', '20110102 19:52:03.630', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RF80', N'D140', N'7V5J', '20090820 23:26:18.050', '20091222 22:18:49.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RHNI', N'TI83', N'V8A0', '20090426 12:27:48.030', '20090909 00:26:46.190', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RJD2', N'LSK', N'33RD', '20100327 16:14:46.700', '20100515 07:42:51.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RKIH', N'X8DU', N'8BHO', '20090821 14:11:48.570', '20091219 19:57:29.170', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RLU6', N'JMY7', N'HCQQ', '20101122 21:33:22.760', '20110327 04:31:59.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RMWR', N'M33Z', N'J71O', '20100223 07:26:35.930', '20100826 18:26:24.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RTRP', N'X3BU', N'OIME', '20100629 22:00:12.320', '20110223 02:52:42.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RUEW', N'Q8U9', N'FA8Z', '20090311 12:18:21.430', '20091028 00:52:45.880', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RVUA', N'AWZT', N'NMQE', '20100512 05:06:46.110', '20101206 08:06:31.260', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RVWT', N'AXZV', N'Q0TM', '20100420 14:51:24.540', '20101007 01:32:59.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RXHA', N'33DQ', N'D3ZB', '20100215 23:23:13.330', '20101002 09:17:34.200', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RXM5', N'FFKZ', N'1H6R', '20091116 17:39:29.210', '20100727 22:54:56.470', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RXN1', N'QFVG', N'SFM', '20090418 06:54:26.740', '20090914 08:48:18.650', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RY0H', N'NSYH', N'WGQK', '20101207 22:28:44.110', '20101218 10:22:39.730', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S26L', N'S517', N'V8WT', '20100131 03:52:33.890', '20100405 22:06:22.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S29J', N'3PV7', N'63YM', '20100206 08:31:01.250', '20101114 08:07:45.150', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S3TP', N'HI4N', N'X5JW', '20091207 04:59:12.120', '20091209 18:39:36.630', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S809', N'LS4H', N'G7UF', '20090828 23:23:09.660', '20091030 23:36:00.930', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S8CC', N'BCEA', N'LFGO', '20100615 16:00:07.430', '20110224 03:58:56.280', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SBHI', N'VX8H', N'VFDR', '20090204 02:22:42.280', '20090411 10:43:53.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SCLR', N'D50Q', N'VK3D', '20100111 09:48:32.520', '20100226 13:20:41.980', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SE2E', N'MAM8', N'GBJ0', '20100810 08:58:48.990', '20100925 23:01:12.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SGNI', N'IZHQ', N'7BCY', '20100527 09:49:33.400', '20100725 14:34:55.620', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SGQX', N'A3BN', N'U2EU', '20100418 13:24:16.120', '20100831 13:39:16.750', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SHVC', N'IS3W', N'SIQ3', '20090320 19:53:47.580', '20090723 09:55:35.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SIOY', N'FMRN', N'2K6W', '20101025 06:16:22.910', '20110608 09:57:45.710', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SISQ', N'DIOW', N'GA5G', '20100330 01:04:43.690', '20101122 16:13:20.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SJX1', N'JAQA', N'7J9V', '20100525 09:57:52.720', '20100720 09:06:26.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SP4X', N'SREB', N'BOFP', '20090604 17:53:30.530', '20090702 12:45:23.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'STOB', N'GD4P', N'FOP', '20090817 03:52:04.500', '20091012 11:58:11.110', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SU4F', N'9YDB', N'JFY5', '20101021 21:13:18.690', '20110109 05:10:39.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SUHI', N'PZ0A', N'X8QZ', '20091010 16:38:17.930', '20100621 15:34:14.640', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SVI3', N'207K', N'VCAP', '20100629 17:31:11.170', '20110102 02:44:11.570', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SW19', N'1G8R', N'GSBE', '20100815 21:58:26.510', '20101002 23:20:10.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SWUG', N'YVSA', N'IX5Q', '20090308 14:07:11.250', '20090922 07:03:49.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SXLX', N'PM9C', N'1IQ7', '20090125 08:56:44.460', '20090204 18:35:26.290', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SYQW', N'HPAN', N'Q18O', '20091215 04:51:23.330', '20100218 00:40:47.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T0CB', N'9IYS', N'008T', '20100911 16:44:00.140', '20110407 23:23:13.280', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T161', N'2O5X', N'2X8F', '20090222 18:30:51.500', '20090317 01:03:42.380', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T2XR', N'4GA1', N'GXGQ', '20090920 05:46:44.310', '20091204 15:48:41.590', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T3U4', N'8AIH', N'4DQC', '20090712 09:58:59.600', '20091115 22:52:55.590', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T4DD', N'ONLR', N'GJS8', '20100226 23:20:03.530', '20100925 03:29:48.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T5SM', N'866Y', N'CTI0', '20091003 22:42:20.180', '20100130 22:43:08.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T6RU', N'L45F', N'LFGO', '20091120 14:39:00.320', '20100212 03:42:32.280', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T8W4', N'Z954', N'WOD7', '20090126 06:12:39.210', '20090314 18:05:57.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T9GV', N'AJRX', N'MGCN', '20101220 23:23:13.210', '20110330 15:19:17.100', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TAVR', N'QENQ', N'I5ZC', '20101228 23:43:28.890', '20110523 18:13:48.530', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TEZT', N'62LK', N'AJT7', '20101003 21:17:07.060', '20110217 09:44:27.560', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TGHK', N'99AE', N'TPM5', '20090716 14:15:31.470', '20100212 17:17:46.180', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'THC9', N'5UWJ', N'3H2W', '20090320 04:30:02.860', '20090428 22:14:52.310', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'THNK', N'I8BM', N'928L', '20090113 04:43:03.130', '20090903 21:14:02.320', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'THOQ', N'FOMW', N'HO2J', '20090212 19:23:05.720', '20090821 02:57:24.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TIIB', N'5M1I', N'DIYY', '20101029 22:50:32.650', '20110316 13:23:01.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TIX0', N'HALE', N'TEVL', '20100628 12:54:04.010', '20110113 10:51:22.060', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TJ88', N'3AIF', N'5WSJ', '20090118 10:05:20.580', '20091014 01:19:14.410', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TMBF', N'D5NP', N'LJH', '20090527 09:22:45.750', '20100118 15:39:26.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TNF7', N'866Y', N'RS9L', '20100905 19:26:33.090', '20110601 16:37:10.380', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TO3B', N'9ID9', N'5ZV9', '20090903 23:07:38.900', '20100205 12:35:23.270', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TOZG', N'EHHP', N'A6X', '20090910 23:32:57.280', '20100109 09:17:27.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TP2C', N'94ZX', N'M6B1', '20090323 06:34:15.390', '20090917 19:34:14.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TP7E', N'SW8I', N'7DHU', '20100224 00:07:09.650', '20101203 20:14:30.570', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TQ8R', N'LTN9', N'6KZQ', '20100328 05:57:48.500', '20100413 20:32:29.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TUQ1', N'7RBJ', N'1D4J', '20100109 17:40:28.760', '20101105 06:36:02.930', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TV81', N'C6RA', N'MZTT', '20090128 23:34:55.750', '20090605 16:02:26.280', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TW3N', N'RCUL', N'3H2W', '20090103 15:28:47.610', '20091008 07:27:35.250', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TW5E', N'1VE7', N'BN4H', '20100128 18:57:59.700', '20100909 16:06:27.150', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TX8G', N'XOB1', N'ON3D', '20090502 11:44:09.570', '20091108 02:47:13.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TYW6', N'572Q', N'9WPW', '20101014 14:34:29.590', '20110315 15:28:34.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U17F', N'4W1Y', N'7OD6', '20090727 13:19:55.380', '20091110 11:52:30.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U1M3', N'NKUG', N'VNV5', '20100429 23:39:17.270', '20100911 07:54:40.250', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U3JV', N'XQUJ', N'2ECW', '20091114 20:52:36.980', '20100716 16:43:47.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U3XU', N'GB8C', N'N1DV', '20100125 20:27:29.990', '20100530 15:45:35.390', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U4EN', N'K630', N'N1DV', '20100112 09:53:31.700', '20100505 21:39:14.470', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U6TA', N'2L5W', N'CEG6', '20091207 16:54:17.760', '20100531 21:23:22.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U8OI', N'KVVZ', N'ZU4L', '20101221 21:50:04.580', '20111010 02:06:30.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UB8P', N'2IUE', N'4PKR', '20091228 12:04:40.010', '20100916 19:48:47.280', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UBBN', N'KMBI', N'I5ZC', '20101006 15:34:14.020', '20101223 00:13:58.690', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UDDS', N'FVYR', N'5MSR', '20100107 02:32:05.990', '20100924 21:59:34.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UE0B', N'D1I7', N'2437', '20090609 18:17:34.920', '20091004 19:02:38.110', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UEPP', N'WJQK', N'CC21', '20100324 04:04:14.290', '20101213 04:26:25.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UEYL', N'4XPI', N'7W34', '20090609 09:30:24.760', '20090812 02:34:27.510', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UF74', N'F6TA', N'HKJB', '20100117 10:48:19.080', '20100705 13:28:58.840', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UHU5', N'ADTJ', N'INH3', '20090302 23:19:06.890', '20090914 14:23:01.240', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UHUR', N'8WSG', N'FH6N', '20101019 17:39:36.720', '20110208 06:34:46.970', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UJ0A', N'A2N2', N'EB2I', '20100508 08:41:28.130', '20110219 05:44:01.550', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UJSG', N'XYD4', N'FIQQ', '20091203 15:48:52.660', '20100430 12:20:13.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UKCD', N'CUL2', N'XSES', '20090513 00:44:54.580', '20090915 11:55:16.520', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UL2', N'TEPC', N'N5HP', '20090826 21:25:15.640', '20100622 10:43:30.950', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ULFC', N'IPQ1', N'ZMGR', '20090515 04:15:46.820', '20090904 11:04:07.150', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UMTW', N'IKO1', N'61H3', '20101110 01:43:13.640', '20110607 00:57:42.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UQ0L', N'G2H3', N'63ZW', '20090110 22:07:28.460', '20090927 02:28:41.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UQ9C', N'N5JF', N'YDA8', '20090604 13:47:58.090', '20091021 08:09:04.170', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UR8Z', N'86R', N'9V0C', '20100206 20:17:18.530', '20101012 03:23:07.260', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'URMC', N'R0K0', N'K1PG', '20090804 22:47:08.020', '20090812 19:39:19.050', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UUV3', N'28E3', N'50G9', '20100731 21:43:30.340', '20101214 20:11:50.840', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UYQX', N'0Y6J', N'6MHG', '20091223 15:02:52.560', '20100819 03:30:48.530', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V1CS', N'33AI', N'E12R', '20100112 04:26:19.080', '20100723 16:43:12.510', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V1TZ', N'FLS6', N'JKNB', '20100716 00:58:07.920', '20110507 05:52:36.810', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V2JM', N'0J82', N'6KZQ', '20090212 09:44:43.780', '20091120 00:57:26.880', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V3OC', N'C9YV', N'3U0D', '20101231 12:27:37.400', '20110930 22:27:14.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V3R6', N'4C7E', N'MMT9', '20090612 06:22:29.010', '20100207 11:58:17.790', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V4KJ', N'MHS7', N'O80V', '20090907 22:32:35.590', '20100704 18:02:14.370', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V6OM', N'NEMH', N'B40L', '20090228 18:31:15.130', '20091110 05:39:55.320', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V6WP', N'M2MD', N'UVRI', '20091009 09:04:19.470', '20100710 06:32:21.700', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V8B3', N'D8Z3', N'TZPF', '20100602 14:40:45.890', '20101122 16:56:03.390', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VA5Q', N'40B', N'GBJ0', '20100607 02:07:47.720', '20110327 16:55:28.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VBC6', N'ZKU', N'4F5M', '20100602 07:09:13.360', '20100903 14:57:45.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VD9L', N'84I9', N'TB2A', '20090712 09:20:37.740', '20100208 19:43:58.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VEEQ', N'NLIW', N'H47G', '20090710 19:57:51.550', '20090726 01:03:52.260', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VEIR', N'NKSL', N'SHR2', '20091003 03:12:44.840', '20100716 16:10:10.570', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VEOA', N'F6TX', N'RPC7', '20100409 18:59:34.840', '20100903 22:26:18.950', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VFUS', N'15TH', N'9LRN', '20090114 16:01:10.900', '20090903 23:02:23.870', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VFYO', N'I7G7', N'K9LM', '20100310 06:25:25.910', '20100910 04:40:40.280', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VGL8', N'73E2', N'GVU0', '20101220 20:05:56.050', '20110520 22:39:02.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VGZ5', N'GFKZ', N'4JLY', '20100421 01:22:28', '20100617 06:59:51.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VHEI', N'73CX', N'YIYD', '20090831 20:17:41.670', '20100330 09:33:52.610', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VHOT', N'1ZN9', N'LBMH', '20100518 09:47:46.900', '20110105 04:29:43.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VJ6N', N'9LD7', N'GCN5', '20101129 02:39:21.080', '20110415 11:20:57.180', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VK89', N'TY2L', N'FNYO', '20101211 19:04:11.730', '20110513 11:39:31.620', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VLQ8', N'A8SQ', N'8F6H', '20100329 21:33:24.230', '20100330 04:13:12.540', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VMS5', N'459O', N'6016', '20101208 02:03:08.610', '20110728 16:06:49.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VNF6', N'J7TO', N'EC30', '20090529 15:58:31.550', '20090602 14:15:08.150', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VNIT', N'E2K6', N'7W34', '20091222 13:30:49.920', '20100804 08:53:33.600', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VPX0', N'J3KP', N'FLQS', '20090224 22:07:58.010', '20090928 10:44:56.890', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VQJ6', N'6YLS', N'FRV2', '20100329 04:57:18.480', '20101124 00:40:34.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VR4W', N'C9YV', N'PKUI', '20090610 08:52:38.720', '20100111 10:54:12.770', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VRHW', N'MRV0', N'4XQ9', '20090412 16:27:43.910', '20090528 17:08:55.010', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VRR7', N'1SLS', N'XXZH', '20090813 04:44:04.250', '20100228 14:47:52.050', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VRZ4', N'5G58', N'Z02R', '20090924 23:50:38.050', '20100509 15:07:13.070', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VSR4', N'OQ1K', N'4WCN', '20091220 19:47:01.960', '20100831 03:35:10.620', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VTC2', N'FZVE', N'DP6F', '20090419 01:12:21.510', '20100120 07:28:57.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VV5N', N'NR4M', N'MZTT', '20090319 11:07:43.150', '20090903 16:08:36.540', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VV63', N'NQ06', N'SHR2', '20100605 17:27:52.980', '20101211 00:50:08.610', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VWM7', N'GJWX', N'TPM5', '20091014 21:13:49.090', '20100727 10:32:38.590', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W03', N'0APT', N'DSEX', '20091226 19:15:42.160', '20100626 14:46:49.740', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W0I5', N'7P7I', N'406E', '20100204 04:32:08.450', '20100204 18:19:28.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W2DK', N'DLDW', N'OIME', '20101212 14:37:29.370', '20110225 05:23:00.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W2XI', N'TPO2', N'NMQE', '20091118 10:40:47.930', '20100122 01:18:44.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W2Y3', N'35R1', N'JI3Q', '20101115 23:30:14.510', '20110221 20:54:45.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W443', N'9EI5', N'1O8Z', '20100525 04:31:47.450', '20100909 09:22:04.910', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W8G6', N'EEEZ', N'ZU4L', '20100802 00:15:30.650', '20110124 10:47:52.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W8OT', N'94ZX', N'9WPW', '20091127 20:18:44.640', '20100604 05:32:07.240', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W9UJ', N'WYR2', N'NH55', '20100510 02:32:02.450', '20101203 18:26:13.020', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WAJ0', N'C4EY', N'JL24', '20090903 02:21:22.900', '20091007 19:26:18.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WC2S', N'6O8J', N'C0FC', '20090825 08:58:09.490', '20091125 00:09:54.490', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WCWJ', N'97BH', N'BN4H', '20090125 06:45:59.800', '20090903 10:08:03.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WDDB', N'WVGR', N'OHSW', '20090528 03:45:56.660', '20091225 17:46:18.600', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WDIK', N'682F', N'DP6F', '20100211 02:09:17.560', '20100920 03:09:28.900', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WEAF', N'AGKQ', N'CXJT', '20100130 17:27:24.990', '20100903 23:32:53.540', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WIGY', N'Z6NA', N'VK3D', '20091004 17:32:39', '20100626 21:19:27.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WIZY', N'8HBX', N'WIXF', '20090304 11:42:09.330', '20090524 00:14:20.780', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WJ4B', N'YMTI', N'NWIZ', '20100812 22:26:59.290', '20110522 05:35:27.620', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WJCM', N'CU7T', N'EVT7', '20100628 11:07:40.750', '20100723 20:54:41.230', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WK43', N'BMVW', N'ZTBG', '20101019 03:53:37.750', '20110616 06:44:05.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WMNV', N'MGCB', N'9T5B', '20101231 20:42:32.220', '20110806 20:00:39.410', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WNTA', N'MSFT', N'Z6GG', '20100413 14:50:40.080', '20100713 17:21:56.470', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WO9Y', N'8OHR', N'1IY0', '20091010 00:40:25.810', '20100519 15:34:36.520', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WQCP', N'R782', N'PB1B', '20100219 01:31:59.510', '20100624 18:18:22.130', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WU0C', N'CHNI', N'LU3R', '20091025 07:38:04.070', '20091222 23:38:42.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WUH0', N'03YD', N'70ZD', '20101013 13:25:35.660', '20110406 22:23:14.530', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WX7V', N'XIL2', N'BQTV', '20090730 21:53:35.100', '20091012 13:11:52.020', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WXAM', N'H4ML', N'6RPV', '20100724 17:53:44.150', '20101113 08:58:57.390', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WXBA', N'513Z', N'N1DV', '20091217 02:20:15.290', '20100319 01:56:32.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WZD9', N'MMX', N'5WSJ', '20100307 10:40:02.410', '20100315 11:43:00.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X0E6', N'S3RG', N'80PP', '20090405 15:45:20.250', '20090414 13:42:55.340', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X1XE', N'8ML1', N'K8QO', '20100228 10:25:19.920', '20100823 14:17:30.550', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3HV', N'3DN6', N'G0VT', '20100617 20:24:59.170', '20100622 19:55:04.640', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3PM', N'W262', N'D30H', '20100121 09:58:01.680', '20100817 01:34:50.820', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3QT', N'AQ2M', N'4WCN', '20100328 08:30:27.480', '20100501 00:55:41.790', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3TC', N'TREW', N'SSVR', '20090120 03:05:30.970', '20090403 11:33:19.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X5UL', N'LWVD', N'0GQS', '20090216 18:37:12.740', '20090323 00:43:07.460', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X7AZ', N'Z0ZN', N'DNBL', '20090626 10:41:06.220', '20090729 14:25:46.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X7O1', N'3GR', N'AA7F', '20090523 06:34:49.530', '20090620 23:30:30.990', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X8L2', N'VZLD', N'UJ1S', '20090516 02:27:02.720', '20091018 17:41:26.360', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X9QV', N'MEGK', N'TB2A', '20101022 19:21:21.600', '20110814 06:55:42.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XA28', N'SXA0', N'HOJI', '20090521 02:26:17.870', '20100213 21:44:23.400', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XAYB', N'H4Z7', N'C06X', '20100706 14:33:12.900', '20100826 12:37:53.720', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XBMY', N'PD95', N'99KR', '20090830 07:57:24.320', '20091229 00:21:34.720', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XCTM', N'Q7D3', N'Q09Q', '20090707 15:21:26.300', '20100226 11:30:52.670', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XD26', N'GXWG', N'J6QS', '20100203 15:22:14.100', '20100722 03:57:41.160', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XDS3', N'T8MK', N'LBMH', '20100213 15:45:28.060', '20100718 09:08:09.060', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XGO2', N'TO84', N'2437', '20100526 00:58:20', '20100908 00:48:25.800', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XHV', N'2SXQ', N'QKFH', '20100618 23:38:37.330', '20110119 08:47:29.870', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XI7', N'P33X', N'8ZCS', '20090914 19:42:22.820', '20100127 18:22:39.920', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XJCV', N'ICUM', N'BX49', '20100423 13:58:20.810', '20110208 05:56:52.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XK5R', N'WDQ7', N'QKFH', '20090620 13:22:32.350', '20100122 05:16:38.630', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XM9', N'U9BO', N'C1VI', '20090908 09:22:01.610', '20091220 03:26:27.660', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XP9G', N'3MHO', N'X41E', '20100524 19:37:42.510', '20101013 14:54:22.880', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XPNY', N'00XS', N'H3K4', '20100506 21:52:10.230', '20110124 00:38:31.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XQI3', N'49AT', N'GSMA', '20100123 15:38:59.170', '20100722 12:47:25.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XRMV', N'NHD0', N'898P', '20100114 19:38:53.610', '20100912 11:08:42.280', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XSD4', N'K1GE', N'E12R', '20101208 13:50:33.670', '20110521 21:05:28.580', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XSJG', N'43VK', N'MMBM', '20100719 05:28:35.790', '20110416 03:35:29.820', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XSKY', N'LPV3', N'WHUH', '20091026 17:18:28.730', '20100728 23:20:22.470', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XT53', N'R0K0', N'HKJB', '20090907 13:08:21.430', '20091107 05:00:10.360', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XVCY', N'HM3I', N'ODXP', '20100504 09:56:09.390', '20101115 01:48:07.760', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XVWM', N'U6HR', N'ZIK7', '20100831 10:47:25.330', '20110321 04:14:40.610', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XXOC', N'D8HO', N'LVPB', '20090316 03:36:47.930', '20090906 16:35:31', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XZCR', N'AWZT', N'IIIO', '20090816 21:42:20.690', '20090919 17:10:17.950', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XZSQ', N'0XK7', N'60GH', '20100419 08:51:51.890', '20100530 03:38:48.090', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y08Y', N'217H', N'LF1B', '20100619 15:39:07.570', '20110303 23:05:51.060', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y162', N'JIIH', N'CEG6', '20100313 06:06:34.330', '20101121 23:43:49.220', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y2FS', N'Z656', N'NKCD', '20090930 20:40:22.780', '20091026 01:30:47.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y2FT', N'A6K6', N'CEXL', '20100903 17:27:02.290', '20101209 13:37:39.220', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y2HF', N'LAPA', N'K8', '20090404 01:06:55.900', '20091025 22:44:26.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y30P', N'MLBY', N'YCJG', '20101026 00:08:53.080', '20110710 08:50:25.840', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y5FG', N'A2F3', N'RXBD', '20090130 22:54:28.690', '20090429 10:28:54.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y7KU', N'89EP', N'3S3P', '20090918 21:07:39.060', '20100326 21:59:54.450', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y8UU', N'867J', N'M7NK', '20100212 09:46:46.420', '20100708 05:05:24.990', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YBOD', N'53AM', N'LGTW', '20091112 15:35:00.950', '20100128 00:01:43.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YF15', N'4UAE', N'5GI', '20100605 22:34:25.650', '20100830 16:04:27.560', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YJL1', N'NSYH', N'ITZV', '20100110 11:23:39.600', '20100611 13:43:03.180', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YL1B', N'8FG8', N'Y35E', '20091130 03:36:43.710', '20100914 04:16:42.230', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YL1M', N'5GQT', N'OIME', '20090914 06:55:48.600', '20090915 06:51:59.740', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YLJ0', N'SE19', N'GTUN', '20090428 19:53:37.170', '20100111 12:20:58.330', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YM31', N'QD1M', N'ZU4L', '20100323 04:19:36.260', '20100529 11:44:24.690', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YNYC', N'SYEP', N'NF21', '20100214 11:42:02.840', '20100703 11:43:15.830', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YPPT', N'XW0H', N'A3HZ', '20100628 21:16:10.510', '20100829 19:23:36.650', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YQC7', N'8H9D', N'OW1Y', '20100215 06:59:16.410', '20100620 18:28:58.920', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YQYJ', N'CPR8', N'7HNP', '20100825 11:03:11.800', '20110104 23:29:13.680', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YVIU', N'5TTD', N'JQ30', '20090809 10:27:32.920', '20090823 16:57:34.230', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YX7D', N'667O', N'H8I0', '20100505 00:58:51.720', '20110119 07:05:02.850', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z1H3', N'0QD1', N'X911', '20090318 05:10:40.520', '20090610 10:27:25.320', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z2Z2', N'K8RG', N'JJF', '20100712 18:10:18.540', '20110502 00:07:39.700', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z3UK', N'IZ69', N'YDA8', '20100827 15:12:14.360', '20110323 11:31:00.030', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z4AK', N'572Q', N'6ZAA', '20101027 14:27:09.810', '20110503 07:42:39.880', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z58U', N'9WS5', N'LI6R', '20101218 04:33:07.270', '20110402 03:20:55.320', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z5Z3', N'U7HJ', N'INH3', '20090218 14:45:04.790', '20090823 06:52:10.760', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z79I', N'36JU', N'F8YN', '20100111 19:42:02.700', '20100713 13:02:14.080', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z7Z8', N'6ACX', N'AIY7', '20100813 08:04:44.900', '20101115 18:26:57.300', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z8OJ', N'JL7D', N'AW4P', '20101204 19:45:38.030', '20110608 12:32:05.890', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZFL6', N'JPCL', N'TZPF', '20100727 22:21:15.980', '20110303 12:13:09.430', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZI3O', N'9JIY', N'KEGX', '20090215 13:24:26.230', '20090729 16:42:16.090', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZJE0', N'1D4I', N'FC6Z', '20090707 14:14:56.250', '20090803 05:13:47.290', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZJTT', N'HNG9', N'IVTR', '20090925 14:01:13.340', '20091127 18:43:13.440', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZLE8', N'LMHE', N'I1LD', '20090126 03:43:48.090', '20090715 16:48:17.190', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZLYU', N'XOZW', N'GJS8', '20101017 03:54:45.800', '20110126 07:33:46.510', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZNSL', N'UPND', N'2O9L', '20090921 07:58:27.520', '20100406 11:59:37.670', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZOSD', N'FZNP', N'9UNG', '20090514 05:54:33.740', '20090610 04:26:01.070', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZPOJ', N'738G', N'PXFC', '20100909 11:00:16.570', '20110623 20:59:47.040', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZQIB', N'VN1I', N'J9CN', '20100702 02:08:27.800', '20110416 20:29:59.160', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZRY6', N'QJQN', N'CNKT', '20100902 06:59:36.860', '20101204 20:21:33.110', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZSC4', N'GD4P', N'UAX8', '20091202 22:30:27.360', '20091225 04:22:39.910', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZSOQ', N'KUYO', N'70ZD', '20090308 21:59:28.960', '20091229 17:28:26.150', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZT1X', N'9YDB', N'DGXQ', '20100210 08:27:38.760', '20100921 10:27:21.700', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZV97', N'C8EP', N'4NBW', '20090708 13:28:38.460', '20091106 06:22:36.980', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZWAZ', N'5LI0', N'TJVH', '20100416 13:58:59.280', '20100901 02:16:43.420', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZXDE', N'LIQ6', N'4F5M', '20091125 14:56:11.320', '20100721 18:23:05.610', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZXER', N'UUJR', N'T183', '20091110 00:55:50.150', '20091123 21:42:25.520', 2)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZYBL', N'SO1Z', N'BRV1', '20100214 18:45:00.070', '20101009 11:18:47.030', 1)
GO

INSERT INTO [dbo].[HoaDon_WebTower9] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZZTW', N'G79', N'TZYE', '20091019 01:21:27.720', '20100801 11:05:28.200', 2)
GO

--
-- Data for table dbo.KhachHang_WebTower9  (LIMIT 0,500)
--

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'008V', N'Jenna Gordon', N'Gibraltar - Arizona', '20100618 10:07:11.320', '20110131 03:52:03.090', 2, N'F', N'AliceBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'00XS', N'Constance Herring', N'Trinidad - New Jersey', '20090528 07:30:20.600', '20090627 05:18:15.540', 1, N'F', N'LightBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'03YD', N'Joan Goodwin', N'Jersey - Mississippi', '20100519 08:24:51.640', '20101130 11:28:48.420', 2, N'M', N'Tomato', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'064P', N'Jocelyn Solis', N'Saint Helena - Delaware', '20091120 12:51:50.700', '20100828 05:16:36.890', 2, N'F', N'LightYellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'06VT', N'Billy Tyler', N'Guam - Louisiana', '20090615 11:41:50.250', '20090920 19:06:11.020', 2, N'M', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'08CL', N'Joni Sampson', N'Sri Lanka - Iowa', '20101002 10:43:23.510', '20110227 10:53:17.450', 1, N'F', N'DarkViolet', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'09NB', N'Clarence Reilly', N'Kazakhstan - Connecticut', '20100423 22:25:19.300', '20101204 21:33:56.700', 2, N'F', N'DarkSalmon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0A4E', N'Andy Hamilton', N'Bolivia - West Virginia', '20091003 10:28:24.860', '20100330 07:25:53.550', 2, N'F', N'Beige', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0A98', N'Charlie Spears', N'North Korea - Indiana', '20100124 19:15:18.220', '20100201 10:26:08.010', 2, N'F', N'BurlyWood', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0APT', N'Vincent Mc Daniel', N'Afghanistan - Michigan', '20110317 22:22:25.570', '20111123 20:01:13.990', 2, N'M', N'LightSteelBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0F7T', N'Kenneth Benton', N'Argentina - Washington', '20090704 21:57:46.010', '20100421 16:10:59.970', 2, N'M', N'FireBrick', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0FHQ', N'Sonya Mays', N'Belgium - Vermont', '20090521 20:26:03.420', '20090923 18:24:52.330', 2, N'F', N'SlateBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0I04', N'Martha Marsh', N'Samoa - Hawaii', '20101121 11:07:07.880', '20110607 02:33:46.270', 2, N'F', N'DarkGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0J82', N'Caroline Chandler', N'Mauritania - Pennsylvania', '20090512 11:48:18.930', '20091218 16:16:32.760', 1, N'F', N'Grey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0LF4', N'Catherine Carr', N'Spain - Florida', '20100208 09:11:36.260', '20101025 04:58:41.520', 1, N'M', N'SteelBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0QD1', N'Stefanie Burgess', N'Japan - Delaware', '20100218 02:26:14.200', '20101126 12:22:34.200', 1, N'M', N'Peru', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0RXC', N'Donovan Marks', N'Czech Republic - Pennsylvania', '20110116 22:39:23.730', '20110330 16:45:28.730', 2, N'F', N'SaddleBrown', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0XK7', N'Stuart Leblanc', N'Nepal - Kansas', '20091003 17:17:30.510', '20100404 15:07:02.240', 2, N'F', N'Gray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0Y6J', N'Faith Cantrell', N'Israel - New Hampshire', '20100718 16:46:06.940', '20101006 19:36:01.410', 2, N'M', N'MediumOrchid', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0Z7K', N'Randal Washington', N'Sweden - Wyoming', '20100506 03:52:12.930', '20100704 18:48:18.920', 2, N'M', N'LightGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0ZRG', N'Janelle Andrade', N'Kyrgyzstan - Ohio', '20100111 03:56:46.070', '20100704 02:46:53.040', 2, N'M', N'Chartreuse', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'11MR', N'Norma Simmons', N'Afghanistan - Rhode Island', '20110203 22:23:49.070', '20110606 08:54:11.370', 2, N'F', N'LightPink', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'13LJ', N'Rusty Schaefer', N'Cyprus - Ohio', '20090416 14:36:57.510', '20100128 20:00:00.810', 2, N'M', N'LightCyan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'15TH', N'Teri Schneider', N'Cyprus - Ohio', '20110209 22:36:53.310', '20110227 23:47:23.650', 1, N'F', N'Black', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'16R7', N'Shonda Henry', N'Denmark - California', '20100717 09:12:28.640', '20101218 21:48:43.370', 1, N'F', N'DeepPink', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'180R', N'Norma Estrada', N'Brazil - Massachusetts', '20090829 16:31:32.800', '20091112 00:40:19.310', 1, N'F', N'Lavender', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1AXU', N'Clayton Shaw', N'Guinea - Alabama', '20100307 14:43:51.830', '20100411 02:31:42.750', 2, N'F', N'DarkOrchid', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1BZS', N'Kyle Morse', N'Jersey - Michigan', '20110117 07:43:02.080', '20111029 08:06:12.680', 1, N'F', N'YellowGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1C3O', N'Mario Downs', N'Bahamas - Georgia', '20091219 11:25:38.890', '20100831 09:20:45.610', 1, N'M', N'HotPink', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1D4I', N'Regina Robles', N'Pakistan - Wyoming', '20091026 02:56:23.940', '20100303 10:59:53.430', 2, N'M', N'Yellow', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1EK9', N'Brandi Stein', N'Chile - Rhode Island', '20100313 23:41:22.720', '20101229 14:54:25.840', 1, N'F', N'LightGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1G09', N'Robbie Griffith', N'Lebanon - Alabama', '20090419 20:38:58.910', '20100114 06:14:33.030', 2, N'M', N'Teal', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1G8R', N'Betty Bolton', N'Portugal - South Dakota', '20090419 00:01:12.150', '20090828 13:25:11.740', 2, N'F', N'LightCyan', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1GOQ', N'Suzanne Crawford', N'Norway - North Carolina', '20090426 22:04:33.570', '20090719 14:33:12.260', 2, N'M', N'Sienna', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1HFI', N'Duane Boone', N'Eire - Maine', '20090725 01:10:09.740', '20100331 01:13:48.790', 2, N'F', N'LightCoral', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1O2A', N'Warren Austin', N'Ethiopia - Maryland', '20090404 06:43:51.680', '20100105 13:00:23.410', 2, N'M', N'MintCream', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1P21', N'Adrian Stone', N'Netherlands - Massachusetts', '20090831 19:38:12.730', '20100421 20:33:33.380', 1, N'M', N'Thistle', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1PDV', N'Tracy Moon', N'Andorra - Ohio', '20100311 15:56:25.980', '20100330 13:18:44.760', 2, N'F', N'PaleGoldenRod', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1PYU', N'Jaime Wilkinson', N'Belgium - Colorado', '20110325 18:31:00.760', '20111016 08:11:05.510', 1, N'F', N'BlueViolet', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1S7M', N'Latasha Vaughn', N'Ghana - Missouri', '20100206 03:41:36.050', '20100724 20:12:26.300', 2, N'M', N'MediumOrchid', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1SLS', N'Hugh Barr', N'Bahamas - Idaho', '20100115 16:11:02.120', '20101003 09:36:11.300', 1, N'M', N'Aqua', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1VE7', N'Arlene Leach', N'Burkina Faso - Montana', '20091116 13:12:36.700', '20100520 01:32:44.210', 2, N'F', N'DarkTurquoise', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1VJE', N'Brooke Cameron', N'Poland - Louisiana', '20100810 11:36:43.620', '20110101 22:19:17.620', 1, N'F', N'MintCream', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1ZN9', N'Gregory Mullen', N'Mexico - New Mexico', '20090402 21:53:29.150', '20091020 16:24:00.840', 1, N'F', N'SlateGrey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'207K', N'Charlie Livingston', N'Slovenia - Rhode Island', '20110503 07:36:09.740', '20120215 10:26:07.750', 2, N'M', N'HoneyDew', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'20DY', N'Randall Peterson', N'Singapore - New Hampshire', '20090917 03:25:25.900', '20100612 01:21:06.780', 2, N'F', N'CornflowerBlue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'20U9', N'Bryce Pratt', N'Guinea-Bissau - Kentucky', '20091125 17:23:51.850', '20091209 14:18:53.770', 2, N'M', N'Yellow', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'213L', N'Randi Leonard', N'Somalia - Ohio', '20090604 16:34:08.460', '20090729 13:23:07.980', 1, N'F', N'YellowGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'217H', N'Tracy Acevedo', N'Singapore - Kentucky', '20100707 17:45:31.180', '20101112 00:42:56.010', 1, N'F', N'Coral', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'21EL', N'Alan Mccoy', N'Slovakia - Mississippi', '20090525 02:47:09.490', '20090727 23:29:01.620', 1, N'F', N'Lime', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'21WW', N'Joey Mullins', N'North Korea - New Jersey', '20100722 23:34:57.290', '20110228 14:22:53.870', 2, N'M', N'DarkSlateBlue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'23A1', N'Annie Hawkins', N'Bolivia - Hawaii', '20110207 00:10:15.310', '20110403 01:48:30.280', 1, N'M', N'PaleTurquoise', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'23YJ', N'Staci Erickson', N'Israel - New Hampshire', '20091111 23:42:43.340', '20100802 15:11:26.280', 1, N'F', N'SeaShell', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'28E3', N'Lakesha Watkins', N'Egypt - Oklahoma', '20091025 00:53:36.670', '20100302 01:24:45.670', 2, N'M', N'MintCream', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2AZ4', N'Garrett Hubbard', N'Liechtenstein - Kansas', '20110411 22:20:01.900', '20110425 23:16:39.030', 1, N'F', N'BlanchedAlmond', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2BQ', N'Gabrielle Fitzgerald', N'Finland - Maryland', '20090627 22:35:55.570', '20100211 22:10:41.210', 1, N'F', N'Plum', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2CJZ', N'Victoria Drake', N'Belgium - Wyoming', '20090813 19:42:19.370', '20100308 08:37:22.680', 1, N'M', N'Aqua', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2D3T', N'Mickey Villarreal', N'Thailand - Maine', '20091101 01:21:01.260', '20100421 20:08:31.550', 2, N'F', N'Azure', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2FT', N'Nora Edwards', N'Guernsey - Utah', '20110228 13:30:05.600', '20110511 11:46:08.060', 2, N'M', N'DeepSkyBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2IUE', N'Herman Bowman', N'Benin - Connecticut', '20090703 13:07:46.450', '20091217 07:25:47.460', 2, N'F', N'Thistle', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2JHT', N'Michele Bryant', N'Vietnam - Delaware', '20100522 10:07:27.870', '20110219 01:12:22.390', 1, N'M', N'LightCyan', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2L0B', N'Alejandro Stewart', N'Spain - Kansas', '20100927 17:29:56.990', '20110313 03:19:55.970', 1, N'F', N'GreenYellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2L5A', N'Andrea Romero', N'Iran - Alabama', '20090821 01:18:27.770', '20100514 13:21:51.010', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2L5W', N'Bryan Farley', N'Namibia - Connecticut', '20110405 01:07:05.270', '20120102 01:41:40.290', 2, N'M', N'OrangeRed', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2MOF', N'Chandra Olsen', N'Bulgaria - Utah', '20090823 16:23:00.760', '20100330 12:20:23.290', 1, N'M', N'LemonChiffon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2NQK', N'Jenny De Leon', N'Bermuda - Arkansas', '20090609 16:10:04.820', '20090809 23:35:55.940', 1, N'F', N'Darkorange', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2O5X', N'Maurice Rosario', N'Lebanon - Georgia', '20090705 20:04:52.930', '20090724 03:06:38.560', 2, N'M', N'DarkTurquoise', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2ONB', N'Alice George', N'Sierra Leone - Montana', '20100430 06:47:18.640', '20100903 16:58:12.720', 1, N'F', N'DarkSlateBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2SG', N'Andrea Walters', N'Palau - Tennessee', '20090715 07:05:33.760', '20091120 11:15:12.660', 2, N'F', N'SaddleBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2SXQ', N'Tamiko Stanton', N'Tonga - Hawaii', '20110101 21:42:23.660', '20111001 08:05:38.810', 2, N'F', N'Violet', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2TVF', N'Jack Schmidt', N'Oman - Alaska', '20100620 23:18:05.150', '20100722 18:14:32.430', 2, N'F', N'Aquamarine', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2XQU', N'Bradley Huffman', N'Kenya - Florida', '20110111 21:25:16.850', '20110314 01:49:25.020', 2, N'M', N'DarkGray', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'332P', N'Kirsten Copeland', N'China - Iowa', '20100813 04:17:34.310', '20100928 11:41:05.440', 2, N'F', N'Navy', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'33AI', N'Sylvia Downs', N'Armenia - Texas', '20110312 21:52:35.590', '20111212 04:51:48.750', 2, N'M', N'HotPink', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'33DQ', N'Erica Craig', N'Spain - Minnesota', '20091028 10:24:07.540', '20091125 22:43:50.390', 2, N'M', N'LightBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'35R1', N'Geoffrey Colon', N'Belgium - Arizona', '20100226 07:48:04.560', '20100319 02:45:43.480', 2, N'F', N'AliceBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'367U', N'Brad Rowe', N'Venezuela - New Hampshire', '20110319 09:30:52.970', '20111121 04:29:05.460', 2, N'M', N'DarkCyan', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'36JU', N'Carl Chan', N'Tonga - Louisiana', '20090612 18:57:38.950', '20090709 07:39:12.340', 1, N'F', N'LightPink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'36MA', N'Tera Finley', N'India - Wisconsin', '20090728 23:05:58.110', '20091008 03:39:19.170', 1, N'F', N'LightBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3AIF', N'Bernard Barrett', N'Kuwait - Texas', '20090522 22:05:26.550', '20090829 19:24:22.320', 2, N'M', N'SaddleBrown', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3B6R', N'Corey Campos', N'Palau - Rhode Island', '20110203 15:01:47.810', '20110426 14:56:46.550', 2, N'F', N'Green', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3CND', N'Leanne Short', N'Philippines - Kentucky', '20090921 03:25:38.090', '20100220 01:11:35.450', 2, N'F', N'LightSalmon', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3DHT', N'Katrina Blackburn', N'Guyana - Maryland', '20100505 14:22:17.920', '20101112 06:08:47.870', 2, N'M', N'Gainsboro', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3DN6', N'Dawn Mills', N'Vanuatu - New Hampshire', '20090924 07:29:21.650', '20100306 07:00:07.390', 2, N'F', N'LawnGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3GN4', N'Wallace Merritt', N'Aruba - Wyoming', '20100904 01:37:54.800', '20100921 00:45:19.300', 1, N'M', N'Bisque', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3GR', N'Candy Cortez', N'Palau - West Virginia', '20090822 16:55:37.440', '20100504 08:03:41.210', 2, N'F', N'DarkGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3MCM', N'Stanley Townsend', N'Bahamas - Florida', '20090404 00:29:22.030', '20090801 05:36:35.300', 2, N'F', N'OrangeRed', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3MHO', N'Karl Carter', N'Fiji - Oregon', '20110321 14:14:00.190', '20110925 14:39:09.650', 1, N'F', N'LightCyan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3MPI', N'Melanie Morris', N'Belize - Arkansas', '20090901 19:56:40.990', '20100606 17:09:12.850', 2, N'F', N'Snow', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3NRW', N'Monica Pearson', N'Malawi - Texas', '20100208 04:02:28.840', '20100413 10:30:05.060', 1, N'M', N'PeachPuff', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3PIR', N'Rafael Short', N'Guatemala - South Dakota', '20091003 08:59:31.140', '20100321 22:24:30.220', 2, N'F', N'SpringGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3PV7', N'Jessie Whitehead', N'Western Sahara - North Dakota', '20110419 12:35:51.570', '20111028 19:07:57.220', 1, N'M', N'MediumPurple', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3QKC', N'Jaime Cisneros', N'Poland - Hawaii', '20100408 22:21:26.880', '20100719 18:41:09.580', 1, N'F', N'ForestGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3RT5', N'Anna Lara', N'Nepal - New Mexico', '20101007 21:22:15.130', '20101229 14:15:56.730', 2, N'F', N'GoldenRod', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3RTG', N'Tasha Peck', N'Angola - Vermont', '20090810 04:16:18.150', '20091130 11:34:31.290', 2, N'M', N'LightYellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3SLE', N'Angelina Knapp', N'Micronesia - Vermont', '20100304 08:01:10.380', '20101106 06:07:53.310', 1, N'M', N'Beige', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3WO5', N'Carmen Krueger', N'South Africa - Louisiana', '20101022 09:42:28.490', '20110319 15:19:17.920', 1, N'F', N'SaddleBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3WTS', N'Maggie Schroeder', N'Palau - Tennessee', '20100524 05:18:53.830', '20100911 09:44:24.600', 1, N'F', N'LightSalmon', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3ZO5', N'Mark O''Connor', N'Antarctica - Texas', '20101214 01:10:37.750', '20101224 07:24:12.180', 1, N'F', N'Tomato', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'40B', N'Pamela Mora', N'Barbados - Virginia', '20110422 14:05:32.270', '20111219 12:55:13.930', 2, N'F', N'RoyalBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4123', N'Arturo Kirby', N'Anguilla - New Mexico', '20100716 07:59:35.370', '20110119 23:18:13.190', 2, N'M', N'PaleGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'41UE', N'Jessica Collier', N'Timor-Leste - North Dakota', '20100523 03:06:08.930', '20110214 05:45:49.340', 1, N'M', N'DimGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'43VK', N'Jenny Moreno', N'Guatemala - New York', '20090708 05:25:01.310', '20100201 23:33:52.010', 1, N'M', N'MediumPurple', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'44K8', N'Justin Dalton', N'Armenia - Wisconsin', '20110511 02:00:26.780', '20111228 22:41:29.630', 2, N'F', N'Thistle', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'459O', N'Moses George', N'Sudan - Iowa', '20090726 14:45:20.010', '20100110 21:22:13.330', 2, N'F', N'DarkSlateGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'48IA', N'Leroy Wyatt', N'Guinea - Iowa', '20091116 16:03:06.980', '20100520 20:51:08.130', 2, N'F', N'Yellow', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'49AT', N'Sonny Aguilar', N'Mozambique - Wisconsin', '20110210 16:47:47.710', '20110301 13:07:45.160', 1, N'F', N'WhiteSmoke', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4C7E', N'Steve Valdez', N'Eire - Idaho', '20100226 10:27:07.040', '20100719 10:41:35.740', 2, N'M', N'Cornsilk', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4CD3', N'Guadalupe Robbins', N'Finland - West Virginia', '20090809 17:07:48.710', '20091101 18:14:47.110', 1, N'M', N'Chartreuse', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4CD5', N'Alberto Hardin', N'Liechtenstein - Kansas', '20090814 13:42:47.690', '20091224 23:47:28.710', 2, N'M', N'BlanchedAlmond', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4D2S', N'Matt Haney', N'Afghanistan - Arizona', '20110321 16:20:39.280', '20110910 18:39:48', 1, N'M', N'DarkOliveGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4GA1', N'Lawanda Atkins', N'Argentina - Washington', '20090925 08:11:57.110', '20100114 02:11:23.090', 2, N'M', N'Olive', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4HND', N'Shawna Morton', N'Fiji - Ohio', '20100203 06:15:28.160', '20100720 06:34:44.070', 2, N'M', N'LightSalmon', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4MW3', N'Victor Golden', N'Iran - Rhode Island', '20101118 14:32:02.050', '20110116 09:12:15.730', 2, N'F', N'LightCyan', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4QJY', N'Marianne Mora', N'Mauritius - Oregon', '20110502 11:32:10.820', '20110808 07:31:10.400', 2, N'F', N'Lime', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4S0S', N'Amie Blanchard', N'Armenia - South Dakota', '20090619 18:05:23.550', '20100408 07:55:19.630', 2, N'M', N'Darkorange', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4S57', N'Clifford Castro', N'Colombia - Michigan', '20091025 23:41:17.180', '20100509 01:42:05.390', 1, N'F', N'LawnGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4TU7', N'Ricardo Ayala', N'Guam - Florida', '20091223 18:44:04.970', '20100322 11:31:28.830', 1, N'F', N'Brown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4UAE', N'Marshall Sanford', N'Seychelles - Mississippi', '20091014 18:38:20.860', '20091124 09:26:23.340', 1, N'M', N'DarkGrey', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4W1Y', N'Jodie Mccarty', N'Palau - West Virginia', '20100303 15:42:22.960', '20100726 21:54:50.910', 2, N'M', N'SaddleBrown', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4WG6', N'William Bryan', N'Sweden - Alaska', '20100531 02:14:38.440', '20110119 10:25:50.610', 1, N'F', N'Sienna', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4XPI', N'Cary Allison', N'Georgia - Minnesota', '20090603 03:47:11.950', '20090627 20:14:50.100', 1, N'F', N'Gold', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4YD4', N'Scot Santos', N'Burundi - Nebraska', '20091229 18:46:38.640', '20100402 00:02:42.650', 1, N'F', N'Cornsilk', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'513Z', N'Beth Stark', N'Jersey - North Dakota', '20090816 14:15:04.970', '20100228 20:21:54.950', 1, N'M', N'Teal', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'535K', N'Tomas Mcintosh', N'Vanuatu - Minnesota', '20100422 10:29:50.370', '20110105 02:03:13.200', 1, N'M', N'Beige', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'53AM', N'Alexander Richards', N'Sierra Leone - Illinois', '20100710 20:36:59.580', '20101004 13:19:12.320', 2, N'M', N'OrangeRed', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5428', N'Esther Gordon', N'Belize - Wisconsin', '20110313 20:29:22.950', '20111108 00:12:56.010', 2, N'M', N'AntiqueWhite', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'543K', N'Cristina Giles', N'Honduras - New York', '20090819 02:47:16.590', '20091130 15:13:40.690', 2, N'M', N'SaddleBrown', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'56HA', N'Jamal Gill', N'Liberia - Oklahoma', '20091119 12:42:02.920', '20100602 19:14:18.860', 1, N'F', N'NavajoWhite', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'56OB', N'Erin Gomez', N'North Korea - Alabama', '20100508 12:11:43.530', '20110108 10:36:34.180', 1, N'F', N'HoneyDew', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'572Q', N'Nathaniel Mayo', N'Guyana - New Mexico', '20100415 04:14:51.110', '20100506 04:30:29.040', 2, N'F', N'PaleGoldenRod', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'590P', N'Candy Jimenez', N'Pitcairn - Minnesota', '20091228 05:40:40.140', '20101019 07:37:31.220', 2, N'F', N'MediumSlateBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5BM7', N'Linda Chang', N'New Caledonia - Massachusetts', '20091212 20:02:23.510', '20100207 05:56:53.610', 1, N'M', N'SeaGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5G58', N'Eric Sullivan', N'Canada - Arkansas', '20090714 03:31:21.460', '20100316 02:53:28.660', 1, N'F', N'DeepSkyBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5GC0', N'Victoria Acevedo', N'Bermuda - Arkansas', '20101226 05:22:19.560', '20110723 12:37:20.640', 2, N'F', N'Orange', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5GQT', N'Autumn Hanson', N'Saint Helena - Florida', '20110322 08:53:42.200', '20110509 08:59:18.780', 1, N'M', N'Orchid', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5HRU', N'Sheri Galvan', N'Belarus - Arizona', '20110331 12:49:50.520', '20110408 17:29:50.140', 1, N'F', N'DarkGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5IA8', N'Frances Kane', N'Micronesia - Hawaii', '20091214 01:10:33.310', '20100401 16:17:11.440', 1, N'F', N'DarkSalmon', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5IH5', N'Naomi Snyder', N'El Salvador - South Carolina', '20101015 09:31:56.760', '20101219 20:40:39.680', 2, N'F', N'SlateBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5J3G', N'Kenya Hardy', N'Panama - Wisconsin', '20091004 21:42:29.880', '20100129 08:00:06.890', 2, N'M', N'SlateGrey', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5J97', N'Joseph Duarte', N'Germany - Mississippi', '20100211 22:13:56.970', '20101107 15:48:27.910', 1, N'M', N'HotPink', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5LI0', N'Sonja Mccoy', N'Macao - Idaho', '20101113 11:43:47.800', '20101206 07:04:00.800', 1, N'M', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5LZ8', N'Eileen Spencer', N'Mexico - Vermont', '20091216 23:52:42.440', '20100603 19:14:28.080', 2, N'F', N'Navy', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5M1I', N'Kyle Vargas', N'Belize - Wisconsin', '20090803 08:23:52.340', '20091024 19:29:42.360', 1, N'M', N'PapayaWhip', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5NE7', N'Shannon Gordon', N'Western Sahara - North Carolina', '20091225 03:54:13.900', '20100225 14:43:12.300', 1, N'M', N'Green', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5NX', N'Kurt Ritter', N'Puerto Rico - Pennsylvania', '20090619 16:21:21.200', '20100207 11:25:48.320', 1, N'F', N'RosyBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5O1U', N'Randi Mckinney', N'Malawi - Texas', '20110228 05:29:16.620', '20110702 09:39:06.900', 2, N'F', N'DeepPink', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5OB0', N'Sandy Randall', N'Syria - Tennessee', '20110313 11:47:19.390', '20111004 09:51:38.010', 1, N'F', N'Darkorange', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5P3Y', N'Heath Beltran', N'Norway - Virginia', '20090910 11:19:46.410', '20100701 00:03:24.480', 2, N'M', N'Purple', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5PK0', N'Warren Glass', N'Netherlands - Louisiana', '20091101 19:00:22.990', '20100814 17:35:31.800', 2, N'F', N'LightCyan', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5Q7V', N'Anthony Carlson', N'Ghana - Missouri', '20100723 22:17:07.410', '20110317 23:36:22.800', 2, N'F', N'Aqua', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5REP', N'Tami Weber', N'Yemen - Maine', '20110505 00:24:35.040', '20111001 10:46:45.100', 1, N'M', N'DarkSeaGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5TI5', N'Cassie Washington', N'Yemen - Massachusetts', '20110203 08:25:12.750', '20110610 10:34:06.690', 2, N'M', N'SandyBrown', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5TTD', N'Krista Bonilla', N'New Caledonia - Vermont', '20100410 23:33:14.780', '20100815 10:47:22.950', 1, N'F', N'Olive', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5UWJ', N'Celeste Reese', N'Colombia - New Jersey', '20100814 13:27:25.970', '20110310 07:59:17.460', 2, N'M', N'DarkOliveGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5VND', N'Katina Poole', N'Oman - Nebraska', '20100110 03:58:08.510', '20100830 20:17:19.120', 1, N'M', N'SaddleBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5WSZ', N'Trina Watson', N'Belgium - Oregon', '20110219 13:05:26.350', '20110611 20:05:13.640', 2, N'F', N'NavajoWhite', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5YDM', N'Travis Burnett', N'Western Sahara - North Carolina', '20100606 03:07:10.510', '20100626 03:38:20.650', 2, N'F', N'LightSkyBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'60J0', N'Cari Wright', N'Palau - Rhode Island', '20101101 22:34:04.380', '20110428 10:42:40.660', 1, N'F', N'DarkSlateGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'62LK', N'Jamie Dudley', N'Barbados - Pennsylvania', '20110316 10:46:51.210', '20110624 18:08:15.150', 2, N'F', N'LightGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'64GG', N'Ryan Burns', N'Seychelles - North Dakota', '20100412 11:26:34.230', '20101119 07:31:01.080', 2, N'F', N'DarkGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'662I', N'Leonardo Fleming', N'Cuba - California', '20101204 18:37:16.330', '20110803 21:58:44.510', 2, N'M', N'PowderBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'667O', N'Philip Hubbard', N'Palau - West Virginia', '20090504 08:58:17', '20091101 23:57:29.810', 1, N'M', N'PaleVioletRed', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'682F', N'Herman Gibson', N'Costa Rica - California', '20110221 14:09:10.710', '20110419 20:42:49.650', 1, N'M', N'LightSlateGrey', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'68H7', N'Stephan Morse', N'Uzbekistan - Minnesota', '20100128 23:55:21.710', '20100503 01:27:04.920', 1, N'F', N'DeepSkyBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6ACX', N'Cheryl Williams', N'Algeria - Rhode Island', '20090914 02:00:13.670', '20100205 00:00:25.070', 2, N'F', N'Moccasin', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6AS', N'Francisco Wu', N'Spain - Minnesota', '20100208 01:16:02.930', '20100704 08:40:09.650', 2, N'M', N'Gold', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6B5V', N'Darin Rowe', N'Croatia - North Dakota', '20100818 13:21:23.630', '20110123 01:10:22.450', 1, N'F', N'Teal', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6DLA', N'Ruben Brewer', N'Israel - Colorado', '20110215 09:30:02.560', '20110310 22:20:07.250', 1, N'F', N'MediumSeaGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6DN1', N'Samantha Knight', N'Indonesia - South Carolina', '20100217 00:28:06.890', '20100912 02:49:15.820', 2, N'F', N'MediumPurple', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6HT5', N'Rachelle Hancock', N'Belgium - South Carolina', '20110403 14:17:35.790', '20111021 02:29:24.960', 1, N'F', N'Fuchsia', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6HZH', N'Kate Mc Bride', N'Chile - New Mexico', '20110206 19:37:44.150', '20110826 00:35:49.520', 1, N'F', N'PaleGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6LBR', N'Sandra Escobar', N'United Kingdom - Texas', '20100208 05:24:04.350', '20100813 17:49:09.190', 2, N'F', N'DarkOliveGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6LRC', N'Tyson Mercer', N'Burkina Faso - Alabama', '20091226 16:43:48.210', '20100411 00:33:30.170', 1, N'F', N'DarkOliveGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6LRG', N'Kirsten Greer', N'Lebanon - Georgia', '20110302 12:26:44.170', '20111017 05:43:32.880', 2, N'F', N'DarkGrey', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6O8J', N'Tisha Sexton', N'Eritrea - Virginia', '20091009 11:40:47.720', '20100108 17:56:15.980', 1, N'F', N'Crimson', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6OIN', N'Forrest Keller', N'Malta - North Carolina', '20090508 11:30:31.790', '20091102 13:53:56.820', 1, N'M', N'DarkSeaGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6OT1', N'Clinton Mccann', N'Bulgaria - Rhode Island', '20110328 11:31:20.460', '20110406 11:43:13.310', 1, N'F', N'OliveDrab', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6U2J', N'Brandie Pineda', N'Ghana - Mississippi', '20100628 07:35:43.960', '20101226 09:41:45.330', 2, N'M', N'LightGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6UTT', N'Cara Morton', N'Thailand - Montana', '20100705 05:44:05.980', '20110226 20:56:15.200', 2, N'F', N'Crimson', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6V30', N'Dwayne Harrington', N'Egypt - Arkansas', '20100705 08:07:29.120', '20100910 20:46:19.400', 2, N'F', N'LightSlateGray', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6VAU', N'Sonja Moreno', N'Palau - West Virginia', '20100312 21:51:10.440', '20101228 19:52:08.470', 1, N'F', N'YellowGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6YLS', N'Blanca Hodges', N'Turkey - Rhode Island', '20090811 15:45:20.440', '20091223 06:55:16.850', 2, N'M', N'Salmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6ZEV', N'Claude Erickson', N'Czech Republic - Arizona', '20101007 08:19:34.120', '20110222 14:19:33.680', 1, N'M', N'SlateBlue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6ZXM', N'Staci Beard', N'Burundi - Massachusetts', '20100307 11:18:47.070', '20100917 07:21:35.780', 2, N'F', N'MediumBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'701A', N'Lee Moody', N'Guinea-Bissau - Kentucky', '20090601 07:21:02.960', '20090618 18:27:37.220', 1, N'F', N'SlateBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'738G', N'Shari Day', N'Czech Republic - Rhode Island', '20110320 21:32:02.280', '20110407 12:56:08.040', 1, N'F', N'LightYellow', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'73CX', N'Alice Ashley', N'Kenya - Mississippi', '20110307 11:29:00.860', '20111012 02:32:31.700', 2, N'F', N'MediumSlateBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'73E2', N'Iris Evans', N'Turkey - Mississippi', '20110319 01:50:36.180', '20110401 21:21:26.360', 1, N'F', N'LightCoral', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'74M2', N'Adrian Mercado', N'Italy - Montana', '20090509 10:07:13', '20091112 18:08:25.840', 1, N'M', N'LightSlateGray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'74Z6', N'Lisa Dickson', N'Bulgaria - Utah', '20100329 04:43:36.700', '20101212 14:21:41.400', 1, N'M', N'DarkSalmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'79R', N'Marlon Campos', N'Botswana - Florida', '20101026 07:17:14.330', '20110730 01:24:00.990', 1, N'F', N'Moccasin', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7AY0', N'Elena Levy', N'Czech Republic - Pennsylvania', '20090427 01:50:07.610', '20090902 02:18:46.920', 2, N'F', N'NavajoWhite', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7ERL', N'Cedric Nielsen', N'Swaziland - South Carolina', '20091018 23:07:27.330', '20100625 21:59:57.060', 1, N'M', N'Lavender', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7FC1', N'Peggy Ballard', N'R?union - Wyoming', '20091023 15:41:13.300', '20100722 21:43:05.830', 2, N'F', N'SpringGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7GII', N'Clayton Cain', N'Niue - North Dakota', '20100131 14:37:24.940', '20101020 17:38:58.920', 1, N'M', N'Lavender', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7K64', N'Lisa Duarte', N'Ukraine - Iowa', '20110507 18:11:46.470', '20120224 01:12:58.140', 2, N'M', N'Coral', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7KN2', N'Shawn Sheppard', N'Bahamas - Florida', '20101015 05:47:43.990', '20110319 13:37:24.610', 1, N'F', N'OrangeRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7KVV', N'Bethany Meadows', N'Singapore - Hawaii', '20090515 07:26:12.300', '20091119 15:55:22.930', 1, N'M', N'DarkSlateGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7N3V', N'Candace Mac Donald', N'Georgia - Hawaii', '20090711 21:33:45.630', '20100112 15:13:00.980', 1, N'M', N'MidnightBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7NT2', N'Robbie Scott', N'Greece - Alaska', '20100824 10:28:11.520', '20101029 16:57:24.140', 2, N'F', N'CadetBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7NY4', N'Sherrie Dalton', N'Tonga - Hawaii', '20110202 12:05:17.780', '20110902 06:13:30.420', 2, N'F', N'Brown', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7OJJ', N'Scot Burton', N'Nauru - Colorado', '20100220 14:05:28.630', '20100305 03:03:30.070', 2, N'F', N'LightSalmon', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7P7I', N'Teri Mc Cormick', N'Vietnam - Delaware', '20101029 20:11:10.350', '20110801 04:34:52.790', 1, N'F', N'LightSteelBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7RBJ', N'Teresa Shelton', N'Botswana - New Hampshire', '20100720 12:26:16.940', '20110225 23:04:55.900', 2, N'M', N'PapayaWhip', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7T76', N'Neal Bass', N'Mozambique - Louisiana', '20100121 18:03:53.080', '20101117 14:44:59.910', 2, N'F', N'Plum', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7TKB', N'Alyssa Navarro', N'Italy - Iowa', '20100707 20:52:21.660', '20110305 08:06:43.040', 1, N'F', N'SkyBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7WKL', N'Jeannette Phelps', N'Oman - Wyoming', '20090629 11:16:41.570', '20090814 21:15:41.210', 1, N'F', N'Coral', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7YHW', N'Jessie Mc Millan', N'Colombia - Hawaii', '20090825 08:30:01.510', '20091121 23:08:31.320', 1, N'M', N'DarkKhaki', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7YL7', N'Jeannie Vasquez', N'Pitcairn - Minnesota', '20091215 08:51:02.560', '20100902 21:41:49.600', 1, N'M', N'BlueViolet', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7ZBZ', N'Henry Mac Donald', N'Pitcairn - Pennsylvania', '20090503 03:08:59.920', '20091002 23:50:49.240', 2, N'F', N'LemonChiffon', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'83BT', N'Cheri Diaz', N'Sweden - Texas', '20090611 02:47:15.890', '20091122 22:20:28.260', 1, N'F', N'NavajoWhite', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'84I9', N'Charlie Barker', N'Haiti - North Carolina', '20101218 01:03:37.650', '20110424 21:28:37.680', 1, N'M', N'Black', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'857F', N'Calvin Jensen', N'Nauru - Colorado', '20110503 20:26:57.360', '20111208 13:32:31.730', 1, N'F', N'Wheat', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'866Y', N'Felicia Shepherd', N'Bermuda - Arkansas', '20101018 10:27:15.260', '20110413 08:55:08.450', 1, N'F', N'Azure', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'867J', N'Roman Gilmore', N'Yemen - Tennessee', '20101215 00:14:20.120', '20110131 04:19:01.510', 2, N'M', N'LightPink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'867M', N'Melisa Carrillo', N'Pakistan - Kentucky', '20110406 20:29:11', '20110429 23:06:23.630', 1, N'F', N'PeachPuff', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'86R', N'Natalie Hodge', N'Brazil - Massachusetts', '20100130 00:35:46.390', '20100303 22:00:59.380', 2, N'M', N'OliveDrab', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'89EP', N'Dwight Shaffer', N'Anguilla - Minnesota', '20110302 18:00:21.390', '20110714 20:14:51.070', 2, N'M', N'MistyRose', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8AIH', N'Jonathon Ramsey', N'Mauritania - Rhode Island', '20110225 13:05:06.990', '20111009 06:58:57.070', 2, N'F', N'PaleTurquoise', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8FG8', N'Abraham Waller', N'Vanuatu - Oregon', '20090511 16:18:20.400', '20090703 06:26:07.890', 1, N'F', N'Wheat', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8FGA', N'Dexter Chase', N'Ecuador - Kentucky', '20100124 19:53:49.160', '20101009 18:02:35.880', 1, N'M', N'GhostWhite', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8GNZ', N'Terence Pace', N'Bulgaria - Utah', '20110314 14:43:53.770', '20111102 11:20:07.530', 2, N'F', N'FloralWhite', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8H9D', N'Gordon Sparks', N'Puerto Rico - Georgia', '20090825 05:39:07.810', '20091004 06:18:35.410', 1, N'F', N'Grey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8HBX', N'Benjamin Morton', N'French Guiana - South Carolina', '20100827 11:39:23.880', '20110124 20:08:19.100', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8I7P', N'Melisa Rosales', N'Colombia - Hawaii', '20100117 10:01:08.010', '20100814 20:56:11.410', 1, N'F', N'DarkTurquoise', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8IOH', N'Victor Huang', N'Pitcairn - New Mexico', '20090430 01:45:42.220', '20090718 23:33:10.240', 1, N'M', N'LightSalmon', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8J0U', N'Alejandro Garcia', N'Greenland - Ohio', '20101108 15:57:36.280', '20110719 23:29:46.840', 2, N'F', N'FloralWhite', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8KSE', N'Katrina Hale', N'Portugal - Missouri', '20100130 18:40:57.640', '20100809 07:59:55.430', 2, N'F', N'DarkSlateBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8ML1', N'Chadwick Adkins', N'China - Alaska', '20091130 14:37:20', '20100815 15:21:49.870', 1, N'M', N'PowderBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8MNB', N'Glenn Rodriguez', N'Congo - Delaware', '20100203 08:21:38.340', '20100713 10:31:26.470', 2, N'M', N'Plum', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8N5Q', N'Ethan Mc Neil', N'Jordan - Idaho', '20100920 23:35:07.220', '20110206 22:59:56.420', 1, N'M', N'DarkOliveGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8NGY', N'Efrain Barker', N'Monaco - Colorado', '20110222 00:33:42.600', '20111018 17:09:06.840', 2, N'M', N'OldLace', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8OHR', N'Jesus Chambers', N'Kazakhstan - Utah', '20091006 18:18:39.040', '20100527 12:53:09.340', 1, N'M', N'DeepPink', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8QO3', N'Erick Simpson', N'Chile - Vermont', '20090911 15:35:27.890', '20100423 04:59:06.870', 1, N'M', N'RosyBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8R4Z', N'Alfonso Shea', N'Georgia - Massachusetts', '20110109 21:37:45.790', '20110618 19:31:25.650', 1, N'M', N'LawnGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8SHP', N'Johnathan Savage', N'Bulgaria - Maryland', '20090602 09:52:49.320', '20091120 21:47:33.330', 1, N'M', N'DarkGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8URA', N'Kelvin Rosario', N'Czech Republic - Rhode Island', '20110324 01:19:57.810', '20110808 02:23:07.980', 2, N'F', N'FireBrick', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8V8G', N'Diane Hinton', N'Georgia - Minnesota', '20090722 07:07:47.260', '20100323 05:55:44.960', 1, N'F', N'IndianRed', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8VZ2', N'John Fernandez', N'Ghana - Mississippi', '20091117 12:51:37.220', '20100731 16:28:07.050', 1, N'M', N'DarkMagenta', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8WEX', N'Brett Willis', N'Israel - Washington', '20110303 19:07:34.940', '20110720 23:17:52.860', 1, N'M', N'LightSeaGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8WSG', N'Maureen Blevins', N'Egypt - Arkansas', '20101209 08:11:13.850', '20110730 18:26:00.090', 2, N'M', N'Black', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'94EW', N'Rafael Sloan', N'Thailand - Arizona', '20100801 05:04:24.640', '20100925 11:32:20.530', 2, N'F', N'DarkCyan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'94ZX', N'Rafael Mack', N'Thailand - Arizona', '20110401 20:00:59.200', '20111111 01:21:40.660', 2, N'F', N'MediumBlue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'951D', N'Serena Mc Knight', N'Cyprus - Kentucky', '20090427 12:05:54.200', '20090903 05:29:30.580', 2, N'F', N'Blue', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'965O', N'Derek Robertson', N'Iran - Rhode Island', '20090608 18:14:11.120', '20090610 01:02:17.870', 2, N'M', N'MistyRose', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'97BH', N'Margaret Adkins', N'Kyrgyzstan - Ohio', '20100703 13:49:24.840', '20100926 05:53:35.120', 2, N'M', N'Salmon', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'97CO', N'Katrina Terry', N'Bahamas - New Hampshire', '20110324 22:19:03.960', '20110429 06:48:25.580', 1, N'F', N'Silver', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'99AE', N'Marjorie Mendez', N'Vietnam - Minnesota', '20091204 16:10:28.180', '20100311 18:41:50.820', 1, N'F', N'LightCyan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'99XA', N'Luke Lamb', N'Malawi - California', '20100113 07:14:30.660', '20100917 00:13:03.910', 1, N'M', N'AntiqueWhite', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9EI5', N'Abraham Page', N'Lesotho - Arizona', '20110122 14:49:23.770', '20110611 19:32:34.430', 1, N'M', N'DarkBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9F1L', N'Laura Montoya', N'C?te d''Ivoire - Missouri', '20090721 14:11:15.890', '20090815 04:56:00.340', 1, N'M', N'SandyBrown', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9FJQ', N'Tamiko Mendoza', N'Mauritania - Minnesota', '20100614 04:02:39.020', '20100908 02:07:03.990', 1, N'M', N'LightSeaGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9GPD', N'Sandy Cross', N'Qatar - Mississippi', '20110312 12:50:42.920', '20110316 07:16:27.860', 1, N'F', N'LightCyan', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9HQW', N'Maggie Rios', N'Mali - New Jersey', '20091115 15:56:37.170', '20100522 05:31:17.990', 2, N'F', N'DimGrey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9HZ6', N'Ericka Reid', N'Kyrgyzstan - Colorado', '20091016 19:15:20.730', '20100516 21:23:24.060', 1, N'M', N'DarkGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9I8P', N'Isabel Juarez', N'Burkina Faso - Michigan', '20110408 14:09:06.960', '20110503 05:10:42.670', 1, N'F', N'GreenYellow', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9ID9', N'Krista Kidd', N'Malvinas - Maryland', '20090429 00:57:01.880', '20091220 21:10:15.710', 2, N'F', N'SlateGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9IYS', N'Barry Roach', N'Portugal - Oklahoma', '20090925 07:34:03.540', '20091025 17:44:13.820', 2, N'M', N'LightGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9JIY', N'Julius Weber', N'Niue - Connecticut', '20090618 10:11:20.760', '20100201 00:53:51.920', 1, N'F', N'Crimson', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9LD7', N'Claire Jarvis', N'Greece - New Jersey', '20100818 05:57:58.240', '20110523 06:42:26.180', 1, N'F', N'Wheat', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9LT6', N'Gabriela Schneider', N'American Samoa - Utah', '20090809 12:05:15.620', '20100105 11:55:26.830', 2, N'F', N'Navy', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9M5Q', N'Alana Spears', N'Libya - Alaska', '20100428 04:00:01.950', '20100801 06:02:14.960', 1, N'M', N'Brown', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9MAZ', N'Victoria Carroll', N'Egypt - Oklahoma', '20100307 05:32:45.960', '20100713 22:35:43.420', 1, N'F', N'OliveDrab', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9MXX', N'Philip Simpson', N'Djibouti - Oklahoma', '20110118 12:55:08.900', '20110925 11:21:44.370', 2, N'M', N'Wheat', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9N5Y', N'Tonya House', N'Guam - Florida', '20110420 05:20:38.300', '20110602 10:40:32.100', 1, N'F', N'YellowGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9NAS', N'Dianna Rodriguez', N'Barbados - Utah', '20100915 09:51:10.320', '20110110 11:42:23.520', 1, N'M', N'BlanchedAlmond', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9NCX', N'Dena Barron', N'Qatar - Pennsylvania', '20110501 22:01:19.270', '20111001 13:39:00.160', 1, N'M', N'Chartreuse', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9NHE', N'Isabel Li', N'Nauru - Connecticut', '20110211 08:46:42.520', '20110817 03:31:17.020', 1, N'F', N'Crimson', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9O3', N'Shad Henderson', N'Liberia - Delaware', '20110510 06:01:33.350', '20110615 21:28:18.680', 1, N'F', N'DimGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9O3A', N'Neal Faulkner', N'Belgium - Wyoming', '20101212 07:49:03.430', '20110426 03:36:11.160', 1, N'M', N'AntiqueWhite', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9SXE', N'Ruben Baird', N'Greece - Alaska', '20110301 13:26:46.630', '20111214 19:22:17.210', 1, N'F', N'SpringGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9V27', N'Heather Calderon', N'Sierra Leone - New Mexico', '20100426 18:38:56.610', '20110109 21:52:26.910', 1, N'M', N'MidnightBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9WS5', N'Felix Roach', N'Romania - Mississippi', '20101029 18:03:06.660', '20101119 22:19:37.130', 1, N'M', N'DarkViolet', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9Y7V', N'Angelina Keith', N'Russia - Pennsylvania', '20110508 02:04:11.630', '20111101 21:34:30.610', 1, N'M', N'DarkViolet', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9YDB', N'Brendan Pacheco', N'Falklands - South Dakota', '20100402 01:45:52.080', '20100407 22:47:06.890', 2, N'F', N'SteelBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9ZDE', N'Otis Harper', N'Tajikistan - Minnesota', '20100823 15:41:29.780', '20101116 02:45:30.170', 2, N'M', N'PaleGoldenRod', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A0U2', N'Sheryl Griffin', N'Malawi - Alaska', '20091006 02:27:17.810', '20100428 10:37:18.950', 1, N'M', N'DarkSeaGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A2F3', N'Mandy Stout', N'American Samoa - New Mexico', '20101023 02:20:08.100', '20110801 07:06:36.190', 1, N'F', N'Brown', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A2N2', N'Carla Monroe', N'Fiji - Ohio', '20090828 04:35:43.220', '20100409 18:23:50.220', 1, N'M', N'Chocolate', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A3BN', N'Marisa Davies', N'Hong Kong - Nebraska', '20091212 20:49:20.510', '20100522 13:04:53.230', 2, N'M', N'Chocolate', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A4UP', N'Roberto Joseph', N'Malawi - California', '20101027 12:29:04.650', '20110209 05:43:26.630', 2, N'M', N'LavenderBlush', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A6BQ', N'Nikki Ayala', N'Singapore - Pennsylvania', '20100512 16:18:24.940', '20101012 09:55:49.120', 1, N'F', N'MediumPurple', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A6K6', N'Patrick Kirk', N'Portugal - Texas', '20100525 21:39:39.390', '20100907 12:13:03.310', 1, N'M', N'LightPink', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A8SQ', N'Jean Mc Donald', N'Greece - Ohio', '20091024 22:30:24.950', '20100613 21:22:41.510', 1, N'M', N'Thistle', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A8U4', N'Darrell Reynolds', N'Malawi - California', '20090726 17:54:42.640', '20091230 11:14:28.530', 2, N'F', N'Chocolate', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ADPF', N'Stacy Caldwell', N'Saudi Arabia - Michigan', '20100507 19:22:15.270', '20100616 06:42:52.450', 2, N'F', N'RoyalBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ADTJ', N'Antonio Sharp', N'Cyprus - Alabama', '20100105 12:37:12.100', '20100412 14:36:31.340', 1, N'F', N'Thistle', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AE4U', N'Lorena Bird', N'Algeria - Wyoming', '20090707 22:39:13.130', '20100429 08:05:01.180', 2, N'M', N'DeepSkyBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AGKQ', N'Dora Rasmussen', N'Thailand - Maine', '20110203 13:39:31.050', '20110826 06:23:14.990', 1, N'F', N'DarkGoldenRod', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AJRX', N'Kathleen Morse', N'Haiti - Montana', '20110216 02:46:49.220', '20111127 23:12:12.220', 1, N'F', N'DimGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ALW2', N'Megan Middleton', N'American Samoa - Utah', '20100526 05:05:14.440', '20101022 01:42:21.670', 1, N'F', N'DimGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'APA4', N'Maribel Combs', N'Cape Verde - Michigan', '20100615 11:39:29.260', '20110220 22:34:11.840', 1, N'F', N'BlueViolet', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AQ2M', N'Rusty Castro', N'Italy - Tennessee', '20100531 09:55:03.910', '20100620 12:08:22.550', 2, N'F', N'GhostWhite', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AQN2', N'Kathryn Gould', N'Libya - South Dakota', '20100309 12:37:36', '20101106 08:41:08.010', 1, N'M', N'DarkSalmon', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AS48', N'Tracey Terrell', N'Gibraltar - Arizona', '20090516 18:38:57.700', '20100307 04:01:53.970', 2, N'M', N'DarkSlateGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AWZT', N'Jayson Kane', N'Canada - Kentucky', '20110503 22:30:19.660', '20110519 07:30:43.280', 1, N'F', N'AliceBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AX2U', N'Leigh Pitts', N'Haiti - California', '20100124 12:48:36.190', '20100810 08:27:11.870', 2, N'F', N'HoneyDew', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AX3X', N'Ricardo Wong', N'Uruguay - Oregon', '20100927 14:33:50.490', '20110515 13:07:34.820', 2, N'M', N'Yellow', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AXZV', N'Demond Cooley', N'Nepal - Kansas', '20101129 16:10:50.400', '20110819 07:28:49.120', 2, N'F', N'MediumOrchid', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'B5HR', N'Katrina Bennett', N'Macao - Utah', '20101124 04:29:31.170', '20110616 12:23:28.600', 2, N'F', N'SlateGrey', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'B5N2', N'Matthew Henderson', N'Lebanon - Georgia', '20090830 12:50:03.870', '20090930 23:12:58.190', 1, N'M', N'DarkGray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'B9N6', N'Jennifer Duran', N'South Africa - Illinois', '20100320 05:39:45.360', '20100403 10:19:11.850', 2, N'F', N'MediumPurple', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BCEA', N'Leslie Meyer', N'Rwanda - Hawaii', '20100804 08:48:46.510', '20110128 00:15:01.120', 2, N'F', N'LavenderBlush', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BCMU', N'Tammi Aguilar', N'Ghana - New York', '20091209 22:25:28.310', '20100815 23:12:49.660', 1, N'M', N'SeaShell', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BDT8', N'Gabrielle Bradshaw', N'Finland - Maryland', '20110129 08:09:22.290', '20110619 21:30:10.460', 1, N'M', N'Navy', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BGOZ', N'Abigail Norman', N'Barbados - Virginia', '20101215 17:28:32.510', '20110609 03:15:09.840', 1, N'F', N'Gainsboro', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BJ4Q', N'Holly Owens', N'France - California', '20091112 09:57:23.300', '20100809 23:36:20.050', 2, N'F', N'DarkSeaGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BK1O', N'Derick Glass', N'Barbados - Kansas', '20091103 22:03:08.410', '20100323 03:58:26.450', 2, N'M', N'IndianRed', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BKT', N'Dina Beard', N'Liechtenstein - Kansas', '20101214 04:33:24.780', '20110212 21:34:44.910', 2, N'M', N'LightSeaGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BME4', N'Lawanda Lawrence', N'Western Sahara - Washington', '20100130 04:54:20.630', '20100721 18:19:45.720', 2, N'M', N'Yellow', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BMVW', N'Mark Everett', N'Jersey - West Virginia', '20100108 03:22:37.730', '20100417 10:33:46.680', 1, N'F', N'Navy', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BQ0F', N'Jeanette Dudley', N'Pitcairn - Virginia', '20100811 04:13:17.410', '20100820 16:09:10.090', 1, N'M', N'Orchid', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BQ1G', N'Rickey Proctor', N'Estonia - Delaware', '20090403 09:09:47.290', '20090424 19:30:17.700', 1, N'F', N'Sienna', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BQKA', N'Marty Pacheco', N'Niue - Arizona', '20100421 05:51:24.150', '20100724 17:11:42.120', 1, N'M', N'DarkOrchid', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BRPF', N'Carey Fry', N'Malawi - California', '20090729 12:38:22.760', '20100317 05:21:09.800', 1, N'M', N'LightSalmon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BRQ3', N'Penny Choi', N'Japan - New Mexico', '20090602 16:16:39.430', '20090630 19:02:42.360', 1, N'F', N'LemonChiffon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BT33', N'Teresa Warner', N'Cuba - Iowa', '20091018 11:04:10.450', '20091104 01:58:39.050', 2, N'M', N'Gainsboro', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BW1M', N'Bridgette Hall', N'Guyana - Wisconsin', '20100831 07:14:30.760', '20110213 04:15:24.950', 1, N'F', N'OrangeRed', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BXRS', N'Dana Wagner', N'Syria - New Hampshire', '20091202 04:28:49.850', '20100102 00:51:40.550', 2, N'M', N'Linen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BY12', N'Anne Huang', N'Malaysia - Pennsylvania', '20100905 09:43:59.580', '20101021 20:52:50.950', 2, N'F', N'DarkRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C1I9', N'Jean Shaw', N'Guernsey - Iowa', '20100113 04:07:15.590', '20100402 18:02:06.380', 1, N'F', N'Sienna', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C4EY', N'Gordon Mays', N'Bolivia - West Virginia', '20091013 01:15:32.530', '20100428 18:27:36.170', 1, N'F', N'Tan', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C5V7', N'Justin Clayton', N'Argentina - Washington', '20100207 00:41:43.580', '20100629 01:44:29.940', 2, N'M', N'Violet', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C6RA', N'Dena Arellano', N'Uzbekistan - Delaware', '20090622 04:13:17.320', '20091114 09:17:47.860', 2, N'F', N'SlateGrey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C8EP', N'Tricia Duffy', N'Qatar - Texas', '20100329 04:39:22.300', '20100410 14:21:20.830', 2, N'F', N'DeepPink', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C9SU', N'Grant Villa', N'Honduras - North Dakota', '20091222 16:01:03.740', '20100107 21:37:33.170', 2, N'F', N'SaddleBrown', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C9YV', N'Deborah Faulkner', N'Guadeloupe - New Jersey', '20100320 19:09:30.040', '20101220 05:45:10.090', 1, N'M', N'DarkGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C9Z3', N'Shawna Ward', N'Belgium - Arizona', '20110106 00:40:39.050', '20111015 07:44:37.360', 1, N'F', N'DeepPink', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CD1U', N'Austin Schmidt', N'Slovakia - Mississippi', '20091031 17:56:52.720', '20100817 07:22:57.720', 2, N'F', N'SeaShell', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CDPL', N'Melody Chung', N'Cuba - Georgia', '20090821 17:12:40.490', '20100217 14:07:49.740', 1, N'F', N'Peru', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CHNI', N'Grant Chapman', N'Ghana - Vermont', '20100426 14:37:37.390', '20110108 14:03:30.530', 1, N'M', N'DodgerBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CK68', N'Kari Estrada', N'Italy - Kentucky', '20110316 19:03:09.890', '20111116 05:38:57.800', 2, N'M', N'LightPink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CP5P', N'Jermaine Bright', N'Kenya - Mississippi', '20110123 08:07:08.750', '20110304 15:23:16.920', 1, N'M', N'Maroon', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CPR8', N'Alan Mercer', N'Georgia - West Virginia', '20091230 03:57:52.670', '20100127 20:09:22.670', 2, N'M', N'YellowGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CPWP', N'Stanley Goodman', N'Bahrain - Alabama', '20100220 00:48:33.330', '20100523 17:07:07.680', 1, N'F', N'PaleGoldenRod', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CR8Z', N'Cheri Mckenzie', N'Romania - Oregon', '20100804 22:02:51.390', '20110217 19:25:51.760', 2, N'M', N'Salmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CU7T', N'Lynette Graves', N'Cuba - California', '20091028 20:31:11.640', '20100724 03:48:23.310', 2, N'F', N'MediumPurple', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CUL2', N'Shelley Whitehead', N'Malvinas - West Virginia', '20090601 10:33:18.990', '20090720 15:45:08.670', 1, N'F', N'MediumBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CZBZ', N'Gustavo O''Connor', N'Armenia - Massachusetts', '20100826 04:31:14.680', '20110505 09:09:53.660', 1, N'F', N'Chocolate', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CZIL', N'Howard Burke', N'Cyprus - Ohio', '20110428 03:51:11.070', '20110618 08:33:43.820', 1, N'M', N'LavenderBlush', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D140', N'Nelson Franklin', N'Seychelles - Indiana', '20091106 00:48:36.530', '20100826 16:22:34.680', 2, N'F', N'Tan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D18U', N'Lillian Sawyer', N'Congo - Utah', '20100723 21:01:23.630', '20110216 20:03:54.120', 2, N'M', N'SandyBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D1I7', N'Rachael Juarez', N'Niger - Colorado', '20100701 07:20:41.740', '20100819 12:01:30.510', 2, N'F', N'MediumVioletRed', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D266', N'Tammie Rasmussen', N'Fiji - North Carolina', '20101201 11:16:43.240', '20110809 05:26:20.110', 2, N'M', N'MediumVioletRed', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D4WZ', N'Norma Bean', N'Palau - Rhode Island', '20090904 17:35:35.810', '20100320 03:56:45.090', 1, N'M', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D50Q', N'Vicky Cain', N'Tajikistan - Wyoming', '20091123 11:58:24.240', '20100111 01:35:17.720', 1, N'M', N'Chocolate', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D56T', N'Marc Frank', N'Guinea - South Carolina', '20091025 17:39:01.770', '20100122 22:08:13.370', 1, N'F', N'DarkSlateGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D5NP', N'Wesley Hale', N'Mozambique - Mississippi', '20110304 10:25:08.630', '20110928 12:19:45.490', 1, N'F', N'Black', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D6IG', N'Penny Flores', N'Timor-Leste - North Dakota', '20090817 09:56:43.770', '20100314 18:52:34.250', 1, N'M', N'Purple', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D6KA', N'Yvette Vang', N'Poland - Louisiana', '20090607 03:16:55.370', '20090615 22:26:34.610', 2, N'M', N'Gray', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D8HO', N'Jonathan Avila', N'Rwanda - Hawaii', '20110205 08:32:18.990', '20110519 14:20:28.500', 2, N'F', N'HoneyDew', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D8Z3', N'Kristi Arellano', N'Saint Lucia - Virginia', '20100324 17:08:05.360', '20101008 22:12:16.630', 2, N'F', N'DarkOliveGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DAPB', N'Jodi Harrell', N'Ethiopia - Nevada', '20100627 08:01:04.600', '20101103 18:17:51.130', 1, N'F', N'CadetBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DDEJ', N'Cherie Barajas', N'Kiribati - Wisconsin', '20100208 22:02:59.400', '20101017 15:30:54.210', 1, N'M', N'RoyalBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DI2J', N'Carrie Chandler', N'Slovakia - Mississippi', '20100126 03:58:33.450', '20101018 23:47:51.220', 1, N'M', N'LightYellow', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DIOW', N'Andrea Dennis', N'Bolivia - West Virginia', '20100130 20:29:00.120', '20100419 16:58:27.730', 1, N'M', N'Turquoise', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DJWV', N'Erika Sawyer', N'Niger - Connecticut', '20090820 11:36:21.380', '20100520 18:46:57.900', 2, N'F', N'Snow', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DKKC', N'Kari Mc Lean', N'Tajikistan - Delaware', '20091029 16:52:05.700', '20100121 09:44:01.210', 1, N'F', N'GreenYellow', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DLDW', N'Latonya Gregory', N'Liberia - New York', '20091110 06:52:56.820', '20100708 16:45:10.270', 1, N'M', N'SandyBrown', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DRP8', N'Myra Sherman', N'Germany - Hawaii', '20091206 13:53:40.320', '20091225 00:06:03.740', 2, N'M', N'LightCyan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DT8J', N'Jayson Reyes', N'Colombia - Alaska', '20101027 08:49:44.210', '20110822 23:51:39.380', 1, N'M', N'HotPink', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DWSN', N'Peggy O''Neal', N'Bulgaria - Rhode Island', '20100705 23:26:34.720', '20100721 17:16:26.250', 2, N'M', N'PeachPuff', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DWWK', N'Alisha Dawson', N'Falklands - Oklahoma', '20101121 10:47:27.920', '20110406 07:59:48.830', 1, N'M', N'Khaki', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DZFJ', N'Jacob Tyler', N'Sierra Leone - Oregon', '20091024 16:42:01.390', '20100620 07:01:59.940', 1, N'M', N'RoyalBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E1J6', N'Neal Kaiser', N'Lebanon - Minnesota', '20100409 13:06:11.230', '20101115 22:56:15.470', 2, N'F', N'RoyalBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E2K6', N'Becky Bautista', N'Cuba - Nebraska', '20100524 10:56:44.460', '20101218 17:38:47.620', 2, N'M', N'OldLace', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E2SB', N'Rachael Rivera', N'Botswana - Connecticut', '20091019 21:31:30.480', '20100130 14:39:57.850', 1, N'M', N'Magenta', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E495', N'Heather Dougherty', N'Albania - Utah', '20090723 04:59:49.820', '20090918 02:48:28.460', 1, N'F', N'LightGrey', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E4T8', N'Rose Barry', N'Macedonia - Mississippi', '20110119 00:22:36.230', '20110429 02:54:03.930', 2, N'F', N'Grey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E4TN', N'Tania Herrera', N'Mauritania - Minnesota', '20100128 12:48:21.620', '20100224 22:44:10.170', 2, N'F', N'DarkKhaki', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E5JI', N'Deborah O''Neill', N'Iran - Washington', '20100208 19:28:01.350', '20100915 17:15:01.450', 1, N'F', N'Moccasin', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E5XL', N'Leonardo Johns', N'Uzbekistan - Massachusetts', '20100527 08:43:26.340', '20101109 15:17:55.280', 2, N'M', N'Grey', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E64M', N'Wendi Kemp', N'Finland - California', '20100221 09:11:38.880', '20100303 22:31:31.140', 2, N'F', N'SandyBrown', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E8BM', N'Tia Merritt', N'Tonga - Hawaii', '20090827 21:24:53.440', '20090929 18:49:24.680', 1, N'M', N'MediumPurple', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E93I', N'Anthony Tyler', N'Antarctica - Alaska', '20100226 07:10:00.910', '20101012 19:21:45.350', 1, N'F', N'Orchid', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ECMY', N'Olga Benjamin', N'Afghanistan - Tennessee', '20090709 10:59:37.830', '20091019 13:53:53.680', 2, N'M', N'LightSlateGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EDPU', N'Brett Yates', N'Tajikistan - New York', '20101009 23:01:14.700', '20110718 21:13:48.050', 1, N'F', N'LightYellow', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EDU2', N'Sandy Smith', N'Uzbekistan - Delaware', '20110220 01:22:00.090', '20111125 01:31:44.230', 2, N'M', N'MintCream', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EEEZ', N'Raymond Cross', N'Oman - Alaska', '20100920 05:54:07.620', '20101025 02:40:04.370', 2, N'M', N'RosyBrown', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EGCK', N'Edward Stevens', N'Mexico - Vermont', '20101228 08:16:48.780', '20110924 18:10:44.100', 2, N'F', N'Navy', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EGJ3', N'Perry Klein', N'Afghanistan - Tennessee', '20091009 21:52:19.520', '20100707 06:11:49.650', 2, N'F', N'Black', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EHHP', N'Irene Gilmore', N'Lesotho - Washington', '20091216 13:21:06.300', '20101008 13:04:38.380', 2, N'F', N'LightSlateGrey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EJBN', N'Alfonso Terry', N'Thailand - Georgia', '20091212 20:10:59.370', '20100709 14:31:41.510', 1, N'F', N'Wheat', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EM1Z', N'Marshall Erickson', N'Cape Verde - New Hampshire', '20091208 14:27:59.290', '20100208 13:39:02.100', 1, N'M', N'DarkSalmon', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EMG9', N'Kristina Hurley', N'Uzbekistan - Massachusetts', '20110202 07:42:53.550', '20110924 20:26:42.400', 2, N'M', N'PowderBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EMK3', N'Diana Glenn', N'Lebanon - Minnesota', '20110225 13:09:37.670', '20110911 22:04:25.400', 1, N'F', N'PaleTurquoise', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EP0C', N'Nikki Gilmore', N'Denmark - Wyoming', '20091107 16:13:43.090', '20091201 16:43:48.220', 2, N'M', N'Chartreuse', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EUUQ', N'Clay Whitney', N'Greece - Indiana', '20090803 11:32:56.760', '20100221 12:47:06.620', 1, N'M', N'LawnGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EWJB', N'Patrice Vazquez', N'Israel - South Dakota', '20091027 17:21:07.860', '20091104 02:35:22.080', 2, N'M', N'Beige', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EWS4', N'Alexis Michael', N'Micronesia - Vermont', '20100113 21:32:45.770', '20100802 15:34:17.410', 2, N'F', N'HotPink', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EXTZ', N'Joni Boyer', N'Djibouti - Alabama', '20100314 16:03:34.410', '20100907 16:17:40.300', 2, N'M', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EYTK', N'Heather Henderson', N'Finland - Oregon', '20090503 17:02:06.900', '20091002 01:15:31.530', 2, N'F', N'Olive', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EZ3K', N'Nick Cannon', N'France - Vermont', '20100413 10:24:04.390', '20100529 14:12:33.290', 2, N'F', N'IndianRed', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F294', N'Darren Hammond', N'Bulgaria - Oregon', '20101230 16:25:30.140', '20110910 17:06:55.120', 2, N'M', N'LimeGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F50K', N'Edith Keller', N'Cape Verde - Michigan', '20100508 21:12:51.930', '20101231 21:29:04.330', 1, N'F', N'Brown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F5HU', N'Ginger Allen', N'Syria - Illinois', '20090918 01:17:30.050', '20100428 22:48:19.650', 1, N'M', N'DodgerBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F6TA', N'Wade Medina', N'Saudi Arabia - Michigan', '20090923 15:23:45.200', '20100324 05:39:23.810', 2, N'F', N'BlanchedAlmond', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F6TX', N'Roberta Clarke', N'Guinea - South Carolina', '20100322 06:03:37.890', '20110102 16:17:56.340', 1, N'M', N'Grey', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F8DA', N'Joanne Lara', N'Martinique - Minnesota', '20110401 23:21:08.470', '20111031 04:46:07.480', 1, N'F', N'DarkGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FB1N', N'Frankie Woodard', N'Puerto Rico - Idaho', '20100623 21:08:04.840', '20110405 04:01:26.610', 1, N'M', N'DarkOrchid', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FB29', N'Kristen Roberts', N'Greenland - Iowa', '20100216 07:23:38.810', '20100811 10:23:35.730', 2, N'M', N'AntiqueWhite', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FBLA', N'Kellie Mercado', N'Niue - Arkansas', '20100730 23:56:56.680', '20101127 13:28:25.960', 1, N'M', N'SeaShell', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FBLP', N'Loretta Farmer', N'Australia - Kentucky', '20090620 16:04:56.770', '20090820 09:13:50.990', 1, N'F', N'DarkTurquoise', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FFKZ', N'Calvin Moran', N'Spain - Alabama', '20100329 12:30:56.070', '20100711 18:53:26.130', 1, N'F', N'YellowGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FFUL', N'Irma Padilla', N'Malawi - California', '20100826 23:56:48.730', '20101203 12:58:51.710', 2, N'M', N'DarkRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FHZ9', N'Jamal Mejia', N'Lebanon - Georgia', '20100911 01:53:14.050', '20110707 12:22:09.220', 1, N'M', N'LightPink', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FI9V', N'Kenny Olsen', N'Kiribati - Tennessee', '20090706 21:15:26.300', '20100130 09:19:48.900', 1, N'M', N'RosyBrown', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FLS6', N'Marisol Melendez', N'Monaco - Kansas', '20100720 20:43:43.520', '20110113 07:14:59.400', 2, N'M', N'Salmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FMRN', N'Stacie Decker', N'Tanzania - Rhode Island', '20100410 10:28:35.090', '20100725 06:04:48.720', 1, N'F', N'Gray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FNNY', N'Scott Lynch', N'Nicaragua - Vermont', '20100504 07:35:10.130', '20101104 14:39:52.050', 2, N'M', N'MidnightBlue', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FNZF', N'Ted Davila', N'Uruguay - South Dakota', '20100226 15:20:28.600', '20100705 13:33:09.340', 1, N'F', N'Snow', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FOGI', N'Darren Russell', N'Canada - Delaware', '20101111 08:02:50.990', '20101128 14:11:17.500', 1, N'M', N'NavajoWhite', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FOMW', N'Jerrod Macias', N'Djibouti - Utah', '20100313 14:40:20.030', '20101225 17:14:40.290', 1, N'M', N'LightCyan', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FQBW', N'Deana Beard', N'Zimbabwe - Tennessee', '20100421 17:15:20.170', '20100717 07:00:22.880', 1, N'M', N'Beige', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FU80', N'Theresa Greene', N'Bahamas - Florida', '20100423 23:57:56.210', '20101115 19:08:08.450', 2, N'F', N'WhiteSmoke', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FUDK', N'Katherine Buchanan', N'Gibraltar - Arizona', '20100516 16:24:15.250', '20110114 19:54:46.410', 1, N'F', N'CornflowerBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FVYR', N'Frederick Shaw', N'Saint Helena - Colorado', '20110420 17:06:31.480', '20110710 09:05:17.310', 2, N'M', N'LightCyan', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FWHO', N'Norma Love', N'Belize - Kentucky', '20090507 09:15:41.600', '20090729 19:41:26.960', 2, N'M', N'PaleGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FXRA', N'Sergio Clay', N'Uruguay - Kansas', '20110128 06:37:58.570', '20110821 08:40:56.340', 2, N'F', N'Black', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZNP', N'Christine Berry', N'Liberia - Wisconsin', '20100404 16:43:48.130', '20110117 01:21:12.670', 1, N'M', N'DarkTurquoise', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZO0', N'Cari Welch', N'Macao - Utah', '20100809 10:27:10.860', '20110306 09:15:25.440', 2, N'M', N'MediumPurple', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZRX', N'Brent Miranda', N'China - Massachusetts', '20100729 21:45:24.620', '20110316 18:24:00.870', 2, N'F', N'DeepSkyBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZVE', N'Tom Harper', N'United States - Kentucky', '20100604 22:13:14.120', '20100922 06:44:18.720', 1, N'M', N'DeepSkyBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZZ1', N'Samantha Herman', N'Botswana - Florida', '20100908 20:36:43.110', '20110601 09:51:13.290', 1, N'F', N'DarkOliveGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G0G6', N'Angel Crane', N'Philippines - Delaware', '20100730 18:05:03.560', '20100805 13:36:53.440', 1, N'M', N'FireBrick', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G1SD', N'Edward Schroeder', N'Paraguay - Vermont', '20090712 04:32:05.750', '20100418 15:43:24.380', 2, N'M', N'GoldenRod', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G2H3', N'Toby Alexander', N'Malvinas - South Dakota', '20100919 02:11:13.510', '20110616 03:24:01.810', 1, N'F', N'Green', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G2MK', N'Salvatore Mckay', N'Belarus - Nebraska', '20110408 18:03:01.160', '20110526 21:20:03.820', 1, N'M', N'FloralWhite', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G2YG', N'Christian Holmes', N'Singapore - New Mexico', '20110315 03:36:10.600', '20110812 14:06:52.090', 1, N'M', N'LightCoral', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G4Y', N'Roman Vang', N'Belize - Kentucky', '20110412 16:41:37.570', '20110913 04:54:48.450', 1, N'M', N'DimGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G5F2', N'Garrett Dudley', N'Nepal - New Mexico', '20090606 13:52:38.140', '20091231 00:41:01.970', 1, N'M', N'GhostWhite', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G61P', N'Rose Weeks', N'Israel - Oregon', '20100429 23:01:07.880', '20101212 20:54:52.460', 1, N'F', N'Cyan', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G79', N'Bernard Carter', N'Nepal - Kansas', '20090726 16:25:43.210', '20100507 23:45:11.060', 2, N'M', N'DarkGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G7L5', N'David Mosley', N'Andorra - Ohio', '20090705 04:23:19.580', '20100101 19:56:53.090', 1, N'M', N'ForestGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GAF', N'Tabatha Lucero', N'Rwanda - New Hampshire', '20090930 23:24:40.310', '20100412 11:03:29.650', 1, N'F', N'GreenYellow', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GB8C', N'Erika Waller', N'Greece - Ohio', '20100722 04:18:40.760', '20110421 21:04:40.490', 1, N'F', N'PowderBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GCVP', N'Susan Miranda', N'Myanmar - Massachusetts', '20101214 16:26:47.070', '20110817 05:04:46.190', 2, N'M', N'LightYellow', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GD4P', N'Jami Baldwin', N'Afghanistan - Washington', '20101011 04:54:03.610', '20110330 15:12:59.490', 1, N'F', N'Peru', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GE0C', N'Wendell Vaughan', N'Aruba - Wyoming', '20091008 23:54:30.800', '20100201 15:31:18.240', 2, N'M', N'LightGrey', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GEQW', N'Elton De Leon', N'Peru - Idaho', '20100319 18:35:20.580', '20101125 09:16:30.980', 1, N'M', N'Chocolate', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GFKZ', N'Charles Brown', N'Chile - Colorado', '20090914 10:05:42.270', '20091213 12:42:14.360', 1, N'F', N'OldLace', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GFTJ', N'Irma Wolfe', N'Nepal - Washington', '20090630 16:12:47.720', '20100311 09:00:50.760', 2, N'F', N'Violet', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GGK4', N'Francisco Mata', N'Belize - Wisconsin', '20110502 03:41:40.220', '20110621 08:38:11.840', 1, N'M', N'Magenta', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GI48', N'Brent Hendricks', N'Croatia - North Dakota', '20091026 08:53:31.260', '20100414 11:40:58.230', 2, N'F', N'DeepPink', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GJJQ', N'Terence Gibbs', N'Macedonia - Oregon', '20090529 23:59:06.070', '20091222 04:52:21.610', 1, N'M', N'SpringGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GJRW', N'Quincy Good', N'Palau - North Dakota', '20100118 12:15:54.820', '20100510 12:45:33.950', 1, N'F', N'Silver', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GJWX', N'Brian Farmer', N'Ghana - Florida', '20100420 02:20:23.170', '20100503 04:43:20.050', 2, N'F', N'Wheat', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GLTE', N'Leslie Lloyd', N'Niue - Arkansas', '20100921 16:08:10.230', '20110401 17:45:04.420', 2, N'M', N'MintCream', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GRM5', N'Sammy Montoya', N'Ghana - Missouri', '20110118 16:38:22.610', '20110215 20:21:40.120', 1, N'M', N'LightGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GSR6', N'Sabrina Welch', N'Brazil - Connecticut', '20100325 15:50:29.910', '20100828 15:46:50.950', 2, N'M', N'MediumVioletRed', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GTMR', N'Latisha Harper', N'Argentina - West Virginia', '20110421 12:51:40.990', '20110926 16:44:27.920', 1, N'M', N'Teal', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GTOL', N'Jake Peterson', N'Yemen - New Hampshire', '20100626 17:44:14.360', '20110418 15:24:48.220', 1, N'M', N'FloralWhite', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GV6Q', N'Vickie Chase', N'Burkina Faso - Alaska', '20101207 07:11:07.930', '20110727 02:07:44.640', 2, N'M', N'Teal', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GVOP', N'Lara Ferguson', N'Mayotte - Connecticut', '20090804 11:00:18.900', '20100319 15:27:41.290', 1, N'M', N'BlueViolet', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GWCY', N'Jake Butler', N'Turkey - Mississippi', '20100110 04:50:18.340', '20100621 15:00:42.230', 2, N'M', N'CadetBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GX7E', N'Lloyd Sanders', N'Croatia - Kansas', '20090508 06:34:57.020', '20090717 03:03:23.240', 1, N'M', N'MediumSlateBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GXWG', N'Patrick Henson', N'Guadeloupe - Texas', '20100307 11:47:38.660', '20100715 15:01:12.090', 1, N'F', N'Peru', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GZXX', N'Isabel Contreras', N'Lebanon - Maine', '20100518 08:30:03.320', '20101129 01:58:23.340', 2, N'M', N'RosyBrown', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H1Z0', N'Alvin Baldwin', N'Australia - Kentucky', '20100722 01:48:35.510', '20110510 09:41:40.110', 1, N'M', N'Cornsilk', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3EQ', N'Margarita Simmons', N'Russia - Pennsylvania', '20090926 05:59:53.680', '20091208 01:51:36.640', 1, N'F', N'SandyBrown', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3J3', N'Jeffrey Krueger', N'Saudi Arabia - Connecticut', '20100209 20:53:47.390', '20100619 21:49:54.900', 1, N'F', N'MistyRose', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3OY', N'Michele Mullen', N'Ecuador - Georgia', '20090510 04:49:17.050', '20090925 01:07:19.140', 2, N'F', N'MistyRose', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3YZ', N'Neal Leon', N'Japan - North Carolina', '20090813 04:17:56.460', '20100219 19:06:00.790', 1, N'M', N'DarkSlateBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H4HJ', N'Jordan Stewart', N'Malawi - Connecticut', '20101128 07:43:56.170', '20101229 06:00:34.390', 1, N'M', N'LightSlateGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H4ML', N'Leslie Stokes', N'Australia - Kentucky', '20100601 23:55:57.670', '20100912 12:36:24.400', 1, N'M', N'Yellow', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H4Z7', N'Pete Chandler', N'Fiji - Pennsylvania', '20100821 16:48:14.430', '20101102 05:24:48.670', 2, N'F', N'OldLace', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H6JK', N'Nichole Lang', N'Bulgaria - Montana', '20110423 17:38:39.530', '20110429 20:34:25.600', 1, N'F', N'Gray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HALE', N'Ryan Cantu', N'Ethiopia - Maryland', '20101026 11:34:10.960', '20110114 05:09:39.520', 2, N'F', N'PaleTurquoise', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HBGD', N'Joe Cowan', N'Philippines - Missouri', '20110329 17:05:02.950', '20120115 07:36:26.380', 1, N'F', N'SkyBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HBKZ', N'Clayton Hampton', N'Poland - Illinois', '20090412 01:54:44.010', '20090926 03:34:46.230', 1, N'M', N'Tomato', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HI4N', N'Sarah Lawrence', N'Libya - Utah', '20100320 02:06:50.620', '20100320 05:21:12.860', 2, N'F', N'Plum', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HJ7Y', N'Claire O''Neill', N'Greenland - Iowa', '20101201 07:20:56.710', '20101203 08:38:48.690', 1, N'F', N'DodgerBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HJB4', N'William Riggs', N'Argentina - West Virginia', '20100221 08:31:52.940', '20101017 04:47:16.850', 1, N'M', N'Lime', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HJWK', N'Angie Knox', N'Sweden - Arizona', '20100729 18:36:36.430', '20100918 09:49:21.350', 2, N'F', N'LightCyan', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HM3I', N'Luke Becker', N'Taiwan - Arizona', '20110103 23:40:48.760', '20110122 15:11:38.850', 1, N'M', N'PeachPuff', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HNG9', N'Gabriela Barton', N'Barbados - Washington', '20101206 23:01:01.730', '20110506 09:41:59.940', 1, N'M', N'GhostWhite', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HPAN', N'Patricia Mc Donald', N'Australia - Tennessee', '20090422 18:20:22.600', '20090529 12:11:41.120', 1, N'F', N'HotPink', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HQAG', N'Keri Charles', N'Rwanda - Hawaii', '20090925 11:02:59.060', '20100123 23:01:21.110', 2, N'M', N'MistyRose', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HRVU', N'Calvin Hutchinson', N'Palau - North Dakota', '20100609 15:20:43.450', '20100915 10:27:22.410', 1, N'M', N'Sienna', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HRX2', N'Brett Fitzgerald', N'Lesotho - Arizona', '20100506 14:00:34.240', '20100530 07:11:19.420', 2, N'F', N'Cornsilk', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HS6Q', N'Kristian Haney', N'Indonesia - Montana', '20091127 18:26:36.070', '20100811 07:25:43.030', 1, N'M', N'SaddleBrown', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HSBJ', N'Claude Watson', N'Uruguay - Kansas', '20101227 15:37:39.620', '20110208 05:24:48.560', 1, N'M', N'DarkViolet', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HUTT', N'Bridgett Alexander', N'Tonga - Kansas', '20090908 08:01:49.470', '20100517 23:02:40.490', 1, N'F', N'MediumBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HUYH', N'Chadwick Cervantes', N'Morocco - Connecticut', '20100713 17:59:19.160', '20101104 08:19:00.140', 1, N'M', N'PaleGoldenRod', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HWDB', N'Seth Archer', N'Greenland - Ohio', '20101123 08:59:24.300', '20110607 21:39:49.140', 2, N'F', N'OliveDrab', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HX6J', N'Allen Hudson', N'Mauritania - Minnesota', '20100508 20:10:16.210', '20110301 07:39:48.690', 1, N'M', N'LightBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HZCZ', N'Kelley Glass', N'Seychelles - California', '20110131 07:16:08.710', '20110327 12:28:57.240', 1, N'M', N'Magenta', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I3NX', N'Oscar Chavez', N'Jordan - North Carolina', '20091218 11:55:28.250', '20100407 14:33:54.800', 1, N'F', N'LavenderBlush', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I5I3', N'Rex Santana', N'Bahamas - New Hampshire', '20100111 18:55:37.500', '20100821 17:51:01.170', 1, N'F', N'CadetBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I5PL', N'Clyde Cummings', N'Andorra - West Virginia', '20110128 15:34:53.570', '20110217 12:05:31.310', 1, N'F', N'DarkBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I7G7', N'Clayton Hanna', N'Monaco - Colorado', '20110326 08:47:32.790', '20111228 18:45:02.510', 2, N'M', N'Gray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I8BM', N'Marcos Bentley', N'Slovenia - Washington', '20090709 02:59:44.340', '20100212 10:16:50.600', 1, N'M', N'Fuchsia', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I9HJ', N'Angelia Bridges', N'Kenya - Arkansas', '20110213 16:29:12.380', '20110926 12:18:55.600', 2, N'F', N'Aqua', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IBPF', N'Beverly Peters', N'Zambia - Mississippi', '20100322 13:05:15.540', '20101005 10:03:42.040', 2, N'F', N'DarkCyan', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ICUM', N'Clifton Lyons', N'Bermuda - Arkansas', '20110404 08:20:53.420', '20110421 06:23:39.790', 1, N'F', N'Plum', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ID0R', N'Joel Hendrix', N'Mali - Missouri', '20100619 17:20:19.470', '20100722 13:33:36.550', 2, N'F', N'LightGrey', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IE87', N'Vivian Forbes', N'Macedonia - Oregon', '20110104 09:49:02.160', '20110505 22:18:39.790', 2, N'M', N'PaleTurquoise', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IEPN', N'Michele Hill', N'Senegal - Wisconsin', '20090924 23:28:34.950', '20091218 05:02:24.540', 1, N'F', N'LightCoral', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IGGD', N'Edwin Mosley', N'Burundi - Massachusetts', '20101230 01:57:21.960', '20110201 11:17:06.240', 1, N'M', N'PeachPuff', N'Automotive')
GO

--
-- Data for table dbo.KhachHang_WebTower9  (LIMIT 1000,500)
--

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IH31', N'Loretta Mccall', N'Falklands - Arizona', '20100726 03:03:48.510', '20100811 10:37:47.700', 1, N'M', N'LawnGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IJAX', N'Yvette Christian', N'Latvia - Arkansas', '20110129 01:47:25.890', '20110901 13:33:44.950', 2, N'F', N'YellowGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IJP8', N'Kristy Becker', N'Fiji - Maine', '20110130 08:15:19.620', '20110206 15:06:27.620', 1, N'F', N'MintCream', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IJWZ', N'Jenny Charles', N'Barbados - Utah', '20091220 21:24:30.350', '20100714 16:00:40.780', 1, N'F', N'Blue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IK9O', N'Sonja Everett', N'Trinidad - Florida', '20110129 04:40:21.810', '20110523 06:06:28.310', 2, N'F', N'Yellow', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IKO1', N'Carey Aguilar', N'Liechtenstein - Vermont', '20100515 09:24:15.160', '20100529 13:30:06.120', 2, N'F', N'DarkRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IKZ', N'Joyce Edwards', N'Trinidad - Kansas', '20090526 15:15:15.390', '20091004 04:02:34.220', 2, N'F', N'Pink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IMRQ', N'Vicki Rodriguez', N'Rwanda - Ohio', '20091130 04:40:16.790', '20100721 20:31:53.450', 1, N'M', N'MediumOrchid', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IO5', N'Marie Escobar', N'Grenada - Hawaii', '20090415 12:27:26.730', '20091220 00:12:58.770', 2, N'F', N'Turquoise', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IOD7', N'Quincy Elliott', N'Tajikistan - Delaware', '20100521 11:27:25.930', '20110123 02:36:16.930', 1, N'F', N'PaleVioletRed', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IOZI', N'Harry Mccarty', N'Saint Helena - Virginia', '20100510 04:43:40.080', '20101006 13:54:49.350', 1, N'F', N'Blue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IPQ1', N'Scott Hatfield', N'Vanuatu - New Hampshire', '20100609 23:00:50.470', '20100712 07:07:19.060', 2, N'F', N'MediumSlateBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IQO2', N'Earnest Weiss', N'Bahamas - New Hampshire', '20110415 18:59:21.990', '20110913 11:13:51.480', 1, N'M', N'Orchid', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IRFC', N'Kate Lloyd', N'Yemen - Kansas', '20100810 18:21:07.640', '20100813 17:27:59.580', 1, N'M', N'PapayaWhip', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IS3W', N'Andrea Clay', N'Mauritius - Oregon', '20110120 02:06:01', '20110519 19:42:14.340', 2, N'F', N'PowderBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IT1Y', N'Sherman French', N'Ethiopia - Maryland', '20091229 00:02:24.310', '20100723 15:19:04.100', 1, N'F', N'DodgerBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IVJ6', N'Carl Gay', N'Botswana - North Carolina', '20100824 15:03:50.250', '20110418 05:05:30.080', 2, N'F', N'Plum', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IWM8', N'Darnell Bernard', N'Lesotho - Washington', '20100709 18:10:51.460', '20100716 20:49:39.780', 1, N'M', N'MediumPurple', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IWVD', N'Seth Morrow', N'Iceland - New Hampshire', '20090722 06:03:54.430', '20100128 13:06:47.190', 1, N'M', N'Cornsilk', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IYLM', N'Chasity Bradshaw', N'Bulgaria - Utah', '20101203 22:21:14.410', '20110124 19:06:45.240', 2, N'M', N'MediumOrchid', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IZ69', N'Ira Herring', N'Pakistan - Pennsylvania', '20100209 00:50:28.310', '20100804 09:11:53.710', 2, N'M', N'Tomato', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IZHQ', N'Quincy Spears', N'Liechtenstein - Texas', '20090519 04:41:24.290', '20091221 18:58:24.910', 1, N'F', N'Fuchsia', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IZU', N'Chadwick Short', N'Taiwan - North Carolina', '20100517 03:41:27.920', '20100716 12:01:19.540', 2, N'M', N'DimGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J0HJ', N'Malcolm Sandoval', N'Zimbabwe - Tennessee', '20100508 03:07:10.300', '20100603 22:36:05.030', 2, N'F', N'DarkTurquoise', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J0RB', N'Leonardo Ibarra', N'Kazakhstan - Connecticut', '20100422 10:09:57.600', '20100503 18:39:57.930', 2, N'F', N'Thistle', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J3DY', N'Juanita Mc Intyre', N'C?te d''Ivoire - South Carolina', '20100816 07:25:52.620', '20110203 10:30:59.770', 1, N'F', N'Snow', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J3KP', N'Clifton Schaefer', N'Netherlands - Alaska', '20110214 03:05:31.760', '20110303 08:05:14.700', 1, N'F', N'Wheat', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J5R5', N'Frankie Lynn', N'Poland - Hawaii', '20110330 09:15:56.730', '20111003 03:46:09.990', 1, N'M', N'Fuchsia', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J7TO', N'Robert Valdez', N'Cape Verde - New Jersey', '20110406 15:16:48.620', '20110624 10:33:39.240', 2, N'M', N'BlueViolet', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J87R', N'Dexter Webster', N'Spain - Connecticut', '20090907 21:47:50.890', '20100429 20:27:45.530', 1, N'M', N'Khaki', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J9VM', N'Sarah Hammond', N'Belarus - Arizona', '20100111 00:59:55.830', '20100327 08:12:26.590', 1, N'F', N'Fuchsia', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JAG6', N'Janice Pitts', N'Burkina Faso - Virginia', '20090430 05:08:46.900', '20090503 11:40:36.010', 2, N'M', N'Tan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JAQA', N'Ian Calderon', N'Cape Verde - Tennessee', '20100630 17:24:13.930', '20110128 11:48:58.740', 2, N'M', N'DeepSkyBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JBSB', N'Tara Hogan', N'Monaco - Kansas', '20100309 00:55:41.330', '20100715 01:30:31.140', 1, N'F', N'DarkOliveGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JBVT', N'Maureen Collins', N'Niue - Tennessee', '20090806 18:52:55.480', '20100110 20:58:05.950', 2, N'F', N'GreenYellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JCLA', N'Shelia Durham', N'Monaco - Colorado', '20100826 22:22:11.680', '20100830 11:55:28.470', 1, N'M', N'Orchid', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JDFU', N'Stuart Barrera', N'Finland - Oregon', '20110322 10:12:49.620', '20110712 05:20:04.990', 2, N'F', N'DarkGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JDN0', N'Ramiro Glenn', N'Burundi - Colorado', '20091015 03:28:08.380', '20100415 01:28:08.820', 2, N'F', N'LightPink', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JDTC', N'Traci Lamb', N'Mauritius - Wisconsin', '20091029 03:22:03.310', '20100413 05:52:54.100', 2, N'F', N'Cyan', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JFK9', N'Marie Wu', N'Morocco - New Mexico', '20090823 05:42:22.950', '20091010 17:17:23.910', 1, N'F', N'DarkGray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JFMV', N'Lance Reilly', N'Algeria - Tennessee', '20100602 08:40:55.680', '20100908 12:11:05.010', 1, N'M', N'PapayaWhip', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JHJZ', N'Staci Arellano', N'Egypt - Wyoming', '20101129 20:24:18.450', '20110906 11:10:12', 1, N'F', N'Tan', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JIIH', N'Beth Gross', N'South Africa - Missouri', '20110416 13:55:27.200', '20110503 09:14:09.130', 1, N'F', N'DarkRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JIVF', N'Laura Chan', N'Bulgaria - New Mexico', '20090814 00:52:54.170', '20100125 08:11:09.960', 2, N'F', N'SteelBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JJ50', N'Mason Pham', N'Bhutan - New Mexico', '20110406 18:32:06.830', '20120113 13:30:38.230', 2, N'M', N'DarkSeaGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JL7D', N'Clarissa Ayers', N'Micronesia - Vermont', '20101009 07:47:29.530', '20110712 07:30:00.830', 1, N'F', N'MidnightBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JMY7', N'Calvin Shelton', N'Eritrea - Virginia', '20100611 17:04:00.330', '20100624 23:25:36.960', 2, N'M', N'DarkOliveGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JOCU', N'Marco Marshall', N'Czech Republic - Oregon', '20110101 21:20:32.920', '20110206 04:22:49.440', 1, N'M', N'Moccasin', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JPCL', N'Laurie Casey', N'C?te d''Ivoire - Missouri', '20110330 08:18:12.540', '20110716 06:33:58.160', 2, N'F', N'Linen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JQDH', N'Anitra Ochoa', N'Argentina - West Virginia', '20110503 13:44:31.550', '20120104 19:47:02.660', 2, N'F', N'MediumSlateBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JROV', N'Dianna Horn', N'Estonia - Washington', '20110227 02:52:40.570', '20110428 23:36:39.140', 2, N'M', N'LightSteelBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JT4S', N'Frank Rojas', N'Gambia - New Mexico', '20091211 03:08:13.770', '20100523 01:07:53.960', 2, N'M', N'DarkGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JXFV', N'Noel Rasmussen', N'Cape Verde - Oregon', '20101022 01:26:27.860', '20110621 23:46:01.800', 2, N'M', N'BlanchedAlmond', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K11H', N'Wanda Holland', N'Guinea - Iowa', '20110322 22:25:04.370', '20111202 01:36:43.290', 2, N'M', N'MediumVioletRed', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K1GE', N'Nancy Wise', N'Comoros - Illinois', '20091024 08:22:04.490', '20100612 18:09:27.250', 1, N'M', N'SlateGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K3WH', N'Kristian Willis', N'Niue - Connecticut', '20110403 20:22:38.740', '20110902 07:58:08.560', 1, N'M', N'Turquoise', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K630', N'Garry Warner', N'Cape Verde - Oregon', '20101221 09:43:10.370', '20110701 04:57:21.370', 1, N'F', N'LightSteelBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K8FU', N'Jasmine Marquez', N'Sierra Leone - Maryland', '20090415 12:18:03.970', '20090825 06:24:44.670', 2, N'F', N'Indigo', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K8RG', N'Alana Duke', N'Cook Islands - Wyoming', '20100808 22:53:59.430', '20101122 14:38:40.320', 1, N'M', N'SeaGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KBD5', N'Tracie Martin', N'Belgium - Vermont', '20091121 01:48:54', '20100718 19:11:39.010', 1, N'M', N'Red', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KCL0', N'Gilbert Hardin', N'Vanuatu - New Hampshire', '20090804 10:02:14.450', '20090915 10:40:32.880', 1, N'F', N'GhostWhite', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KD5W', N'Katina Beltran', N'Guadeloupe - New Jersey', '20100111 13:37:04.030', '20100517 17:08:34.440', 1, N'M', N'LightSalmon', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KGJJ', N'Sonja Holder', N'Sweden - Maine', '20091214 19:24:03.120', '20100503 23:37:04.780', 2, N'M', N'Aqua', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KH2H', N'Joel Bishop', N'Timor-Leste - North Dakota', '20110311 03:45:40.220', '20110401 11:27:58.670', 1, N'F', N'WhiteSmoke', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KI8I', N'Luke Santos', N'Saint Helena - Delaware', '20110121 23:57:49.900', '20110801 11:35:09.740', 1, N'F', N'Magenta', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KLSX', N'Kelvin Lang', N'Mozambique - Mississippi', '20101205 19:33:23.530', '20110607 10:49:41.110', 1, N'F', N'Blue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KMBI', N'Randall Burke', N'Finland - Maine', '20090513 03:11:25.180', '20100209 11:54:07.600', 2, N'M', N'Darkorange', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KP5', N'Janine Calhoun', N'Palau - West Virginia', '20101224 04:16:17.560', '20110510 08:42:26.350', 1, N'M', N'DarkGoldenRod', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KQDK', N'Judy Beard', N'Nigeria - Minnesota', '20090401 08:05:28.590', '20091203 12:41:50.280', 2, N'F', N'Aqua', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KSYQ', N'Noah Nixon', N'Israel - New Hampshire', '20100707 17:35:03.340', '20101014 11:02:59.920', 1, N'M', N'Gainsboro', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KUYO', N'Connie Walters', N'Eritrea - Virginia', '20100726 10:46:58.910', '20101031 18:36:18.960', 1, N'M', N'Maroon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KVVZ', N'Danielle Rowland', N'Somalia - Kentucky', '20100918 20:18:35.370', '20101112 04:53:18.620', 2, N'F', N'GreenYellow', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KWTV', N'Cassie Evans', N'Djibouti - Nevada', '20090520 12:35:05.690', '20090920 08:23:12.920', 2, N'F', N'DarkSlateBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KX3C', N'Dorothy Evans', N'Saint Helena - Colorado', '20100723 02:17:14.510', '20100725 07:27:23.160', 1, N'M', N'Chartreuse', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KXOT', N'Darrell Nixon', N'Cuba - Louisiana', '20091117 10:16:04.060', '20100718 13:15:42.200', 1, N'M', N'Thistle', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KZDU', N'Damion Reynolds', N'Thailand - Missouri', '20090602 23:18:50.070', '20090921 01:24:42.640', 2, N'M', N'Azure', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L04S', N'Shannon Stevenson', N'Haiti - California', '20110428 22:34:29.110', '20110717 05:58:43.030', 2, N'M', N'LightGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L0DD', N'Derek Farley', N'Togo - Connecticut', '20101001 22:29:18.360', '20110131 09:44:39.190', 1, N'M', N'MistyRose', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L0QS', N'Marcus Moore', N'Libya - Alaska', '20090815 13:47:29.250', '20091010 10:10:33.600', 1, N'F', N'DeepPink', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L2DP', N'Ricky Clay', N'Haiti - Illinois', '20100727 22:38:27.840', '20101018 20:18:59.510', 2, N'M', N'Olive', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L38F', N'Tameka Stewart', N'Cuba - California', '20110112 15:50:44.420', '20111004 10:56:17.070', 2, N'M', N'Khaki', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L3GL', N'Morgan Larson', N'Guernsey - Utah', '20100708 14:11:14.380', '20100904 11:07:15.450', 2, N'F', N'MidnightBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L45F', N'Nick Nixon', N'Belgium - Arizona', '20100313 19:27:11.270', '20100424 14:21:26.900', 2, N'M', N'DarkCyan', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L6M8', N'Candace Spence', N'Antarctica - Vermont', '20100420 23:28:34.180', '20100716 13:31:34.150', 1, N'M', N'MintCream', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L72J', N'Louis Lloyd', N'Barbados - Washington', '20100209 18:06:31.350', '20100807 17:26:53.890', 2, N'M', N'Cornsilk', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LAPA', N'Tonia Schaefer', N'Jamaica - Mississippi', '20090901 01:50:59.370', '20091107 18:16:13.560', 1, N'F', N'CadetBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LGMF', N'Olga Hardin', N'Nepal - Idaho', '20090726 13:47:36.440', '20091008 11:49:24.690', 1, N'F', N'DeepPink', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LHEF', N'Roger Rose', N'Malvinas - West Virginia', '20110128 01:40:59.550', '20110609 18:30:41.310', 1, N'M', N'AntiqueWhite', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LIC1', N'Vicki Waters', N'Argentina - Washington', '20110217 02:04:13.740', '20111018 01:43:19.370', 2, N'M', N'DarkBlue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LIQ6', N'Theodore Stephenson', N'Gabon - Kentucky', '20101108 01:50:10.200', '20110808 14:59:36.030', 1, N'F', N'LightSkyBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LJJM', N'Kareem Lane', N'C?te d''Ivoire - South Carolina', '20100804 14:14:11.210', '20110302 08:12:30.760', 2, N'M', N'LemonChiffon', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LJPZ', N'Glenda Randolph', N'Monaco - Colorado', '20101123 09:49:53.100', '20101219 14:38:46.980', 1, N'M', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LMHE', N'Lonnie Allison', N'Bahamas - Florida', '20090503 09:27:48.330', '20090731 04:06:38.020', 2, N'M', N'LawnGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LN7J', N'Doris Shannon', N'Colombia - North Carolina', '20100409 03:10:47.090', '20100503 10:09:31.110', 2, N'F', N'SlateGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LNZ6', N'Joan Nolan', N'Panama - New Hampshire', '20100805 03:58:35.240', '20110527 11:25:01.940', 1, N'M', N'PapayaWhip', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LOM0', N'Joshua Mccoy', N'Yemen - Massachusetts', '20100812 11:59:31.530', '20100919 09:10:12.670', 2, N'F', N'MediumTurquoise', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LON9', N'Hollie Vaughn', N'Oman - Alaska', '20090714 15:23:44.940', '20090913 07:12:01.800', 1, N'F', N'Salmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LOPX', N'Ian Gallegos', N'Cape Verde - Michigan', '20100723 20:36:02.360', '20101013 13:43:41.230', 2, N'M', N'White', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LPV3', N'Marissa Elliott', N'Libya - Alaska', '20101021 20:57:52.920', '20110530 04:36:48.730', 2, N'M', N'LightGrey', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LRPZ', N'Colby Knight', N'Barbados - Pennsylvania', '20091230 07:05:11.160', '20100222 17:50:57.990', 1, N'M', N'Ivory', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LS4H', N'Isaac Zimmerman', N'South Africa - Louisiana', '20090417 18:06:40.190', '20090730 08:44:03.390', 2, N'M', N'Linen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LSK', N'Lesley Abbott', N'Botswana - Oklahoma', '20090807 16:00:39.190', '20100518 13:01:50.060', 2, N'M', N'Plum', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LSUP', N'Courtney Lawson', N'Nepal - Florida', '20100701 16:31:54.310', '20101018 04:01:48.640', 1, N'M', N'Indigo', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LSW4', N'Marla Preston', N'Jersey - Michigan', '20100201 02:46:21.940', '20100604 19:58:19.200', 1, N'F', N'MediumVioletRed', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LTN9', N'Leah Hobbs', N'Liberia - Wisconsin', '20110312 04:35:06.590', '20110504 17:48:25.180', 1, N'M', N'White', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LTT2', N'Cory Warren', N'Sierra Leone - Hawaii', '20110502 04:32:01.790', '20120117 13:31:14.060', 2, N'M', N'Grey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LU5T', N'Sergio Sheppard', N'Syria - Tennessee', '20090910 13:18:01.030', '20091203 00:06:59.810', 1, N'F', N'NavajoWhite', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LWVD', N'Kenneth Delacruz', N'Cook Islands - Wyoming', '20090506 21:53:36.720', '20091010 17:05:29.740', 2, N'F', N'WhiteSmoke', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LYTX', N'Reginald Maxwell', N'Benin - Connecticut', '20110118 03:19:55.150', '20110510 08:14:39.160', 2, N'F', N'DarkKhaki', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M2MD', N'Josh Blair', N'Cape Verde - Rhode Island', '20090625 15:18:24.950', '20090826 01:27:57.200', 1, N'F', N'ForestGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M33Z', N'Darlene Newton', N'Japan - Mississippi', '20090721 04:33:27.910', '20100110 18:56:02.580', 1, N'F', N'LightGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M46F', N'Felix Spencer', N'Belarus - Arizona', '20100315 03:32:01.480', '20100501 10:43:11.260', 2, N'M', N'DarkSlateGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M64A', N'Kimberley Maxwell', N'Belarus - Nebraska', '20110303 17:47:30.320', '20111225 19:34:25.070', 1, N'F', N'SlateGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M9XT', N'Chester Spence', N'Eritrea - Wyoming', '20090621 16:29:44.930', '20090826 07:54:06.900', 1, N'F', N'Lime', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MA8W', N'Andre Vega', N'Sierra Leone - Alabama', '20100513 17:18:53.860', '20110129 08:23:44.730', 1, N'M', N'FireBrick', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MAM8', N'Joanna Carey', N'Uzbekistan - Idaho', '20110117 09:42:12.690', '20110318 16:58:21.830', 2, N'M', N'LightGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MAMK', N'Rex Nixon', N'Finland - Texas', '20100601 01:26:14.070', '20110223 06:39:00.680', 1, N'M', N'AliceBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MCR8', N'Virginia Stokes', N'Lebanon - Maine', '20100225 23:43:19.200', '20101029 16:34:49.070', 1, N'M', N'DarkCyan', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MEGK', N'Toby Landry', N'Poland - Illinois', '20090626 19:36:15.850', '20090914 04:05:39.260', 1, N'M', N'RosyBrown', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MGCB', N'Rafael Sandoval', N'Vietnam - South Carolina', '20110408 02:31:14.020', '20111201 14:38:44.450', 2, N'F', N'CornflowerBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MHS7', N'Lorraine Valdez', N'Hungary - California', '20100926 13:35:32.100', '20110616 09:27:01.120', 1, N'F', N'Salmon', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MLBY', N'Steven Rogers', N'Sri Lanka - Iowa', '20090930 07:21:30.550', '20100717 08:47:25.680', 2, N'F', N'Brown', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MM9O', N'Dylan Carr', N'Somalia - West Virginia', '20100110 20:34:37.700', '20100803 06:07:26.950', 2, N'F', N'MediumTurquoise', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MMX', N'Belinda Barnes', N'Iran - Alabama', '20100904 23:39:39.510', '20110317 08:18:02.840', 2, N'M', N'Beige', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MRV0', N'Dustin Campbell', N'Costa Rica - Utah', '20100516 03:40:48.880', '20100711 12:39:48.160', 2, N'F', N'DarkKhaki', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MS24', N'Calvin Carson', N'Anguilla - New Mexico', '20091202 16:38:45.640', '20100423 20:12:28.090', 2, N'M', N'LightGray', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MSFT', N'Edgar Conley', N'Nicaragua - Indiana', '20100718 08:50:34.630', '20100926 13:23:59.440', 2, N'F', N'Olive', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MT6V', N'Ted Lara', N'Pitcairn - Virginia', '20100409 04:54:44.160', '20100508 08:49:24.130', 2, N'F', N'Snow', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MTRW', N'Donnell Mc Mahon', N'Portugal - South Dakota', '20100816 01:25:58.560', '20110417 10:01:18.900', 2, N'F', N'Crimson', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MVZH', N'Emily Sampson', N'Sweden - Texas', '20101208 01:26:03.410', '20110520 10:51:38.240', 1, N'F', N'MistyRose', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MY25', N'Guadalupe Thornton', N'Martinique - Louisiana', '20091121 22:19:58.220', '20100705 17:12:04.920', 1, N'M', N'Coral', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MZIP', N'Teddy Sparks', N'Mauritania - Pennsylvania', '20091102 10:32:25.170', '20100515 03:42:27.890', 1, N'F', N'Wheat', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MZP9', N'Johnathan Durham', N'Ukraine - Iowa', '20100109 14:59:59.440', '20100818 08:06:05.730', 1, N'F', N'MediumPurple', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N06L', N'Dan Walls', N'Sudan - South Dakota', '20100606 16:27:07.360', '20100816 06:02:22.540', 2, N'M', N'PowderBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N0U9', N'Norman Medina', N'Fiji - Oregon', '20100804 11:50:14.850', '20100908 11:30:54.530', 2, N'F', N'Aquamarine', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N2OI', N'Tania Mc Millan', N'Iceland - New Hampshire', '20110227 22:58:44.580', '20110925 04:17:31.440', 1, N'F', N'LemonChiffon', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N43H', N'Gordon Thornton', N'Puerto Rico - Pennsylvania', '20090626 09:34:38.760', '20100210 07:19:39.100', 1, N'F', N'LightPink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N5JF', N'Francisco Fuentes', N'Colombia - Massachusetts', '20100227 19:50:21.670', '20101222 18:49:43.700', 2, N'F', N'LightSlateGrey', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N5X0', N'Monte Reese', N'Estonia - Delaware', '20101128 03:31:43.870', '20110509 21:55:26.160', 1, N'F', N'MediumPurple', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N6FG', N'Shaun Hess', N'Tanzania - Rhode Island', '20110124 09:06:32.090', '20110414 12:57:42.590', 2, N'F', N'GhostWhite', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NA5V', N'Monte Nicholson', N'Kazakhstan - Missouri', '20100909 09:31:14.970', '20110314 23:52:04.280', 2, N'M', N'CornflowerBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NBRF', N'Kenneth Stevenson', N'Saint Helena - Florida', '20101017 04:53:09.360', '20110328 19:38:25.490', 1, N'F', N'Moccasin', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NC74', N'Lloyd Hood', N'Mali - Maine', '20090817 12:43:43.110', '20100505 04:29:42.960', 2, N'F', N'Fuchsia', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NCBO', N'Caroline Steele', N'Peru - South Dakota', '20091113 20:07:36.300', '20100705 06:19:28.340', 1, N'M', N'Moccasin', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NCZY', N'Jeffery Nielsen', N'Cyprus - West Virginia', '20100509 16:03:08.290', '20101103 08:04:48.500', 2, N'M', N'LightYellow', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NDFH', N'Roberto Ali', N'Slovakia - Mississippi', '20110219 02:50:24.730', '20111012 06:16:02.790', 2, N'M', N'Ivory', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NDL', N'Benjamin Pugh', N'Gabon - Kentucky', '20091002 22:01:16.730', '20100719 01:53:27.980', 2, N'F', N'Violet', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NEMH', N'Gabriel Cox', N'Germany - Hawaii', '20110202 01:02:06.170', '20110527 20:45:31.470', 2, N'F', N'LightYellow', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NF5T', N'Nicolas Moody', N'Congo - New Jersey', '20101207 03:02:09.310', '20101216 08:22:40.080', 1, N'F', N'Grey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NHD0', N'Kristine Kemp', N'Ecuador - South Carolina', '20100308 04:13:03.290', '20101115 05:51:11.900', 1, N'M', N'DarkBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NIK0', N'Sidney Dennis', N'Peru - South Dakota', '20100323 04:09:04.760', '20100630 03:19:27.780', 1, N'F', N'DarkSalmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NJHO', N'Howard Moss', N'Eire - Idaho', '20100602 09:14:55.600', '20110108 21:57:05.790', 2, N'F', N'Indigo', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NKSL', N'Irma Duncan', N'Swaziland - Florida', '20100918 13:35:33.870', '20101228 21:54:31.130', 2, N'M', N'Chartreuse', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NKUG', N'Shari Guerra', N'Ecuador - New York', '20110210 18:00:11.870', '20110917 00:14:45.220', 2, N'F', N'MintCream', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NLBL', N'Edwin Waller', N'Zambia - Ohio', '20090417 11:40:11.060', '20090428 02:28:00.350', 1, N'F', N'DarkGoldenRod', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NLIW', N'Darrick O''Connor', N'Austria - Utah', '20100330 18:17:27.130', '20101213 11:09:59.900', 1, N'M', N'DodgerBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NLQN', N'Sherman Tran', N'Tajikistan - New York', '20091220 22:31:04.580', '20100512 01:02:22.920', 2, N'M', N'Indigo', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NNP9', N'Brandon Lopez', N'Nepal - Florida', '20100517 16:33:02.690', '20100526 16:53:44.820', 2, N'F', N'OrangeRed', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NNXG', N'Darrick Stephenson', N'Slovakia - Arizona', '20100618 09:54:42.720', '20101208 12:57:37.720', 2, N'M', N'Indigo', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NNZ6', N'Ray Ortiz', N'Mauritius - Indiana', '20100822 06:06:33.480', '20100902 14:18:25.390', 1, N'M', N'LightSalmon', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NQ06', N'Cassandra Shea', N'Kazakhstan - Maine', '20091117 08:36:07.730', '20100804 13:30:37.820', 1, N'F', N'DimGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NQ5S', N'Jeannette Crawford', N'Togo - Connecticut', '20100328 18:34:08.290', '20100724 11:50:49.660', 1, N'F', N'IndianRed', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NR4M', N'Franklin Dunlap', N'Malaysia - Rhode Island', '20091017 21:26:57.880', '20100212 22:37:28', 2, N'M', N'Silver', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NRD', N'Herman Waller', N'Lebanon - Alabama', '20090401 22:25:50.140', '20090514 08:07:23.820', 1, N'F', N'GhostWhite', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NSYH', N'Joanna Underwood', N'Slovakia - Hawaii', '20091118 20:03:23.510', '20100328 16:40:43.750', 2, N'M', N'Snow', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NTQS', N'Jessica Mcclain', N'San Marino - New Jersey', '20090830 20:43:39.260', '20090918 11:25:15.430', 2, N'M', N'DodgerBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NY21', N'Rose Gibbs', N'South Africa - Missouri', '20090710 00:49:43.380', '20100214 06:36:31.560', 1, N'M', N'DarkViolet', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'O44Q', N'Sheryl Ho', N'Zambia - Vermont', '20101010 03:35:54.370', '20110705 02:34:08.880', 1, N'F', N'CornflowerBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'O4JD', N'Tara Monroe', N'South Africa - Nevada', '20110118 08:32:05.400', '20110322 02:07:01.210', 2, N'M', N'DeepPink', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'O5JB', N'Cedric Barnes', N'Malawi - Michigan', '20110417 20:03:21.550', '20110629 14:05:14.930', 2, N'M', N'DarkRed', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OB7Q', N'Marilyn Juarez', N'Paraguay - Vermont', '20100310 04:58:23.070', '20100422 00:19:43.540', 2, N'M', N'YellowGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OBB9', N'Shawna Mc Clure', N'Colombia - North Carolina', '20090511 17:24:43.620', '20090705 14:51:09.840', 1, N'F', N'YellowGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OCP', N'Amy Sexton', N'Oman - Nebraska', '20110211 04:09:06.710', '20110223 07:15:41.770', 1, N'F', N'LightYellow', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OCRG', N'Kimberley Griffith', N'Guernsey - Connecticut', '20100126 20:28:13', '20100523 05:56:43.860', 1, N'F', N'Violet', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OD3Q', N'Whitney Bowen', N'Singapore - Kentucky', '20101209 10:54:35.340', '20101227 00:15:55.520', 1, N'M', N'Coral', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ODXE', N'Krista Haney', N'Kenya - Connecticut', '20101004 18:59:38.470', '20110718 00:15:37.520', 1, N'F', N'LightSalmon', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OE7B', N'Gloria Stephenson', N'Kyrgyzstan - Virginia', '20101127 12:24:52.010', '20110218 03:15:29.010', 2, N'F', N'SlateGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OE8M', N'Damian Wood', N'Gibraltar - Pennsylvania', '20100709 05:19:29.040', '20101207 02:08:47.390', 1, N'F', N'IndianRed', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OET2', N'Rose Rivera', N'Cape Verde - Oregon', '20100211 05:53:07.020', '20100713 11:51:54.940', 2, N'M', N'HoneyDew', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OIR1', N'Cesar Morales', N'Nepal - New Mexico', '20091207 05:53:39.190', '20100712 21:57:56.200', 1, N'M', N'Chocolate', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OIU8', N'Harvey Bell', N'Seychelles - Colorado', '20100402 20:09:39.730', '20110120 18:00:46.240', 1, N'M', N'LightSteelBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OJFY', N'Myra Pham', N'Lesotho - Washington', '20090828 03:12:12.570', '20100105 08:52:10.860', 2, N'M', N'BlueViolet', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OJIX', N'Colleen Ingram', N'Uruguay - Pennsylvania', '20100813 03:47:59.800', '20110109 21:32:34.530', 1, N'F', N'PaleVioletRed', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OM3D', N'Jerry Nicholson', N'Guyana - North Dakota', '20110215 06:07:19.250', '20111128 17:06:25.710', 1, N'F', N'PaleGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OMEK', N'Randolph Flowers', N'Qatar - Iowa', '20100630 02:41:34.470', '20101124 20:45:00.870', 1, N'F', N'Peru', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ONLR', N'Darren Liu', N'Romania - Kentucky', '20110306 20:41:34.620', '20111025 00:51:01.090', 2, N'F', N'MediumSeaGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ONVO', N'Bernard Atkinson', N'Yemen - New Hampshire', '20110413 10:02:06.270', '20110419 00:57:23.330', 1, N'F', N'LightSlateGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OONV', N'Shanna Hall', N'Guatemala - South Dakota', '20100927 11:08:12.790', '20110429 13:22:15.670', 2, N'M', N'Gold', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OQ1K', N'Andy Carroll', N'Kyrgyzstan - Ohio', '20090426 13:35:17.280', '20090918 03:19:12.250', 2, N'F', N'Salmon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OQ9O', N'Dina Flynn', N'Algeria - Missouri', '20091210 08:25:16.890', '20100523 23:12:05.070', 2, N'M', N'LimeGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OQRO', N'Roy Byrd', N'Estonia - Delaware', '20100127 00:06:24.360', '20100828 16:24:25.090', 1, N'F', N'Yellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OS09', N'Lillian Lucas', N'Tajikistan - Delaware', '20100826 22:43:00.810', '20110518 07:17:36.660', 1, N'F', N'DarkRed', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OSLC', N'Emma Steele', N'Czech Republic - Arizona', '20110303 06:43:51.880', '20110729 10:01:24.150', 1, N'M', N'Maroon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OSMK', N'Heather Petersen', N'Gabon - Florida', '20101212 03:47:42.010', '20110531 12:39:49.040', 1, N'F', N'SlateBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OXEZ', N'Dean Carr', N'Uzbekistan - Arizona', '20100525 08:46:08.480', '20101214 19:27:20.120', 2, N'M', N'Beige', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OZEB', N'Nancy Ayers', N'Colombia - New Hampshire', '20090530 23:02:29.790', '20091227 16:11:30.190', 1, N'M', N'LightGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OZGG', N'Bridget Edwards', N'Bhutan - Texas', '20110105 13:46:29.700', '20111015 21:26:29.370', 1, N'F', N'Yellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P1G0', N'Bethany Bailey', N'Bhutan - Texas', '20100923 16:15:57.940', '20110108 20:42:06.520', 1, N'M', N'DarkTurquoise', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P1PL', N'Dwight King', N'Mozambique - Mississippi', '20090626 09:22:41.270', '20100219 09:50:52.090', 1, N'F', N'LightSeaGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P33X', N'Quincy Green', N'Iran - Rhode Island', '20100930 03:33:16.480', '20110530 10:45:01.090', 2, N'F', N'Thistle', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P4MB', N'Joel Rogers', N'Fiji - Pennsylvania', '20090728 03:24:51.450', '20090731 11:21:33.730', 2, N'M', N'LightPink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P4P1', N'Iris Haley', N'Ghana - Mississippi', '20100722 06:51:37.820', '20101123 10:28:35.170', 1, N'F', N'FireBrick', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P4VT', N'Erica Ayala', N'Belgium - California', '20091127 13:52:47.670', '20100918 05:41:35.530', 2, N'F', N'OliveDrab', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P5S2', N'Ramiro Bailey', N'Turkey - Rhode Island', '20090614 03:54:39.920', '20091215 12:23:01.270', 1, N'M', N'White', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PACT', N'Kristian Leon', N'Lesotho - Washington', '20090418 16:02:03.170', '20090818 15:12:39.150', 2, N'F', N'LightYellow', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PAJF', N'Casey Benson', N'Qatar - Texas', '20100620 19:47:49.290', '20110104 17:25:20.920', 2, N'M', N'MediumOrchid', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PCOK', N'Dennis Bond', N'Haiti - California', '20090506 16:11:40.010', '20090710 17:07:00.430', 1, N'M', N'SandyBrown', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PCP4', N'Katie Camacho', N'Guinea-Bissau - Tennessee', '20110429 06:06:52.870', '20120214 20:54:58.500', 2, N'M', N'Cyan', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PD95', N'Sheldon Terry', N'Libya - Alaska', '20090430 04:33:22.600', '20100114 05:16:26.190', 2, N'M', N'Magenta', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PF0L', N'Mike O''Neal', N'Liberia - Oklahoma', '20100419 05:06:12.930', '20101225 10:41:41.210', 1, N'M', N'OldLace', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PKI', N'Randall Barnes', N'Virgin Islands - Pennsylvania', '20100521 03:30:12.130', '20100720 12:48:04.600', 2, N'M', N'SlateBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PLEC', N'Willie Fields', N'Uruguay - Pennsylvania', '20100501 13:49:52.210', '20100511 13:46:01.620', 2, N'F', N'Gainsboro', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PLO5', N'Cari Sanders', N'Timor-Leste - North Dakota', '20090707 12:25:22.300', '20090828 12:20:09.550', 1, N'F', N'Orchid', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PM9C', N'Vincent Mercado', N'Nauru - California', '20101210 02:59:47.880', '20110625 03:42:19.390', 2, N'F', N'SlateGrey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PNIU', N'Fred Olson', N'Burkina Faso - Oregon', '20100622 19:15:17.340', '20110203 10:04:48.190', 2, N'F', N'SeaShell', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PT1T', N'Brandy Henry', N'Niue - Montana', '20100328 12:22:19.080', '20100521 09:34:11.210', 2, N'M', N'Gray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PVO4', N'Shawn Carr', N'Cameroon - Missouri', '20100224 17:06:08.420', '20101007 22:45:10.700', 1, N'F', N'MediumBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PXVS', N'Manuel Bell', N'Tonga - North Carolina', '20110301 03:08:15.530', '20110828 22:44:46.590', 1, N'M', N'Aquamarine', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PY6Z', N'Jolene Grimes', N'Seychelles - South Dakota', '20090416 02:36:56.520', '20091020 20:31:54.410', 1, N'M', N'White', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PZ0A', N'Erica Cherry', N'Belgium - Vermont', '20101030 18:20:45.630', '20110703 03:32:03.710', 2, N'M', N'DarkGoldenRod', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q249', N'Israel Henry', N'Mali - Minnesota', '20100518 07:33:13.100', '20101027 03:44:48.100', 2, N'M', N'BurlyWood', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q2KY', N'Nakia Moreno', N'Colombia - Montana', '20101216 16:09:05.420', '20110210 22:22:17.010', 2, N'M', N'Olive', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q2ZS', N'Colby Dominguez', N'Saint Helena - New Hampshire', '20090726 04:59:19.630', '20100312 15:58:39.720', 1, N'M', N'DarkBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q425', N'Damian Skinner', N'Algeria - South Carolina', '20091216 19:49:09.690', '20100207 06:31:10.230', 1, N'M', N'Silver', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q5GM', N'Melvin Avila', N'Luxembourg - Missouri', '20101109 09:15:59.440', '20110328 03:54:38.920', 1, N'M', N'SeaShell', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q61T', N'Damian Kaiser', N'Botswana - Connecticut', '20110211 19:43:54.040', '20110829 14:25:05.560', 1, N'F', N'PapayaWhip', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q7D3', N'Carey Cohen', N'United Kingdom - Alaska', '20101125 20:36:10.230', '20110530 04:06:16.340', 1, N'F', N'Yellow', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q7M9', N'Julio Raymond', N'Virgin Islands - Colorado', '20100529 18:04:57.410', '20100531 03:53:43.920', 1, N'M', N'DarkKhaki', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q8H0', N'Kelli Jacobs', N'Guadeloupe - Texas', '20110109 10:53:51.750', '20110918 14:58:15.280', 2, N'M', N'CornflowerBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q8U9', N'Rhonda Beasley', N'China - Tennessee', '20101221 04:56:08.360', '20110118 04:57:30.430', 1, N'M', N'PapayaWhip', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QA9S', N'Jay Robertson', N'Israel - Colorado', '20091122 18:24:24.460', '20100215 11:19:10.500', 1, N'F', N'SandyBrown', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QB4H', N'Kerrie Bradley', N'Italy - Montana', '20100803 23:58:55.990', '20101217 16:30:58.480', 1, N'F', N'OrangeRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QB6Q', N'Stacy Todd', N'Bulgaria - Oregon', '20110409 17:08:52.820', '20111104 10:08:31.530', 1, N'F', N'PaleGoldenRod', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QBC0', N'Jarrod Gardner', N'Cuba - Nevada', '20110414 14:52:33.670', '20110630 04:33:57.680', 2, N'M', N'PapayaWhip', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QBX2', N'Natalie Moore', N'France - South Dakota', '20101221 04:42:15.670', '20110821 02:09:23.420', 2, N'M', N'DarkRed', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QD1M', N'Marisa Petersen', N'Kazakhstan - Missouri', '20091208 12:21:29.130', '20091227 09:35:44.290', 2, N'M', N'BlanchedAlmond', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QENQ', N'Paul Lloyd', N'Argentina - West Virginia', '20100501 23:11:02.900', '20100504 16:11:09.610', 2, N'M', N'DarkTurquoise', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QFVG', N'Ricardo Hanna', N'Dominica - Delaware', '20100108 18:40:43.530', '20100308 08:14:27.540', 1, N'M', N'Moccasin', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QHUY', N'Fred Lam', N'Indonesia - Delaware', '20090704 12:39:11.940', '20090805 19:19:45.900', 1, N'F', N'PaleVioletRed', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QJQN', N'Bennie Malone', N'Vietnam - Minnesota', '20100812 23:08:25.680', '20110502 09:36:47.350', 1, N'F', N'DarkViolet', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QLT8', N'Karl Marks', N'Afghanistan - Rhode Island', '20101103 01:38:53.740', '20110625 04:34:29.560', 2, N'M', N'Grey', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QMQA', N'Latoya Anderson', N'Eritrea - Wyoming', '20100831 11:26:16.290', '20110307 18:48:10.560', 2, N'M', N'IndianRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QN0N', N'Edward Weiss', N'Saint Lucia - Florida', '20110428 03:50:24.760', '20110905 17:03:18.090', 2, N'F', N'Gainsboro', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QQW4', N'Joyce Middleton', N'Nepal - New Mexico', '20091029 21:39:35.320', '20100416 08:30:13.270', 2, N'F', N'Brown', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QS4T', N'Kellie Potter', N'Belize - Wisconsin', '20090810 02:09:38.220', '20090901 06:49:58.350', 2, N'M', N'DarkOliveGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QSAZ', N'Jacob O''Neill', N'Slovenia - Wisconsin', '20090415 11:28:46.300', '20091121 17:26:17.940', 1, N'F', N'SlateGray', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QT5C', N'Joe Cohen', N'Portugal - Oklahoma', '20091006 20:24:24.380', '20100227 05:35:41.580', 2, N'M', N'DimGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QTWJ', N'Dwight Reynolds', N'Tuvalu - California', '20101101 01:27:36.760', '20110116 19:39:13.270', 2, N'F', N'PaleTurquoise', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QTYJ', N'Aisha Snow', N'Sierra Leone - Montana', '20090915 20:21:56.860', '20100619 03:56:47.790', 2, N'F', N'Pink', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QY45', N'Denise Coffey', N'Indonesia - Delaware', '20100126 03:27:46.440', '20100223 01:01:57.080', 2, N'M', N'Lavender', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QYF3', N'Walter Sosa', N'Anguilla - Maine', '20100727 06:14:50.540', '20100825 21:46:35.510', 2, N'F', N'Darkorange', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QZ2U', N'Felicia Watson', N'C?te d''Ivoire - South Carolina', '20101102 10:57:33.470', '20110804 21:39:18.700', 1, N'F', N'DarkGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QZQM', N'Patricia Brady', N'Greece - Ohio', '20101121 16:55:57.430', '20110212 12:39:04.480', 2, N'F', N'Gray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R0GE', N'Eileen Briggs', N'New Zealand - California', '20110127 20:20:14.750', '20110829 07:30:09.800', 2, N'F', N'OldLace', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R0K0', N'Edward Choi', N'Fiji - Mississippi', '20100103 17:48:46.990', '20100429 21:46:57.130', 1, N'F', N'LimeGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R1QK', N'Olivia Delgado', N'Timor-Leste - North Carolina', '20101223 05:56:43.660', '20110102 19:45:09.550', 1, N'F', N'DarkMagenta', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R2TE', N'Herman Pearson', N'Portugal - Utah', '20100904 22:43:49.070', '20101015 19:40:09.530', 2, N'F', N'SaddleBrown', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R32', N'Pamela Soto', N'Somalia - Ohio', '20090403 07:17:30.610', '20090917 20:42:44.990', 1, N'M', N'LemonChiffon', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R3SJ', N'Wendy Jennings', N'Pitcairn - Pennsylvania', '20091105 03:50:32.330', '20100514 15:45:29.690', 2, N'F', N'MintCream', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R5N8', N'Nicolas Mercer', N'North Korea - Alabama', '20101101 03:05:03.980', '20110523 20:20:01.110', 2, N'M', N'DarkOrchid', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R6Q3', N'Fred Callahan', N'Spain - Alabama', '20100424 23:22:38.290', '20101118 05:14:06.700', 2, N'F', N'Yellow', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R782', N'Daniel George', N'Mongolia - Vermont', '20101225 20:25:57.780', '20110616 16:59:17.870', 1, N'F', N'MediumOrchid', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RAL6', N'Carl Lucero', N'Malta - North Carolina', '20101126 10:07:07.250', '20110706 13:35:51.010', 2, N'M', N'Violet', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RCUL', N'Bryan Collins', N'Niger - Colorado', '20100922 09:28:47.240', '20110604 07:36:03.550', 2, N'F', N'DarkMagenta', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RDDD', N'Betty Rangel', N'Bhutan - Georgia', '20101031 14:08:23.610', '20110816 14:58:16.800', 1, N'F', N'Crimson', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'REPR', N'Earnest Callahan', N'Tajikistan - Minnesota', '20090407 09:59:09.430', '20090508 12:47:22.530', 1, N'F', N'DarkTurquoise', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'REU2', N'Jason Cardenas', N'Liechtenstein - Virginia', '20100512 17:08:01.850', '20100516 02:38:08.520', 1, N'M', N'LimeGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RH68', N'Joshua Suarez', N'Tuvalu - California', '20090621 05:33:00.670', '20091205 01:10:24.860', 1, N'F', N'DarkCyan', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RHJ1', N'Mary Solomon', N'Kenya - Hawaii', '20110221 19:00:05.590', '20110401 01:16:18.180', 1, N'M', N'LavenderBlush', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RR0O', N'Billie Short', N'French Guiana - New Hampshire', '20100906 10:30:35.960', '20101218 05:41:31.230', 1, N'M', N'SlateGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RRSD', N'Harry Hurst', N'Macedonia - Oregon', '20110104 07:31:55.170', '20110914 00:57:05.220', 2, N'M', N'LightGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RRT7', N'Yvonne Mills', N'France - California', '20100817 12:32:55.290', '20100830 22:30:40.730', 1, N'M', N'Aqua', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RSB8', N'Alana Gill', N'Malawi - Michigan', '20101107 04:04:53.150', '20110805 01:49:08.160', 1, N'F', N'BlueViolet', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RUCW', N'Ericka Brock', N'Western Sahara - North Dakota', '20110428 22:38:29.540', '20110729 11:56:49.050', 2, N'M', N'Gold', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RUP2', N'James Collier', N'Suriname - Indiana', '20101026 16:23:06.410', '20110627 13:09:13.780', 2, N'M', N'SlateGrey', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RVEF', N'Victoria Lester', N'Sudan - Pennsylvania', '20110324 07:27:31.300', '20110918 05:35:28.940', 1, N'M', N'LightSteelBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RYLG', N'Darnell Collins', N'Malta - Pennsylvania', '20090926 04:33:25.940', '20100213 17:32:04.560', 2, N'M', N'LightPink', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RZH6', N'Beverly Porter', N'Fiji - Mississippi', '20090806 05:52:10.880', '20090808 16:08:09.640', 2, N'M', N'SlateGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S3RG', N'Justin Hopkins', N'Sri Lanka - North Dakota', '20090424 04:34:17.720', '20091229 08:46:40.930', 2, N'F', N'DarkSlateGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S4PO', N'Staci Stanton', N'Bolivia - Hawaii', '20090831 16:11:33.640', '20100602 22:37:25.860', 2, N'F', N'AliceBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S517', N'Charles Winters', N'Netherlands - Michigan', '20110426 08:20:15.430', '20111208 22:57:57.280', 2, N'F', N'DarkRed', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S6CE', N'Harold Bolton', N'Tajikistan - Wyoming', '20100722 11:02:29.130', '20110505 16:13:25.140', 1, N'M', N'OrangeRed', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S736', N'Mickey Mcclain', N'Uruguay - Kansas', '20100321 09:08:40.240', '20100413 14:45:33.990', 2, N'F', N'LightSkyBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S76Y', N'Marcella Mc Intyre', N'Liechtenstein - Kansas', '20100304 04:57:42.430', '20100619 07:56:44.060', 1, N'F', N'PaleVioletRed', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SDRD', N'Guillermo Le', N'China - Tennessee', '20100722 02:08:02.970', '20101003 06:18:32.940', 2, N'F', N'DarkSlateGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SE19', N'Gabriel Schultz', N'Bahamas - New Hampshire', '20090722 04:15:57.970', '20100108 00:58:06.140', 2, N'F', N'Violet', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SECX', N'Kara Riley', N'Eritrea - Wyoming', '20100923 06:06:38.600', '20110709 11:49:09.800', 1, N'F', N'SeaGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SED7', N'Kara Ryan', N'Yemen - Wyoming', '20100516 00:27:54.420', '20110102 01:39:50.290', 1, N'F', N'Linen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SES2', N'Kenya Braun', N'Hong Kong - Nebraska', '20110429 16:16:45.470', '20110922 23:48:30.210', 2, N'F', N'Linen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SFQ6', N'Lonnie Huynh', N'Saint Helena - Virginia', '20110113 22:30:57.530', '20110304 12:09:52.140', 1, N'M', N'DarkSeaGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SKEO', N'Alexandra Hanson', N'Guinea-Bissau - Louisiana', '20090614 11:26:21.600', '20090615 14:19:54.180', 2, N'M', N'Gray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SKZW', N'Alonzo Harvey', N'American Samoa - New Mexico', '20110216 20:40:22.470', '20110528 11:25:50.350', 2, N'F', N'Crimson', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SO1Z', N'Kevin Barker', N'Sierra Leone - Oregon', '20091025 09:48:22.970', '20100611 11:35:12.600', 1, N'M', N'Gold', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SPFH', N'Patricia Adkins', N'Rwanda - Ohio', '20110201 00:08:18.950', '20110723 19:26:06.230', 1, N'M', N'Teal', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SREB', N'Janelle Chapman', N'Tanzania - New York', '20100214 14:32:10.020', '20100330 22:50:37.630', 2, N'M', N'DarkGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'STM2', N'Jocelyn Doyle', N'Burkina Faso - Virginia', '20110209 15:26:44.670', '20110514 21:18:43.790', 2, N'F', N'SpringGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SUHS', N'Amber Whitehead', N'Lebanon - Alabama', '20110103 22:21:12.190', '20110107 19:38:37.400', 1, N'F', N'Azure', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SUYB', N'Samantha Kline', N'Gibraltar - Arizona', '20100310 17:39:45.820', '20100709 06:26:27.190', 1, N'F', N'DarkKhaki', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SV1C', N'Lawrence Bowen', N'Ukraine - Arizona', '20100511 18:29:35.160', '20100710 18:11:00.060', 2, N'M', N'CornflowerBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SVIU', N'Robin Weiss', N'American Samoa - Utah', '20100828 09:47:14.410', '20101125 07:40:10.170', 2, N'M', N'Snow', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SW8I', N'Darius Schmitt', N'Romania - Maine', '20100512 10:53:00.240', '20100909 01:58:19.470', 1, N'F', N'Maroon', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SXA0', N'Brandy Parrish', N'Hungary - New Mexico', '20091128 09:56:29.270', '20100702 04:28:28.290', 1, N'M', N'Darkorange', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SYEP', N'Vernon Huynh', N'Sweden - Arizona', '20091118 21:39:13.110', '20091231 05:26:53.370', 2, N'M', N'NavajoWhite', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'T4XF', N'Summer Hines', N'Malaysia - Connecticut', '20100126 02:26:08.880', '20100130 12:51:37.140', 2, N'F', N'Navy', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'T86N', N'Rodolfo Spears', N'Israel - New Hampshire', '20100704 14:37:21.720', '20110111 23:30:20.170', 2, N'M', N'DodgerBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'T8MK', N'Rene Sparks', N'Myanmar - Minnesota', '20090409 17:04:15.360', '20091024 19:40:24.100', 1, N'M', N'Thistle', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TA6I', N'Jami Banks', N'Jordan - South Carolina', '20100609 11:23:59.690', '20110224 10:04:41.930', 1, N'F', N'Maroon', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TB8S', N'Ty Sexton', N'Bahamas - Idaho', '20110422 21:19:32.950', '20111029 10:37:02.520', 1, N'M', N'GreenYellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TBBP', N'Amanda Bradford', N'Finland - Mississippi', '20101108 16:44:38.800', '20110506 23:18:09.960', 1, N'F', N'DarkViolet', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TBFH', N'Shana Browning', N'Luxembourg - Montana', '20100614 18:47:22.310', '20110206 09:30:25.110', 1, N'F', N'Green', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TBWZ', N'Mario Charles', N'Afghanistan - Washington', '20100918 00:55:47.930', '20110519 01:53:33.030', 2, N'F', N'SaddleBrown', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TC3T', N'Daryl Macias', N'Russia - Pennsylvania', '20100419 03:48:39.310', '20100921 13:11:46.810', 2, N'M', N'DimGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TC52', N'Whitney Escobar', N'Denmark - Ohio', '20100712 10:28:15.070', '20101112 03:02:01.060', 1, N'F', N'LemonChiffon', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TD6Q', N'Tonia Pope', N'Kenya - Arizona', '20100308 14:38:02.780', '20100829 07:22:36.640', 2, N'M', N'DarkGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TEPC', N'Daniel Richards', N'Panama - New Hampshire', '20101214 23:32:28.290', '20110811 21:57:18.300', 2, N'M', N'CadetBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TH20', N'Angelia Stevenson', N'Sri Lanka - Georgia', '20090408 08:17:45.730', '20091201 04:34:08.350', 2, N'F', N'Peru', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TH7H', N'Neil Hendrix', N'Croatia - Kansas', '20100521 17:50:14.410', '20110308 02:24:38.150', 1, N'M', N'DeepSkyBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TI83', N'Josephine Tucker', N'North Korea - New Jersey', '20090726 08:50:46.760', '20091112 18:00:16.190', 2, N'M', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TIIY', N'Andres Lloyd', N'Macao - Oregon', '20110325 01:55:40.980', '20110720 17:23:25.670', 2, N'F', N'SeaShell', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TIKG', N'Sheila Cochran', N'Iraq - Illinois', '20091003 04:43:48', '20100404 16:14:16.820', 2, N'F', N'Yellow', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TJ4D', N'Charity Conley', N'New Zealand - North Carolina', '20090811 09:56:57.700', '20091221 16:19:56.560', 2, N'M', N'Plum', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TLYI', N'Amie Burton', N'Guyana - Wisconsin', '20100206 01:49:19.830', '20100307 06:24:26.600', 2, N'F', N'SeaGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TO84', N'Lamar Chandler', N'Malawi - Delaware', '20100324 08:44:08.150', '20100918 02:30:03.960', 2, N'M', N'LightSalmon', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TOAM', N'Brent O''Neill', N'Saint Helena - North Dakota', '20090524 10:53:12.100', '20090922 01:43:07.190', 2, N'F', N'BlanchedAlmond', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TOMF', N'Arturo Newton', N'C?te d''Ivoire - South Carolina', '20100815 02:10:42.720', '20110518 03:35:25.950', 1, N'F', N'DeepPink', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TPO2', N'Shannon Church', N'Guinea-Bissau - Kentucky', '20090625 17:37:41.480', '20090703 22:34:35.560', 2, N'M', N'DarkSlateGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TQ30', N'Diane Brock', N'Estonia - Delaware', '20110220 18:36:10.850', '20111001 13:51:20.750', 2, N'F', N'Sienna', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TREW', N'Dion Peters', N'Italy - Louisiana', '20110414 19:23:25.940', '20110527 23:26:13.580', 1, N'M', N'LightGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TSIU', N'Ricky Tanner', N'Botswana - Pennsylvania', '20090816 01:04:34.630', '20100124 16:06:38.350', 2, N'F', N'SkyBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TT', N'Ruby Mcgrath', N'Niger - Connecticut', '20100909 04:48:19.200', '20110524 06:46:13.700', 1, N'F', N'PeachPuff', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TUML', N'Jason Wilcox', N'New Caledonia - Utah', '20090906 23:50:47.120', '20091010 09:26:16.380', 1, N'M', N'WhiteSmoke', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TUND', N'Preston Navarro', N'Vatican City - New Jersey', '20090919 19:20:27.870', '20091028 20:04:07.950', 1, N'M', N'BurlyWood', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TWPS', N'Bryon Mccann', N'Italy - Montana', '20101222 03:04:14.740', '20110727 23:13:43.290', 2, N'M', N'Wheat', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TY2L', N'Kari Rodgers', N'Mali - Georgia', '20100119 03:47:07.930', '20100704 15:31:34.100', 2, N'M', N'Yellow', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TY6W', N'Christie Lester', N'Namibia - Connecticut', '20090430 09:40:16.640', '20091219 06:28:11.070', 2, N'F', N'LightGreen', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U0TA', N'Allen Huynh', N'Cyprus - Kentucky', '20110318 18:13:15.620', '20111120 23:10:41.910', 2, N'M', N'DimGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U1A2', N'Louis Arias', N'Uruguay - Kansas', '20090714 02:46:17.620', '20100115 08:28:48.420', 1, N'M', N'DarkGray', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U3KT', N'Ron Craig', N'Nigeria - Maryland', '20100202 02:14:02.760', '20100430 18:42:18.170', 1, N'F', N'Black', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U410', N'Terra Hatfield', N'Congo - New Mexico', '20100402 13:30:46.260', '20100611 09:42:59.550', 2, N'M', N'Teal', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U46M', N'Glenn Woodard', N'Hong Kong - Nebraska', '20110302 19:28:40.530', '20111202 15:33:12.940', 2, N'M', N'Navy', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U5OK', N'Lashonda Huerta', N'Iran - Montana', '20100703 02:01:19.540', '20110224 14:32:16.550', 2, N'F', N'Black', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U5WL', N'Renee Strickland', N'Burkina Faso - Montana', '20100515 13:40:34.910', '20101205 07:55:34.900', 2, N'M', N'SkyBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U6HR', N'Whitney Bradford', N'Nauru - California', '20100721 20:19:29.300', '20101217 00:00:58.010', 1, N'F', N'LightCyan', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U768', N'Randy Hinton', N'Isle of Man - Vermont', '20100705 20:51:43.320', '20101029 16:15:27.610', 1, N'M', N'MediumVioletRed', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U7HJ', N'Kellie Zavala', N'Libya - Virginia', '20100211 03:33:48.780', '20100626 17:07:15.600', 1, N'M', N'MediumSlateBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U8PW', N'Hope Ryan', N'Rwanda - Ohio', '20100415 21:31:10.200', '20101103 06:03:58.200', 2, N'F', N'DarkMagenta', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U9BO', N'Jarrod Mc Donald', N'Zimbabwe - Kansas', '20090408 08:08:09.940', '20090828 21:28:29.400', 2, N'F', N'Aquamarine', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UAL', N'Dan Benton', N'Timor-Leste - Colorado', '20100225 15:08:37.710', '20101029 07:57:55.260', 1, N'M', N'FireBrick', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UDA5', N'Carol Cameron', N'Vanuatu - Delaware', '20110210 07:59:29.030', '20110603 20:44:08.280', 2, N'F', N'Olive', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UDU4', N'Tanisha Horn', N'Colombia - New Hampshire', '20100126 21:57:42.420', '20100914 02:00:36.710', 1, N'M', N'LimeGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UEKK', N'Patrice Moore', N'Thailand - Arizona', '20100807 11:46:39.030', '20101227 18:52:04.900', 1, N'F', N'SlateGray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UHVY', N'Victor Velez', N'Guadeloupe - Texas', '20100412 06:59:28.440', '20100526 05:27:43.130', 2, N'F', N'Chocolate', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UHW', N'Yvette Schwartz', N'C?te d''Ivoire - Missouri', '20110210 04:39:10.370', '20111031 21:37:01.010', 2, N'M', N'ForestGreen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UI9Q', N'Jared Brewer', N'Colombia - Georgia', '20100709 17:40:47.380', '20101004 16:57:04.560', 2, N'M', N'Green', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UIH1', N'Peter Graham', N'Puerto Rico - Colorado', '20100607 07:23:01.420', '20101016 02:14:35.440', 1, N'F', N'DarkCyan', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UL6W', N'Bryce Conrad', N'Virgin Islands - Pennsylvania', '20100310 11:45:42.070', '20100815 09:36:10.610', 2, N'M', N'Salmon', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UMSS', N'Marjorie Bell', N'Norway - South Carolina', '20100119 06:04:27.520', '20100825 11:45:35.260', 1, N'F', N'Snow', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UNKU', N'Javier Chapman', N'Burundi - Nebraska', '20090905 08:51:25.520', '20100214 12:50:09.240', 2, N'F', N'DarkGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UPIC', N'Gordon Cisneros', N'Malawi - Michigan', '20091111 19:58:04.390', '20100525 23:07:15.500', 1, N'F', N'LightCyan', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UPND', N'Ross Dodson', N'Lesotho - Washington', '20090610 16:55:10.310', '20100325 20:22:12.450', 2, N'M', N'SpringGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UQYU', N'Dianna Baldwin', N'Algeria - New Hampshire', '20090603 09:40:13.260', '20091107 10:36:37.460', 2, N'F', N'RosyBrown', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UTLA', N'Saul Perkins', N'Romania - Colorado', '20100506 04:08:02.690', '20100930 23:46:39.240', 1, N'F', N'DarkViolet', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UU2L', N'Brock Watts', N'Paraguay - Washington', '20100113 10:36:19.680', '20100608 05:40:07.800', 2, N'M', N'SkyBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UUJR', N'Johnny Owens', N'Montenegro - California', '20100216 16:50:23.900', '20101118 01:21:12.730', 1, N'M', N'DarkGoldenRod', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UWG8', N'Jenifer Luna', N'Ecuador - Kentucky', '20101023 04:34:13.660', '20110226 03:11:26.800', 1, N'M', N'GreenYellow', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UWGC', N'Jocelyn Maxwell', N'Georgia - Massachusetts', '20100825 22:33:22.410', '20110514 16:27:58.100', 1, N'F', N'DarkSlateBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UWNT', N'Colin Clements', N'China - Alaska', '20110504 16:02:30.460', '20120130 21:18:39.460', 2, N'M', N'DimGray', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UYKZ', N'Levi Chaney', N'Puerto Rico - Idaho', '20101022 21:38:23.980', '20110212 22:31:59.120', 1, N'M', N'Plum', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'V06X', N'Jennifer Hall', N'Kenya - Arkansas', '20090409 21:14:26.340', '20090430 09:14:10.420', 1, N'F', N'LightSkyBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'V132', N'Chadwick Valencia', N'Tanzania - New York', '20091204 04:36:45.010', '20100719 12:55:48.950', 1, N'M', N'DarkSlateBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'V8S4', N'Benjamin O''Neal', N'Thailand - Delaware', '20090513 13:53:49.610', '20090919 13:30:52.240', 2, N'F', N'SpringGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VABI', N'Lakeisha Brewer', N'Thailand - Arizona', '20110131 11:08:33.360', '20110710 03:18:42.470', 1, N'M', N'SlateGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VAK6', N'Freddie Mills', N'Djibouti - Utah', '20100523 10:15:37.190', '20110314 04:02:50.540', 1, N'M', N'DarkSlateGrey', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VAQR', N'Alan Mercer', N'Seychelles - Mississippi', '20100908 20:11:11.730', '20101029 09:31:24.680', 2, N'F', N'Salmon', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VBBD', N'Micheal Blackburn', N'Saint Lucia - Washington', '20100809 02:02:34.930', '20101014 15:40:41.610', 2, N'F', N'Thistle', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VBPJ', N'Ann Wong', N'Tonga - Louisiana', '20090628 03:24:45.370', '20091225 00:13:22.510', 1, N'M', N'GoldenRod', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VC0H', N'Tricia Rios', N'Macao - Utah', '20091208 21:03:51.700', '20100418 07:14:37.620', 2, N'M', N'PaleGoldenRod', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VCKE', N'Christine Nolan', N'Japan - Massachusetts', '20090820 14:30:20.490', '20100528 12:28:12.370', 2, N'F', N'Lime', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VFZT', N'Ronald Boyle', N'Luxembourg - Missouri', '20091022 02:50:58.050', '20091028 07:04:37.180', 2, N'M', N'Teal', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VHSO', N'Mia Rowland', N'Israel - Tennessee', '20091127 12:29:47.570', '20100118 00:54:43.810', 1, N'M', N'DarkTurquoise', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VLD5', N'Saul Anthony', N'Haiti - North Dakota', '20110107 11:00:24.890', '20110331 07:46:59.140', 2, N'F', N'MediumPurple', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VMQQ', N'Terence Ramsey', N'Palau - West Virginia', '20101008 12:10:28.570', '20110618 18:33:06.130', 2, N'F', N'HotPink', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VN1I', N'Anita Olson', N'South Africa - Nevada', '20101210 08:41:17.380', '20110213 04:51:05.490', 2, N'F', N'PowderBlue', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VOC7', N'Jessica Sandoval', N'Moldova - Maine', '20100709 00:05:41.570', '20100901 02:22:28.710', 2, N'F', N'DimGrey', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VQTZ', N'Wallace French', N'Bangladesh - North Carolina', '20110201 00:17:12.930', '20110507 12:33:17.740', 2, N'F', N'Indigo', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VU9Q', N'Elaine Mueller', N'Moldova - Maine', '20101228 08:16:37.210', '20110701 20:24:30.400', 1, N'F', N'DarkSalmon', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VUAS', N'Drew Farmer', N'Anguilla - Maine', '20101201 16:31:19.650', '20110429 00:53:51.460', 1, N'M', N'FloralWhite', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VX8H', N'Chad Francis', N'New Caledonia - Massachusetts', '20090523 21:45:45.420', '20091004 08:10:45.900', 2, N'F', N'Silver', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VXAZ', N'Alvin Watts', N'American Samoa - Mississippi', '20100503 03:56:24.180', '20100527 12:30:35.790', 2, N'F', N'Beige', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VY2R', N'Marlon Wheeler', N'Bulgaria - Oregon', '20101113 03:36:14.130', '20110602 20:22:17.670', 2, N'F', N'DimGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VZLD', N'Leah Greer', N'Djibouti - Utah', '20100721 03:22:41.580', '20101014 19:21:29.950', 2, N'M', N'GhostWhite', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W1T9', N'Jayson Morse', N'Finland - Oregon', '20091222 18:39:01.770', '20100518 21:54:16.040', 2, N'M', N'Gold', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W262', N'Wayne Holmes', N'Myanmar - Minnesota', '20100325 19:53:35.170', '20100419 13:02:17.340', 2, N'F', N'Lime', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W7AB', N'Angelo Phillips', N'Indonesia - Montana', '20101207 06:43:12.460', '20110127 15:53:44.140', 2, N'M', N'CornflowerBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W9PL', N'Elena Blackwell', N'Bahamas - Nebraska', '20090425 17:41:38.740', '20090820 07:32:30.360', 2, N'F', N'PowderBlue', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WBJI', N'Milton Lester', N'Jordan - South Carolina', '20100831 11:37:45.120', '20110509 02:25:37.340', 2, N'F', N'DarkSalmon', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WCZ', N'Angelo Barker', N'Kazakhstan - Utah', '20100331 08:32:11.360', '20100913 18:47:15.570', 2, N'M', N'Magenta', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WDQ7', N'Ebony Lowery', N'Montenegro - South Dakota', '20101206 06:42:46.660', '20110513 23:59:39.980', 1, N'M', N'Thistle', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WDSK', N'Sonja Wiggins', N'Egypt - North Carolina', '20090501 21:50:32.200', '20090620 12:39:38.120', 1, N'F', N'MediumPurple', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WJ0H', N'Colleen Crosby', N'United Kingdom - Maryland', '20100305 06:11:46', '20101228 18:58:08.570', 2, N'F', N'Chartreuse', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WJQK', N'Juanita Edwards', N'R?union - New Hampshire', '20090714 15:37:25.750', '20100324 14:09:51.640', 2, N'F', N'DeepSkyBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WKEV', N'Lena Casey', N'Lesotho - Washington', '20110412 04:24:23.660', '20110516 03:10:59.240', 1, N'F', N'PaleTurquoise', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WLDH', N'Nicole Barron', N'Japan - Massachusetts', '20090512 04:36:50.030', '20090925 20:34:53.050', 2, N'F', N'PaleVioletRed', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WO5A', N'Monte Wagner', N'Italy - Texas', '20090517 00:08:16.650', '20090825 18:29:50.900', 2, N'M', N'WhiteSmoke', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WPE2', N'Keri Lawrence', N'Tonga - Hawaii', '20101020 02:42:27.800', '20110730 05:44:52.970', 1, N'F', N'DarkRed', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WQGB', N'Rolando Hampton', N'Iraq - California', '20100825 01:13:44.470', '20110616 20:15:55.230', 1, N'M', N'Darkorange', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WRPG', N'Yolanda Potts', N'Swaziland - Florida', '20090405 10:44:54.930', '20090406 22:16:44.340', 1, N'F', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WVA7', N'Damian Andrews', N'Pakistan - Pennsylvania', '20091026 10:48:11.690', '20100123 15:11:21.720', 1, N'F', N'CornflowerBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WVGR', N'Brad Cummings', N'Uzbekistan - California', '20091031 19:16:42.270', '20100622 02:10:38.940', 1, N'M', N'Gainsboro', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WXQO', N'Hilary Herring', N'South Africa - Illinois', '20090906 18:34:48.440', '20091007 23:25:51.870', 1, N'M', N'LightCoral', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WYR2', N'Ernesto Clements', N'Barbados - Washington', '20110107 21:01:44.730', '20110415 19:49:49.200', 2, N'F', N'AliceBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WYVQ', N'Miguel Weiss', N'Mauritania - Pennsylvania', '20110405 21:00:04.700', '20110820 16:43:44.740', 2, N'F', N'Salmon', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WZP5', N'Glenda Wagner', N'Australia - Iowa', '20101025 10:02:12.030', '20110107 04:25:13.930', 2, N'F', N'LightSteelBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X3BU', N'Wallace Herman', N'Romania - Maine', '20100513 08:24:44.700', '20101024 09:54:16.550', 2, N'M', N'Azure', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X3E0', N'Felix Underwood', N'Falklands - South Dakota', '20101116 22:57:15.190', '20110802 03:05:00.280', 2, N'F', N'Silver', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X3EY', N'Christina Franco', N'Cuba - Nevada', '20091124 18:08:33.310', '20100724 02:24:58.240', 1, N'M', N'Plum', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X5ZX', N'Andrea Ball', N'Suriname - Texas', '20101205 07:18:10.320', '20110617 11:30:47.750', 1, N'F', N'Purple', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X77K', N'Carla Meyer', N'Afghanistan - New Jersey', '20110301 16:30:49.690', '20111020 14:01:43.720', 2, N'M', N'Azure', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X8DU', N'Gregory Hicks', N'Malvinas - Maryland', '20090927 03:44:50.130', '20100404 11:25:44.540', 1, N'F', N'GhostWhite', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X9W', N'Tera Compton', N'Greenland - Ohio', '20100503 19:17:59.260', '20101010 20:19:26.630', 2, N'M', N'DarkSeaGreen', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XA15', N'Antoine Jefferson', N'Lithuania - Arizona', '20091105 11:43:06.980', '20100209 15:09:57.820', 1, N'F', N'LightGrey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XCXJ', N'Herbert Faulkner', N'Poland - Hawaii', '20090410 06:02:26.840', '20091221 19:57:09.140', 2, N'M', N'LightGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XEYQ', N'Karrie Barr', N'Yemen - Maine', '20091220 02:47:38.300', '20100706 02:41:41.570', 2, N'F', N'MediumOrchid', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XGLY', N'Christy Poole', N'Libya - Alaska', '20100225 00:42:55.730', '20101125 15:09:40.690', 1, N'M', N'LavenderBlush', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XIL2', N'Iris Roth', N'Saudi Arabia - Michigan', '20110217 01:16:42.990', '20111003 22:28:56.270', 2, N'M', N'LightGrey', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XLTD', N'Tina Velasquez', N'R?union - Wyoming', '20101017 12:06:56.570', '20110210 21:59:01.410', 1, N'M', N'DarkViolet', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XOB1', N'Donovan Parrish', N'Grenada - Minnesota', '20100424 05:36:29.400', '20100531 04:18:51.200', 2, N'F', N'PaleVioletRed', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XOZW', N'Grace Choi', N'Guernsey - New Mexico', '20100719 03:56:11.200', '20101020 10:41:49.370', 1, N'M', N'LawnGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XQUJ', N'Elisabeth Reeves', N'Liberia - New York', '20091016 08:19:28.240', '20091206 22:06:35.210', 1, N'F', N'Gray', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XU92', N'Olga Meyers', N'Colombia - Hawaii', '20110425 12:57:05.680', '20110708 21:10:54.620', 2, N'M', N'SeaShell', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XUFO', N'Melinda Little', N'Timor-Leste - North Dakota', '20110423 23:50:23.160', '20110619 22:05:39.710', 1, N'M', N'Orange', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XW0H', N'Andrea Maxwell', N'Afghanistan - Arizona', '20100528 06:22:47.740', '20101217 01:20:28.190', 2, N'M', N'Fuchsia', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XYD4', N'Stephan Todd', N'Malaysia - Rhode Island', '20110209 15:45:43.840', '20111122 12:09:26.100', 1, N'F', N'Cornsilk', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XZAK', N'Marsha Hayes', N'Vanuatu - Delaware', '20100908 06:24:40.710', '20110413 00:03:31.230', 2, N'M', N'PapayaWhip', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XZI2', N'Marshall Hubbard', N'Sierra Leone - Montana', '20090924 08:22:50.860', '20100128 02:37:53.270', 2, N'M', N'DarkOliveGreen', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y2NR', N'Shana Harmon', N'Algeria - Colorado', '20101102 15:24:57.070', '20110804 22:40:26.450', 1, N'F', N'Lime', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y36U', N'Jorge Bullock', N'New Caledonia - Utah', '20091127 19:14:47.760', '20091213 05:28:45.870', 2, N'M', N'LemonChiffon', NULL)
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y3DN', N'Terrence Wheeler', N'Algeria - New Hampshire', '20090523 11:44:14.450', '20091222 01:37:32.800', 1, N'M', N'Orange', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y5QL', N'Mia Clayton', N'Senegal - Florida', '20090925 03:21:16.410', '20090927 23:59:10.590', 2, N'M', N'DarkGray', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y64K', N'Olga Wright', N'Israel - Illinois', '20090820 01:42:32.220', '20100112 16:22:53.130', 2, N'F', N'Linen', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y7UB', N'Gordon Gibson', N'Falklands - South Dakota', '20110216 23:53:53.780', '20110625 09:37:54.500', 2, N'M', N'GhostWhite', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y7X7', N'Janice Gill', N'Mozambique - Louisiana', '20090525 17:36:49.320', '20100203 12:57:47.730', 2, N'F', N'Peru', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YCRI', N'Kristy Clarke', N'Swaziland - Florida', '20110317 09:15:50.640', '20110327 22:45:52.180', 1, N'F', N'Beige', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YDM2', N'Jacob Mooney', N'Nicaragua - Indiana', '20090913 19:34:01.830', '20091127 01:59:53.230', 1, N'F', N'LimeGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YEA', N'Raquel Nixon', N'Comoros - Illinois', '20100410 17:22:04.090', '20100909 03:05:10.360', 2, N'M', N'DarkSlateGray', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YHOI', N'Abel Donaldson', N'Pakistan - Kentucky', '20090408 21:45:20.310', '20090815 00:57:42.910', 2, N'F', N'DarkGrey', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YIXM', N'Allyson Merritt', N'Thailand - Missouri', '20100316 04:53:48.730', '20101020 10:01:53.630', 1, N'F', N'PowderBlue', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YKH5', N'Vickie Ball', N'Somalia - Ohio', '20110124 13:22:39.370', '20110224 12:33:26.680', 1, N'M', N'Cornsilk', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YKKF', N'Molly Osborn', N'Panama - Colorado', '20110505 17:27:56.550', '20120110 06:06:01.010', 2, N'M', N'LightYellow', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YLLN', N'Darnell Bryan', N'Finland - Washington', '20110101 03:43:19.930', '20110628 08:56:13.600', 1, N'F', N'CadetBlue', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YLNN', N'Janette Melton', N'Sierra Leone - New Mexico', '20100223 14:27:40.730', '20100706 09:50:33.040', 1, N'F', N'SpringGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YMTI', N'Joey Guerra', N'Mali - New Jersey', '20101202 22:12:04.410', '20110623 05:38:38.540', 2, N'F', N'White', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YRN6', N'Heidi Saunders', N'Honduras - Florida', '20101012 06:08:57.740', '20110731 07:36:41.930', 1, N'F', N'DarkSlateBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YSJP', N'Joy Boyd', N'Kazakhstan - Connecticut', '20090526 15:57:43.380', '20090617 21:51:13.600', 1, N'F', N'FloralWhite', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YTKS', N'Carolyn Blackwell', N'Belgium - Massachusetts', '20100201 00:00:59.100', '20101028 13:44:18', 1, N'M', N'MistyRose', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YUGA', N'Gavin Wilkinson', N'Iran - Rhode Island', '20100606 06:51:29.390', '20101027 01:17:51.540', 1, N'F', N'DarkGray', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YVD7', N'Irene Guerrero', N'Seychelles - North Dakota', '20090531 03:37:50.730', '20100321 00:27:30.850', 2, N'M', N'Maroon', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YVSA', N'Earl Peterson', N'Egypt - Oklahoma', '20091228 19:45:54.880', '20100907 22:55:14.210', 1, N'M', N'Grey', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YVSM', N'Patrick Lucas', N'Micronesia - Vermont', '20110220 20:24:56.380', '20110316 13:13:08.790', 1, N'F', N'White', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YWD1', N'Jenna Pineda', N'United Kingdom - Texas', '20100716 22:27:19.290', '20110422 07:12:38.650', 1, N'M', N'Navy', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YXPU', N'Mandy Baldwin', N'Cuba - Iowa', '20090410 04:05:05.260', '20100112 09:17:24.680', 2, N'M', N'DimGrey', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YXWB', N'Brandie Barton', N'Algeria - Minnesota', '20100527 22:28:25.300', '20101128 11:58:19.370', 2, N'M', N'Navy', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YXYE', N'Keri Scott', N'Bahamas - New Mexico', '20090509 04:11:58.490', '20100109 08:06:30.810', 2, N'F', N'PowderBlue', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YY7W', N'Everett Humphrey', N'Vanuatu - New Hampshire', '20110114 12:48:12.310', '20110524 21:35:53.430', 1, N'M', N'Thistle', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YYYV', N'Angelina Vega', N'Ecuador - Kentucky', '20101104 17:36:37.800', '20101210 01:06:47.660', 1, N'M', N'Peru', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YZLJ', N'Camille Kelly', N'Poland - Illinois', '20100516 04:41:51.940', '20110222 12:51:37.490', 1, N'M', N'ForestGreen', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YZOV', N'Ramona Luna', N'Martinique - Louisiana', '20090911 02:12:27.340', '20091113 10:10:26.430', 1, N'F', N'CornflowerBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z0CS', N'Alfred Wall', N'Iraq - South Carolina', '20101218 20:22:17.830', '20110511 22:32:04.820', 1, N'M', N'DeepPink', N'Marine')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z0IT', N'Yesenia Mullen', N'Ecuador - Louisiana', '20101114 08:21:49.300', '20110518 22:31:00.990', 1, N'F', N'Magenta', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z0ZN', N'Vicky Cuevas', N'Libya - Utah', '20110107 20:34:51.990', '20110915 06:44:05.600', 2, N'M', N'SpringGreen', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z1HU', N'Leanne Mccann', N'Singapore - New Hampshire', '20090418 14:46:27.340', '20100124 18:42:16.100', 2, N'M', N'Khaki', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z2TG', N'Ruby Cantu', N'Gabon - Arkansas', '20091229 03:15:32.850', '20100101 23:18:27.790', 2, N'F', N'MediumOrchid', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z381', N'Jerome Pollard', N'Zambia - Mississippi', '20090527 00:40:38.650', '20100215 15:53:01.480', 2, N'M', N'LightBlue', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z5Y4', N'Orlando Leon', N'Portugal - Missouri', '20091022 13:22:36.830', '20091216 16:40:37.300', 1, N'F', N'Teal', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z656', N'Clint Whitney', N'Greenland - Illinois', '20110417 03:22:51.700', '20110917 18:13:18.040', 1, N'M', N'GhostWhite', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z6NA', N'Tasha Miles', N'Mexico - Vermont', '20110330 16:36:02.260', '20110812 19:57:34.040', 2, N'F', N'LightGray', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z701', N'Natalie Sanchez', N'Uruguay - Oregon', '20110402 16:55:44.380', '20110409 20:56:27.480', 1, N'F', N'LemonChiffon', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z954', N'Ginger Randall', N'South Korea - Vermont', '20091102 17:57:52.030', '20091128 21:05:08.760', 2, N'M', N'MistyRose', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z9QY', N'Amanda Trevino', N'Zambia - Ohio', '20090823 03:12:56.480', '20100109 08:15:08.380', 2, N'F', N'Moccasin', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZCZL', N'Lance Mack', N'Armenia - Ohio', '20090426 15:29:34.910', '20090720 20:45:39.760', 2, N'M', N'Grey', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZESQ', N'Quincy Mora', N'Bulgaria - Wyoming', '20100420 03:32:03.070', '20110206 18:49:04.040', 1, N'M', N'Beige', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZF0L', N'Sabrina Nichols', N'Isle of Man - Kansas', '20110313 10:06:31.470', '20110824 14:16:53.580', 1, N'M', N'Ivory', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZF3K', N'Garry Morse', N'Puerto Rico - Idaho', '20100726 14:14:02.260', '20101002 17:17:31.960', 2, N'F', N'DarkViolet', N'Power')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZIZV', N'Efrain Murphy', N'North Korea - New Jersey', '20100518 13:08:39.110', '20100915 20:23:48.120', 1, N'F', N'SkyBlue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZKBR', N'Austin Calderon', N'Tajikistan - Hawaii', '20100811 08:19:52.180', '20101029 02:05:19.540', 2, N'F', N'DeepSkyBlue', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZKU', N'Nichole Pineda', N'Malta - Pennsylvania', '20101227 18:19:26.940', '20110311 09:23:17.710', 2, N'F', N'Aquamarine', N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZL1O', N'Kelvin Kemp', N'Burundi - Colorado', '20090418 01:17:14.520', '20091026 02:49:38.770', 1, N'M', N'BlanchedAlmond', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZMFO', N'Norman Flynn', N'Portugal - South Dakota', '20110329 12:42:18.960', '20111015 12:09:37.380', 1, N'F', N'Blue', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZNIZ', N'Leigh Wiley', N'Isle of Man - Minnesota', '20101028 03:29:56.370', '20110725 22:30:48.720', 1, N'F', N'Thistle', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZNUE', N'Dean Orozco', N'Sri Lanka - Iowa', '20090420 06:45:22.100', '20090511 12:48:53.150', 1, N'F', N'Purple', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZQNW', N'Tim Hammond', N'Finland - Maine', '20100215 07:58:11.220', '20101129 13:36:54.160', 1, N'F', N'SpringGreen', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZSV5', N'Jacob Calhoun', N'Cuba - Nebraska', '20100601 14:40:17.270', '20100908 20:42:44.110', 1, N'M', N'DarkMagenta', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZU6I', N'Hilary Navarro', N'Congo - New Mexico', '20110201 06:27:38.760', '20110504 22:45:25.440', 2, N'F', N'Salmon', N'Airports')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZU8B', N'Bruce Pena', N'San Marino - Delaware', '20101212 09:50:19.230', '20110116 12:51:53.390', 1, N'M', N'AntiqueWhite', N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZVU2', N'Holly Mac Donald', N'Cuba - Louisiana', '20100118 20:39:24.270', '20100812 18:35:28.390', 2, N'F', N'Lime', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZX3S', N'Warren Warner', N'Oman - Nebraska', '20090614 06:21:44.730', '20091007 05:19:52.490', 2, N'M', N'DarkGrey', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZXU', N'Celeste Stokes', N'Chile - Arkansas', '20091005 13:43:43.350', '20100626 22:25:57.220', 2, N'F', N'LawnGreen', N'Environment')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZY6O', N'Ronda Kramer', N'Cook Islands - Wyoming', '20090715 00:38:15.880', '20090830 02:31:41.190', 1, N'F', N'FireBrick', N'Water')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZYJ5', N'Ivan Padilla', N'Thailand - Arizona', '20090711 02:11:34.170', '20091129 11:49:50.200', 2, N'F', N'LightPink', N'Mining')
GO

INSERT INTO [dbo].[KhachHang_WebTower9] ([MaKH], [TenKH], [TenNuoc], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZYTB', N'Cristina Orr', N'Guernsey - Iowa', '20091014 18:55:17.100', '20100523 02:19:37.750', 1, N'M', N'LightYellow', N'Environment')
GO

--
-- Data for table dbo.sysdiagrams  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[sysdiagrams] ON
GO

INSERT INTO [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition])
VALUES 
  (N'Diagram_0', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF0A000000FEFFFFFF0400000005000000060000000700000008000000090000000B000000FEFFFFFF0C0000000D0000000E0000000F00000010000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF02000000000000000000000000000000000000000000000000000000000000002069F38C3912CC010300000000190000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000036030000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000D000000C009000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000340000005F000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C000000FEFFFFFF0E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F00000030000000310000003200000033000000FEFFFFFF35000000FEFFFFFF3700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F000000500000005100000052000000530000005400000055000000FEFFFFFFFEFFFFFF58000000590000005A0000005B0000005C0000005D0000005E0000005F000000600000006100000062000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000430000A1E100C05000080070000000F00FFFF07000000007D000040670000B3400000F8800000506000000000000032FEFFFFDE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C07000000440200000087010000004000A50900000700008001000000C002000000800000170000805363684772696400523500002C01000043686954696574486F61446F6E5F576562546F776572390000003800A50900000700008002000000B202000000800000100000805363684772696400EE0200002C010000486F61446F6E5F576562546F7765723900009400A50900000700008003000000620000000180000069000080436F6E74726F6C00ED01000044FDFFFF52656C6174696F6E736869702027464B5F43686954696574486F61446F6E5F4A6164655F486F61446F6E5F4A61646527206265747765656E2027486F61446F6E5F576562546F776572392720616E64202743686954696574486F61446F6E5F576562546F776572392700720000002800B50100000700008004000000310000007500000002800000436F6E74726F6C00EB10000069FCFFFF00003C00A50900000700008005000000B802000000800000130000805363684772696400000000008A1B00004B6861636848616E675F576562546F776572397700008C00A50900000700008006000000520000000180000061000080436F6E74726F6C008B0900001315000052656C6174696F6E736869702027464B5F486F61446F6E5F4A6164655F4B6861636848616E675F4A61646527206265747765656E20274B6861636848616E675F576562546F776572392720616E642027486F61446F6E5F576562546F776572392700000000002800B50100000700008007000000310000006D00000002800000436F6E74726F6C00D9F6FFFF0A19000000000000000000000000214334120800000096240000A2160000785634120700000014010000430068006900540069006500740048006F00610044006F006E005F0057006500620054006F00770065007200390000002E0030002E0030002C002000430075006C0074007500720065003D006E00650075007400720061006C002C0020005000750062006C00690063004B006500790054006F006B0065006E003D00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000096240000A2160000000000002D010000080000000C000000070000001C010000BC07000054060000D0020000840300007602000038040000460500002A03000046050000AE060000920400000000000001000000521900006612000000000000060000000600000002000000020000001C010000120C00000000000001000000C71100001008000000000000020000000200000002000000020000001C010000BC0700000100000000000000C7110000ED03000000000000000000000000000002000000020000001C010000BC0700000000000000000000072C0000DE20000000000000000000000D00000004000000040000001C010000BC07000024090000A005000078563412040000007800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000018000000430068006900540069006500740048006F00610044006F006E005F0057006500620054006F0077006500720039000000214334120800000096240000A216000078563412070000001401000048006F00610044006F006E005F0057006500620054006F007700650072003900000075006C0074007500720065003D006E00650075007400720061006C002C0020005000750062006C00690063004B006500790054006F006B0065006E003D0062003000330066003500660037006600310031006400350030006100330061000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000096240000A2160000000000002D010000080000000C000000070000001C010000BC07000054060000D0020000840300007602000038040000460500002A03000046050000AE060000920400000000000001000000151500006612000000000000060000000600000002000000020000001C010000AB0900000000000001000000C71100001008000000000000020000000200000002000000020000001C010000BC0700000100000000000000C7110000ED03000000000000000000000000000002000000020000001C010000BC0700000000000000000000072C0000DE20000000000000000000000D00000004000000040000001C010000BC07000024090000A005000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001100000048006F00610044006F006E005F0057006500620054006F007700650072003900000004000B00840300002C0100008403000070FEFFFFE835000070FEFFFFE83500002C0100000000000002000000F0F0F00001000000000000000000000000000000010000000400000000000000EB10000069FCFFFF8415000058010000310000000100000200008415000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61210046004B005F00430068006900540069006500740048006F00610044006F006E005F004A006100640065005F0048006F00610044006F006E005F004A00610064006500214334120800000096240000FA1A00007856341207000000140100004B006800610063006800480061006E0067005F0057006500620054006F007700650072003900000000000000000000000000000000002B0B084E2C0BA8A29B74389F9B7440A29B7428A29B740CA39B7440A39B742CA39B74000000000000000000000000000000000000000000000000000000003CADB97A1400008079000000010000005624F67EE102008050009B7400000000000000000000000000002B0B48502C0B5AADB97A389F008080009B7428A29B740CA39B7440A39B742CA39B740000000036A2B97A000000808E000000000000000000000000000000000100001400000000000000010000004524000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000096240000FA1A0000000000002D0100000A0000000C000000070000001C010000BC07000054060000D0020000840300007602000038040000460500002A03000046050000AE0600009204000000000000010000006D160000BD16000000000000080000000800000002000000020000001C0100006E0A00000000000001000000C7110000FF05000000000000010000000100000002000000020000001C010000BC0700000100000000000000C7110000ED03000000000000000000000000000002000000020000001C010000BC0700000000000000000000072C0000DE20000000000000000000000D00000004000000040000001C010000BC07000024090000A005000078563412040000007000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000140000004B006800610063006800480061006E0067005F0057006500620054006F007700650072003900000002000B00220B00008A1B0000220B0000CE1700000000000002000000F0F0F00001000000000000000000000000000000010000000700000000000000D9F6FFFF0A1900009A13000058010000300000000100000200009A13000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F0048006F00610044006F006E005F004A006100640065005F004B006800610063006800480061006E0067005F004A006100640065000100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B2710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000000000000032FEFFFF0100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E0000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000100000001000000000000000000000000000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000036000000F40700000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000560000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000057000000D40200000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000630000001200000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003600320030002C0035002C0031003000380030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0033003000390030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003900380030002C00310032002C0032003300340030002C00310031002C0031003400340030000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003600320030002C0035002C0031003000380030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003400370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003900380030002C00310032002C0032003300340030002C00310031002C0031003400340030000000030000000300000000000000540000000100797201000000640062006F00000046004B005F00430068006900540069006500740048006F00610044006F006E005F004A006100640065005F0048006F00610044006F006E005F004A0061006400650000000000000000000000C4020000000004000000040000000300000008000000010000009885560E0000000000000000AD070000000000050000000500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003600320030002C0035002C0031003000380030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003600370030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003900380030002C00310032002C0032003300340030002C00310031002C00310034003400300000000600000006000000000000004C00000001004D5501000000640062006F00000046004B005F0048006F00610044006F006E005F004A006100640065005F004B006800610063006800480061006E0067005F004A0061006400650000000000000000000000C402000000000700000007000000060000000800000001000000D887560E0000000000000000AD0700000000000A0000000300000002000000010000000000000000000000060000000500000002000000240000001B000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200A0BFEF8C3912CC01020200001048450000000000000000000000000000000000620100004400610074006100200053006F0075007200630065003D004C004F004E0047002D00500043003B0049006E0069007400690061006C00200043006100740061006C006F0067003D0057006500620074006F0077006500720039003B0049006E00740065006700720061007400650064002000530065006300750072006900740079003D0054007200750065003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F003000000000022600280000004B006800610063006800480061006E0067005F0057006500620054006F007700650072003900000008000000640062006F000000000226002200000048006F00610044006F006E005F0057006500620054006F007700650072003900000008000000640062006F0000000002240030000000430068006900540069006500740048006F00610044006F006E005F0057006500620054006F007700650072003900000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00390031003500310030003600300038002D0038003800300039002D0034003000320030002D0038003800390037002D004600420041003000350037004500320032004400350034007D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
GO

SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
GO

--
-- Definition for indices : 
--

ALTER TABLE [dbo].[KhachHang_WebTower9]
ADD CONSTRAINT [PK_KhachHang] 
PRIMARY KEY CLUSTERED ([MaKH])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[KhachHang_WebTower9]
ADD CONSTRAINT [PK_KhachHang] 
PRIMARY KEY CLUSTERED ([MaKH])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[KhachHang_WebTower9]
ADD CONSTRAINT [PK_KhachHang] 
PRIMARY KEY CLUSTERED ([MaKH])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[sysdiagrams]
ADD PRIMARY KEY CLUSTERED ([diagram_id])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [UK_principal_name] 
UNIQUE NONCLUSTERED ([principal_id], [name])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

