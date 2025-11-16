-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : Jade
-- Version   : Microsoft SQL Server  9.00.1399.06


--
-- Dropping table ChiTietHoaDon_Jade : 
--
create database Jade
go
use Jade
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[ChiTietHoaDon_Jade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[ChiTietHoaDon_Jade]
GO

--
-- Dropping table HoaDon_Jade : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[HoaDon_Jade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[HoaDon_Jade]
GO

--
-- Dropping table KhachHang_Jade : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[KhachHang_Jade]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[KhachHang_Jade]
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
-- Definition for table KhachHang_Jade : 
--

CREATE TABLE [dbo].[KhachHang_Jade] (
  [MaKH] varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [TenKH] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [DiaChi] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
-- Definition for table HoaDon_Jade : 
--

CREATE TABLE [dbo].[HoaDon_Jade] (
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
-- Definition for table ChiTietHoaDon_Jade : 
--

CREATE TABLE [dbo].[ChiTietHoaDon_Jade] (
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
-- Data for table dbo.ChiTietHoaDon_Jade  (LIMIT 0,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1, N'QH5', N'RUVT', '20071118 09:41:05.660', '20080720 04:29:08.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (2, N'U17F', N'ES3N', '20090202 20:26:03.340', '20091127 03:37:59.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (3, N'SBHI', N'5QE5', '20090805 03:50:58.010', '20100121 08:28:01.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (4, N'KN09', N'ZGEP', '20070806 08:19:00.330', '20071207 22:14:02.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (5, N'73KG', N'3WMY', '20080905 17:41:13.240', '20080909 07:54:55.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (6, N'02GY', N'B0EN', '20070717 17:35:43.730', '20070803 01:49:23.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (7, N'WQCP', N'SWPM', '20071001 23:10:52.800', '20080428 10:36:33.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (8, N'G1DV', N'G79S', '20091103 05:13:58.190', '20100317 21:25:28.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (9, N'Z79I', N'839Q', '20080117 19:49:55.820', '20080607 13:13:53.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (10, N'9PN', N'0DMD', '20080221 01:17:22.870', '20081002 15:59:37.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (11, N'AEWT', N'RLGL', '20080703 19:07:55.150', '20080913 10:41:48.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (12, N'H23K', N'0R2K', '20090605 08:33:25.860', '20091129 09:47:57.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (13, N'NCA', N'0B1T', '20090131 00:55:18.890', '20090525 18:39:28.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (14, N'H25', N'IVS', '20070203 03:41:51.330', '20070718 07:32:06.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (15, N'ZJE0', N'DXY7', '20070331 20:43:00.570', '20071121 11:23:45.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (16, N'0VZO', N'A0QM', '20090916 19:16:19.130', '20100222 08:06:59.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (17, N'VGL8', N'PKIK', '20070516 04:11:48.230', '20071026 07:36:12.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (18, N'ZWAZ', N'8K2B', '20090725 14:28:05.670', '20091215 04:56:53.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (19, N'OLKY', N'QMGC', '20090410 10:32:59.500', '20091202 01:52:53.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (20, N'BGS0', N'32N7', '20080605 10:42:18.900', '20090219 11:16:01.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (21, N'TYW6', N'2TBW', '20070824 23:51:11.060', '20071207 12:15:42.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (22, N'V3OC', N'C6E6', '20081001 13:08:45.940', '20090607 08:48:57.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (23, N'ZSC4', N'BR7C', '20080630 07:32:39.070', '20090116 16:35:03.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (24, N'0XJZ', N'QMGC', '20070330 07:49:09.620', '20070806 07:52:56.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (25, N'PLQX', N'W78D', '20091224 09:14:44.830', '20100120 23:23:34.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (26, N'JHCL', N'TBR2', '20080514 03:17:44.930', '20080612 20:12:45.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (27, N'XK5R', N'NYLM', '20080716 01:52:48.360', '20081105 00:02:44.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (28, N'P2LN', N'XF1Z', '20080821 08:33:09.240', '20081010 04:07:41.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (29, N'K5SI', N'3IAR', '20080216 02:56:31.980', '20080829 14:56:52.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (30, N'2ZZV', N'P87Y', '20080628 10:07:10.610', '20080927 04:28:03.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (31, N'6S4A', N'XEB4', '20071119 15:36:25.050', '20080605 19:13:23.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (32, N'GH97', N'ZBKF', '20070924 16:25:56.220', '20080223 18:30:17.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (33, N'ANG1', N'3JRV', '20080705 09:07:48.520', '20090403 01:56:17.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (34, N'ZPOJ', N'19R5', '20070311 19:29:54.500', '20070407 11:02:52.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (35, N'NR60', N'CC6X', '20090125 19:19:56.170', '20090206 15:05:55.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (36, N'RY0H', N'UVE8', '20090904 19:27:08.390', '20100612 16:55:31.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (37, N'0CS', N'P44D', '20080718 09:49:16.740', '20081029 13:07:13.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (38, N'DZLE', N'R0JW', '20080410 22:09:54.890', '20080513 00:33:50.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (39, N'CONZ', N'P3OJ', '20090727 07:16:05.450', '20090804 17:56:40.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (40, N'Y8UU', N'38C7', '20081224 15:30:59.290', '20090303 05:55:21.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (41, N'IPR1', N'1CU7', '20090603 23:56:38.620', '20091123 18:31:04.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (42, N'Q569', N'9OFQ', '20080824 15:23:20.330', '20090429 19:43:04.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (43, N'4EVD', N'9FNG', '20090703 18:15:17.430', '20091103 00:34:32.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (44, N'080J', N'IES1', '20081102 04:09:17.290', '20090608 00:07:44.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (45, N'WU0C', N'YP3N', '20080619 05:49:06.970', '20080624 01:19:12.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (46, N'T9GV', N'KL6E', '20080423 04:05:32.570', '20080727 08:50:06.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (47, N'CHIE', N'0GR9', '20080127 19:37:25.390', '20080824 05:33:10.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (48, N'GREK', N'I5GG', '20080706 02:32:45.930', '20081209 01:37:38.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (49, N'5BYR', N'CC8N', '20080426 16:44:02.740', '20081004 23:27:12.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (50, N'7DBD', N'I1PR', '20081107 12:23:04.450', '20090620 12:19:43.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (51, N'F6G0', N'NGDT', '20090410 16:18:25.400', '20091229 02:48:02.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (52, N'Q9NT', N'MMZU', '20070319 13:21:53.890', '20070823 00:22:17.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (53, N'MLQ9', N'2NXK', '20090526 02:42:12.270', '20091031 04:05:54.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (54, N'HPW3', N'W78D', '20070419 13:37:48.580', '20070719 10:20:07.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (55, N'6WPC', N'LT05', '20090521 04:25:54.310', '20100315 22:25:23.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (56, N'VSR4', N'FM3E', '20090215 20:32:19.720', '20091208 19:40:11.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (57, N'UBBN', N'2OAT', '20070806 12:53:24.270', '20071111 11:02:57', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (58, N'QSGS', N'FR1M', '20090508 20:01:48.390', '20090618 00:35:06.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (59, N'VEIR', N'32N7', '20070812 23:04:15.500', '20071116 22:50:29.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (60, N'OMDR', N'AFDW', '20070425 14:23:28.310', '20080124 11:42:10.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (61, N'MWYT', N'NYLM', '20081231 15:42:55.370', '20090724 01:46:39.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (62, N'7AMU', N'VJM2', '20090209 14:37:43.560', '20090719 06:28:53.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (63, N'WDDB', N'CGMY', '20080918 02:17:26.200', '20090515 06:28:37.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (64, N'WDIK', N'JZ0Z', '20090721 09:42:45.210', '20090910 08:45:51.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (65, N'36FB', N'2XSC', '20070404 09:40:57.810', '20070429 20:46:14.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (66, N'UMTW', N'SDSY', '20071011 02:41:58.930', '20080517 16:11:32.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (67, N'614W', N'XG2M', '20071201 23:25:37.330', '20080624 07:51:41.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (68, N'NRH7', N'YUY', '20081122 05:25:24.390', '20090218 07:36:37.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (69, N'UDDS', N'5XT7', '20080108 08:21:55.160', '20080609 16:26:12.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (70, N'7B2E', N'JYP3', '20070727 01:15:52.180', '20080405 18:28:14.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (71, N'ZZTW', N'LPKF', '20080301 09:27:02.390', '20080425 18:59:46.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (72, N'HGES', N'YLQI', '20090203 06:01:53.340', '20090614 07:02:22.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (73, N'NX1T', N'KF4H', '20091229 07:12:00.220', '20100512 11:00:13.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (74, N'QB81', N'NCDH', '20070417 19:02:00.200', '20071001 19:57:33.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (75, N'TP7E', N'1PHE', '20090101 10:45:40.280', '20090328 16:44:57.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (76, N'3KIP', N'T9CQ', '20081230 08:27:50.730', '20090604 16:32:39.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (77, N'QKNU', N'2OUE', '20090330 18:53:28.510', '20090804 08:14:26.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (78, N'1Q6R', N'U19C', '20090828 03:23:21.780', '20100606 16:27:20.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (79, N'4NNF', N'RSH7', '20081010 02:00:02.660', '20090211 06:33:44.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (80, N'WO9Y', N'C7O', '20080902 05:09:12.250', '20090422 14:33:29.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (81, N'6TCI', N'SN65', '20070418 07:40:19.530', '20070816 14:39:36.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (82, N'HAE', N'5QE5', '20070110 23:20:02.430', '20070923 22:25:06.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (83, N'K1B0', N'LF82', '20070427 15:49:06.490', '20071102 04:40:29.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (84, N'C01Y', N'MEAF', '20090409 14:33:27.530', '20100105 02:37:09.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (85, N'OECD', N'1PI4', '20090319 17:48:45.220', '20090726 01:40:02.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (86, N'H245', N'AYHB', '20070903 02:14:31.160', '20071015 18:51:06.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (87, N'UJ0A', N'WSFW', '20080430 13:43:43.950', '20090218 14:24:23.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (88, N'2KMJ', N'76SX', '20080318 19:29:59.940', '20080915 15:36:10.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (89, N'T8W4', N'G38T', '20071021 15:04:00.190', '20071118 12:37:30.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (90, N'S29J', N'WVFV', '20091209 22:47:36.460', '20091225 19:25:44.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (91, N'XPNY', N'RXEO', '20090130 06:33:44.120', '20090802 05:52:35.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (92, N'AGVC', N'8W7S', '20090311 13:47:28.360', '20090513 12:32:08.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (93, N'JCXT', N'NZQY', '20070830 23:05:39.380', '20080423 01:43:22.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (94, N'O8ZB', N'E9Y5', '20090403 16:52:37.140', '20090508 06:14:31.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (95, N'CB2G', N'FZ6X', '20091223 23:48:03.930', '20100606 04:08:42.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (96, N'A9WP', N'5QE5', '20070425 09:18:55.060', '20070508 12:02:11.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (97, N'U3XU', N'XEB4', '20091206 13:05:54.140', '20091215 13:14:28.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (98, N'7GC0', N'QMBS', '20091213 08:32:32.220', '20100222 15:48:42.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (99, N'6R7L', N'F4M5', '20080731 18:28:19.480', '20090209 03:21:30.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (100, N'2GD', N'6DVJ', '20070910 03:07:08.030', '20071204 09:07:41.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (101, N'24Q0', N'MTKM', '20070524 04:39:55.230', '20071130 00:58:25.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (102, N'PD8B', N'1PHE', '20090306 14:12:01.010', '20090705 21:56:34', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (103, N'NA2S', N'BF45', '20070629 18:10:50.760', '20070702 09:11:27.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (104, N'XCTM', N'T8P5', '20071002 15:28:10.550', '20080427 04:58:58.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (105, N'1KHT', N'VYUT', '20070909 02:56:02.060', '20080225 17:19:58.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (106, N'XD26', N'P2GH', '20070308 10:16:32.050', '20070717 19:45:40.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (107, N'2FN', N'2J5T', '20070321 06:09:53.680', '20070412 13:22:05.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (108, N'WJ4B', N'FSC1', '20090208 07:40:12.060', '20091126 08:08:22.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (109, N'OM2B', N'UR2X', '20080417 02:52:08.310', '20080421 17:35:10.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (110, N'3ELK', N'SCDW', '20070522 19:58:03.570', '20071012 05:52:44.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (111, N'5DO6', N'CU5U', '20091118 01:38:51.210', '20100506 11:25:46.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (112, N'3T5Q', N'8P8O', '20071209 09:30:02.500', '20080401 18:35:37.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (113, N'MF8Y', N'O9IB', '20070730 18:01:45.730', '20080302 18:01:22.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (114, N'Y2HF', N'R441', '20081209 17:55:03.260', '20090522 08:17:00.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (115, N'HTZC', N'IEUA', '20070108 06:43:08.770', '20070610 21:02:35.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (116, N'5CHJ', N'I5GG', '20081221 16:22:52.940', '20090827 03:21:34', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (117, N'0ISE', N'A7QG', '20081015 22:48:37.060', '20090714 01:48:24.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (118, N'L72L', N'QMR9', '20090610 11:43:58.680', '20100306 03:51:28.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (119, N'7LJU', N'I17C', '20070504 15:53:59.990', '20071213 07:05:49.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (120, N'ML03', N'S5YU', '20090801 07:26:26.660', '20100511 01:55:09.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (121, N'04T2', N'VL5Z', '20090611 12:58:14.990', '20100123 01:47:09.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (122, N'D8RF', N'Q9A', '20090914 03:55:37.400', '20091008 16:15:32.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (123, N'V4KJ', N'JO6K', '20080202 14:21:24.190', '20080402 18:59:07.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (124, N'27I6', N'9D9U', '20080129 09:34:18.710', '20080614 21:00:28.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (125, N'A1W3', N'RBH0', '20080625 18:42:08.070', '20080903 12:35:40.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (126, N'PR0E', N'C7O', '20081220 19:39:34.040', '20091009 06:27:38.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (127, N'YBOD', N'ASMM', '20080606 06:56:13.960', '20081218 05:19:01.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (128, N'0Y2H', N'5I9W', '20070927 14:19:23.080', '20080105 04:45:42.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (129, N'E4EU', N'6Z8W', '20070424 19:13:56.280', '20070427 15:48:51.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (130, N'3EDY', N'VRT2', '20080909 01:26:45.220', '20081121 04:42:47.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (131, N'A0V1', N'VS3Z', '20090123 19:21:56.600', '20090620 03:18:11.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (132, N'IPVC', N'CGF6', '20090417 10:20:56.290', '20090611 16:25:45.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (133, N'JO1O', N'F61J', '20080128 08:55:02.290', '20080427 13:05:51.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (134, N'20OC', N'LSEB', '20080131 22:52:54.620', '20080310 21:26:03.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (135, N'4SWD', N'PWA', '20080412 00:29:17.020', '20080524 13:35:04.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (136, N'I94P', N'R20', '20080211 17:28:18.530', '20081206 16:43:03.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (137, N'V1TZ', N'UM8S', '20090714 05:09:11.670', '20100324 13:13:40.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (138, N'MHJI', N'RX41', '20090726 00:20:55.940', '20100502 23:41:32.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (139, N'3Q99', N'Q8UP', '20080801 11:37:25.470', '20081110 09:17:11.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (140, N'R59A', N'DCTI', '20090112 07:32:13.160', '20091105 05:54:22.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (141, N'ERB2', N'8JW7', '20070615 20:04:37.480', '20070706 05:29:02.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (142, N'XJCV', N'HEM7', '20090322 06:03:31.890', '20090325 06:16:01.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (143, N'4SWD', N'D35', '20091201 16:37:51.640', '20100526 22:01:00.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (144, N'0NF5', N'O4LC', '20070601 19:05:56.620', '20071204 06:44:46.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (145, N'MJ1U', N'KI4X', '20070122 21:08:45.240', '20070618 07:59:59.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (146, N'UF74', N'JWH3', '20080222 21:03:41.610', '20080502 11:16:58.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (147, N'OWEC', N'LIMP', '20080812 19:45:42.620', '20090106 18:30:46.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (148, N'4AQR', N'WS72', '20080920 05:10:36.130', '20081201 17:26:22.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (149, N'67BI', N'VTLY', '20090327 10:09:28.360', '20090924 09:11:56.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (150, N'6Q84', N'YCDM', '20080103 07:25:10.990', '20080806 00:47:09.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (151, N'431J', N'VIKA', '20080709 10:30:18', '20080820 10:13:48.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (152, N'8P26', N'6WB4', '20070629 01:21:55.460', '20070808 09:23:00.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (153, N'ZXER', N'8SBJ', '20090811 16:38:32.230', '20100107 08:42:53.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (154, N'L6W5', N'N1HZ', '20081230 11:01:52.830', '20090728 01:26:22.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (155, N'2A86', N'AIPO', '20080330 14:08:53.050', '20080906 07:20:33.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (156, N'9BS3', N'WV0D', '20070909 00:44:17.840', '20080221 08:42:54.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (157, N'URMC', N'JNM8', '20080202 23:50:36.810', '20080404 02:57:27.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (158, N'5K9O', N'1ZA4', '20090531 08:36:32.060', '20091112 12:10:59.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (159, N'NS05', N'1VDT', '20090407 20:46:02.480', '20090823 16:23:18.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (160, N'IX69', N'KI8Y', '20080918 07:16:28.020', '20090314 10:52:20.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (161, N'YX7D', N'DVK8', '20081001 03:20:18.100', '20090525 14:26:39.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (162, N'2MAG', N'WZNF', '20090623 15:50:30.600', '20100201 08:36:23.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (163, N'IW0K', N'8KPG', '20081017 12:26:15.780', '20090801 16:19:32.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (164, N'5KHA', N'YRR2', '20090808 01:25:23.090', '20100327 12:52:24.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (165, N'TW3N', N'WD3A', '20080428 00:36:06.970', '20090217 02:34:34.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (166, N'0YU1', N'0DMD', '20070803 15:17:54.920', '20071125 19:00:02.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (167, N'LC99', N'TXK5', '20091111 00:35:00.210', '20091205 05:29:47.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (168, N'KDEY', N'2KGH', '20090628 19:08:51.110', '20091222 20:35:20.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (169, N'OEK7', N'199X', '20070830 17:25:46.240', '20071229 18:41:57.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (170, N'ZV97', N'RA7M', '20081126 13:14:50.250', '20090430 04:19:33.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (171, N'AXS8', N'NGDT', '20090609 11:13:41.270', '20100331 14:07:54.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (172, N'2D6L', N'J53Y', '20090322 22:27:41.120', '20100107 02:06:53.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (173, N'GZ4M', N'0ED1', '20071110 00:06:33.200', '20080425 18:34:17.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (174, N'HL6I', N'474A', '20080421 08:21:46.830', '20081203 01:11:28.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (175, N'7ADX', N'KAQ4', '20090216 11:21:49.170', '20091105 20:26:07.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (176, N'2JY8', N'EY5J', '20070323 06:54:43.090', '20071031 19:31:08.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (177, N'7WID', N'D5JS', '20091013 11:17:45.770', '20100310 18:14:32.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (178, N'5FJ7', N'V9BL', '20070903 19:15:27.560', '20080225 12:14:22.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (179, N'G95F', N'PRQ4', '20080107 12:25:33.470', '20081024 13:00:30.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (180, N'GD1J', N'86RW', '20070504 21:38:26.460', '20070505 01:18:43.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (181, N'0JBB', N'R9OY', '20070510 23:53:51.410', '20071003 11:56:53.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (182, N'E5GP', N'EKYR', '20090916 01:45:37.830', '20100116 11:52:40.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (183, N'0JMR', N'9QXE', '20080702 04:09:54.720', '20090205 19:33:47.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (184, N'71V0', N'8SBJ', '20090421 11:48:45.300', '20090717 15:01:42.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (185, N'X0E6', N'0BNF', '20070303 14:56:27.220', '20070403 18:28:59.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (186, N'0THI', N'PAYT', '20080728 18:00:01.140', '20081112 17:55:12.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (187, N'ISSS', N'3IAR', '20090905 17:42:24.070', '20100331 07:42:52.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (188, N'YL1M', N'S6YW', '20090127 21:53:09.470', '20090727 11:39:29.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (189, N'ZT1X', N'AD2K', '20091102 08:44:01.580', '20100430 14:05:31.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (190, N'0DMU', N'SZO3', '20070804 23:44:59.170', '20080129 04:52:10.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (191, N'NX6R', N'80GS', '20070109 17:37:41.710', '20070904 13:45:36.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (192, N'9ZUU', N'SI0H', '20070213 20:32:39.610', '20070513 01:02:41.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (193, N'YQC7', N'QA5G', '20070420 03:34:53.450', '20070910 07:18:14.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (194, N'LQHG', N'5RT5', '20091113 04:20:57.450', '20100624 22:24:51.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (195, N'SGQX', N'ZIKQ', '20070414 04:11:55.060', '20070613 15:27:43.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (196, N'BZYM', N'BMDB', '20071223 04:14:06.880', '20080329 20:52:40.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (197, N'FK7H', N'8JW7', '20070605 17:37:16.100', '20070620 13:56:30.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (198, N'Z4AK', N'EDEU', '20070426 15:12:28.540', '20071227 09:08:36.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (199, N'W2DK', N'REMV', '20090202 18:29:49.650', '20090812 04:10:13.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (200, N'Z2Z2', N'K35S', '20090621 05:50:50.330', '20090723 12:59:57.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (201, N'8UGF', N'PKIK', '20080412 20:28:41.410', '20080528 05:47:12.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (202, N'4VSN', N'J53Y', '20090214 00:36:51.520', '20091110 21:55:27.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (203, N'WEAF', N'V9T6', '20080122 11:44:49.890', '20080929 22:44:25.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (204, N'6FWM', N'4Q2E', '20070501 20:54:38.110', '20070528 04:52:24.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (205, N'VWM7', N'B1YX', '20080725 20:11:29.720', '20090303 10:39:15.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (206, N'K3DJ', N'D2FT', '20090418 12:02:36.880', '20090609 08:06:55.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (207, N'SYQW', N'6GXZ', '20090819 01:15:22.260', '20100207 14:48:44.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (208, N'IWR', N'4KZP', '20080422 08:16:45.390', '20081201 07:31:26.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (209, N'D1D0', N'31ZJ', '20091112 23:40:03.660', '20100718 05:00:15.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (210, N'0KEQ', N'VUKK', '20080109 07:14:09.950', '20080902 11:49:25.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (211, N'0Y2H', N'KAQ4', '20071126 13:26:32.070', '20071213 14:28:23.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (212, N'PCIK', N'O2EQ', '20070602 04:35:09.250', '20071205 14:43:05.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (213, N'4KAK', N'CKLU', '20080524 20:10:58.580', '20081114 23:10:30.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (214, N'1WZK', N'TWBS', '20081204 23:07:36.020', '20090421 15:04:36.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (215, N'4Z9O', N'SWG0', '20080511 07:22:36.610', '20080611 22:55:28.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (216, N'LH62', N'ZBKF', '20090115 01:34:40.280', '20090509 02:34:00.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (217, N'951I', N'N7TU', '20071223 11:40:35.880', '20071227 13:02:37.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (218, N'BE5F', N'ZO1S', '20090628 00:37:30.490', '20100115 01:17:50.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (219, N'86TK', N'YGCO', '20090607 10:28:55.870', '20091224 18:23:25.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (220, N'SXLX', N'76SX', '20090930 06:36:05.840', '20100406 08:39:22.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (221, N'4W54', N'X1WJ', '20071127 21:35:30.850', '20080622 11:17:11.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (222, N'MHHP', N'1LV8', '20071015 02:41:50.730', '20080306 17:50:18.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (223, N'KOAO', N'S03X', '20090826 10:24:49.530', '20100620 06:29:50.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (224, N'NZID', N'8JW7', '20070126 17:40:47.060', '20070927 13:49:48.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (225, N'CNO5', N'JWH3', '20081117 19:37:08.540', '20090622 14:33:57.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (226, N'0L8P', N'V4P7', '20090426 14:41:01.660', '20091119 13:05:14.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (227, N'3IRA', N'SLYN', '20081203 18:52:47.660', '20090429 18:48:40.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (228, N'VRZ4', N'UM8S', '20071227 19:45:35.760', '20080827 20:09:26.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (229, N'Q0FH', N'4P4I', '20080109 04:09:51.770', '20080622 09:43:45.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (230, N'WAJ0', N'7VOT', '20080226 07:07:42.290', '20080808 23:33:28.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (231, N'NUW3', N'61JI', '20091017 13:17:26.990', '20100513 05:34:39.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (232, N'6ZZC', N'YTGE', '20090619 20:05:17.220', '20100109 09:05:56.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (233, N'9D73', N'3SXW', '20080731 00:45:37.910', '20090511 08:04:09.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (234, N'H3BB', N'5XT7', '20080718 06:34:43.150', '20090403 00:00:33.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (235, N'6YB0', N'JK5', '20090121 01:09:45.050', '20091002 19:31:31.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (236, N'W2Y3', N'8KPG', '20080325 23:16:59.890', '20080917 14:01:26.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (237, N'HV2U', N'JW1L', '20080825 14:00:47.940', '20090212 13:08:16.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (238, N'NJ5P', N'4W30', '20080303 07:15:16.600', '20080911 14:41:23.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (239, N'BRO2', N'XR4R', '20070927 15:37:15.580', '20080312 04:22:28.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (240, N'DK2H', N'NQA9', '20071115 02:53:50.340', '20080820 10:22:05.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (241, N'8A1N', N'IWTZ', '20081209 16:44:38.880', '20090801 03:06:29.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (242, N'0HWY', N'YY6V', '20080516 09:25:38.670', '20090224 00:11:26.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (243, N'MG4P', N'PBPN', '20090316 22:13:05.820', '20091105 06:39:15.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (244, N'00BJ', N'ES3N', '20081025 01:29:51.620', '20090624 02:16:06.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (245, N'ZJTT', N'95Q1', '20090908 10:18:27.110', '20100215 14:23:47.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (246, N'YL1B', N'KZII', '20090809 13:02:32.470', '20090929 23:02:32.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (247, N'5LFG', N'FSC1', '20080921 00:21:41.030', '20090423 01:52:12.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (248, N'6WPC', N'W78D', '20080515 04:27:17.440', '20080520 16:13:38.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (249, N'3DWE', N'DCSP', '20080704 20:58:20.830', '20090112 23:29:24.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (250, N'6U4U', N'07C8', '20080329 02:37:14.790', '20081130 12:53:44.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (251, N'4MBY', N'P44D', '20091230 16:33:31', '20100403 07:50:04.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (252, N'3XSD', N'8P8O', '20071208 16:59:45.620', '20080331 12:38:41.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (253, N'QP9S', N'FZJ4', '20071119 04:43:32.680', '20080102 14:45:11.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (254, N'3NWE', N'KKGV', '20090505 11:53:43.820', '20090507 19:30:51.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (255, N'UQ0L', N'MT21', '20080725 08:15:19.470', '20081127 01:42:47.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (256, N'5WQ2', N'O2Z7', '20070630 17:46:50.670', '20080118 11:56:55.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (257, N'L974', N'QY16', '20090620 14:12:01.990', '20100319 15:25:38.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (258, N'86FP', N'N1HZ', '20071227 18:04:02.820', '20080104 08:54:37.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (259, N'ULFC', N'M4DI', '20080613 01:17:29.580', '20080930 14:18:27.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (260, N'VEOA', N'GHK9', '20090331 05:30:28.060', '20090413 21:34:02.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (261, N'GA78', N'KXXU', '20070516 17:09:49.210', '20071207 13:18:15.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (262, N'1CGC', N'C00K', '20080823 05:29:46.500', '20090408 18:39:18.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (263, N'TJ88', N'ZVWK', '20070415 04:06:53.620', '20070611 21:47:42.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (264, N'GX97', N'V9T6', '20080917 16:32:21.370', '20081209 05:26:48.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (265, N'CJDS', N'Q8SY', '20080323 17:56:42.960', '20080422 06:14:47.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (266, N'STOB', N'LAW0', '20080607 17:21:14.860', '20080929 05:22:27.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (267, N'FPG8', N'KGTW', '20081101 03:49:31.340', '20090522 06:38:56.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (268, N'NSP3', N'6KM7', '20091106 13:36:15.440', '20100609 23:09:57.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (269, N'2JR9', N'ASMM', '20091113 21:57:50.980', '20100515 19:33:06.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (270, N'MEP3', N'KVMA', '20070216 08:05:36.710', '20070722 08:54:02.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (271, N'3B61', N'GC7B', '20070523 11:33:52.340', '20080121 13:25:45.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (272, N'MURY', N'IEIF', '20091021 04:25:19.290', '20100209 22:21:14.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (273, N'ZRY6', N'1VDT', '20081001 09:00:14.900', '20081104 20:55:23.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (274, N'VQJ6', N'ASMM', '20080724 07:35:05.520', '20090302 08:01:21.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (275, N'K0PW', N'PAQS', '20071022 13:51:26.950', '20080702 05:32:54.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (276, N'50K8', N'Y0RQ', '20090713 12:09:52.190', '20100222 11:05:45.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (277, N'87BH', N'CN1Z', '20080730 04:28:44.920', '20090225 11:11:03.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (278, N'KMDO', N'DJ46', '20071102 08:54:57.910', '20071228 04:13:44.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (279, N'5Y8F', N'Z372', '20070520 07:22:19.960', '20070811 23:26:01.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (280, N'DYOF', N'YSZ', '20090410 06:34:36.070', '20090922 15:31:26.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (281, N'VJ6N', N'F91K', '20070806 14:19:20.630', '20080525 11:13:03.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (282, N'323R', N'WD3A', '20070722 14:25:30.220', '20071211 02:35:03.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (283, N'T0CB', N'HSYO', '20090623 22:47:14.930', '20090814 20:40:03.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (284, N'JA23', N'4FUZ', '20091012 01:32:36.980', '20100518 20:50:01.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (285, N'UEYL', N'JZ0Z', '20080226 14:34:11.290', '20080507 15:43:25.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (286, N'K1YH', N'XG2M', '20081109 20:17:41.370', '20090211 16:55:58.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (287, N'4RF8', N'JPBV', '20080801 15:21:44.530', '20090107 18:20:45.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (288, N'5TKK', N'KI4X', '20090327 12:51:54.100', '20100103 12:33:19.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (289, N'NENM', N'K35S', '20091223 22:19:23.680', '20100506 22:17:46.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (290, N'KDO4', N'V7O5', '20080724 07:22:54.380', '20080915 07:34:37.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (291, N'0JBB', N'IB2M', '20081005 09:04:57.910', '20090426 22:35:49.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (292, N'8OD1', N'WCVM', '20070830 19:56:45.110', '20080210 04:13:39.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (293, N'THOQ', N'K206', '20090920 05:57:47.020', '20091212 00:22:57.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (294, N'9BS3', N'I17P', '20080628 10:06:47.530', '20081128 06:48:26.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (295, N'X7O1', N'2V01', '20070702 09:44:01.130', '20070914 21:03:51.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (296, N'1D10', N'6FHL', '20070419 11:14:52.380', '20070425 08:27:11.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (297, N'6V64', N'YZPZ', '20080202 05:18:45.040', '20080915 02:23:45.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (298, N'6ELD', N'TWBS', '20070630 05:40:44.450', '20071128 01:12:28.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (299, N'O70R', N'P311', '20070804 07:33:08.660', '20080303 20:01:20.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (300, N'73AT', N'P0NF', '20080402 16:57:12.240', '20080519 09:01:21.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (301, N'JTC8', N'0GND', '20071009 09:13:01.120', '20080306 16:23:36.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (302, N'6R7L', N'8W7S', '20081114 10:45:25.590', '20090909 02:42:15.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (303, N'SHVC', N'LOUM', '20080701 06:29:26.470', '20081031 20:40:33.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (304, N'HJXI', N'SWG0', '20080519 12:52:44.120', '20080624 14:35:22.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (305, N'8SXC', N'KL6E', '20071107 15:03:22.450', '20071110 23:28:00.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (306, N'G09J', N'6SD1', '20070312 12:08:11.710', '20071219 09:28:50.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (307, N'4F5J', N'6TT2', '20090308 07:59:30.730', '20090526 15:43:19.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (308, N'92NL', N'4UXA', '20090426 21:08:27.170', '20090828 06:43:51.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (309, N'KSM8', N'V79', '20080714 22:02:16.870', '20080901 13:57:57.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (310, N'PORE', N'P3OJ', '20090111 20:05:27.290', '20090731 14:37:03.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (311, N'NOG7', N'B0EN', '20081130 13:18:05.760', '20090918 00:45:52.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (312, N'0CS', N'DE1H', '20080819 05:17:04.080', '20090323 11:11:54.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (313, N'5CBO', N'O2Z7', '20070810 10:41:42.860', '20080321 09:28:37.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (314, N'1DGD', N'N5U0', '20090304 18:42:53.510', '20091103 22:47:02.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (315, N'6SB', N'0XDW', '20080825 15:11:07.420', '20080915 10:21:00.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (316, N'4LI3', N'OF2U', '20091025 02:44:18.990', '20091227 10:43:13.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (317, N'4JLR', N'UYVQ', '20090301 06:42:31.570', '20090824 21:59:15.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (318, N'A275', N'VHQW', '20070704 02:34:16.650', '20071120 00:57:41.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (319, N'3O89', N'C00K', '20070724 01:58:10.070', '20070804 13:43:24.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (320, N'THNK', N'SL4Q', '20090513 21:39:01.600', '20100104 13:18:49.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (321, N'7Y67', N'1U41', '20091106 01:59:30.330', '20100718 11:01:42.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (322, N'5KHA', N'ZXWH', '20090806 14:57:37.240', '20100314 18:05:38.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (323, N'0ALP', N'NGDT', '20091113 15:16:51.770', '20100203 00:52:11.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (324, N'G94P', N'FZ6X', '20080422 14:34:56.590', '20080830 11:58:29.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (325, N'3DWE', N'2FK4', '20080512 23:00:38.810', '20090120 10:18:13.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (326, N'8T9O', N'KI52', '20090922 15:37:07.230', '20091211 09:12:06.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (327, N'U8OI', N'YLQI', '20070131 22:27:32.260', '20070301 21:58:18.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (328, N'JNUW', N'KZME', '20070405 22:53:27.370', '20071004 14:06:57.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (329, N'Y2FS', N'7VOT', '20080123 21:51:04.390', '20080618 10:57:30.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (330, N'6OVY', N'IXLP', '20070706 02:36:34.560', '20080309 21:05:44.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (331, N'XVWM', N'YVHP', '20080611 06:51:07.140', '20090405 08:42:01.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (332, N'V6OM', N'JO1H', '20080131 22:48:00.470', '20080331 09:58:36.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (333, N'2A86', N'P3Z6', '20070401 01:21:49.240', '20070822 08:12:25.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (334, N'H0LA', N'AD2K', '20090215 14:25:07.720', '20090324 14:24:41.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (335, N'UYQX', N'Y7HD', '20080702 21:21:34.940', '20080718 23:07:50.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (336, N'D5P8', N'5XT7', '20080921 03:33:55.050', '20090712 08:30:49.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (337, N'KCKP', N'B14G', '20090120 07:56:03.760', '20090208 05:54:31.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (338, N'B4Q0', N'OXND', '20080205 09:54:30.810', '20080221 06:04:42.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (339, N'FJ0F', N'L1VQ', '20081205 10:29:14.530', '20090708 21:22:02.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (340, N'E7TP', N'CFFP', '20071218 02:25:59.580', '20080316 06:14:35.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (341, N'FKWJ', N'QRRC', '20090903 12:18:10.650', '20090918 01:12:40.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (342, N'O7UF', N'EADQ', '20090406 18:13:17.370', '20090512 11:36:54.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (343, N'M8Q1', N'P69G', '20070913 14:49:37.220', '20080503 22:35:22.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (344, N'XHV', N'UYVQ', '20071213 02:13:56.390', '20080802 07:40:44.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (345, N'WZD9', N'KQY1', '20090823 18:04:48.620', '20091024 06:48:46.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (346, N'ARMI', N'4KZP', '20070217 03:47:53.820', '20071201 11:23:56.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (347, N'OQID', N'8MBW', '20070121 09:15:02.240', '20070917 18:45:03.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (348, N'CO1O', N'WH1E', '20070719 11:14:53.510', '20071205 01:35:55.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (349, N'CCUI', N'GHZ6', '20091102 18:55:40.110', '20100314 20:27:27.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (350, N'BRO2', N'F6SF', '20070907 06:59:42.140', '20070918 10:20:38.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (351, N'68UK', N'BI5D', '20080218 04:32:20.820', '20080626 10:27:56.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (352, N'WX7V', N'3IAR', '20070802 02:44:28.390', '20071028 01:26:04.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (353, N'A275', N'I95C', '20091207 03:42:34.380', '20100425 11:29:05', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (354, N'0DMU', N'VUMU', '20080322 09:54:07.070', '20081224 06:42:31.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (355, N'Y08Y', N'MTKM', '20080527 14:57:41.920', '20080827 21:59:39.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (356, N'9MCW', N'0GR9', '20080303 18:15:23.890', '20081018 22:17:58.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (357, N'79E9', N'MBR4', '20081231 19:28:33.820', '20090806 01:50:04.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (358, N'C6XT', N'5ABG', '20070311 15:54:29.870', '20071229 08:42:04.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (359, N'6SB', N'QNHO', '20070107 13:52:05.310', '20070401 04:17:09.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (360, N'7ADX', N'03P0', '20080214 23:26:15.220', '20080925 14:15:54.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (361, N'59LG', N'8CEI', '20070209 13:40:39.440', '20071020 11:30:33.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (362, N'LRY6', N'MPTO', '20081203 09:06:03.350', '20090619 01:36:22.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (363, N'WUH0', N'X52E', '20080403 23:17:22.780', '20090105 19:46:21.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (364, N'4KAK', N'CHW9', '20080110 19:25:42.300', '20080420 16:52:14.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (365, N'RUEW', N'Q6JL', '20070803 13:14:20.150', '20080222 05:55:03.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (366, N'T2XR', N'S6EE', '20071031 14:30:05.290', '20080619 14:47:16.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (367, N'B67', N'P1M', '20080521 03:55:14.830', '20080802 02:59:30.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (368, N'3O89', N'D5JS', '20080623 20:16:35.150', '20081227 19:03:56.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (369, N'50K8', N'P3Z6', '20070902 21:21:18.560', '20080417 23:39:12.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (370, N'82ZH', N'V79', '20091204 11:37:12.370', '20091231 01:50:12.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (371, N'L8HQ', N'D35', '20071005 18:48:15.230', '20071119 04:48:43.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (372, N'6O62', N'6DVJ', '20080125 20:48:00.760', '20080704 15:54:34.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (373, N'VHEI', N'ASMM', '20080728 16:05:02.130', '20090309 03:35:39.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (374, N'852S', N'ZO1S', '20090805 23:32:10.490', '20100316 07:28:49.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (375, N'DTR1', N'1Y7W', '20090909 09:20:50.960', '20100418 12:06:10.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (376, N'LXG7', N'O5AK', '20070802 07:46:12.960', '20080307 23:24:48.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (377, N'3ELK', N'B1YX', '20081124 00:08:00.010', '20090906 19:30:16.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (378, N'2VAO', N'SINJ', '20081202 13:02:55.380', '20090429 17:11:28.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (379, N'JS3', N'VP80', '20080829 20:30:07.980', '20081106 05:09:44.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (380, N'86FP', N'XZ4O', '20080326 19:12:44.980', '20081216 22:54:18.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (381, N'5PO3', N'BCJL', '20090902 06:22:04.990', '20100120 14:27:04.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (382, N'HG3O', N'1Y7W', '20090715 11:12:38.760', '20100121 20:22:23.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (383, N'5KE1', N'40GG', '20070603 03:57:47.260', '20070722 17:39:31.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (384, N'5JPH', N'SWG0', '20070519 14:51:22.240', '20071002 00:36:53.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (385, N'ZLYU', N'6T1V', '20090517 22:04:13.750', '20090913 10:37:48.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (386, N'11NX', N'VE3P', '20071111 04:06:38.740', '20080609 07:15:57.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (387, N'3FVA', N'0XID', '20080224 19:05:26.090', '20081001 22:29:32.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (388, N'0YU1', N'SMP5', '20090108 15:27:42.180', '20090624 01:29:54.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (389, N'J3CY', N'OF2U', '20070921 23:27:25.790', '20080523 16:25:02.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (390, N'LBOY', N'XHW8', '20070502 03:06:11.050', '20070728 00:49:53.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (391, N'B68F', N'KQ3G', '20090920 08:05:21.230', '20091206 06:40:45.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (392, N'7JDD', N'5CBY', '20081111 16:01:33.890', '20081207 21:12:27.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (393, N'49Q7', N'Y56U', '20080129 20:02:25.490', '20080918 01:47:33.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (394, N'8BES', N'KXXU', '20071022 11:02:59.300', '20080809 07:06:08.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (395, N'SISQ', N'40GG', '20071108 12:45:20.130', '20080323 18:44:02.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (396, N'UHUR', N'3XMP', '20071002 03:12:07.290', '20080126 23:36:18.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (397, N'RMWR', N'HIEO', '20080103 18:55:54.580', '20080302 15:50:34.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (398, N'861J', N'CB7S', '20090902 19:23:54.930', '20100113 05:43:09.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (399, N'693G', N'4VQ5', '20070512 12:59:36.230', '20070612 01:45:42.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (400, N'4MBY', N'S0Y4', '20081024 03:34:43.330', '20090302 16:01:30.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (401, N'6G5K', N'GAJ6', '20080927 23:52:38.990', '20090430 08:24:26.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (402, N'LFO5', N'VKG2', '20080729 12:58:27.090', '20080919 23:41:07.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (403, N'2M5W', N'7OE6', '20091115 13:53:34.950', '20100614 01:56:44.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (404, N'A2S7', N'LOUM', '20091129 07:18:27.750', '20100314 18:37:16.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (405, N'7R4K', N'1YKM', '20091202 12:11:26.910', '20100826 05:31:56.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (406, N'EP3N', N'554Z', '20070124 07:44:20.050', '20071019 18:33:23.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (407, N'1CGC', N'SMP5', '20090103 10:39:26.270', '20090615 21:50:25.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (408, N'4WES', N'IEUA', '20070504 04:10:23.880', '20071207 04:00:16.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (409, N'HM83', N'UB44', '20080713 00:33:16.110', '20080906 18:36:21.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (410, N'CD4T', N'YUG1', '20071027 07:11:28.960', '20080417 22:34:51.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (411, N'ME1K', N'PR9R', '20090409 18:07:23.880', '20091208 02:47:42.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (412, N'FCP7', N'TRZU', '20070130 06:25:38.440', '20070409 08:38:36.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (413, N'1CWJ', N'9OFQ', '20080711 19:24:21.890', '20090221 03:32:20.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (414, N'AN9P', N'SLYN', '20081012 18:39:20.330', '20090208 05:22:51.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (415, N'DIRR', N'P69G', '20080613 17:04:10.230', '20080904 23:48:51.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (416, N'4WES', N'61JI', '20070728 02:28:00.690', '20070928 15:08:11.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (417, N'JH58', N'ITDT', '20080703 05:08:16.090', '20081128 07:56:52.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (418, N'RTRP', N'40AG', '20071117 08:26:00.530', '20080406 19:09:29.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (419, N'DRUO', N'5FLX', '20080824 21:21:28.560', '20090603 06:14:27.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (420, N'QBIQ', N'UR2X', '20090922 09:07:41.410', '20100710 22:39:06.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (421, N'GLD5', N'R3UK', '20090905 19:24:39.210', '20090917 16:17:44.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (422, N'3486', N'VSHL', '20090512 12:27:32.660', '20091205 01:29:37.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (423, N'LP1V', N'PCJN', '20071003 20:49:09.350', '20080602 02:38:55.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (424, N'15JZ', N'RAMP', '20070504 18:15:07.500', '20070922 22:49:20.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (425, N'SP4X', N'AYHB', '20070317 03:31:51.130', '20071121 19:09:27.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (426, N'CVOE', N'75YM', '20081123 02:46:41.340', '20081211 07:36:16.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (427, N'598H', N'8F2W', '20091227 00:45:35.270', '20100812 14:07:01.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (428, N'PYJK', N'QY16', '20071008 05:02:02.820', '20080526 20:29:32.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (429, N'GZ12', N'VJM2', '20080928 10:46:50.360', '20081223 12:44:48.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (430, N'73AT', N'Y5Z2', '20081209 06:08:43.660', '20090323 12:29:53.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (431, N'92JG', N'6QH9', '20090729 12:50:18.380', '20100105 07:34:15.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (432, N'FLTW', N'YUY', '20090323 04:44:05.090', '20090824 13:47:08.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (433, N'2UD9', N'NO1Z', '20080724 00:03:19.140', '20081118 15:25:47.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (434, N'F55', N'3JZZ', '20091105 16:55:24.660', '20100702 13:08:15.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (435, N'TX8G', N'I95C', '20090628 19:20:05.990', '20090818 14:29:53.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (436, N'7A2Q', N'FUNM', '20080204 17:23:37.890', '20080502 14:45:57.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (437, N'RJD2', N'UHOT', '20090829 21:19:03.810', '20100605 18:25:40.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (438, N'8203', N'JNM8', '20070704 20:39:19.520', '20080304 23:02:16.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (439, N'X9QV', N'QZER', '20070617 02:39:55.330', '20071202 19:04:57.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (440, N'LM7K', N'1GOX', '20090424 14:19:53.690', '20090921 16:04:25.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (441, N'75DZ', N'2OUE', '20081106 17:27:12.470', '20081224 09:25:32.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (442, N'1RUX', N'JWH3', '20071024 14:55:02.200', '20071027 18:29:17.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (443, N'K9JD', N'YLQI', '20070629 14:54:26.060', '20071018 06:53:33.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (444, N'5QUJ', N'PCU1', '20091125 16:15:56.840', '20100204 17:50:12.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (445, N'YNYC', N'80GS', '20080122 08:58:47.180', '20080614 22:02:11.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (446, N'G3MK', N'QPJ0', '20090822 01:39:42.790', '20090829 22:02:10.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (447, N'FSTI', N'VS1M', '20070503 20:37:11.990', '20070813 17:40:08.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (448, N'G09J', N'5ABG', '20090418 01:23:05.170', '20090809 20:24:43.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (449, N'1XAJ', N'VJM2', '20090509 17:58:49.070', '20091204 07:17:18.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (450, N'BE5F', N'Y4MI', '20070414 10:17:19.440', '20070627 03:35:52.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (451, N'B68F', N'M4DI', '20090330 22:03:51.210', '20091224 15:39:26.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (452, N'9HF6', N'D43U', '20070217 10:29:54.050', '20070922 20:41:05.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (453, N'VHOT', N'6KM7', '20080109 22:02:26.360', '20080607 23:28:43.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (454, N'GIVI', N'AB4S', '20070820 03:51:54.820', '20070928 03:06:36.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (455, N'OBAJ', N'0SWW', '20090217 08:10:04.120', '20090614 23:43:47.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (456, N'3FVA', N'KU01', '20090518 11:25:06.340', '20090526 06:54:50.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (457, N'ZSOQ', N'6GXZ', '20071027 16:09:17.740', '20080214 21:02:13.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (458, N'P9P1', N'GXQ', '20090714 19:38:27.440', '20090922 03:07:24.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (459, N'1Q6R', N'A4QV', '20090915 03:46:36.610', '20100217 23:27:49.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (460, N'72VU', N'V1FX', '20080110 09:24:45.570', '20080914 21:55:40.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (461, N'PN7V', N'X5XO', '20070128 06:58:44.790', '20070309 04:26:23.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (462, N'AIA5', N'1XJP', '20080329 05:37:23.450', '20081116 01:20:54.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (463, N'FWVC', N'MS4', '20080804 17:23:33.530', '20081213 15:15:28.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (464, N'XRMV', N'VTUT', '20090803 18:24:32.460', '20100412 06:06:29.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (465, N'J6OQ', N'S6YW', '20080329 18:21:10.590', '20080412 15:00:36.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (466, N'5DO6', N'QXOX', '20070118 13:23:18.780', '20070416 13:00:35.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (467, N'IT30', N'6AO9', '20080708 06:22:19.310', '20090316 17:12:50.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (468, N'E1C', N'5XT7', '20080905 02:28:57.240', '20090617 14:24:06.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (469, N'DRUO', N'AN02', '20090415 23:19:14.340', '20090622 14:52:59.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (470, N'JAWW', N'8W7S', '20070510 23:40:32.340', '20080301 09:02:54.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (471, N'E047', N'BR7C', '20071128 05:08:56.880', '20080218 20:42:32.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (472, N'AEP1', N'ZGEP', '20071231 08:28:56.560', '20080722 08:54:37.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (473, N'EMHB', N'DIZG', '20070603 05:46:05.190', '20080302 00:04:33.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (474, N'T4DD', N'41J8', '20090502 07:01:34.880', '20090911 14:10:02.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (475, N'QJF0', N'RUMC', '20071116 15:40:28.940', '20080717 13:13:35.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (476, N'F2YJ', N'7PZQ', '20081113 04:29:37', '20081121 21:48:27.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (477, N'JTKR', N'XG2M', '20081113 21:33:06.590', '20090217 18:36:04.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (478, N'FOCR', N'ZVWK', '20071108 04:33:12.520', '20080427 08:48:44.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (479, N'2KMJ', N'JWH3', '20090412 09:16:20.330', '20100203 00:47:09.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (480, N'CD2Z', N'L2IF', '20070726 01:52:08.350', '20080323 21:07:18.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (481, N'X3PM', N'BEJI', '20080723 06:09:29.340', '20090224 13:56:09.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (482, N'SJX1', N'2RQT', '20070910 23:22:30.100', '20080103 17:42:19.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (483, N'2KCL', N'V7O5', '20080530 11:03:13.750', '20080622 13:12:14.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (484, N'C6RG', N'XIPU', '20080617 00:29:30.910', '20080629 09:08:57.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (485, N'82UZ', N'CFFP', '20090910 08:04:52.460', '20100123 20:50:28.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (486, N'2EFN', N'TRZU', '20090612 02:20:24.330', '20100209 10:53:11.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (487, N'9ZIP', N'SI0H', '20080314 06:41:38.730', '20080318 14:18:26.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (488, N'6G5K', N'CU5U', '20071205 20:11:24.310', '20080222 12:19:12.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (489, N'51N2', N'2NXK', '20070919 08:45:20.530', '20080118 13:24:29.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (490, N'QD57', N'XIPU', '20070211 07:54:59.640', '20070326 07:35:04.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (491, N'D8RX', N'95H2', '20070411 01:14:20.150', '20080113 17:43:45.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (492, N'8P26', N'DXY7', '20070216 01:40:36.370', '20070914 15:18:16.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (493, N'6O62', N'8MB2', '20071019 16:52:42.910', '20080115 23:34:27.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (494, N'17VW', N'VTLY', '20090606 17:15:09.770', '20100112 21:09:17.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (495, N'W03', N'4HAT', '20090328 07:21:08.900', '20090716 11:38:03.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (496, N'NY58', N'0KXL', '20070811 11:49:49.020', '20071205 08:04:38.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (497, N'HM83', N'WS72', '20090320 21:31:28.670', '20090909 03:13:49.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (498, N'5FJ7', N'2J5T', '20071125 20:29:53.610', '20080503 00:47:05.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (499, N'NPP0', N'X5XO', '20080828 21:54:46.240', '20081025 02:49:36.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (500, N'SVI3', N'I1PR', '20080104 19:35:28.400', '20080301 09:01:36.950', 1)
GO

--
-- Data for table dbo.ChiTietHoaDon_Jade  (LIMIT 500,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (501, N'56PJ', N'KU01', '20080214 19:17:23.470', '20080411 04:49:20.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (502, N'1CWJ', N'Q6JL', '20080827 18:08:14.760', '20081222 03:16:03.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (503, N'0SVU', N'UVE8', '20070103 02:03:50.820', '20070218 05:31:44.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (504, N'AVT8', N'MP6R', '20081230 18:18:16.730', '20090731 22:14:24.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (505, N'922F', N'MEAF', '20090517 05:08:22.560', '20100304 06:53:20.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (506, N'0HWY', N'MGYN', '20080331 13:34:54.640', '20080604 06:44:49.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (507, N'5WQ5', N'ZOJ', '20090916 04:43:48.860', '20100518 20:36:33.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (508, N'HE8V', N'2FK4', '20080908 15:00:51.480', '20080926 09:18:41.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (509, N'0047', N'JIEW', '20091003 12:11:25.890', '20100106 13:53:01.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (510, N'D80N', N'TBR2', '20070407 03:40:27.110', '20070725 01:55:20.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (511, N'04T2', N'N1B0', '20070705 13:51:59.750', '20080202 12:18:46.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (512, N'L3PN', N'6KM7', '20091219 11:36:05.220', '20100815 12:13:29.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (513, N'MHRP', N'XG4', '20070404 10:22:07.110', '20070616 02:20:15.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (514, N'Q85B', N'Q1IX', '20090221 01:54:28.250', '20090923 02:20:32.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (515, N'YPPT', N'K05', '20090619 03:15:16.230', '20090721 07:59:32.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (516, N'XA28', N'UBIC', '20090519 07:36:14.690', '20091230 10:44:04.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (517, N'5BYR', N'6T1V', '20091029 18:34:09.700', '20100526 12:08:41.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (518, N'GLD5', N'PAYT', '20070218 16:54:02.610', '20070617 06:06:32.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (519, N'PQ22', N'K9YB', '20091123 10:19:40.010', '20100319 09:16:02.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (520, N'CVOE', N'YLQI', '20081017 16:00:46.270', '20081228 04:07:26.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (521, N'N0W4', N'YF7X', '20081105 06:41:40.050', '20090127 22:42:09.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (522, N'234L', N'TI56', '20070804 10:10:54.990', '20080124 04:53:38.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (523, N'IB5S', N'3CYZ', '20071218 17:43:36.700', '20080531 00:59:38.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (524, N'O0BB', N'DILT', '20090305 15:24:14.700', '20090330 07:17:56.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (525, N'XI7', N'ZTGI', '20070130 22:26:12.180', '20070217 15:19:09.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (526, N'BTT8', N'Y73D', '20071013 03:28:20.510', '20080402 05:24:16.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (527, N'3UUF', N'R20', '20070314 15:36:13.650', '20070708 09:20:11.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (528, N'H39A', N'I17C', '20071227 12:30:55.430', '20080218 02:55:16.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (529, N'055O', N'ZO1S', '20070204 23:40:25.970', '20070227 02:31:59.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (530, N'IQ8T', N'R4IE', '20070408 03:50:39.910', '20070814 05:08:58.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (531, N'5Y8F', N'BB3D', '20090825 06:58:08.340', '20100108 18:34:39.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (532, N'XBMY', N'V54A', '20071221 01:03:12.970', '20080813 17:49:00.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (533, N'SWUG', N'2TBO', '20090311 06:38:26.280', '20090703 05:59:08.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (534, N'AF6S', N'1MGK', '20080408 13:40:51.920', '20081204 15:45:34.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (535, N'52SA', N'0C10', '20090610 06:34:44.880', '20091212 16:17:58.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (536, N'VNF6', N'M5E7', '20091125 12:01:14.590', '20100305 10:40:07.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (537, N'6EBE', N'8CEI', '20070908 21:18:39.270', '20071116 12:10:35.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (538, N'4AQR', N'8O6W', '20090530 16:44:57.030', '20090917 14:57:51.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (539, N'L00L', N'BEJI', '20090130 19:21:08.360', '20090221 02:15:37.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (540, N'2GDQ', N'QCZD', '20080611 18:29:57.810', '20080821 14:05:39.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (541, N'9ZUU', N'U2GN', '20090925 21:36:35.470', '20100720 14:16:39.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (542, N'AZ4S', N'Q8SY', '20090705 15:40:47.250', '20100418 04:59:46', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (543, N'QG8G', N'UB44', '20080303 07:59:58.420', '20081211 22:26:11.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (544, N'DZLE', N'9D9U', '20070615 05:04:53.410', '20070627 11:29:09.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (545, N'ABY6', N'ALJZ', '20090808 18:02:59.900', '20091217 19:16:18.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (546, N'0JMR', N'2OAT', '20070422 13:38:14.930', '20070531 05:30:16.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (547, N'93FD', N'GHZ6', '20091113 15:18:29.260', '20100331 12:58:01.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (548, N'CW4C', N'JNM8', '20080827 14:58:14.660', '20090217 21:13:55.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (549, N'JNAY', N'CKLU', '20091218 13:59:53.550', '20100624 13:09:45.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (550, N'YF15', N'A7BE', '20091108 23:44:54.210', '20100513 00:53:59.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (551, N'YQYJ', N'TZOE', '20071012 17:15:39.330', '20080506 19:55:58.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (552, N'87BH', N'7KC2', '20090131 04:37:26.050', '20090325 21:07:17.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (553, N'JLJV', N'JO6K', '20080102 10:10:13.610', '20080214 15:31:03.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (554, N'8AW9', N'YJRS', '20091111 05:53:59.980', '20100823 22:42:10.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (555, N'5V7J', N'JYP3', '20090228 12:53:48.360', '20091128 10:19:28.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (556, N'9PN', N'QZER', '20070714 09:06:28.480', '20080113 23:55:43.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (557, N'EZMA', N'MOFH', '20070911 00:24:38.060', '20080520 02:16:25.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (558, N'W8G6', N'HVNP', '20071030 10:39:36.130', '20071120 22:13:49.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (559, N'M9PO', N'MS4', '20081130 19:52:04.550', '20090614 06:55:15.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (560, N'XP9G', N'OF2U', '20080805 01:40:02.040', '20081202 01:29:05.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (561, N'D1AW', N'VBET', '20080118 21:58:40.990', '20080923 21:24:39.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (562, N'DS46', N'IT82', '20080920 16:12:53.420', '20090331 17:41:17.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (563, N'JNUW', N'2PTR', '20080804 15:20:25.510', '20090527 06:46:42.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (564, N'7WID', N'RUMC', '20090628 08:20:45.980', '20100322 08:44:04.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (565, N'3W32', N'IETJ', '20070812 20:42:18.780', '20080511 07:20:42.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (566, N'0ALP', N'RX41', '20090715 12:48:46.780', '20100416 18:29:47.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (567, N'7B2E', N'3ILZ', '20071011 04:57:38.940', '20080213 06:14:21.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (568, N'BWGU', N'VPU3', '20081225 20:41:15.190', '20090507 10:34:42.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (569, N'AEP1', N'PMF8', '20090912 19:19:43.380', '20091011 10:02:34.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (570, N'3HBO', N'XM2T', '20090724 15:14:01.640', '20100313 21:19:26.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (571, N'3NWE', N'MA33', '20080910 10:17:35.420', '20090213 22:33:30.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (572, N'ITM', N'Y7HD', '20070602 01:49:12.660', '20070908 21:10:50.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (573, N'9EIC', N'DM43', '20080118 21:32:54.250', '20080425 03:50:56.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (574, N'68KL', N'TG88', '20080613 15:49:42.190', '20080728 19:10:23.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (575, N'07WB', N'4IFI', '20090121 18:24:10.800', '20090405 13:50:47.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (576, N'598H', N'8ICH', '20090502 15:00:52.800', '20090807 17:42:24.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (577, N'HFDJ', N'ZFLS', '20090602 02:10:56.580', '20091208 06:27:27.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (578, N'5RB6', N'U319', '20070706 12:38:43.280', '20071205 13:30:29.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (579, N'I1EI', N'2GX8', '20090727 21:21:14.800', '20100206 12:01:38.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (580, N'WXBA', N'X8KE', '20091010 08:47:57.250', '20100716 09:48:53.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (581, N'VPX0', N'I9BY', '20071129 12:09:51.250', '20080102 16:26:16.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (582, N'JCXT', N'80GS', '20080717 00:37:58.990', '20090315 12:06:16.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (583, N'17VW', N'4Q2E', '20080108 22:31:01.880', '20080621 13:45:31.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (584, N'XZCR', N'PINY', '20070328 23:55:31.770', '20070813 01:38:01.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (585, N'3RI2', N'X8KE', '20090626 10:35:00.590', '20100202 09:13:00.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (586, N'IX4T', N'3ILZ', '20070726 02:20:42.280', '20071016 21:27:22.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (587, N'K56Z', N'BVRP', '20091218 14:52:59.360', '20100630 02:17:57.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (588, N'U6TA', N'4FUZ', '20090430 00:44:26.300', '20090905 07:16:59.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (589, N'9T81', N'IXEF', '20090208 00:47:03.570', '20091102 05:26:06.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (590, N'JJ4Q', N'9IC8', '20081127 21:28:16.400', '20081129 16:22:16.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (591, N'0ACL', N'ZBKF', '20090317 11:36:36.530', '20090812 08:23:42.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (592, N'9D73', N'R3UK', '20091109 10:39:03.150', '20091226 13:56:46.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (593, N'5PO3', N'MG0V', '20070630 20:52:52.470', '20080131 08:02:36.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (594, N'N9A5', N'NWBF', '20070628 17:41:06.320', '20080117 00:46:33.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (595, N'7AJW', N'V5NR', '20070525 20:31:16.810', '20070924 16:41:00.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (596, N'AN9P', N'BMDB', '20080106 05:23:42.050', '20080420 20:35:23.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (597, N'L6W5', N'NGDT', '20071202 00:20:21.740', '20080917 22:13:04.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (598, N'2KI5', N'2CZ4', '20080904 23:39:12.450', '20080921 13:42:08.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (599, N'4QOB', N'REMV', '20091102 08:22:34.640', '20091212 04:08:28.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (600, N'C6XT', N'JO1H', '20070125 05:14:13.110', '20070630 00:46:32.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (601, N'I94P', N'Z35T', '20090712 08:40:36', '20100210 23:15:55.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (602, N'2OL1', N'L32Z', '20071119 18:37:14.060', '20071125 02:23:19.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (603, N'5IA3', N'TJ7N', '20081214 19:38:31.290', '20090509 11:11:21.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (604, N'Z8OJ', N'F61J', '20070527 22:45:51.900', '20080207 15:50:20.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (605, N'9E67', N'P0NF', '20080229 13:27:18.790', '20080329 02:20:30.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (606, N'JTC8', N'VPAM', '20070513 15:26:26.660', '20070829 22:45:08.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (607, N'00BJ', N'UB8G', '20080114 07:04:31.790', '20080926 17:16:22.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (608, N'FLJT', N'PRQ4', '20090720 18:20:31.430', '20100514 20:20:41.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (609, N'43HN', N'TZOE', '20071021 11:29:49.180', '20080520 08:51:24.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (610, N'0ACL', N'AIZV', '20091028 21:52:55.560', '20100422 16:37:04.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (611, N'9R9T', N'REMV', '20080211 06:55:31.900', '20081201 17:28:16.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (612, N'7AMU', N'SINJ', '20070308 11:45:54.770', '20070616 12:45:57.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (613, N'EN00', N'F42', '20080403 13:18:21.330', '20080809 10:12:11.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (614, N'PBMX', N'PMF8', '20090220 11:04:07.300', '20090924 21:06:22.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (615, N'DZUR', N'69EY', '20070907 13:30:10.780', '20071201 09:02:49.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (616, N'9GKT', N'NJZS', '20090703 21:20:42.010', '20090711 09:18:23.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (617, N'O4B6', N'DM43', '20070913 17:41:51.540', '20071011 03:55:46.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (618, N'3Q99', N'DM0A', '20080509 15:24:53.730', '20081015 05:08:42.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (619, N'IIR7', N'UVE8', '20070102 21:45:45.390', '20070217 23:31:04.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (620, N'KSM8', N'EN1A', '20070118 18:21:36.500', '20070727 09:53:20.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (621, N'7DBD', N'G2NH', '20090727 21:55:47.420', '20091017 16:11:50.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (622, N'KDO4', N'Z372', '20080612 04:13:12.640', '20090404 22:57:23.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (623, N'GZ4M', N'DE1H', '20091116 19:54:11.630', '20100501 05:08:37.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (624, N'T161', N'FYHJ', '20071016 21:51:26.970', '20071112 17:40:19.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (625, N'N3YC', N'YGCO', '20070510 03:37:25.110', '20070802 12:55:45.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (626, N'D4VF', N'V5TD', '20081031 23:38:32.270', '20090218 08:36:44.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (627, N'GSKU', N'BVRP', '20091202 04:56:20.190', '20100604 13:08:15.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (628, N'TEZT', N'QAFE', '20070724 03:51:47.930', '20080204 03:04:24.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (629, N'5CHJ', N'YKJF', '20080120 19:18:25.370', '20080831 02:29:24.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (630, N'Q320', N'SWPM', '20080117 13:00:28.750', '20081011 17:15:25.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (631, N'UEPP', N'LP5L', '20080601 14:40:31.050', '20080915 19:29:21.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (632, N'93FD', N'X83W', '20070928 02:31:44.120', '20080318 16:45:20.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (633, N'AY8W', N'2NXK', '20070903 04:16:08.650', '20071224 09:22:01.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (634, N'YLJ0', N'K9YB', '20090703 16:07:01.680', '20090810 11:15:07.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (635, N'OIKG', N'Y5Z2', '20070401 00:07:21.240', '20070605 10:32:58.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (636, N'RCS1', N'X96E', '20070110 17:32:37.190', '20070208 14:02:57.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (637, N'4887', N'EXZX', '20090802 04:59:27.700', '20091106 00:54:55.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (638, N'QTG7', N'Q6JL', '20070814 23:45:09.980', '20080310 21:55:12.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (639, N'OSNQ', N'0ML2', '20090127 10:28:12.990', '20090515 23:17:31.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (640, N'J6OQ', N'1CAK', '20090213 19:08:33.920', '20090606 10:27:53.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (641, N'3TT0', N'9FZA', '20090711 19:16:10.490', '20091115 04:11:00.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (642, N'M1C3', N'MR6C', '20070531 20:32:27.930', '20071213 05:57:17.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (643, N'VMS5', N'AD2K', '20080710 13:14:37.120', '20090211 22:25:35.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (644, N'M9PO', N'7OE6', '20090412 02:54:08.010', '20090712 12:49:03.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (645, N'4Q9J', N'ILB8', '20071018 14:32:44.490', '20071025 22:54:00.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (646, N'E897', N'6WB4', '20090109 23:50:41.760', '20090226 19:37:45.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (647, N'XT53', N'C4IK', '20080807 21:20:41.810', '20090315 03:44:35.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (648, N'1YYB', N'WZJC', '20080509 09:48:45.180', '20090303 10:56:14.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (649, N'JZBH', N'HSYO', '20091021 04:10:55.540', '20100215 15:43:44.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (650, N'1AFN', N'7KZY', '20071121 23:10:34.810', '20080315 07:22:37.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (651, N'NIOC', N'Y7HD', '20070425 11:41:50.500', '20070712 16:39:37.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (652, N'KVS7', N'9ITH', '20090724 08:55:28.020', '20091203 17:04:23.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (653, N'LSBS', N'7LW6', '20080903 01:53:27.060', '20090531 14:11:05.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (654, N'K0PW', N'D35', '20091015 14:00:58.130', '20100314 18:15:08.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (655, N'X3TC', N'2TBW', '20070630 07:18:25.690', '20070912 08:34:42.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (656, N'9T81', N'ZY4V', '20080131 04:27:23.360', '20080904 00:18:33.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (657, N'XSJG', N'75YM', '20080102 22:43:02.440', '20080521 21:14:43.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (658, N'DBNF', N'DVYM', '20080229 21:47:04.310', '20080627 17:31:03.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (659, N'D1AW', N'H08Q', '20070118 19:08:26.790', '20070709 02:54:35.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (660, N'LGGQ', N'TLDE', '20090429 13:48:46.520', '20091204 17:43:46.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (661, N'CZY9', N'KF01', '20070611 10:30:06.470', '20080121 09:36:53.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (662, N'0K31', N'40AG', '20070624 03:12:43.860', '20070824 14:11:58.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (663, N'5IA3', N'R441', '20080630 23:02:06.050', '20080913 17:51:18.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (664, N'922F', N'0QKV', '20091003 22:29:20.440', '20100604 15:35:59.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (665, N'HZDC', N'PR9R', '20080529 07:12:24.500', '20080806 21:07:43.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (666, N'A0TU', N'UHOT', '20070517 04:23:47.780', '20070916 00:42:57.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (667, N'3486', N'PY27', '20090705 07:29:46.120', '20100419 03:23:57.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (668, N'FWIM', N'V9BL', '20080930 21:11:19.660', '20081229 22:57:05.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (669, N'6TCI', N'RE3O', '20081122 10:56:46.050', '20090422 10:33:24.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (670, N'BLXC', N'8VZM', '20070828 19:57:33.590', '20071023 18:59:52.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (671, N'HGES', N'8MK9', '20091201 16:21:14.310', '20100701 08:23:29.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (672, N'GA78', N'O4WK', '20070130 17:56:41.560', '20070529 06:00:35.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (673, N'MG4P', N'CNYQ', '20090412 04:56:40.750', '20090601 05:51:11.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (674, N'5LCZ', N'T91O', '20071119 02:37:11.470', '20080709 13:03:11.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (675, N'254L', N'4V8D', '20070709 23:05:26.020', '20070911 05:42:20.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (676, N'BEKS', N'TJ7N', '20090227 01:23:19.490', '20090901 10:14:34.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (677, N'3EDY', N'P0NF', '20091202 14:58:35.530', '20100221 00:31:49.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (678, N'JCV5', N'5AU9', '20070807 17:00:03.620', '20071020 16:19:34.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (679, N'CZ02', N'XHW8', '20091229 07:18:42.490', '20100117 18:46:19.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (680, N'EU8U', N'RIPB', '20080429 03:46:43.360', '20080604 17:18:00.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (681, N'FWIM', N'JIEW', '20070327 02:17:50.460', '20071003 04:52:09.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (682, N'4EVD', N'FC25', '20080725 19:07:35.010', '20090128 02:12:01.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (683, N'7W06', N'8OIQ', '20071002 23:40:52.400', '20071219 11:20:41.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (684, N'4RF8', N'R20', '20070301 20:07:50.560', '20070618 19:06:47.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (685, N'2LZQ', N'UYVQ', '20070925 01:18:38.240', '20080402 00:35:49.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (686, N'20OC', N'BMDB', '20081108 05:45:03.040', '20090809 02:24:59.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (687, N'QQUC', N'PKIK', '20090124 00:38:17.070', '20090814 02:34:16.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (688, N'KGCG', N'PWTT', '20071118 14:15:10.530', '20080806 15:06:53.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (689, N'IHWE', N'H2JU', '20090104 08:48:35.980', '20090925 02:40:25.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (690, N'EP1O', N'Y73D', '20090228 19:39:57.890', '20090727 10:14:26.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (691, N'TNF7', N'Q8JL', '20090107 18:49:34.750', '20090715 16:48:15.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (692, N'4OWO', N'0Q0L', '20080603 07:12:23.380', '20090307 07:23:53.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (693, N'H23K', N'8ZDT', '20070728 04:36:43.190', '20070903 19:00:37.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (694, N'SCLR', N'73BW', '20090929 20:39:26.470', '20100407 05:33:46.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (695, N'MXR5', N'I8T8', '20080905 08:38:27.440', '20090313 00:51:00.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (696, N'FKWJ', N'5ABG', '20090118 16:03:26.630', '20090324 13:59:03', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (697, N'FOI1', N'VIKA', '20081129 21:30:21.890', '20090330 12:06:00.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (698, N'N8Y0', N'9K9A', '20081006 14:45:16.680', '20090706 06:49:37.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (699, N'XSKY', N'INSL', '20071114 19:41:43.500', '20071206 15:41:20.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (700, N'PZSV', N'O97G', '20070604 10:08:56.710', '20071206 22:11:04.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (701, N'FH6K', N'HNYC', '20090707 16:20:55.640', '20090905 16:13:49.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (702, N'H0LA', N'HDZD', '20091107 00:09:22.160', '20100316 04:47:31.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (703, N'379R', N'561Q', '20090616 22:51:59.130', '20091111 00:22:50.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (704, N'AEWT', N'89B3', '20090223 08:13:21.940', '20090425 20:43:52.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (705, N'MJ1U', N'YYWY', '20071221 06:49:20.500', '20080710 22:59:09.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (706, N'Q407', N'A7KC', '20070326 17:45:08.940', '20071211 10:39:02.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (707, N'AE0U', N'X4X7', '20070414 03:58:47.260', '20070705 11:13:12.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (708, N'OVC7', N'ES3N', '20071016 23:16:15.580', '20071123 01:07:54.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (709, N'ELGZ', N'80GS', '20090408 14:55:32.110', '20090704 12:32:49.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (710, N'WMNV', N'9FZA', '20080502 05:55:06.210', '20081105 22:20:09.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (711, N'O947', N'BEJI', '20080228 13:28:47.840', '20080713 23:46:45.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (712, N'VV63', N'1Q2Y', '20070529 05:42:58.810', '20070803 04:55:10.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (713, N'KVS7', N'GBSC', '20080302 14:28:21.830', '20080609 22:44:44.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (714, N'XZSQ', N'PFCI', '20080920 15:21:43.430', '20090202 09:36:36.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (715, N'IIR7', N'ALJZ', '20090203 11:30:56.060', '20090304 12:51:37.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (716, N'4NER', N'4FUZ', '20081115 15:22:31.470', '20081223 07:24:53.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (717, N'T5SM', N'VBET', '20090921 03:31:51.470', '20100702 02:51:18.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (718, N'78KC', N'03P0', '20080502 02:54:15.480', '20090122 22:44:31.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (719, N'5WQ2', N'69C1', '20090109 21:10:42.200', '20090304 15:00:11.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (720, N'K5SI', N'E04B', '20090721 01:27:21.470', '20091024 18:42:45.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (721, N'K56Z', N'4VQ5', '20080422 03:45:30.710', '20081127 22:08:42.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (722, N'X1XE', N'00F1', '20080817 17:14:35.590', '20080912 12:17:04.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (723, N'M2G', N'ES3N', '20090926 12:22:43.680', '20100130 20:16:40.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (724, N'MJ7O', N'TBR2', '20090923 15:16:48.170', '20090926 00:18:58.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (725, N'PNEA', N'JZ0Z', '20080820 01:07:58.840', '20090203 02:11:38.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (726, N'NUG7', N'7OE6', '20080630 09:08:50.920', '20090220 00:59:37.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (727, N'OEK7', N'ES3N', '20090705 13:19:58.370', '20090924 10:59:59.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (728, N'PD8B', N'5AU9', '20090713 08:17:14.280', '20091221 00:17:26.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (729, N'HPX', N'BEJI', '20090314 17:58:44.040', '20090428 12:12:11.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (730, N'Z58U', N'ZGCQ', '20080620 07:01:59.400', '20090414 15:43:18.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (731, N'OCN0', N'Y4MI', '20070331 03:52:57.590', '20070604 22:08:35.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (732, N'FRRV', N'F42', '20080227 00:13:18.840', '20080613 17:42:12.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (733, N'EFVB', N'NHZV', '20090922 21:18:20.120', '20091114 00:38:14.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (734, N'9MCW', N'9K9A', '20090727 21:09:45.770', '20091208 20:35:16.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (735, N'9GKT', N'A40I', '20081022 11:25:47.720', '20090726 01:04:12.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (736, N'WIGY', N'1Q2Y', '20070520 02:08:28.310', '20070720 00:04:39.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (737, N'FDXB', N'9R3S', '20090207 20:15:35.890', '20090319 01:49:11.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (738, N'MBJ4', N'0GND', '20080808 15:27:30.460', '20080824 14:36:50.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (739, N'VFYO', N'RX41', '20090311 13:18:30.070', '20091003 20:07:38.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (740, N'O0OA', N'KXXU', '20070702 07:33:29.290', '20080217 13:56:47.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (741, N'6LA8', N'F405', '20080728 01:46:15.770', '20090204 15:11:47.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (742, N'1G7O', N'ALJZ', '20080410 01:22:01.490', '20080922 01:26:22.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (743, N'MHHP', N'I7ON', '20080810 23:19:38.420', '20090202 02:34:05.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (744, N'58SD', N'6Z2B', '20070905 02:53:29.770', '20071120 04:20:17.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (745, N'CZY9', N'MTKM', '20080102 06:11:10.050', '20080114 10:27:42.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (746, N'LP1V', N'OF2U', '20080812 13:06:35.930', '20081213 11:53:06.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (747, N'KQMW', N'L9ER', '20070403 16:44:01.550', '20070928 08:39:10', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (748, N'FWXJ', N'KKJQ', '20081105 13:14:59.760', '20090527 09:24:02.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (749, N'PR0E', N'WGSX', '20070827 09:08:30.410', '20080203 16:42:09.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (750, N'OSWL', N'DCTI', '20091020 17:15:55.980', '20100320 17:26:08.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (751, N'AG61', N'A2H4', '20090429 12:31:35.170', '20090719 11:07:45.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (752, N'OSNQ', N'VE3P', '20070731 18:36:06.400', '20080102 13:21:29.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (753, N'GXVH', N'3H4T', '20090926 17:34:34.490', '20100503 15:49:27.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (754, N'I8IP', N'4FUZ', '20080425 18:14:22.040', '20081207 20:58:35.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (755, N'5V7J', N'JO1H', '20090211 06:23:26', '20091104 00:02:23.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (756, N'UR8Z', N'HNYC', '20071120 23:06:20.050', '20071225 03:56:46.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (757, N'BKLK', N'2DTQ', '20070211 11:46:38.470', '20070214 08:30:51.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (758, N'F8Q7', N'C4IK', '20090923 07:35:10.960', '20100215 00:03:52.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (759, N'QXHL', N'PAYT', '20070707 07:05:23.100', '20080117 18:32:14.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (760, N'4F5J', N'RAMP', '20090621 21:40:29.580', '20100316 21:59:33.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (761, N'68KL', N'VS1M', '20070921 04:25:10.570', '20080317 23:39:04.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (762, N'JP18', N'RHEY', '20071001 19:41:32.990', '20080510 10:55:47.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (763, N'6YQ3', N'2XSC', '20080803 05:17:31.550', '20090522 12:55:43.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (764, N'Q0FH', N'8MB2', '20071020 07:53:32.710', '20080116 20:49:31.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (765, N'FYIR', N'BF5M', '20080203 02:02:08.610', '20080604 00:11:35.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (766, N'2MAG', N'WV0D', '20070102 13:15:28.990', '20070131 06:04:33.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (767, N'S3TP', N'EXZX', '20070905 08:24:38.700', '20070919 04:16:56.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (768, N'81LJ', N'6GKZ', '20080805 17:18:36.060', '20090428 02:09:28.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (769, N'614W', N'F4M5', '20091129 03:55:55.710', '20100506 08:32:24.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (770, N'MBJ4', N'8U7C', '20080917 09:22:27.750', '20090612 12:46:59.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (771, N'PZFB', N'UXY4', '20091007 19:06:55.580', '20100802 05:35:42.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (772, N'TV81', N'UYD6', '20080213 12:04:21', '20081107 12:14:29.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (773, N'92NL', N'8CEI', '20090220 13:35:45.420', '20090421 02:36:54.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (774, N'TIX0', N'M83R', '20080711 13:37:12.910', '20081112 01:03:24.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (775, N'9EIC', N'Z0WK', '20071224 23:41:05.690', '20080716 03:30:59.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (776, N'D5P8', N'UFRE', '20070113 02:23:29.220', '20070308 20:42:20.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (777, N'GZ12', N'IVS', '20070107 17:54:57.160', '20070607 09:42:59.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (778, N'8AW9', N'77J5', '20090122 09:29:13.910', '20090313 15:56:24.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (779, N'F3G3', N'6LFZ', '20080922 09:05:38.110', '20090709 13:51:17.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (780, N'LPTV', N'V9BL', '20070108 12:01:22.900', '20070221 14:18:33.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (781, N'379R', N'NCDH', '20080329 16:24:49.370', '20080525 16:20:28.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (782, N'3OFH', N'UV51', '20070831 00:04:58.610', '20080225 01:35:58.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (783, N'Q4UB', N'8VZM', '20081116 23:08:43.870', '20081117 07:35:18.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (784, N'92JG', N'YF7X', '20090525 00:42:48.060', '20091204 18:46:04.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (785, N'NLV8', N'PKIK', '20090220 18:30:24.240', '20090926 04:35:34.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (786, N'068B', N'2KN2', '20090830 09:16:51.200', '20100329 08:47:06.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (787, N'9YIR', N'BD30', '20080601 06:38:44.360', '20081207 01:52:46.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (788, N'MQ0O', N'JI8O', '20080530 03:03:58.080', '20081003 03:39:39.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (789, N'JO1O', N'QZRH', '20070616 14:46:19.770', '20071201 20:32:54.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (790, N'PBMX', N'T384', '20071203 12:19:27.670', '20080801 21:07:27.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (791, N'OEAI', N'ZGCQ', '20070408 14:21:49.830', '20070605 15:33:49.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (792, N'7IBQ', N'XQXS', '20090517 12:40:24.930', '20091128 01:45:19.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (793, N'EO4D', N'BGM1', '20080203 08:22:07.350', '20080603 20:04:36.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (794, N'KCKP', N'0IHL', '20090919 15:38:00.490', '20100515 22:08:06.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (795, N'2VAO', N'P0NF', '20091011 03:08:18.720', '20091201 14:17:44.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (796, N'EO4D', N'NO1Z', '20071028 06:04:42.780', '20080724 04:16:01.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (797, N'V6WP', N'7LW6', '20090906 20:04:29.940', '20100226 12:30:40.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (798, N'79E9', N'8VZM', '20071023 15:26:05.710', '20080118 05:44:35.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (799, N'951I', N'VKOD', '20090802 00:51:21.160', '20100413 04:08:42.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (800, N'I9O9', N'Q9A', '20071231 16:55:41.050', '20081010 04:23:10.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (801, N'5OJ2', N'9DTT', '20071209 04:41:57.230', '20080327 07:36:10.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (802, N'SUHI', N'EJ6K', '20080827 23:25:25.500', '20090328 06:29:42.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (803, N'7CDQ', N'4Z84', '20081207 09:19:04.050', '20090121 00:51:38.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (804, N'O947', N'NWBF', '20081208 23:46:02.660', '20090619 03:55:10.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (805, N'JCV5', N'J53Y', '20070113 22:09:00.390', '20070615 11:50:27.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (806, N'2JY8', N'FH60', '20080317 00:27:14.160', '20080707 22:53:16.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (807, N'IWR', N'NGC8', '20080609 05:00:20.980', '20080912 10:44:36.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (808, N'O5RG', N'I7GI', '20080318 03:57:21.580', '20080621 14:46:04.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (809, N'F2YJ', N'5ABG', '20070503 18:33:16.340', '20070525 17:27:37.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (810, N'OBZ', N'P3OJ', '20090130 03:59:56.780', '20090829 03:20:03.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (811, N'BWM6', N'YUG1', '20071114 05:11:22.880', '20080515 18:13:47.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (812, N'7OCE', N'V5TD', '20080120 02:17:24.560', '20080928 16:34:27.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (813, N'Q85B', N'5BGG', '20080101 22:29:32.850', '20080604 10:12:36.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (814, N'E047', N'TXFL', '20070629 19:04:00.190', '20071127 04:13:42.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (815, N'M778', N'474A', '20080325 05:15:40.210', '20081022 05:39:05.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (816, N'2GDQ', N'1882', '20070122 04:20:11.960', '20070122 22:03:07.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (817, N'4NER', N'ITDT', '20081113 20:32:49.120', '20090623 03:20:30.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (818, N'3CBF', N'4Q2E', '20090311 04:34:43.490', '20090617 18:09:40.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (819, N'IH1W', N'JZQT', '20080828 13:23:08.480', '20090215 16:13:57.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (820, N'T6RU', N'8TM0', '20080604 16:45:17.420', '20090101 15:24:29.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (821, N'Q8WB', N'LP5L', '20080802 06:36:44.640', '20081220 04:11:47.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (822, N'LC99', N'VS1M', '20090407 05:20:40.620', '20091012 00:37:17.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (823, N'K8HM', N'FT1A', '20080221 02:32:16.290', '20080528 05:36:35.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (824, N'SISQ', N'MA33', '20081227 15:36:28.040', '20090731 11:24:58.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (825, N'UE0B', N'9FNG', '20080611 19:00:37.910', '20090107 21:13:11.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (826, N'F4R0', N'X52E', '20070524 06:26:30.650', '20070905 03:50:23.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (827, N'L8KD', N'JW1L', '20070111 03:42:13.640', '20070606 16:09:54.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (828, N'OCN0', N'7FN1', '20090602 21:57:44.940', '20091002 04:28:48.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (829, N'MNZY', N'XF1Z', '20080930 10:28:54.190', '20081211 10:45:40.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (830, N'VLQ8', N'BMDB', '20070227 17:36:22.900', '20071019 23:14:59.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (831, N'2FUU', N'MRD3', '20070508 06:18:59.280', '20071106 08:11:41.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (832, N'CHIE', N'95Q1', '20090317 02:28:51.460', '20090520 03:58:25.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (833, N'CHOE', N'BR7C', '20090622 08:37:52.760', '20090926 11:47:42.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (834, N'PZSV', N'H2JU', '20070923 16:09:57.060', '20070930 09:28:07.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (835, N'FQHV', N'M7D3', '20090130 07:19:25.680', '20090922 06:42:23.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (836, N'0047', N'8MZ3', '20090801 16:59:23.870', '20091224 09:50:47.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (837, N'YVIU', N'PR9R', '20080922 14:45:54.570', '20090203 00:44:20.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (838, N'FSTI', N'LZD5', '20091208 23:22:41.210', '20100327 03:40:08.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (839, N'QVFP', N'FUNM', '20090512 02:33:47.660', '20090622 06:55:38.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (840, N'6ZTL', N'9R9W', '20071207 18:03:10.070', '20080321 05:42:18.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (841, N'2ZZV', N'FJYW', '20080323 04:16:30.210', '20080716 22:02:31.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (842, N'LV3Q', N'TWBS', '20070317 02:41:22.770', '20070618 11:06:43.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (843, N'EFVB', N'DILT', '20080128 08:30:41.730', '20080511 10:12:03.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (844, N'SGQX', N'1YKM', '20080516 10:46:22.990', '20090128 17:12:51.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (845, N'K1YH', N'UFRE', '20070120 07:08:04.780', '20070320 02:53:40.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (846, N'QSGS', N'4HAT', '20090319 12:04:25.270', '20090702 22:59:22.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (847, N'FT3C', N'S6YW', '20080516 14:10:52.080', '20080625 15:32:44.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (848, N'TIIB', N'IAZQ', '20070807 13:18:07.160', '20080504 15:50:54.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (849, N'PTC8', N'WGSX', '20080627 10:22:20.280', '20080724 16:29:01.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (850, N'DGQE', N'NHQ7', '20090919 22:48:06.750', '20091109 16:14:38.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (851, N'48PO', N'4W30', '20081213 09:31:53.660', '20090131 00:55:31.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (852, N'X3HV', N'2TBO', '20070629 15:29:46.440', '20070911 18:21:01.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (853, N'Q4KM', N'Q1IX', '20090224 02:02:57.230', '20090927 13:30:38.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (854, N'4887', N'MTQU', '20080228 08:06:03.730', '20080411 12:44:14.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (855, N'SUHI', N'4NB', '20090530 10:18:56.420', '20091021 00:11:23.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (856, N'OK0Z', N'DPO7', '20080901 23:21:16.610', '20090411 06:58:54.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (857, N'JZBH', N'YP3N', '20070708 20:53:09.210', '20071101 00:53:07.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (858, N'DKP2', N'JZ0Z', '20091210 17:42:36.010', '20100418 13:26:40.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (859, N'ULFC', N'E8K8', '20070630 04:45:24.750', '20080407 06:42:00.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (860, N'11PV', N'LZD5', '20090822 15:42:29.750', '20091010 08:00:04.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (861, N'KQGF', N'WD3A', '20080306 20:45:00.510', '20081128 06:43:23.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (862, N'D4Z2', N'FLRD', '20090106 07:02:36.050', '20091007 06:15:48.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (863, N'R3PA', N'KVIZ', '20090617 17:28:27.390', '20090711 04:00:24.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (864, N'DBNF', N'TWBS', '20070307 00:56:53.430', '20070602 18:12:39.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (865, N'7LJU', N'1ZA4', '20080924 21:40:57.500', '20081023 19:08:22.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (866, N'6KDW', N'PRQ4', '20080829 02:42:31.420', '20081226 14:15:23.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (867, N'VD9L', N'JW1L', '20080729 17:39:31.810', '20090102 04:46:46.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (868, N'W443', N'P7DQ', '20070411 06:19:35.780', '20070906 00:44:30.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (869, N'K2NB', N'7WXM', '20080529 11:44:34.520', '20081230 21:31:20.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (870, N'TW5E', N'VJM2', '20080823 12:16:16.340', '20081028 19:48:19.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (871, N'2LZQ', N'BR7C', '20080430 13:34:17.400', '20081014 21:18:47.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (872, N'G94P', N'WZNF', '20081205 21:10:07.910', '20090328 23:40:22.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (873, N'UQ0L', N'PBTO', '20091030 02:00:55.840', '20091226 11:14:02.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (874, N'AVT8', N'9DTT', '20070922 19:19:58.400', '20071128 10:31:39.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (875, N'OCTO', N'TG88', '20070315 12:28:47.200', '20070618 17:21:59.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (876, N'DSJB', N'RLGL', '20080519 03:55:21.860', '20080704 17:05:05.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (877, N'FY9O', N'J53Y', '20080310 20:49:58.890', '20080602 14:25:15.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (878, N'AE0U', N'DRAY', '20091006 15:45:53.300', '20100223 12:23:44.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (879, N'0C00', N'RR14', '20081208 08:28:23.250', '20090514 08:31:19.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (880, N'3RI2', N'4VQ5', '20090325 06:56:12.640', '20090707 22:13:50.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (881, N'G0VL', N'4Q2E', '20090106 16:15:38.580', '20090311 12:17:40.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (882, N'UBBN', N'10VV', '20090605 14:24:06.490', '20091128 00:19:00.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (883, N'AZ4S', N'B1UL', '20071207 11:35:24.650', '20080310 11:59:47.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (884, N'HZDC', N'A2H4', '20090110 11:40:47.440', '20090131 18:31:03.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (885, N'RKIH', N'6QH9', '20080316 08:04:29.240', '20080917 22:19:28.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (886, N'EU8U', N'K9YB', '20091108 14:49:12.840', '20100224 13:50:41.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (887, N'LUWX', N'K5H4', '20070122 00:25:54.230', '20070619 14:27:47.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (888, N'NS05', N'PIKH', '20080425 00:31:49.020', '20080616 23:03:29.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (889, N'RUEW', N'BWFF', '20080425 05:51:00.650', '20081005 09:16:44.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (890, N'F8KK', N'8CEI', '20070531 07:58:09.060', '20070613 23:43:29.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (891, N'RKIH', N'A0XP', '20090124 20:06:14.660', '20090223 08:57:40.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (892, N'CATH', N'69EY', '20081012 21:03:18.560', '20081017 11:17:41.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (893, N'UKCD', N'7FN1', '20090611 18:37:16.460', '20091015 20:58:09.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (894, N'GX97', N'UBIC', '20090919 10:51:17.920', '20100708 22:55:34.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (895, N'H2TQ', N'DM43', '20091001 21:18:09.570', '20100216 22:58:56.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (896, N'0PNN', N'ZY4V', '20090316 21:13:54.170', '20090805 15:46:43.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (897, N'JS3', N'9DVV', '20070929 09:12:55.390', '20071208 07:06:19.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (898, N'0L8P', N'K5H4', '20071124 07:33:48.290', '20071210 15:59:24.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (899, N'M8Q1', N'ZXWH', '20090821 13:05:25.500', '20100406 22:04:29.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (900, N'W8OT', N'4P4I', '20080523 04:25:33.370', '20090117 12:38:18.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (901, N'VGZ5', N'LT05', '20070821 18:24:53.460', '20080426 18:12:36.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (902, N'K30K', N'37F0', '20080206 07:51:16.290', '20080816 14:48:14.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (903, N'D8RX', N'9R3S', '20090310 01:33:32.640', '20090504 18:19:35.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (904, N'S26L', N'0Q0L', '20091103 22:06:03.950', '20100722 20:40:42.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (905, N'VHOT', N'BD30', '20080522 09:13:49.350', '20081121 18:55:51.880', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (906, N'K1B0', N'8BYF', '20070108 12:21:45.750', '20070901 01:15:10.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (907, N'LIVZ', N'E5KS', '20070830 13:28:50.610', '20070916 07:06:59.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (908, N'W8G6', N'GRBP', '20080604 06:42:58.830', '20081031 02:59:00.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (909, N'TGHK', N'TBR2', '20071216 19:37:16.530', '20080820 19:22:16.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (910, N'H5UN', N'D8AZ', '20080112 06:23:34.550', '20080418 07:06:19.620', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (911, N'BV3S', N'V6WQ', '20070625 02:31:17.720', '20071109 16:33:39.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (912, N'8OCG', N'LE76', '20071002 05:07:15.910', '20080703 12:29:23.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (913, N'9NN', N'RKMG', '20080103 09:14:12.750', '20081001 04:55:22.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (914, N'VFUS', N'8VMN', '20080405 21:49:12.110', '20080930 08:28:11.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (915, N'ZLE8', N'H878', '20070816 23:26:51.170', '20080527 19:42:24.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (916, N'FOI1', N'V7O5', '20081001 06:20:54.020', '20081231 06:24:24.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (917, N'NSDJ', N'4DXO', '20080131 19:27:11.390', '20080729 18:16:01.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (918, N'KKOB', N'A2H4', '20070608 05:47:39.940', '20070610 09:29:22.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (919, N'F6G0', N'NFSU', '20081220 16:52:24.190', '20090710 19:53:12.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (920, N'RHNI', N'J53Y', '20081116 06:51:44.660', '20090625 05:17:42.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (921, N'FRRV', N'5QE5', '20080808 02:16:37.190', '20090505 23:47:37.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (922, N'M0I', N'TZOE', '20070406 17:07:42.780', '20070719 05:43:18.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (923, N'S809', N'D0CX', '20081216 00:28:35.140', '20090926 15:27:46.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (924, N'BERP', N'ZOUA', '20071231 03:46:25.460', '20080719 21:47:51.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (925, N'3JW5', N'LT05', '20090729 16:10:01.680', '20090904 10:50:40.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (926, N'016K', N'5CBY', '20090718 16:30:58.840', '20091228 10:01:07.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (927, N'VNIT', N'PIKH', '20090626 02:32:51.460', '20100409 02:42:14.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (928, N'IG83', N'V54A', '20070210 15:09:37.920', '20070416 12:18:28.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (929, N'09WT', N'VSHL', '20071221 22:01:48.840', '20080806 11:32:44.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (930, N'JJ4Q', N'TI56', '20071229 15:14:53.040', '20080908 01:35:16.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (931, N'323R', N'IG6E', '20070821 18:42:26.470', '20080524 09:58:46.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (932, N'2KI5', N'YYWY', '20070418 13:16:10.590', '20070624 22:25:51.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (933, N'1S62', N'DVK8', '20070216 02:40:27.800', '20070915 14:19:16.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (934, N'KAN8', N'NCDH', '20070719 04:02:49.880', '20080221 19:53:02.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (935, N'L8KD', N'K5H4', '20080804 12:31:19.180', '20090107 04:01:14.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (936, N'AXS8', N'1CU7', '20071202 08:24:22.280', '20080521 21:29:26.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (937, N'W443', N'REMV', '20070329 12:50:33.840', '20070727 05:59:25.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (938, N'Q8WB', N'A2JQ', '20080202 13:29:20.710', '20080614 15:19:05.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (939, N'H30G', N'YTGE', '20070822 02:26:58.090', '20080106 23:35:12.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (940, N'DTR1', N'YK1U', '20080308 19:42:43.490', '20081113 21:04:18.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (941, N'VSR4', N'5GQO', '20090312 01:20:22.220', '20090611 06:43:43.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (942, N'72DM', N'31ZJ', '20080818 17:42:55.410', '20090614 11:28:48.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (943, N'L974', N'VTLY', '20070511 04:54:32.490', '20070824 03:41:14.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (944, N'S3TP', N'YVHP', '20070414 23:27:26.090', '20070620 02:10:26', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (945, N'48PO', N'DCZC', '20091206 05:26:51.350', '20100531 07:09:51.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (946, N'7994', N'PCTX', '20080425 14:58:58.750', '20080618 20:28:17.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (947, N'FQHV', N'F14T', '20071011 11:49:05.800', '20071113 06:22:20.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (948, N'8OCG', N'YLQI', '20080307 20:48:04.340', '20081111 12:29:59.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (949, N'IWNI', N'DIZG', '20090203 11:24:26.740', '20090211 03:13:10.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (950, N'DQ8Z', N'IVS', '20080101 14:57:15.540', '20080217 16:34:33.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (951, N'VTC2', N'VKG2', '20080215 01:46:42.780', '20081102 21:30:43.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (952, N'OWEC', N'ZBKF', '20070424 03:25:15.440', '20070630 21:36:58.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (953, N'HARA', N'WH1E', '20081203 14:41:24.100', '20090327 20:06:13.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (954, N'PKCY', N'I17C', '20071006 06:13:40.840', '20071013 16:46:48.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (955, N'E4EU', N'YSDD', '20091015 02:08:56.180', '20100710 12:50:42.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (956, N'P9P1', N'RLGL', '20070518 01:17:10.670', '20071010 12:29:19.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (957, N'FOCR', N'QPJ0', '20090220 07:22:41.150', '20090915 23:20:29.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (958, N'1KHT', N'A2H4', '20080310 21:47:07.180', '20080811 20:31:45.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (959, N'43HN', N'FJYW', '20070408 05:56:02.260', '20071118 09:50:03.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (960, N'O7UF', N'5GQO', '20081103 16:42:50.510', '20081124 08:54:45.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (961, N'TP2C', N'JTYD', '20070715 09:48:54.290', '20080319 22:32:57.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (962, N'7A2Q', N'JSBH', '20070720 22:19:12.690', '20080328 18:48:31.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (963, N'MDBX', N'KZME', '20070615 08:41:09.980', '20080121 15:26:16.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (964, N'068B', N'ZR38', '20091218 04:22:23.500', '20101008 17:47:00.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (965, N'JH58', N'V5ZU', '20070524 11:41:08.070', '20070921 21:07:34.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (966, N'FRX8', N'VTUT', '20070309 13:15:07.120', '20070518 18:07:49.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (967, N'8203', N'75YM', '20070817 02:26:48.110', '20071019 22:10:08.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (968, N'2KCL', N'4HM5', '20070618 05:11:22.870', '20070811 09:02:20.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (969, N'7JDD', N'PR9R', '20090901 09:17:52.940', '20090923 04:26:57.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (970, N'S8CC', N'FEDQ', '20090914 15:02:28.890', '20100105 22:12:59.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (971, N'AY8W', N'3MFP', '20080705 17:30:20.180', '20090403 00:24:59.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (972, N'JGUT', N'UH6', '20091229 05:57:50.680', '20100214 02:56:56.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (973, N'XGO2', N'BD30', '20091017 03:20:41.860', '20100330 09:54:10.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (974, N'NX1T', N'P2GH', '20071014 21:09:40.690', '20080622 22:48:54.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (975, N'OAQ7', N'CU5U', '20090906 05:31:22.440', '20100113 22:34:00.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (976, N'PQ22', N'2PTR', '20091220 08:33:41.790', '20100917 12:18:49.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (977, N'VK89', N'Y035', '20091126 12:13:10.300', '20100921 02:02:04.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (978, N'1DGD', N'E7ZV', '20080903 01:01:09.040', '20090409 13:17:21.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (979, N'RMWR', N'MR6C', '20080124 22:19:34.110', '20080219 14:38:01.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (980, N'VBC6', N'WD3A', '20080405 01:11:02.920', '20090112 14:22:23.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (981, N'24Q0', N'R3AZ', '20081008 04:41:53.040', '20090215 03:38:47.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (982, N'744F', N'QY9', '20080420 05:44:47.120', '20080528 14:12:16.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (983, N'RXN1', N'I4OY', '20080107 03:45:11.180', '20080304 09:05:18.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (984, N'5ANG', N'DM43', '20091220 07:04:33.300', '20100619 18:58:12.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (985, N'WXAM', N'Y035', '20091113 13:28:10.270', '20100901 04:04:34.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (986, N'CW4C', N'JK5', '20070430 15:17:11.020', '20071125 12:21:48.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (987, N'BZYM', N'2GX8', '20080514 22:34:46.490', '20090123 02:19:38.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (988, N'40ZT', N'W78D', '20090512 20:26:46.970', '20091202 21:32:29.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (989, N'LXG7', N'OS1P', '20071004 01:53:53.700', '20080609 07:02:21.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (990, N'TMBF', N'S0Y4', '20080320 11:14:08.500', '20080330 15:31:55.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (991, N'8RA7', N'AYHB', '20081011 01:01:41.130', '20090701 22:08:58.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (992, N'M1C3', N'HSYO', '20090117 15:03:26.660', '20091010 09:27:40.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (993, N'YLJ0', N'UYD6', '20071028 07:33:18.450', '20080524 05:29:03.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (994, N'3IRA', N'T384', '20081017 09:44:07.580', '20090211 14:40:27.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (995, N'CATH', N'FFBV', '20070826 09:53:49.200', '20070827 22:31:22.590', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (996, N'THC9', N'MWPE', '20080823 03:01:09.530', '20090109 11:55:12.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (997, N'Y7KU', N'JIEW', '20080306 09:01:45.420', '20080524 20:02:32.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (998, N'CHOE', N'VYUT', '20070524 00:32:09', '20070911 09:54:14.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (999, N'EOPN', N'3W95', '20091121 11:46:18.020', '20100725 05:02:52.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1000, N'MC2G', N'HQLF', '20090929 16:11:44.220', '20100113 13:02:02.940', 2)
GO

--
-- Data for table dbo.ChiTietHoaDon_Jade  (LIMIT 1000,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1001, N'0ISE', N'I9BY', '20070910 12:32:10.640', '20080626 22:18:10.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1002, N'ADR', N'A2H4', '20070426 06:37:42.930', '20080129 21:20:00.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1003, N'RF80', N'8W7S', '20080706 11:30:11.400', '20090218 08:03:02.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1004, N'O8ZB', N'Y55A', '20090521 20:21:57.850', '20091202 05:00:12.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1005, N'B7AG', N'F0CG', '20090627 21:26:55.360', '20090911 16:09:34.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1006, N'D4Z2', N'12BM', '20080216 19:48:52.100', '20080918 18:33:47.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1007, N'KU0K', N'OEB4', '20070708 00:04:33.590', '20080127 11:42:48.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1008, N'71V0', N'7RDH', '20080220 17:31:43.410', '20080731 21:17:20.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1009, N'CNO5', N'4IFI', '20080130 00:42:18.400', '20080725 18:12:49.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1010, N'73KG', N'VTLY', '20091025 17:35:14.400', '20100819 00:31:53.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1011, N'PZFB', N'TRZU', '20070621 13:04:00.380', '20071115 10:27:15.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1012, N'QMJM', N'CGVE', '20070620 06:21:32.110', '20080404 10:03:08.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1013, N'6ZDF', N'O2EQ', '20070215 23:27:33.060', '20070624 05:53:45.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1014, N'SWUG', N'JWH3', '20090102 04:44:59.340', '20090831 19:27:40.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1015, N'T9GV', N'F4E7', '20070127 12:00:57.470', '20070806 05:15:58.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1016, N'VRR7', N'SJTL', '20090326 04:04:07.170', '20091022 08:20:42.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1017, N'V1TZ', N'1CU7', '20090713 18:34:01.510', '20100124 09:43:13.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1018, N'BTT8', N'6WB4', '20070626 01:36:36.690', '20070803 20:28:05.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1019, N'3HZI', N'1WWT', '20070204 14:54:13.230', '20070207 13:42:27.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1020, N'Z1H3', N'C6E6', '20070124 20:23:57.050', '20070824 08:45:46.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1021, N'YF15', N'TKEM', '20081024 14:40:20.630', '20090218 15:48:11.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1022, N'Z2Z2', N'B1UL', '20080405 06:00:01.140', '20080912 00:37:40.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1023, N'X3QT', N'GHZ6', '20090914 03:17:29.170', '20091228 02:00:00.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1024, N'U3JV', N'XGSU', '20080613 22:03:44.440', '20080625 12:55:03.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1025, N'HPX', N'491O', '20071205 14:00:47.760', '20080503 00:04:01.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1026, N'RF80', N'MPTO', '20090618 02:26:53.520', '20090623 14:57:20.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1027, N'ZPOJ', N'ZJVS', '20090303 22:24:32.230', '20090719 21:27:54.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1028, N'QXDR', N'ITDT', '20071231 17:36:34.270', '20080216 19:13:44.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1029, N'OK0Z', N'92UX', '20070219 11:15:51.490', '20071028 00:17:32.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1030, N'TNF7', N'QAKH', '20080115 02:30:12.910', '20081031 10:38:48.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1031, N'H2TQ', N'KKJQ', '20081015 23:31:56.370', '20090425 16:16:18.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1032, N'0C00', N'1PHE', '20090706 11:41:01.300', '20100110 16:07:51.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1033, N'NTNQ', N'9Y8Q', '20081012 13:14:51.020', '20090712 08:14:29.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1034, N'7GC0', N'53SM', '20080426 06:07:49.900', '20081202 01:35:59.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1035, N'UL2', N'EXZX', '20070727 12:38:52.280', '20080514 16:04:14.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1036, N'X3HV', N'H5T1', '20080614 22:04:10.110', '20081113 06:18:48.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1037, N'MB25', N'I4OY', '20091014 18:14:35.720', '20100203 06:09:14.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1038, N'K2NB', N'K3JT', '20080817 07:23:13.330', '20090127 04:05:07.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1039, N'LKPQ', N'YUG1', '20070625 09:37:37.930', '20071009 02:48:38.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1040, N'KIRA', N'WS72', '20080927 17:39:18.160', '20081213 09:30:48.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1041, N'PEPH', N'V54A', '20091023 15:12:37.430', '20091029 00:39:00.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1042, N'TAVR', N'UVTU', '20070326 05:03:03.080', '20070625 05:02:19.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1043, N'GABT', N'RR14', '20080413 19:44:28.560', '20080510 03:19:40.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1044, N'QP6W', N'SDSY', '20071209 08:18:39.310', '20080817 06:30:28.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1045, N'DBOZ', N'YGCO', '20070930 22:10:08.110', '20080312 05:04:40.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1046, N'T0CB', N'YKJF', '20080423 18:40:09.020', '20090123 12:05:51.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1047, N'D80J', N'TRZU', '20081202 15:35:53.590', '20090419 03:33:56.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1048, N'016K', N'BF5M', '20081025 02:48:19.110', '20090719 10:01:23.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1049, N'WEAF', N'ECXF', '20080920 21:43:10.110', '20090505 09:24:29.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1050, N'QKNU', N'NFSU', '20080601 05:49:42.040', '20080831 14:10:41.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1051, N'DGQE', N'LP5L', '20090209 08:27:08.020', '20091012 02:12:00.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1052, N'A9WP', N'BQYS', '20070912 07:25:08.720', '20071022 23:34:27.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1053, N'BV3S', N'UFRE', '20070419 09:37:55.760', '20070804 20:11:47.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1054, N'XSKY', N'RUMC', '20091028 15:22:20.970', '20091201 20:17:07.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1055, N'04T2', N'O4LC', '20071207 01:31:23.590', '20080920 21:13:52.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1056, N'0SLT', N'6QH9', '20090606 06:32:09.500', '20091014 21:40:30.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1057, N'2OL1', N'TXK5', '20070812 03:20:13.760', '20080201 19:20:00.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1058, N'XGO2', N'BI5D', '20070123 13:26:26.960', '20070826 19:08:00.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1059, N'IB5S', N'TTNQ', '20080617 06:21:10.090', '20080801 04:56:11.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1060, N'CCUI', N'S8ZT', '20070110 19:00:01.830', '20070322 01:12:15.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1061, N'VEIR', N'1ND4', '20081214 21:24:19.880', '20090301 21:05:53.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1062, N'XDS3', N'5CBY', '20090707 06:27:59.330', '20091210 16:29:05.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1063, N'MKJQ', N'YRR2', '20080102 06:15:51.910', '20080731 20:59:48.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1064, N'6KDW', N'EQHG', '20070115 22:12:05.490', '20070722 07:34:01.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1065, N'BFOB', N'BVRP', '20080110 18:03:18.020', '20080425 08:15:35.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1066, N'GREK', N'RXEO', '20071216 01:22:59.090', '20080830 18:19:25.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1067, N'0THI', N'2GLD', '20080906 17:06:41.090', '20080923 01:48:39.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1068, N'A1W3', N'IVS', '20081021 17:19:43.170', '20090518 04:17:47.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1069, N'CJDS', N'4HM5', '20080608 16:06:07.060', '20090213 03:23:27.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1070, N'S26L', N'Y73D', '20080813 13:56:47.370', '20080921 22:57:11.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1071, N'1AFN', N'AN02', '20090611 09:49:31.460', '20090918 02:11:28.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1072, N'KMDO', N'IBDA', '20071127 11:10:48.180', '20071229 05:38:07.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1073, N'33YZ', N'839Q', '20070101 15:58:58.750', '20070822 17:39:28', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1074, N'A5TM', N'554Z', '20080508 21:14:55.070', '20081221 04:11:40.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1075, N'NZID', N'HXBS', '20070403 05:11:19.620', '20071026 08:06:46.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1076, N'TEZT', N'YVHP', '20080801 09:37:17.540', '20080827 10:45:52.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1077, N'00BJ', N'K2V', '20091222 10:15:32.590', '20100504 21:18:00.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1078, N'NSP3', N'OG6C', '20081006 18:58:49.850', '20090308 19:29:32.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1079, N'GKH1', N'Z35T', '20070914 23:53:36.320', '20080210 07:50:23.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1080, N'QZSB', N'5OEJ', '20090812 19:20:38.740', '20100203 11:58:11.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1081, N'I1EI', N'SVNX', '20070717 10:50:59.930', '20080101 11:23:25.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1082, N'S8CC', N'OHWK', '20070510 19:36:13.120', '20071028 11:26:32', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1083, N'EZMA', N'41J8', '20090410 19:53:24.170', '20090809 09:49:15.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1084, N'FPG8', N'MF14', '20080919 05:26:09.450', '20090225 10:06:52.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1085, N'V8B3', N'4QD9', '20081204 18:03:04.890', '20090119 08:26:49.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1086, N'VFYO', N'88OG', '20080204 16:06:47.640', '20080704 16:41:52.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1087, N'XVCY', N'793Z', '20090320 02:03:05.530', '20090608 19:56:05.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1088, N'ZT1X', N'IT82', '20081214 21:52:30.060', '20090810 11:57:23.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1089, N'ARMI', N'I4OY', '20070522 04:36:26.300', '20080108 04:22:07.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1090, N'WJCM', N'7VOT', '20080220 06:06:42.780', '20080730 18:23:44.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1091, N'CW2V', N'N6K7', '20071104 18:43:56.340', '20080808 10:58:48.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1092, N'WO9Y', N'5P36', '20090922 04:48:08.750', '20100406 11:01:15.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1093, N'NUG7', N'Q8LO', '20070303 01:02:03.240', '20070628 23:08:56.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1094, N'0JMR', N'6LFZ', '20070615 14:37:36.090', '20070721 01:36:24.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1095, N'U3XU', N'V5NR', '20091013 20:14:58.290', '20100809 12:24:55.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1096, N'KDEY', N'PINY', '20070419 08:44:38.100', '20070915 08:09:56.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1097, N'EOPN', N'VSHL', '20090323 22:47:11.170', '20090919 08:02:31.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1098, N'9HF6', N'DCSP', '20080329 21:32:23.070', '20080815 19:45:39.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1099, N'ZXER', N'GHZ6', '20091128 14:15:21.290', '20100423 22:14:54.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1100, N'OLII', N'6GKZ', '20091015 20:47:09.030', '20100508 10:45:16.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1101, N'X5UL', N'VUGZ', '20090817 01:33:27.940', '20100502 10:17:12.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1102, N'D4VF', N'BCJL', '20070211 22:16:10.410', '20070928 23:16:09.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1103, N'D6L0', N'6WS4', '20070519 10:42:12.040', '20070606 06:37:57.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1104, N'3IRA', N'G7AC', '20070208 07:46:22.740', '20070814 10:27:19.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1105, N'B8D4', N'C7O', '20081220 20:00:10.580', '20091009 11:59:14.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1106, N'HARA', N'38C7', '20080315 21:16:19.840', '20081014 20:33:54.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1107, N'4LI3', N'3P75', '20070911 15:26:09.970', '20071228 05:55:00.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1108, N'VA5Q', N'PAQS', '20081210 12:23:00.700', '20090609 16:00:07.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1109, N'ANG1', N'A7BE', '20090728 10:11:01.340', '20091203 12:10:21.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1110, N'IHWE', N'P5P6', '20090506 15:54:06.050', '20100124 10:28:00.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1111, N'VQJ6', N'NHZV', '20090614 20:16:36.920', '20100408 00:22:31.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1112, N'8SXC', N'5OEJ', '20081104 08:21:23.910', '20081124 23:50:28.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1113, N'YVIU', N'CHW9', '20090510 13:32:50.650', '20090716 11:17:37.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1114, N'RVUA', N'O8BN', '20081104 11:00:31.350', '20090423 16:58:01.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1115, N'WDIK', N'ZFW0', '20090626 08:09:01.910', '20100114 13:48:51.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1116, N'2JR9', N'DVK8', '20080807 01:48:06.760', '20090301 09:39:22.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1117, N'MQ0O', N'1CU7', '20070329 10:34:35.150', '20070504 06:39:50.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1118, N'1Q6R', N'CHW9', '20090414 00:49:42.460', '20090605 10:52:57.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1119, N'2EFN', N'9MN7', '20080211 04:09:00.610', '20080701 23:07:13.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1120, N'QXHL', N'3RJC', '20091206 01:56:30.390', '20100817 15:33:44.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1121, N'QH5', N'KZII', '20080926 23:19:53.570', '20090323 22:23:21.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1122, N'E7TP', N'KRAX', '20090922 19:14:11.030', '20091209 13:51:16.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1123, N'V3R6', N'0NQ0', '20080602 12:43:16.870', '20090306 23:55:41.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1124, N'H25', N'WSFW', '20070420 09:59:24.280', '20070717 08:59:43.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1125, N'QTG7', N'B74A', '20071010 19:12:51.020', '20071211 11:58:23.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1126, N'CO1O', N'4VGH', '20090919 05:01:22.710', '20100409 15:10:13.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1127, N'V1CS', N'S5U3', '20070927 10:08:44.940', '20080428 06:29:11.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1128, N'2GD', N'1CU7', '20090719 01:21:22.660', '20100201 16:03:04.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1129, N'HL6I', N'A7KC', '20080726 00:59:56.790', '20090309 15:46:46.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1130, N'DKP2', N'S5YU', '20091214 20:26:41.530', '20100209 23:56:51.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1131, N'3JW5', N'2TBW', '20090510 10:50:06.370', '20091004 02:43:22.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1132, N'DFQE', N'69EY', '20080924 12:43:09.510', '20090716 01:32:21.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1133, N'F4OX', N'7LW6', '20081108 04:43:28.560', '20081114 21:14:39.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1134, N'SU4F', N'SN65', '20071130 03:06:27.290', '20080730 21:05:08.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1135, N'U4EN', N'9OFQ', '20091226 17:47:10.810', '20100731 01:41:00.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1136, N'XSJG', N'I4OY', '20070605 12:34:49.510', '20080130 12:07:16.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1137, N'G0N0', N'HI5Y', '20091222 08:54:01.080', '20100524 04:48:35.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1138, N'KQGF', N'OL2', '20090303 12:07:01.430', '20091022 23:21:57.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1139, N'ZXDE', N'9RM', '20090929 09:25:58.880', '20100314 22:07:38.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1140, N'VEEQ', N'1CAK', '20070921 20:46:45.040', '20080201 11:52:55.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1141, N'3JW5', N'4CBR', '20070527 00:40:37.670', '20070709 10:46:52.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1142, N'DIRR', N'JA0Y', '20070410 13:40:04.820', '20071027 03:55:58.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1143, N'693G', N'7U1Q', '20090519 11:41:28.720', '20090906 23:47:03.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1144, N'4NNF', N'SUSV', '20080115 12:42:20.250', '20081009 17:54:07.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1145, N'KN09', N'L7JE', '20080906 09:50:05.860', '20090217 18:01:13.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1146, N'GKH1', N'HIEO', '20081230 10:22:32.430', '20090913 11:08:20.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1147, N'6ZDF', N'TC8F', '20070515 15:15:18.100', '20070921 23:43:39.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1148, N'3HBO', N'1XJP', '20080427 14:01:31.890', '20081231 06:10:56.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1149, N'4OWO', N'73PC', '20071220 06:28:34.190', '20080501 11:47:33.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1150, N'QS6X', N'HSYO', '20080308 18:26:51.530', '20080610 02:45:34.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1151, N'C9B6', N'O7LP', '20070121 22:10:02.940', '20070515 01:30:06.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1152, N'6U4U', N'K206', '20091209 21:57:28.720', '20100415 21:09:34.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1153, N'C8L6', N'3H4T', '20070217 17:23:22.460', '20071211 20:38:27.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1154, N'1WZK', N'CGVE', '20091223 12:18:50.910', '20100703 06:41:11.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1155, N'4ZKQ', N'MDZ7', '20080119 21:27:15.460', '20080215 12:21:56.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1156, N'OLKY', N'BV37', '20091124 06:19:16.910', '20100523 20:25:56.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1157, N'R93G', N'A7QG', '20080910 09:32:53.550', '20090519 23:20:29.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1158, N'TOZG', N'A4WR', '20070130 00:42:47.750', '20070916 21:38:14.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1159, N'2LZQ', N'4UXA', '20090430 12:33:31.720', '20090902 22:28:56.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1160, N'FCH8', N'73PC', '20090402 14:58:47.880', '20090701 20:49:02.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1161, N'NC5G', N'BCUS', '20070620 11:07:34.900', '20080414 14:04:43.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1162, N'FRX8', N'2CZ4', '20080223 14:04:47.310', '20080920 13:51:56.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1163, N'Y7KU', N'EQHG', '20070518 11:23:03.900', '20080128 00:13:22.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1164, N'IG83', N'IT82', '20090813 13:44:19.820', '20091023 12:13:31.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1165, N'2MAG', N'M83R', '20091227 05:03:59.690', '20100422 07:44:39.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1166, N'XM9', N'HGK4', '20070921 07:33:27.410', '20070923 22:50:10.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1167, N'4ZKQ', N'Y5Z2', '20091227 03:37:55.350', '20100110 02:35:50.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1168, N'PDQZ', N'KI52', '20080611 10:26:23.350', '20081012 14:12:30.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1169, N'KOAO', N'EAOY', '20081108 17:13:20.550', '20090720 15:17:02.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1170, N'YBOD', N'IAZQ', '20090121 19:34:12.390', '20091012 01:41:35.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1171, N'BR7S', N'WRMC', '20080815 16:54:05.680', '20081008 04:50:47.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1172, N'STOB', N'DIZG', '20080125 22:27:33.730', '20080507 07:17:54.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1173, N'WDDB', N'2KN2', '20090715 15:23:43.590', '20100117 12:45:20.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1174, N'X7AZ', N'8CEI', '20070523 07:22:15.560', '20070601 11:14:19.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1175, N'800N', N'ZFW0', '20090713 01:15:52.720', '20100209 04:46:52.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1176, N'N8Y0', N'1Q2Y', '20080619 09:39:48.740', '20090324 18:27:23.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1177, N'DFQE', N'C7O', '20070507 07:32:42.310', '20080129 14:04:14.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1178, N'F8G6', N'80GS', '20070520 00:00:56.610', '20070529 06:01:34.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1179, N'3KIP', N'BVRP', '20080813 00:09:18.430', '20090324 14:58:30.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1180, N'1RUX', N'UB44', '20081010 08:50:18.590', '20090123 00:50:03.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1181, N'YL1M', N'BGM1', '20090507 13:46:04.610', '20090719 15:26:34.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1182, N'0Y2H', N'QAFE', '20090531 20:07:13.060', '20100222 00:18:16.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1183, N'GXY0', N'UEHS', '20080730 18:52:48.470', '20081003 04:15:31.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1184, N'6EBE', N'T91O', '20070520 06:33:05.260', '20070930 13:01:13.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1185, N'Y2FT', N'47D', '20091123 22:16:38.580', '20100725 22:26:45.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1186, N'VHEI', N'K9YB', '20090531 12:52:37.660', '20090620 05:33:49.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1187, N'K3DJ', N'2PTR', '20080807 19:19:47.050', '20090601 04:53:55.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1188, N'O1P5', N'V9T6', '20081115 16:24:37.660', '20090310 14:33:29.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1189, N'NRE3', N'6KNI', '20091110 05:39:11.840', '20100615 08:43:13.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1190, N'RXN1', N'XZNW', '20070202 11:27:53.890', '20070310 05:15:04.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1191, N'RCS1', N'6YJJ', '20080924 03:01:55.970', '20090708 12:46:48.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1192, N'KY6D', N'6S48', '20091123 08:11:13.330', '20100704 07:10:21.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1193, N'XXOC', N'JZ0Z', '20091102 23:33:29.710', '20100219 00:53:02.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1194, N'WC2S', N'2OAT', '20070629 18:27:10.990', '20070914 01:18:37.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1195, N'055O', N'QAKZ', '20070404 09:39:10.140', '20070815 21:48:13.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1196, N'OEAI', N'1Y7W', '20090402 10:35:50.360', '20090813 20:54:56.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1197, N'1OIQ', N'40AG', '20091123 02:17:00.930', '20100726 03:42:36.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1198, N'VRZ4', N'PW8N', '20091005 21:57:08.900', '20091114 11:33:32.560', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1199, N'Y162', N'6WS4', '20080119 07:38:20.570', '20080619 10:09:29.420', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1200, N'OAQ7', N'3JZZ', '20071218 02:16:38.450', '20080527 19:11:04.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1201, N'8MB5', N'JVDF', '20090103 06:44:37.080', '20090903 08:32:31.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1202, N'IOQT', N'9DTT', '20081203 04:48:54.750', '20081209 09:31:10.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1203, N'CZ02', N'O9IB', '20090618 20:48:11.340', '20100408 14:53:54.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1204, N'CD2Z', N'PMF8', '20081127 10:54:21.800', '20090516 10:05:59.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1205, N'IPR1', N'L8X3', '20090724 01:32:45.850', '20090901 21:54:47.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1206, N'YNYC', N'A7QG', '20081226 23:42:29.220', '20090106 18:12:13.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1207, N'4Q9J', N'H5T1', '20070528 06:33:45.120', '20080124 08:24:15.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1208, N'SIOY', N'V9T6', '20090927 10:01:06.900', '20100712 09:24:09', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1209, N'254L', N'D8AZ', '20070613 11:02:58.190', '20080320 01:54:19.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1210, N'NCTI', N'KVBM', '20090801 11:47:26.720', '20090918 17:54:33.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1211, N'9NN', N'ZOJ', '20090720 22:46:34.590', '20100219 06:21:42.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1212, N'3O89', N'2FK4', '20080424 09:31:56.940', '20081222 17:18:55.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1213, N'Z5Z3', N'YGCO', '20080618 00:33:29.330', '20080624 06:39:45.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1214, N'VMS5', N'ALVY', '20070722 03:43:13.130', '20070811 21:38:53.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1215, N'WC2S', N'VL5Z', '20091126 01:12:43.280', '20091213 05:22:28.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1216, N'58SD', N'LOUM', '20080119 15:00:21.850', '20080221 13:46:27.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1217, N'TO3B', N'86RW', '20090725 19:11:58.850', '20091218 09:36:26.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1218, N'3TT0', N'LPKF', '20091229 04:49:58.650', '20100429 11:12:10.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1219, N'F55', N'E9Y5', '20090919 15:27:41.250', '20100124 13:46:47.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1220, N'TIIB', N'22E6', '20070729 16:11:22.030', '20071103 02:10:51.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1221, N'NCA', N'EDEU', '20090212 12:13:40.360', '20090217 17:56:16.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1222, N'I2YI', N'2RN7', '20080211 11:13:17.690', '20080828 12:02:21.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1223, N'N0W4', N'DILT', '20080801 04:47:11.520', '20090223 05:29:17.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1224, N'3HZI', N'GDFX', '20081007 05:45:26.650', '20090513 10:01:58.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1225, N'3UUF', N'ALJZ', '20070430 16:32:16.420', '20080131 12:54:48.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1226, N'5JPH', N'Q6JL', '20080922 08:42:52.360', '20090130 21:40:27.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1227, N'L8HQ', N'UBIC', '20080323 22:54:04.030', '20090112 06:24:53.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1228, N'6UGS', N'ZXWH', '20090116 20:56:32.590', '20090506 11:26:44.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1229, N'ME1K', N'IG6E', '20070218 21:43:05.410', '20070813 13:26:06.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1230, N'LZNH', N'XF1Z', '20070412 14:40:02.350', '20070629 07:51:56.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1231, N'6TCI', N'XQXS', '20080727 07:22:47.820', '20080829 14:44:48.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1232, N'22N6', N'MTKM', '20070801 09:35:33.420', '20080316 02:30:43.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1233, N'JTUD', N'0SWW', '20090430 16:22:36.050', '20091004 19:52:06.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1234, N'40ZT', N'8CEI', '20070827 21:52:39.970', '20071028 19:47:27.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1235, N'ZSC4', N'B0EN', '20091007 02:05:41.510', '20100317 16:17:33.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1236, N'V1CS', N'1ZD8', '20070605 08:57:09.850', '20070811 05:55:25.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1237, N'75DZ', N'1ZA4', '20091212 23:19:01.720', '20100911 09:24:22.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1238, N'RXHA', N'4QD9', '20090902 07:58:26.680', '20100315 18:09:33.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1239, N'THOQ', N'8K2B', '20071027 05:00:19.410', '20080128 15:06:26.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1240, N'VV5N', N'TXK5', '20071128 22:34:09.360', '20080719 04:14:32.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1241, N'CB2G', N'2RQT', '20090104 06:18:52.540', '20090323 21:09:35.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1242, N'QEFM', N'7E22', '20081110 09:18:40.150', '20081119 19:29:47.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1243, N'50K8', N'IHJK', '20080605 05:21:39.470', '20081017 12:39:10.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1244, N'234L', N'MOFH', '20070411 17:51:45.110', '20070927 14:48:40.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1245, N'NIOC', N'Y7T2', '20070715 12:41:19.300', '20071114 22:53:23.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1246, N'NOG7', N'4KZP', '20070602 17:29:59.020', '20070717 19:27:53.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1247, N'R9NR', N'8ICH', '20080607 07:37:43.990', '20090110 00:30:37.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1248, N'6OVY', N'8ICH', '20090414 19:50:16.580', '20090711 03:14:09.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1249, N'6W9B', N'6XSG', '20070803 17:14:27.720', '20071001 19:56:09.830', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1250, N'1XAJ', N'4RCX', '20090315 18:38:48.300', '20090624 08:01:46.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1251, N'NMLM', N'U20Q', '20090907 15:23:51.520', '20100622 11:18:31.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1252, N'614W', N'JIEW', '20091124 21:27:02.280', '20100328 16:30:27.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1253, N'IH1W', N'BF5M', '20070117 06:29:27.640', '20070817 21:46:46.240', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1254, N'5RB6', N'4PGW', '20070623 15:26:58.540', '20070818 07:58:39.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1255, N'7W06', N'PNMO', '20081103 14:02:58.090', '20090409 01:14:48.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1256, N'RLU6', N'GCRH', '20071123 19:31:19.390', '20080106 20:30:10.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1257, N'HPW3', N'VUMU', '20070505 00:01:43.230', '20070813 04:01:53.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1258, N'68UK', N'7LJK', '20070912 15:02:44.680', '20071127 04:51:57.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1259, N'Q9NT', N'EY5J', '20080730 18:22:05.370', '20090209 21:11:11.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1260, N'WNTA', N'V5NR', '20071101 16:49:53.490', '20080529 00:14:21.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1261, N'ZV97', N'GHK9', '20071006 00:48:25.180', '20071022 11:47:21.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1262, N'7DBD', N'H878', '20080510 09:37:12.530', '20080918 20:57:31.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1263, N'ZI3O', N'D8AZ', '20090809 12:18:01.480', '20091129 19:58:03.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1264, N'RY0H', N'FT1A', '20070303 20:22:55.830', '20070922 18:02:23.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1265, N'5JPH', N'MS4', '20080106 04:24:38.900', '20080121 03:09:45.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1266, N'8MB5', N'D5JS', '20081220 13:11:01.170', '20091002 03:51:00.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1267, N'TV81', N'199X', '20081224 17:09:20.900', '20090319 21:26:50.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1268, N'2M5W', N'QAKH', '20071023 02:40:49.350', '20080623 10:52:18.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1269, N'BFOB', N'ZPEV', '20071015 01:37:31.620', '20080322 05:21:21.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1270, N'7B2E', N'TJ7N', '20090623 16:15:33.420', '20100228 23:27:04.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1271, N'0SQ3', N'JWH3', '20080206 15:41:20.130', '20080407 04:22:06.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1272, N'3CBF', N'37F0', '20091122 11:13:32.180', '20100731 15:26:53.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1273, N'T161', N'D0CX', '20090304 23:49:39.240', '20090401 20:05:44.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1274, N'UQ9C', N'KUE3', '20081022 16:53:31.890', '20090504 09:32:15.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1275, N'FW78', N'ZFLS', '20080724 09:52:29.490', '20080811 05:01:17.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1276, N'E3XS', N'6QH9', '20070405 02:55:00.200', '20080125 22:26:29.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1277, N'8RA7', N'L7JE', '20090907 05:51:38.220', '20091110 23:23:12.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1278, N'DQ8Z', N'R3UK', '20080422 10:55:26.400', '20080529 14:40:38.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1279, N'IX69', N'IF06', '20080325 17:04:07.340', '20080629 11:08:36.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1280, N'UDDS', N'60D9', '20091127 23:02:17.400', '20100716 17:26:56.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1281, N'8RA7', N'HXQ', '20070418 01:05:08.360', '20071117 21:09:50.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1282, N'0SLT', N'M5OW', '20081209 03:03:47.460', '20090704 03:10:44.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1283, N'G0GF', N'SZO3', '20080616 03:42:04.870', '20080805 15:30:35.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1284, N'1S62', N'DILT', '20071206 03:04:17.120', '20080219 05:24:20.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1285, N'W8OT', N'3CYZ', '20070804 23:16:10.840', '20071102 20:33:26.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1286, N'4TEG', N'F4M5', '20080901 09:55:45.540', '20090329 22:14:22.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1287, N'KY6D', N'B1UL', '20070716 03:06:05.770', '20070731 04:43:58.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1288, N'GSKU', N'WD3A', '20081108 00:55:37.510', '20090217 11:53:27.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1289, N'WK43', N'JNM8', '20081023 07:49:41.890', '20090516 18:32:40.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1290, N'YM31', N'V4P7', '20081114 06:34:22.120', '20090311 19:47:23.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1291, N'QB81', N'5XT7', '20070201 08:55:26.620', '20071026 01:53:33.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1292, N'0Z83', N'UM8S', '20090402 08:16:17.040', '20091016 04:32:26.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1293, N'GFS', N'QAV7', '20080203 13:36:21.300', '20080203 20:58:23.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1294, N'51I4', N'DPO7', '20091225 12:10:25.920', '20100627 14:52:06.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1295, N'6R26', N'DM43', '20070223 21:45:44.170', '20070928 16:27:12.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1296, N'6KDW', N'MDZ7', '20070827 20:41:40', '20080501 00:12:04.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1297, N'Y30P', N'UM8S', '20090402 21:00:38.670', '20091016 23:31:45.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1298, N'1CGC', N'2FK4', '20080404 08:58:43.640', '20081121 18:36:48.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1299, N'9PN', N'ZR38', '20090405 13:27:06.220', '20090906 11:38:55.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1300, N'3FVA', N'LHO3', '20080724 23:30:18.140', '20081208 19:02:23.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1301, N'BKLK', N'32OK', '20080608 00:20:38.130', '20090222 22:01:03.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1302, N'8R2R', N'IT82', '20070817 04:56:54.640', '20080515 13:38:20.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1303, N'XHV', N'8MBW', '20080701 18:12:44.950', '20090214 21:52:49.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1304, N'E897', N'DRAY', '20080210 00:58:54.310', '20080528 20:29:06.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1305, N'YQC7', N'M5E7', '20080208 02:57:28.160', '20080319 03:39:41.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1306, N'7AMU', N'QY16', '20091016 04:10:19.340', '20091121 19:51:39.300', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1307, N'LC0G', N'5QE4', '20070922 21:37:23.040', '20071227 20:24:43.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1308, N'FK7H', N'RE3O', '20080326 13:35:55.760', '20080414 12:14:31.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1309, N'66RZ', N'561Q', '20081129 05:34:29.050', '20090106 02:57:23.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1310, N'4TEG', N'JIEW', '20080801 11:07:57.880', '20090109 02:48:19.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1311, N'0L8P', N'VJM2', '20080317 13:39:41.170', '20081221 21:06:59.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1312, N'1YYB', N'52LV', '20090111 13:06:16.830', '20090315 13:21:16.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1313, N'HT3K', N'PW8N', '20090618 21:58:37.340', '20100325 17:43:22.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1314, N'7W06', N'8K2B', '20080901 19:19:47.970', '20090523 03:44:15.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1315, N'2ZZV', N'DPO7', '20070717 15:44:45.130', '20080508 03:04:31.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1316, N'LDYY', N'UVE8', '20081026 21:44:37.730', '20090213 08:36:38.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1317, N'GABI', N'O8BN', '20091124 05:55:07.670', '20100213 05:26:57.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1318, N'Y08Y', N'ZR38', '20080904 09:13:44.350', '20081011 14:33:43.390', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1319, N'B67', N'CC6X', '20090729 21:06:44.990', '20091119 21:28:58.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1320, N'7A2Q', N'7KC2', '20090505 18:28:53.360', '20090819 04:55:24.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1321, N'03OB', N'1X8X', '20080607 10:04:55.400', '20090304 23:07:03.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1322, N'234L', N'4W30', '20070216 16:13:43.380', '20071127 09:33:24.260', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1323, N'2JR9', N'73PC', '20081229 18:51:07.470', '20090206 16:19:39.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1324, N'5KE1', N'4VGH', '20081129 19:03:09.510', '20090110 09:33:58.690', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1325, N'1WZK', N'NP59', '20090523 07:20:06.790', '20100302 21:33:32.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1326, N'2GD', N'P3Z6', '20081105 07:25:03.100', '20090417 23:49:40.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1327, N'WCWJ', N'DCSP', '20081019 21:37:10.870', '20090627 18:28:31.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1328, N'LBOY', N'ZEBV', '20090310 11:39:13.320', '20090801 05:13:38.950', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1329, N'AEP1', N'6QH9', '20080829 19:07:47.710', '20090602 17:05:04.540', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1330, N'IOVM', N'DIZG', '20071128 13:10:49.490', '20080207 04:49:14.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1331, N'O5RG', N'C7O', '20080102 05:54:21.540', '20080409 22:54:45.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1332, N'BERP', N'ILB8', '20080604 20:52:54.580', '20081016 04:46:24.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1333, N'861J', N'R9TS', '20090116 21:28:20.190', '20090719 03:01:43.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1334, N'6V64', N'X52E', '20090831 17:33:49.210', '20100517 16:06:13.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1335, N'8VNJ', N'2RQT', '20080621 22:41:39.260', '20090319 19:25:54.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1336, N'R93G', N'Z0WK', '20090831 20:08:13.730', '20100430 07:31:30.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1337, N'WUH0', N'D8AZ', '20070610 08:51:02.500', '20080315 05:17:55.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1338, N'Z79I', N'FEDQ', '20070508 02:43:10.550', '20080104 19:01:29.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1339, N'6ELD', N'RP69', '20091028 00:06:48.970', '20091202 01:44:40.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1340, N'DW8M', N'CSYL', '20071019 19:05:51.500', '20071212 00:41:47.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1341, N'XP9G', N'8VMN', '20071211 12:18:22.500', '20080403 01:49:39.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1342, N'3W32', N'KF01', '20090420 13:30:10.010', '20100210 16:29:27.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1343, N'5CBO', N'R441', '20091209 19:21:08.460', '20100211 08:56:05.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1344, N'VA5Q', N'0120', '20070324 20:41:44', '20070508 15:44:21.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1345, N'U1M3', N'ZBKF', '20070830 16:54:40.940', '20080115 22:40:24.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1346, N'852S', N'0OTX', '20080120 19:49:09.790', '20080811 12:32:17.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1347, N'ML03', N'4RCX', '20091014 10:17:39.700', '20100519 10:49:05.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1348, N'22N6', N'I7ON', '20090602 18:16:33.330', '20090709 17:14:08.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1349, N'DOH4', N'00F1', '20090610 20:25:40.790', '20091216 11:47:35.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1350, N'PDNO', N'JPBV', '20080429 00:01:06.450', '20080814 07:50:34.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1351, N'CR6L', N'Y7T2', '20071003 14:46:32.340', '20080317 18:45:07.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1352, N'2FN', N'UXY4', '20070730 11:46:54.310', '20080106 08:58:02.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1353, N'4W54', N'QAKZ', '20080905 11:51:58.650', '20090101 21:07:51.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1354, N'WX7V', N'S8ZT', '20091130 18:58:12.860', '20100118 06:43:32.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1355, N'ITM', N'JYP3', '20070217 13:25:22.730', '20070802 19:55:21.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1356, N'ZI3O', N'YCDM', '20080422 08:06:54.740', '20090123 12:27:39.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1357, N'0YU1', N'B14G', '20080817 10:05:47.170', '20090407 21:18:42.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1358, N'LIVZ', N'3JZZ', '20090801 23:09:35.450', '20100204 12:18:51.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1359, N'VEOA', N'QCZD', '20080918 17:38:47.520', '20090121 22:55:35.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1360, N'SP4X', N'X5XO', '20090403 19:32:25.070', '20090927 03:50:01.880', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1361, N'GXL0', N'DLG2', '20071228 06:33:08.470', '20080323 01:23:09.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1362, N'FDXB', N'6KM7', '20080714 09:58:09.720', '20090323 15:11:05.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1363, N'080J', N'L7JE', '20090727 18:28:08.060', '20090907 19:09:28.060', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1364, N'TP7E', N'S2TY', '20080102 16:23:39.560', '20080925 22:08:10.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1365, N'KGCG', N'6JBT', '20070801 05:13:36.340', '20071002 03:53:34.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1366, N'3ELK', N'DE1H', '20091012 16:46:46.600', '20100307 16:20:36.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1367, N'WMNV', N'EADQ', '20091225 15:37:56.650', '20100623 10:19:34.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1368, N'ZQIB', N'SN65', '20091018 04:24:48.130', '20091108 01:37:09.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1369, N'GXL0', N'5CDH', '20070313 20:38:08.710', '20071231 08:18:22.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1370, N'3KIP', N'EQHG', '20071115 19:36:31.400', '20080108 19:33:01.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1371, N'JVSS', N'I4IC', '20080519 12:53:35.220', '20080927 03:18:43.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1372, N'B67', N'8KPG', '20090720 03:11:57.110', '20091206 10:25:29.320', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1373, N'19N8', N'8BYF', '20081107 09:06:55.390', '20081109 12:49:04.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1374, N'7CDQ', N'ZIKQ', '20081011 02:00:53.480', '20081209 20:47:11.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1375, N'Q4KM', N'YO9I', '20080526 06:10:30.860', '20090314 03:05:45.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1376, N'7N2P', N'ILB8', '20090216 20:34:45.400', '20091118 06:37:36.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1377, N'1D10', N'EADQ', '20070309 20:52:34.930', '20071016 00:37:19.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1378, N'3J6H', N'7359', '20081007 22:09:23.460', '20090729 00:35:18.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1379, N'NUSR', N'5CDH', '20080402 02:08:28.570', '20081022 10:53:34.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1380, N'E1C', N'MRD3', '20080503 11:30:57', '20080722 09:01:15.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1381, N'Z4AK', N'KI4X', '20090121 21:07:23.410', '20090925 13:00:36.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1382, N'AEWT', N'VIKA', '20090519 03:20:37.550', '20091219 01:14:24.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1383, N'ZOSD', N'ZBKF', '20090929 15:13:32.530', '20100611 17:26:03.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1384, N'W0I5', N'O4LC', '20070503 19:06:41.250', '20071020 09:14:30.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1385, N'DYW4', N'F8YM', '20070225 22:24:17.140', '20070918 10:04:07.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1386, N'2A86', N'I5GG', '20070605 18:07:27.220', '20080130 13:56:44.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1387, N'5TKK', N'S6EE', '20090929 09:00:55.930', '20091014 07:38:34.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1388, N'82UZ', N'YY6V', '20090216 02:30:07.330', '20090630 20:18:12.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1389, N'B68F', N'DXY7', '20090715 04:08:26.480', '20091015 20:10:53.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1390, N'9R9T', N'4KZP', '20070302 14:34:44.520', '20071222 06:58:15.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1391, N'B5PD', N'OF2U', '20080115 10:02:26.550', '20080123 10:12:49.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1392, N'TGHK', N'9DTT', '20071108 09:41:27.060', '20080208 16:59:04.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1393, N'XD26', N'PFCI', '20080818 09:04:23.040', '20081212 20:05:54.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1394, N'610I', N'UVE8', '20070727 04:34:23.900', '20080101 21:54:39.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1395, N'BRO2', N'ZEBV', '20091022 12:32:43.040', '20100716 23:18:39.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1396, N'NPP0', N'2FK4', '20090529 02:20:12.780', '20091106 10:38:35.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1397, N'VNF6', N'Z0WK', '20090923 19:02:01.950', '20100604 21:20:00.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1398, N'1RUX', N'YY6V', '20081208 02:57:28.900', '20090314 10:47:56.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1399, N'PKCY', N'TKEM', '20090823 15:28:07.660', '20100602 11:50:47.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1400, N'DFQE', N'MDZ7', '20071118 00:07:54.340', '20080905 06:19:49.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1401, N'3J6H', N'N1B0', '20080126 04:11:13.150', '20080219 02:12:44.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1402, N'0NF5', N'C7O', '20091227 05:52:51.570', '20100711 09:11:56.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1403, N'DIRR', N'C00K', '20090322 21:38:24.620', '20090506 08:55:46.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1404, N'RAZD', N'LTTB', '20080727 00:49:09.380', '20081208 16:14:35', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1405, N'09WT', N'1CU7', '20091210 11:07:31.230', '20100913 04:31:52.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1406, N'CH4F', N'PWTT', '20080315 11:34:35.240', '20080411 08:19:38.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1407, N'FJAE', N'MPTO', '20080921 02:39:58.930', '20090225 20:08:59.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1408, N'BNYZ', N'QY16', '20091125 09:51:05.170', '20100123 00:20:41.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1409, N'2OL1', N'TP4W', '20080707 12:47:42', '20080902 03:37:47.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1410, N'F8Q7', N'0QKV', '20071231 16:50:37.340', '20080710 13:17:45.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1411, N'5WQ2', N'KUE3', '20080214 11:14:19.810', '20080410 11:50:21.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1412, N'DTR1', N'3W95', '20091109 11:56:23.710', '20100706 20:43:24.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1413, N'XXOC', N'Y56U', '20080501 21:01:06.880', '20090209 01:25:18.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1414, N'7GC0', N'3JRV', '20070519 06:07:50.520', '20070703 13:54:21.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1415, N'G5U', N'DCSP', '20070313 22:25:01.660', '20071029 14:49:26.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1416, N'1S62', N'IES1', '20080810 03:12:30.920', '20090129 00:08:46.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1417, N'F55', N'73PC', '20081014 18:44:37.200', '20090807 21:45:02.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1418, N'CD2Z', N'X52E', '20090326 23:21:26.800', '20090915 09:54:58.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1419, N'IQ8T', N'D2FT', '20071107 17:59:22.410', '20080109 12:04:03.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1420, N'1KHT', N'PAQS', '20070226 11:06:09.120', '20070629 13:56:51.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1421, N'QXDR', N'LIMP', '20070114 07:45:50.660', '20070525 08:42:03.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1422, N'77FL', N'F8YM', '20071109 13:07:49.310', '20071224 14:01:23.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1423, N'66RZ', N'F4E7', '20070406 00:16:21.650', '20071120 05:26:17.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1424, N'MHRP', N'0QWV', '20070112 06:03:24.180', '20071106 01:20:08.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1425, N'BR7S', N'QSVV', '20091031 09:34:04.850', '20091216 09:20:13.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1426, N'L3PN', N'86RW', '20070713 03:12:08.160', '20070820 10:19:39.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1427, N'ZYBL', N'K115', '20071202 18:07:34.070', '20071225 14:19:35.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1428, N'DYW4', N'DSJI', '20080414 04:32:31.490', '20080904 14:54:25.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1429, N'PNEA', N'05M', '20081219 13:28:10.450', '20090321 21:28:32.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1430, N'6S4A', N'VYUT', '20081228 03:50:18.080', '20090507 16:27:11.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1431, N'7LJU', N'JYP3', '20090526 01:32:43.450', '20090615 09:17:37.510', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1432, N'FCP7', N'F8OA', '20080331 17:55:06.030', '20080802 13:49:24.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1433, N'AY8W', N'DSJI', '20090214 06:41:15.810', '20090225 12:44:32.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1434, N'E41F', N'K9YB', '20070517 02:00:34.220', '20071214 04:33:46.170', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1435, N'OM2B', N'ZOUA', '20070409 07:19:43.850', '20070604 06:48:31.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1436, N'0HWY', N'7KC2', '20090125 15:14:31.840', '20090317 03:48:40.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1437, N'73LE', N'K2V', '20070227 05:42:12.930', '20070815 16:18:38.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1438, N'ANG1', N'E04B', '20080305 14:24:23.140', '20080704 01:11:29.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1439, N'BFOB', N'ML1M', '20070524 07:59:10.030', '20071203 04:42:39.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1440, N'LQHG', N'PR9R', '20081212 10:49:41.910', '20090608 01:44:29.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1441, N'GURU', N'V8GU', '20080913 15:27:28.290', '20081203 17:47:45.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1442, N'YJL1', N'1FRY', '20091103 23:09:50.760', '20100718 07:17:53.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1443, N'DZLE', N'554Z', '20070812 13:42:25.330', '20071029 16:40:25.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1444, N'19N8', N'CU5U', '20080715 11:17:49.140', '20090201 06:53:08.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1445, N'CIB3', N'KZME', '20090116 03:20:24.710', '20090911 19:07:55.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1446, N'82QB', N'KQY1', '20080306 22:06:02.850', '20080514 13:29:26.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1447, N'REK3', N'BD30', '20090708 12:40:20.190', '20091025 15:33:47.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1448, N'5CHJ', N'LTTB', '20080402 02:56:32.510', '20080612 06:11:34.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1449, N'72DM', N'I17C', '20070516 06:09:22.230', '20071231 07:05:14.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1450, N'5OJ2', N'HXQ', '20080314 09:20:12.120', '20080617 23:09:54.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1451, N'MSBM', N'V8GU', '20070815 07:35:35.580', '20080126 12:53:34.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1452, N'UUV3', N'1YKM', '20070630 19:40:35.140', '20070920 11:25:03.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1453, N'431J', N'MDZ7', '20080201 08:58:06.480', '20080305 22:43:54', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1454, N'QERL', N'4KZP', '20090628 04:21:58.540', '20091204 21:53:56.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1455, N'D4Z2', N'0PCN', '20071104 16:22:03.670', '20080413 21:37:47.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1456, N'951I', N'7KZY', '20070319 15:03:23.830', '20071223 12:11:22.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1457, N'K9JD', N'XF1Z', '20090923 05:36:29.910', '20100618 03:45:40.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1458, N'ABY6', N'B0EN', '20090311 15:35:00.430', '20090427 07:35:39.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1459, N'68KL', N'V6WQ', '20080925 15:15:04.540', '20081223 06:54:22.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1460, N'UKCD', N'TC8F', '20090531 07:55:23.070', '20100124 18:12:13.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1461, N'UHUR', N'6DVJ', '20070414 17:27:01.160', '20070418 18:00:04.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1462, N'G0VL', N'8P8O', '20070609 22:07:27.430', '20070624 05:14:35.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1463, N'D6L0', N'QPJ0', '20071207 20:22:54.720', '20080830 02:52:09.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1464, N'51I4', N'XGSU', '20090710 08:57:23.920', '20100221 11:10:36.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1465, N'4NER', N'I9R0', '20080806 15:17:53.890', '20090125 04:00:09.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1466, N'IR5Q', N'4Z84', '20091114 17:19:13.790', '20100704 22:00:57.810', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1467, N'EOPN', N'QLVW', '20070926 05:15:07.900', '20080511 07:58:53.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1468, N'86TK', N'EN1A', '20071217 19:00:32.650', '20080227 20:51:32.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1469, N'A0V1', N'3W95', '20070209 22:48:06.670', '20071126 07:05:50.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1470, N'7R4K', N'5BOE', '20080216 07:10:29.820', '20080813 11:00:46.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1471, N'O4B6', N'YLQI', '20080613 21:30:17.980', '20080616 07:50:08.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1472, N'VGL8', N'TJ7N', '20070812 04:20:14.050', '20080204 20:33:33.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1473, N'AQYZ', N'AFDW', '20081103 15:22:16.770', '20090810 05:12:19.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1474, N'PYJK', N'NS7I', '20081125 07:09:40.510', '20090529 10:19:34.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1475, N'IX4T', N'TXFL', '20080613 19:38:40.830', '20080725 20:09:07.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1476, N'QF0L', N'KC4G', '20070312 08:35:59.910', '20070903 01:24:10.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1477, N'7IBQ', N'9QXE', '20070330 23:25:23.980', '20071222 21:20:58.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1478, N'0KEQ', N'1Y74', '20080920 12:58:32.520', '20081017 22:33:09.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1479, N'QF0L', N'GZTR', '20071227 02:42:59.480', '20080224 06:12:13.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1480, N'G95F', N'6E3O', '20080826 11:28:02', '20090530 19:50:48.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1481, N'5K9O', N'WZJC', '20080104 14:31:47.970', '20080820 18:45:53.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1482, N'1336', N'XZ4O', '20090831 15:11:01.560', '20100510 08:08:02.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1483, N'OVC7', N'W78D', '20071130 22:23:09.250', '20080702 07:49:12.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1484, N'BLXC', N'JK5', '20071008 04:07:58.330', '20080730 22:18:38.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1485, N'IPVC', N'0QWV', '20080515 20:14:42.500', '20090206 03:33:38.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1486, N'5K9O', N'HI5Y', '20081126 05:52:08.300', '20090722 21:52:35.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1487, N'X7O1', N'T41U', '20070301 08:56:59.540', '20070530 15:05:31.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1488, N'DYOF', N'8VMN', '20090819 02:19:17.270', '20100117 14:50:36.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1489, N'VR4W', N'JI8O', '20090712 09:38:30.550', '20090831 06:55:59.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1490, N'UHU5', N'S5YU', '20070121 16:16:20.010', '20070408 18:37:10.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1491, N'AIA5', N'A4QV', '20090504 09:38:01.930', '20090726 00:03:01.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1492, N'1YYB', N'8GJP', '20071218 14:07:12.510', '20080419 08:43:00.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1493, N'5Y8F', N'JIEW', '20090609 23:09:18.610', '20090711 18:17:08.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1494, N'RXHA', N'SZO3', '20071224 00:03:46.970', '20080903 10:30:27.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1495, N'VV63', N'JWH3', '20080830 17:22:40.740', '20090220 07:44:26.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1496, N'0047', N'MMZU', '20080406 17:20:00.860', '20080612 12:33:11.160', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1497, N'GABT', N'B0EN', '20081128 02:46:56.040', '20090914 04:25:45.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1498, N'20OC', N'7RDH', '20080202 04:45:01.410', '20080703 05:29:50.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1499, N'JAWW', N'V6WQ', '20091208 19:59:55.260', '20100107 02:53:00.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1500, N'5ANG', N'FDA8', '20090303 10:01:10.920', '20090309 21:06:58.450', 1)
GO

--
-- Data for table dbo.ChiTietHoaDon_Jade  (LIMIT 2000,500)
--

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1501, N'0CFI', N'TXK5', '20070612 16:50:54.940', '20071031 05:30:33.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1502, N'6V64', N'X52E', '20080722 17:39:47.530', '20080828 18:42:15.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1503, N'PTUA', N'I7GI', '20080222 04:08:25.840', '20080513 23:05:44.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1504, N'W03', N'BR7C', '20090329 22:58:52.420', '20090518 20:04:28.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1505, N'QS6X', N'JK5', '20090930 11:49:54.140', '20100101 15:19:47.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1506, N'BWM6', N'1ND4', '20070104 03:15:21.530', '20071018 16:20:01.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1507, N'DGQE', N'RHEY', '20080826 04:18:18.380', '20081206 06:12:44.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1508, N'UJSG', N'YP3N', '20090308 01:48:25.980', '20090803 12:24:20.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1509, N'744F', N'ALVY', '20080115 08:43:17.700', '20080512 01:44:50.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1510, N'1CWJ', N'HQLF', '20070826 07:46:03.760', '20080607 20:13:38.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1511, N'HO60', N'XZ4O', '20091219 15:37:59.850', '20091231 14:50:24.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1512, N'U17F', N'VBET', '20080103 16:37:57.390', '20080831 05:12:32.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1513, N'IOVM', N'UR2X', '20080316 12:52:00.940', '20081229 01:23:26.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1514, N'FSTI', N'P311', '20070131 03:47:02.530', '20070522 11:03:35.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1515, N'7AJW', N'WS72', '20080527 17:23:35.090', '20080605 23:26:21.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1516, N'CR6L', N'8KPG', '20070814 02:15:59.600', '20071005 09:52:02.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1517, N'4TEG', N'CIZ8', '20090709 23:44:18.180', '20091017 21:25:23.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1518, N'67BI', N'7KZY', '20070302 16:14:56.390', '20071127 04:33:32.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1519, N'XQI3', N'WH1E', '20080225 12:42:41.420', '20081111 07:36:59.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1520, N'WXAM', N'0KI3', '20090910 09:25:45.590', '20100501 06:07:34.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1521, N'7994', N'BWFF', '20090916 08:22:14.250', '20100205 06:55:27.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1522, N'8P26', N'HSYO', '20080207 02:55:50.640', '20080423 17:08:18.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1523, N'P0D', N'VP80', '20080606 09:22:02.100', '20080628 13:55:34.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1524, N'LKPQ', N'BQN1', '20070120 06:31:46.650', '20070820 12:28:41.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1525, N'CHOE', N'VAFX', '20081013 21:32:27.890', '20090118 10:57:46.400', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1526, N'CONZ', N'QAV7', '20070628 07:23:05.470', '20071224 23:07:09.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1527, N'DZUR', N'AIPO', '20080303 05:10:55.440', '20080726 02:16:26.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1528, N'3B61', N'I95C', '20071112 15:18:29.790', '20071207 18:41:53.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1529, N'6ZZC', N'4863', '20070328 13:46:59.760', '20070409 02:35:09.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1530, N'U8OI', N'77J5', '20070310 02:18:39.970', '20071210 07:35:57.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1531, N'BNYZ', N'8MBW', '20080413 05:49:03.870', '20081014 20:58:25.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1532, N'VLQ8', N'1X8X', '20090225 18:40:22.580', '20090620 15:51:09.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1533, N'EMHB', N'6XFQ', '20081012 16:58:37.270', '20090806 19:40:09.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1534, N'6W9B', N'10VV', '20081024 16:41:48.560', '20081216 09:05:16.510', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1535, N'02GY', N'CHW9', '20080316 18:37:07.060', '20080731 14:20:15.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1536, N'9NN', N'ZR38', '20090613 20:52:00.440', '20091223 00:03:38.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1537, N'BV3S', N'GC7B', '20080710 11:02:35.710', '20081227 09:02:18.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1538, N'132F', N'KXXU', '20080901 23:24:16.840', '20090213 11:44:44.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1539, N'6G5K', N'00F1', '20080107 16:18:04.190', '20080729 06:58:52.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1540, N'11NX', N'Z9HB', '20080512 16:59:20.960', '20090215 11:13:37.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1541, N'5QUJ', N'PWKZ', '20070403 01:33:49.920', '20070817 15:39:52.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1542, N'G94P', N'UR2X', '20071224 07:08:33.570', '20080822 02:41:11.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1543, N'A1Y4', N'Y7T2', '20080804 17:35:59.560', '20080907 13:05:46.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1544, N'LH2V', N'1FRY', '20081117 01:52:26.790', '20090119 10:42:22.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1545, N'67BI', N'UHDP', '20070202 00:38:20.170', '20070408 03:46:46.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1546, N'D6L0', N'F4WI', '20080501 17:00:04.540', '20080920 18:50:30.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1547, N'FOI1', N'E7WI', '20091003 01:15:11.570', '20100215 07:19:34.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1548, N'GXY0', N'UBIC', '20090510 19:22:16.070', '20091217 07:13:34.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1549, N'QVFP', N'WD3A', '20090728 06:40:11.880', '20100330 11:04:07.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1550, N'GB4O', N'ACJY', '20080118 15:06:41.130', '20080518 21:52:24.570', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1551, N'5IA3', N'9OFQ', '20080927 17:35:42.690', '20090621 15:07:48.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1552, N'4LI3', N'38C7', '20080928 10:31:59.650', '20081018 23:52:13.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1553, N'J3CY', N'BDUP', '20091207 16:02:19.990', '20100617 21:52:51.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1554, N'DA7H', N'UHDP', '20070331 10:34:09.660', '20070705 20:45:27.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1555, N'NHYY', N'35YV', '20090617 01:38:56.680', '20091128 14:11:31.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1556, N'HON5', N'CIZ8', '20090505 13:55:04.310', '20090708 12:22:16.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1557, N'LPTV', N'12BM', '20070216 08:17:45.430', '20070303 04:46:42.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1558, N'RVWT', N'5OEJ', '20080202 21:36:39.190', '20080721 10:37:04.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1559, N'8SXC', N'GZTR', '20070617 01:26:24.520', '20080225 09:06:43.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1560, N'6ZDF', N'SN65', '20090405 04:26:48.670', '20091104 16:12:38.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1561, N'ERB2', N'R441', '20081101 22:04:26.090', '20090324 14:03:36.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1562, N'F4PN', N'9K9A', '20071015 12:59:48.580', '20071231 11:30:51.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1563, N'7N2P', N'UHDP', '20081211 12:01:26.210', '20090427 09:49:12.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1564, N'V3OC', N'38C7', '20071108 06:24:37.730', '20080329 18:08:54.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1565, N'LRY6', N'8MB2', '20090514 01:56:59.890', '20090823 23:15:13.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1566, N'610I', N'VS3Z', '20071024 20:57:37.270', '20080508 22:59:16.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1567, N'11PV', N'OSYO', '20090322 23:39:20.130', '20091120 09:32:23.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1568, N'UQ9C', N'T9CQ', '20090522 20:10:12.380', '20100112 16:18:10.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1569, N'PN7V', N'C0D3', '20081115 09:09:55.480', '20090816 20:43:20.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1570, N'FW78', N'X0B4', '20081213 20:31:34.650', '20090409 23:22:44.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1571, N'FCH8', N'SI0H', '20090202 15:13:23.900', '20090804 00:49:45.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1572, N'SW19', N'S8ZT', '20071108 00:20:01.330', '20080630 09:40:39.980', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1573, N'72VU', N'7KZY', '20090222 23:56:52.200', '20090429 21:34:41.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1574, N'THC9', N'XA5I', '20091014 19:43:20.460', '20100722 20:23:22.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1575, N'X5UL', N'B14G', '20090610 07:51:55.660', '20090914 14:27:43.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1576, N'GB4O', N'I4OY', '20080924 01:13:40.680', '20090412 04:14:16.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1577, N'HG3O', N'JVDF', '20090704 09:19:51.080', '20090816 04:02:32.730', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1578, N'5WEQ', N'UEHS', '20090720 07:29:35.320', '20100405 03:13:13.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1579, N'UYQX', N'I4IC', '20091218 05:53:26.480', '20100514 08:41:55.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1580, N'22N6', N'GHZ6', '20070615 04:32:23.350', '20080224 16:07:17.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1581, N'JP18', N'CB7S', '20070925 06:07:53.900', '20071108 15:47:35.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1582, N'693G', N'GZTR', '20081023 09:48:39.370', '20090604 19:02:52.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1583, N'X8L2', N'LSP6', '20080416 08:38:17.920', '20080705 07:37:47.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1584, N'UE0B', N'TUHX', '20090309 22:40:18.640', '20090916 04:42:45.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1585, N'GD1J', N'XMX3', '20080611 08:42:57.280', '20080619 16:28:09.890', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1586, N'8BES', N'52QR', '20090715 19:17:04.230', '20091226 21:06:13.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1587, N'ZRY6', N'QTL4', '20090321 02:38:02.590', '20091029 17:58:18.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1588, N'766Y', N'CNE5', '20080715 06:24:27.600', '20090201 22:54:43.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1589, N'0C00', N'Y0RQ', '20090509 15:02:51.880', '20091113 18:53:45.520', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1590, N'L6W5', N'ZY4V', '20081111 04:42:02.750', '20090123 01:58:00.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1591, N'C6RG', N'YKJF', '20090428 12:34:15.010', '20091022 19:16:56.610', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1592, N'5WQ5', N'A7BE', '20070608 13:25:56.520', '20070608 22:25:15.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1593, N'B8D4', N'3P75', '20080318 21:57:52.320', '20081016 02:38:02.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1594, N'SYQW', N'76GJ', '20081003 11:51:15.530', '20090720 14:46:14.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1595, N'6WPC', N'8CEI', '20090710 18:54:54.880', '20091123 21:10:02.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1596, N'PAHC', N'G47T', '20090618 12:34:01.340', '20090817 04:09:01.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1597, N'TOZG', N'073S', '20090111 19:07:07.360', '20090426 16:52:00.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1598, N'K8HM', N'V4P7', '20070928 11:11:21.830', '20080406 18:56:53.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1599, N'IW0K', N'SZO3', '20090705 23:55:26.900', '20100324 11:27:09.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1600, N'994O', N'YJRS', '20090410 03:40:42.900', '20090925 04:47:30.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1601, N'GXVH', N'QY9', '20090208 17:20:44.420', '20090827 09:18:07.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1602, N'LFQU', N'L8X3', '20070514 05:04:59.180', '20071130 15:01:24.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1603, N'K9JD', N'IF06', '20070626 10:12:20.590', '20080227 10:30:14.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1604, N'CVOE', N'ZIKQ', '20070815 10:08:37.230', '20071221 11:41:23.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1605, N'NX6R', N'INSL', '20081214 23:53:17.240', '20090810 21:02:40.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1606, N'VNIT', N'I5GG', '20071121 17:15:41.350', '20071223 05:27:09.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1607, N'QD57', N'VPAM', '20090805 10:35:07.450', '20100417 02:17:33.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1608, N'33YZ', N'ED4U', '20070223 20:18:59.530', '20070923 01:29:29.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1609, N'TX8G', N'JZEI', '20071021 02:42:14.010', '20071021 06:17:44.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1610, N'77FL', N'M6IB', '20070924 00:25:16', '20080614 09:57:16.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1611, N'CATH', N'TKEM', '20091101 04:35:13.240', '20091122 08:19:44.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1612, N'BTT8', N'6YJJ', '20070730 00:48:10.120', '20070924 01:33:30.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1613, N'2KMJ', N'OSYO', '20080215 15:43:12.710', '20080309 01:55:09.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1614, N'I8IP', N'0B1T', '20070102 20:54:01.160', '20071028 16:59:26.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1615, N'JTKR', N'GSHS', '20080711 22:18:54.760', '20081228 00:25:03.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1616, N'93FD', N'A7KC', '20070110 12:15:46.710', '20070816 19:00:44.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1617, N'D80J', N'OSTO', '20090630 04:21:30.670', '20100423 03:53:05.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1618, N'766Y', N'0GND', '20091003 13:21:07.580', '20100607 05:06:27.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1619, N'UEYL', N'5FLX', '20090528 21:41:40.450', '20091010 01:40:45.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1620, N'URMC', N'37F0', '20091029 06:39:55.670', '20100624 02:09:01.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1621, N'DYW4', N'554Z', '20080804 18:19:34.690', '20090506 05:00:58.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1622, N'GZ4M', N'BGM1', '20070908 17:14:52.520', '20071019 10:37:40.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1623, N'FWXJ', N'VAFX', '20070114 05:07:20.490', '20070301 21:24:26.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1624, N'GD1J', N'C0D3', '20070105 04:27:52.720', '20070725 18:45:20.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1625, N'40ZT', N'YF7X', '20090817 07:57:19.640', '20100414 04:05:48.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1626, N'CIB3', N'IEIF', '20080828 01:47:27.380', '20090226 02:24:30.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1627, N'9YIR', N'OXND', '20090821 02:22:09.020', '20090914 07:02:38.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1628, N'0Z83', N'0B1T', '20070523 12:05:36.670', '20070807 06:48:27.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1629, N'JJ4Q', N'PAQS', '20070407 00:48:25.580', '20070829 23:13:21.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1630, N'SCLR', N'V79', '20091222 19:17:54.330', '20100128 10:18:43', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1631, N'X3PM', N'HXQ', '20090912 06:06:33.320', '20091216 11:22:16.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1632, N'RTRP', N'OS1P', '20081006 22:08:29.240', '20090307 09:05:40.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1633, N'BEKS', N'12BM', '20070115 07:34:08.410', '20071108 15:46:04.840', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1634, N'58SD', N'JW1L', '20070910 02:12:43.580', '20080615 03:54:25.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1635, N'T8W4', N'PWTT', '20080505 11:11:38.940', '20080629 06:49:10.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1636, N'Y8UU', N'RKMG', '20070515 01:02:54.720', '20071006 00:46:11.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1637, N'ZOSD', N'YK1U', '20080429 23:36:18.780', '20090202 08:32:39.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1638, N'KQMW', N'MA33', '20070902 22:29:40.680', '20080511 19:56:24.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1639, N'N3YC', N'BDV8', '20070326 22:47:01.390', '20071203 07:40:05.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1640, N'6ZTL', N'GAJ6', '20070722 15:27:15.930', '20080424 11:01:01.530', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1641, N'IG83', N'9FZA', '20091210 08:41:56.790', '20100707 18:48:40.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1642, N'0XJZ', N'CDU', '20090126 06:19:03.060', '20090206 16:28:49.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1643, N'YM31', N'TI56', '20070926 03:42:13.590', '20080414 16:36:59.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1644, N'I9O9', N'C6E6', '20080816 14:37:35.880', '20090328 08:56:30.080', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1645, N'6R26', N'6GKZ', '20090110 00:06:49.520', '20090302 17:38:17.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1646, N'KCKP', N'RIPB', '20080930 11:46:04.890', '20090129 17:43:27.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1647, N'IX4T', N'MEAF', '20090422 21:42:43.810', '20100125 20:30:06.760', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1648, N'A275', N'3HRB', '20080317 01:03:51.150', '20081015 09:38:36.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1649, N'5ANG', N'R441', '20070325 13:32:20.770', '20070724 14:21:11.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1650, N'5KE1', N'XZNW', '20090701 06:39:08.160', '20100204 02:09:18.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1651, N'C9B6', N'RSH7', '20091219 08:12:30.670', '20100220 00:15:57.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1652, N'GB4O', N'ZJVS', '20090410 05:45:59.790', '20090915 11:45:33.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1653, N'37AR', N'PCU1', '20080501 13:29:41.380', '20080627 17:16:08.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1654, N'CW2V', N'PW8N', '20090906 17:15:31.240', '20090930 09:18:09.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1655, N'0JBB', N'T56R', '20070906 09:21:08.210', '20080317 23:46:33.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1656, N'BR7S', N'F6SF', '20080603 00:05:51.890', '20081108 22:40:28.140', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1657, N'3TT0', N'PNMO', '20070430 23:57:38.680', '20071001 17:36:59.500', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1658, N'NRH7', N'5RT5', '20070622 05:44:27.860', '20070805 15:44:54.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1659, N'4ZKQ', N'0YDC', '20071229 02:11:17.590', '20080704 07:35:36.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1660, N'31LO', N'0C10', '20070419 22:05:49.860', '20070615 18:38:10.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1661, N'G09J', N'T8P5', '20080401 14:53:32.330', '20080408 22:24:32.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1662, N'MB25', N'VHQW', '20090315 22:29:30.770', '20090910 19:29:07.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1663, N'6OVY', N'PK3Y', '20091118 19:30:33.950', '20100124 02:16:09.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1664, N'K3DJ', N'OOO0', '20071029 07:24:19.680', '20080718 19:59:02.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1665, N'JA23', N'4DI7', '20080111 18:18:42.690', '20080628 22:35:00.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1666, N'H3BB', N'554Z', '20080126 06:26:43.990', '20080713 23:14:05.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1667, N'4QOB', N'5OEJ', '20070715 17:14:01.700', '20070912 09:47:26.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1668, N'ZJTT', N'52QR', '20070608 13:30:29.130', '20070721 22:00:45.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1669, N'73LE', N'ACJY', '20080829 09:42:22.230', '20090430 10:10:17.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1670, N'0XJZ', N'P7DQ', '20080228 21:16:00.040', '20080324 23:38:52.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1671, N'JNUW', N'BVAE', '20080911 12:39:27.940', '20090509 10:28:06.410', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1672, N'0CFI', N'2DTQ', '20081028 05:51:49.980', '20081212 07:56:41.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1673, N'FDXB', N'PFCI', '20090710 14:34:06.180', '20100501 21:26:22.840', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1674, N'CB2G', N'PW8N', '20081107 06:14:24.520', '20090413 14:39:44.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1675, N'03OB', N'TXK5', '20091118 21:57:58.890', '20091217 07:20:21.870', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1676, N'LPTV', N'SZXN', '20090709 12:00:31.630', '20100329 12:32:10.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1677, N'73AT', N'IHJK', '20091213 13:32:38.940', '20100501 18:00:41.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1678, N'NUSR', N'JW1L', '20080529 14:29:44.620', '20080929 12:27:57.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1679, N'LFO5', N'5CDH', '20071226 04:21:03.210', '20080524 01:07:04.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1680, N'ZNSL', N'6T1V', '20071117 20:11:14.750', '20080315 10:22:22.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1681, N'3CBF', N'VS3Z', '20090507 04:04:43.570', '20091127 05:54:24.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1682, N'6EBE', N'LCZD', '20080606 01:18:17.860', '20080925 21:24:02.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1683, N'DBNF', N'95Q1', '20070228 22:33:15.900', '20071110 16:27:16.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1684, N'NHYY', N'R9OY', '20071006 18:09:17.420', '20080520 21:04:04.180', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1685, N'BWGU', N'38C7', '20070104 11:05:23.650', '20071005 10:02:46.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1686, N'9BS3', N'I9BY', '20070605 00:20:33.520', '20080127 23:36:44.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1687, N'KGCG', N'Z35T', '20070608 08:38:47.860', '20070910 15:49:32.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1688, N'NJ5P', N'BMDB', '20070510 14:18:37.180', '20080208 06:27:56.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1689, N'831K', N'Q9A', '20070104 16:51:35.360', '20070331 04:07:53.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1690, N'HZDC', N'ACJY', '20091202 11:05:47.050', '20100616 08:08:43.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1691, N'36FB', N'1YKM', '20070115 01:05:16.030', '20071101 07:09:13.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1692, N'SHVC', N'SKWM', '20071109 17:51:50.910', '20080630 16:47:45.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1693, N'F6G0', N'L4F7', '20090904 20:18:23.100', '20091107 12:20:48.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1694, N'CCUI', N'B14G', '20091207 00:41:11.540', '20100619 13:01:56', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1695, N'H245', N'N7TU', '20090421 00:33:43.600', '20100115 12:36:30.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1696, N'7JDD', N'EADQ', '20070927 10:12:26.010', '20071027 23:19:34.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1697, N'O8ZB', N'NGC8', '20090309 10:48:29.110', '20091109 14:12:41.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1698, N'7Y67', N'53SM', '20091127 20:17:53.910', '20100723 20:37:58.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1699, N'Z58U', N'7OE6', '20070806 20:18:53.180', '20070930 10:21:30.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1700, N'9HF6', N'0XID', '20071216 17:40:05.520', '20080615 18:24:13.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1701, N'G0N0', N'M49C', '20080318 18:32:03.180', '20080520 07:56:01.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1702, N'HO60', N'HADO', '20081115 08:12:14.670', '20090707 22:29:22.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1703, N'KU0K', N'SZO3', '20090718 15:21:28.920', '20100412 23:28:20.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1704, N'CH4F', N'1YKM', '20090124 16:16:20.730', '20090430 14:42:19.960', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1705, N'WCWJ', N'MAL4', '20071020 17:59:40.210', '20080724 15:41:13.040', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1706, N'MHRP', N'PKIK', '20080222 02:20:40.690', '20080310 16:19:16.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1707, N'E3XS', N'A7KC', '20090930 15:11:53.620', '20100312 14:19:11.940', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1708, N'B7AG', N'ZIUH', '20090624 07:15:16.870', '20100110 02:36:25.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1709, N'4W54', N'VPU3', '20091018 19:17:32.350', '20100810 01:57:48.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1710, N'DQZF', N'03P0', '20080227 21:20:36.580', '20081015 11:14:23.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1711, N'N3YC', N'X4L8', '20080620 10:33:12.960', '20080710 04:39:47.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1712, N'EP1O', N'6DVJ', '20081201 09:27:54.060', '20090101 05:09:03.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1713, N'CW4C', N'0DLE', '20090627 01:23:24.660', '20100107 14:37:51.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1714, N'GH97', N'UK8Q', '20070211 06:00:02.830', '20070421 21:13:15.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1715, N'FK7H', N'4FUZ', '20071213 18:01:06.290', '20080514 12:43:47.190', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1716, N'TO3B', N'8BYF', '20091026 13:35:14.480', '20100510 01:00:30.630', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1717, N'C6XT', N'MG0V', '20090115 23:56:14.870', '20090828 03:01:51.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1718, N'FY9O', N'Y7T2', '20090213 01:21:16.530', '20090702 05:12:06.080', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1719, N'RVUA', N'LAW0', '20071025 20:18:56.030', '20080810 09:56:16.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1720, N'I2YI', N'MTQU', '20070809 17:58:09.160', '20080328 22:58:17.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1721, N'NUW3', N'69C1', '20070820 21:47:56.120', '20071104 07:24:33.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1722, N'AZ4S', N'UBIC', '20070308 02:55:24.520', '20070601 03:19:30.700', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1723, N'OMDR', N'FC25', '20070604 20:38:53.760', '20080217 17:52:52.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1724, N'24Q0', N'ZY4V', '20080926 22:36:35.190', '20081114 02:01:35.100', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1725, N'PBMX', N'N1B0', '20080214 20:10:44', '20080320 16:29:40.460', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1726, N'OIKG', N'K35S', '20071103 18:47:37.030', '20071109 17:40:22.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1727, N'CHIE', N'I95C', '20090222 09:33:26.890', '20091130 19:35:53.920', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1728, N'6FWM', N'EAOY', '20090803 13:52:54.650', '20091112 08:24:27.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1729, N'D1D0', N'2KN2', '20090719 05:40:40.920', '20100123 02:03:15.380', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1730, N'I2YI', N'FYHJ', '20090222 11:45:32.880', '20091217 08:00:48.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1731, N'G95F', N'5P36', '20070503 01:12:02.520', '20070520 22:19:29.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1732, N'Y5FG', N'D2FT', '20070116 17:14:45.030', '20070805 21:22:44.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1733, N'66RZ', N'BCUS', '20071024 18:10:51.430', '20080101 02:06:27.650', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1734, N'B5PD', N'4FUZ', '20070110 10:40:57.680', '20071005 06:42:52.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1735, N'610I', N'LOUM', '20090831 01:39:11.570', '20091026 02:26:21.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1736, N'PAHC', N'F622', '20070622 19:52:28.890', '20080318 07:25:03.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1737, N'2M5W', N'S0Y4', '20081118 09:56:48.950', '20090410 21:55:43.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1738, N'JTKR', N'7359', '20080204 06:16:55.170', '20080712 01:44:57.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1739, N'E5GP', N'517H', '20091217 00:09:37.210', '20100823 05:22:52.150', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1740, N'XAYB', N'E9Y5', '20081112 08:44:42.970', '20090726 17:43:31.740', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1741, N'E1C', N'75YM', '20070904 09:08:39.910', '20071117 09:17:33.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1742, N'LUWX', N'ZIUH', '20071215 01:23:31', '20080626 13:13:08.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1743, N'5TKK', N'G2NH', '20070722 19:01:04.830', '20080426 04:30:09.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1744, N'6FWM', N'Q8LO', '20081106 19:30:58.780', '20090410 16:53:30.800', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1745, N'922F', N'DXKL', '20080614 00:32:34.090', '20081207 03:28:57.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1746, N'82QB', N'VPAM', '20080213 15:37:21.970', '20081030 02:00:11.190', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1747, N'0DMU', N'S6EE', '20080514 16:28:26.260', '20080623 02:09:55.060', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1748, N'0THI', N'QMBS', '20090725 14:18:20.260', '20100515 15:07:34.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1749, N'G0VL', N'6KNI', '20081225 06:40:05.240', '20090205 00:18:09.790', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1750, N'DNVN', N'F14T', '20090625 10:58:29.130', '20090907 11:36:00.850', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1751, N'JAWW', N'RX41', '20080910 10:16:11.140', '20081225 20:17:43.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1752, N'AGVC', N'P87Y', '20070125 09:27:12.580', '20070511 09:00:36.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1753, N'NZID', N'KZME', '20090202 23:58:57.880', '20091009 10:41:42.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1754, N'X8L2', N'LHO3', '20091228 02:20:44.030', '20100429 11:23:14.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1755, N'FYIR', N'V5TD', '20070428 19:52:09.400', '20070813 10:59:40.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1756, N'4NNF', N'RIPB', '20080112 15:36:38.660', '20081016 04:36:32.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1757, N'5WZ0', N'1KAZ', '20080613 11:33:20.910', '20090317 04:36:31.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1758, N'HPX', N'SZXN', '20071022 16:44:53.730', '20080529 21:26:46.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1759, N'NPP0', N'FEDQ', '20071211 20:05:36.730', '20080210 22:12:40.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1760, N'0PNN', N'2FK4', '20091216 23:12:03.190', '20100914 22:00:51.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1761, N'3XSD', N'7FN1', '20081229 16:47:13.800', '20090203 20:43:23.290', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1762, N'W2XI', N'WD3A', '20070228 01:18:58.970', '20070501 05:54:45.090', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1763, N'T3U4', N'X4X7', '20091206 01:34:35.960', '20091218 00:33:10.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1764, N'OIJH', N'G38T', '20070827 07:31:59.470', '20080619 17:57:00.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1765, N'NY58', N'UH6', '20071028 20:08:34.060', '20080528 12:54:55.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1766, N'XZSQ', N'KKJQ', '20080604 17:18:27.920', '20081001 07:17:03.350', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1767, N'V3R6', N'V79', '20080208 15:17:02.620', '20081028 03:02:36.580', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1768, N'VBC6', N'VS3Z', '20090617 14:42:26.970', '20100130 07:54:59.720', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1769, N'AG61', N'8W7S', '20070613 04:20:51.270', '20070626 18:46:55.160', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1770, N'PCIK', N'PNMO', '20070623 22:08:37.390', '20071224 05:18:45.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1771, N'0ACL', N'GDFX', '20071209 03:38:25.520', '20080130 03:04:48.590', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1772, N'DK2H', N'F4WI', '20071213 17:39:19.700', '20080217 01:16:55.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1773, N'K8HM', N'T384', '20090227 01:11:39.320', '20090904 23:49:14.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1774, N'QMJM', N'6S48', '20081212 11:34:13.070', '20090114 16:12:46.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1775, N'6YB0', N'FDA8', '20091205 08:49:29.250', '20100512 13:40:44.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1776, N'S809', N'6LFZ', '20090905 20:24:25.130', '20100305 18:11:26.460', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1777, N'FWVC', N'ED4U', '20090816 07:54:19.690', '20091130 22:49:22.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1778, N'2FUU', N'PMF8', '20080728 01:07:54.980', '20081108 00:59:22.500', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1779, N'DSJB', N'ML1M', '20070415 22:04:01.090', '20071004 22:32:39.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1780, N'Q320', N'R4IE', '20070102 04:33:22.030', '20070318 14:29:30.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1781, N'LXKN', N'RE3O', '20090621 02:19:10.780', '20100314 15:30:28.030', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1782, N'NTNQ', N'RIPB', '20090730 19:15:06.640', '20100514 04:28:20.440', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1783, N'254L', N'77NM', '20070810 07:12:49.400', '20071008 08:06:19.040', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1784, N'DRUO', N'O9IB', '20070124 18:42:11.780', '20070518 14:27:15.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1785, N'2EFN', N'O97G', '20070615 01:29:21.730', '20071223 11:43:06.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1786, N'82ZH', N'HGK4', '20070408 15:44:49.930', '20071106 13:18:54.070', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1787, N'RVWT', N'SK2K', '20071213 17:15:47.160', '20080822 10:41:03.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1788, N'P0D', N'QCZD', '20071027 15:50:07.410', '20080629 14:43:14.310', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1789, N'KDEY', N'9FZA', '20090913 14:48:48.290', '20100221 19:43:13.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1790, N'ELGZ', N'TXFL', '20080819 10:02:32.910', '20081105 21:49:50.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1791, N'QI8X', N'DKKG', '20090108 08:19:07.990', '20091028 02:48:32.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1792, N'71T0', N'YZPZ', '20080128 17:11:55.210', '20080908 00:28:57.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1793, N'27I6', N'RWT5', '20070224 10:11:18.440', '20070602 03:32:17.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1794, N'7OCE', N'2OUE', '20070101 00:57:34.020', '20071005 07:22:01.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1795, N'DKP2', N'6GKZ', '20091113 15:57:29.170', '20100621 21:00:09.440', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1796, N'MG4P', N'ASMM', '20070708 07:49:40.940', '20070720 03:22:49.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1797, N'DNVN', N'2KN2', '20080108 23:48:55.050', '20080709 12:39:58.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1798, N'ZFL6', N'ZXWH', '20091125 11:29:05.360', '20100902 10:33:10.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1799, N'JENA', N'VKOD', '20080110 23:22:24.710', '20080909 03:58:36.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1800, N'GREK', N'TUHX', '20070110 07:14:06.160', '20070308 20:11:54.700', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1801, N'H2TQ', N'0KI3', '20070106 00:20:19.340', '20071029 22:57:35.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1802, N'JGUT', N'W78D', '20081127 01:45:59.290', '20090319 18:14:56.340', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1803, N'KKOB', N'HNYC', '20090212 09:57:28.990', '20091119 20:20:40.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1804, N'FT3C', N'HNYC', '20080704 08:31:27.840', '20081209 18:59:25.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1805, N'L3PN', N'YK1U', '20080718 07:20:03.600', '20080809 08:31:13.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1806, N'MSBM', N'D35', '20070929 16:36:51.430', '20071109 19:00:48.600', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1807, N'1OIQ', N'VS3Z', '20071128 08:15:33.270', '20080701 09:11:22.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1808, N'HGES', N'DSJI', '20070222 12:24:44.800', '20070925 18:28:57.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1809, N'GXL0', N'5I9W', '20070123 17:31:14.770', '20071014 21:42:30.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1810, N'EMHB', N'OSTO', '20070822 23:27:44.270', '20080404 16:48:14.900', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1811, N'92JG', N'DCZC', '20080528 07:42:18.980', '20081115 05:47:10.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1812, N'EN00', N'C7O', '20091116 10:25:25.930', '20100509 03:37:09.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1813, N'77FL', N'6QHD', '20070709 18:40:52.630', '20070826 22:54:08.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1814, N'ZYBL', N'OSYO', '20071210 15:32:14.690', '20080921 07:43:11.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1815, N'M778', N'B1UL', '20070628 20:52:52.410', '20070704 06:30:24.950', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1816, N'P0D', N'GBSC', '20090531 21:32:07.170', '20090719 16:15:03.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1817, N'9ZIP', N'P87Y', '20090720 18:06:09.570', '20090723 21:48:27.050', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1818, N'TMBF', N'8VMN', '20091112 06:52:24.170', '20100529 10:05:56.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1819, N'73LE', N'S5YU', '20070315 06:02:37.730', '20070629 06:13:54.680', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1820, N'M2G', N'DE1H', '20070723 04:23:44.130', '20070723 23:36:02.280', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1821, N'07WB', N'RKMG', '20070624 00:02:40.760', '20071206 20:36:00.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1822, N'E897', N'4RCX', '20070414 23:26:55.210', '20070501 12:19:23.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1823, N'6R26', N'MMZU', '20091003 23:53:38.690', '20091208 12:11:47.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1824, N'3T5Q', N'FCT0', '20081023 18:18:18.360', '20090615 20:57:06.050', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1825, N'1G7O', N'BWFF', '20080614 13:49:29.400', '20081222 02:30:13.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1826, N'JLJV', N'HQLF', '20091110 10:26:30.320', '20100319 02:35:51.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1827, N'QD57', N'NGC8', '20071020 07:28:01.260', '20080713 21:44:38.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1828, N'VRR7', N'QMBS', '20090227 00:14:05.290', '20090927 16:27:14.760', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1829, N'8UGF', N'0C10', '20090128 19:36:43.900', '20090521 19:12:37.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1830, N'EN00', N'4CBR', '20090531 00:59:48.310', '20091024 10:17:56.810', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1831, N'RXHA', N'3ZDB', '20080828 20:35:30.080', '20090623 05:31:28.990', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1832, N'DQZF', N'EE7E', '20090920 20:25:14.330', '20100124 12:16:13.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1833, N'NS05', N'TXFL', '20070719 01:45:30.270', '20071226 21:00:47.070', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1834, N'L974', N'SLYN', '20070406 14:49:54.930', '20070730 02:20:45.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1835, N'T5SM', N'QMGC', '20091227 04:13:02.690', '20100315 15:31:55.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1836, N'XVWM', N'V7EL', '20070726 00:33:11.480', '20071226 21:15:32.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1837, N'QBIQ', N'A40I', '20070618 09:17:37.640', '20070625 08:07:41.090', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1838, N'9EIC', N'QMBS', '20090204 22:41:21.560', '20090824 13:06:54.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1839, N'8AW9', N'PNMO', '20080708 11:22:08.180', '20081008 05:56:03.280', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1840, N'UMTW', N'ASMM', '20090915 08:52:30.310', '20100212 16:42:19.120', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1841, N'0VZO', N'LHO3', '20090511 07:29:16.660', '20100303 04:07:32.530', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1842, N'323R', N'F4E7', '20071022 04:51:02.350', '20071128 16:12:07.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1843, N'8OCG', N'KZII', '20071004 22:18:52.630', '20080712 17:00:44.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1844, N'EMFK', N'LMRG', '20090122 15:21:04.010', '20090915 02:54:59.300', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1845, N'T8W4', N'GXQ', '20070325 02:20:13.930', '20071018 16:02:40.140', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1846, N'OCTO', N'0YDC', '20090221 21:53:42.070', '20090620 23:11:23.710', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1847, N'9P6F', N'SI0H', '20070722 22:31:02.570', '20080114 01:34:50.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1848, N'G0GF', N'3I7J', '20090316 18:39:03.750', '20090706 19:49:07.780', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1849, N'PGGP', N'RQRL', '20090705 04:04:41.610', '20100403 00:51:37.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1850, N'W9UJ', N'QMGC', '20070615 18:25:22', '20071204 04:45:06.570', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1851, N'6ZBM', N'MEAF', '20071218 13:43:31.370', '20071227 05:34:23.120', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1852, N'15JZ', N'TP4W', '20080226 16:56:30.880', '20081207 02:34:03.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1853, N'V8B3', N'7RDH', '20090913 05:26:27.620', '20100307 04:19:16.430', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1854, N'UKCD', N'ITDT', '20070621 18:58:40.580', '20080218 04:22:35.150', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1855, N'RCS1', N'1ZD8', '20090719 07:11:25.400', '20100126 23:35:55.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1856, N'UJSG', N'VS1M', '20090923 00:53:24.130', '20100630 10:38:13.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1857, N'MLQ9', N'9R9W', '20090223 01:52:20.600', '20090411 06:03:09.820', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1858, N'Y30P', N'1VDT', '20070422 15:39:10.620', '20070606 23:23:35.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1859, N'T3U4', N'517H', '20070120 18:41:58.440', '20071015 16:29:13.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1860, N'X9QV', N'HQLF', '20080906 20:53:33.290', '20090319 05:55:22.320', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1861, N'IH1W', N'Q8JL', '20091210 09:08:50.180', '20100221 21:16:11.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1862, N'AQYZ', N'5BOE', '20080930 08:01:27.980', '20081003 16:44:08.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1863, N'17VW', N'DILT', '20080124 16:48:00.910', '20080505 23:16:20.360', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1864, N'JCXT', N'1CAK', '20070825 16:31:26.470', '20071221 11:24:34.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1865, N'CR6L', N'KVBM', '20081224 02:52:14.190', '20090808 11:16:46.920', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1866, N'U3JV', N'YYWY', '20080906 11:17:04.650', '20081021 17:30:58.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1867, N'ZFL6', N'IW5Z', '20090501 08:39:55.650', '20090514 06:36:23.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1868, N'ZSOQ', N'EBCS', '20070405 03:50:57.700', '20071124 20:33:23.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1869, N'V4KJ', N'Y4MI', '20071214 11:19:12', '20080708 16:11:16.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1870, N'9T81', N'G79S', '20091203 20:19:40.930', '20100504 09:14:53.290', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1871, N'1D10', N'5P36', '20081214 12:14:29.520', '20090125 08:07:23.770', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1872, N'LH2V', N'YP3N', '20070615 19:24:48.010', '20070926 08:41:33.670', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1873, N'OK0Z', N'K5H4', '20080506 19:30:15.990', '20080821 04:09:53.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1874, N'TUQ1', N'HKIP', '20070629 21:10:07.430', '20080311 13:31:36.580', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1875, N'MBJ4', N'S6EE', '20080312 20:54:27.470', '20080317 19:28:30.750', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1876, N'9ZIP', N'CNE5', '20090901 19:11:38.420', '20100108 04:23:53.900', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1877, N'TIX0', N'L1VQ', '20090711 01:08:02.580', '20090814 19:18:39.330', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1878, N'V3OC', N'0XDW', '20070912 08:32:34.670', '20080120 09:16:49.210', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1879, N'IT30', N'YSZ', '20080801 15:58:04.430', '20080829 04:54:26.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1880, N'4F5J', N'ALVY', '20090422 15:55:47.330', '20090703 03:18:50.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1881, N'VJ6N', N'P87Y', '20090421 11:55:27.740', '20091231 01:01:02.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1882, N'5LFG', N'K5H4', '20080804 12:48:57.520', '20090107 01:55:31.710', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1883, N'EP1O', N'YRR2', '20090824 20:09:23.690', '20100422 15:35:38.550', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1884, N'RHNI', N'9Y8Q', '20080816 01:11:21.900', '20090414 14:27:32.110', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1885, N'0KEQ', N'INSL', '20080613 11:16:16.930', '20081029 04:43:34.680', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1886, N'LH2V', N'A7KC', '20070704 03:38:59.190', '20070718 02:57:26.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1887, N'4MBY', N'6FHL', '20070108 14:58:46.700', '20070916 07:56:57.630', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1888, N'9R9T', N'BEJI', '20070128 06:46:49.680', '20070904 16:38:12.910', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1889, N'QEFM', N'QMR9', '20070918 07:38:29.530', '20080428 02:44:51.220', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1890, N'1OIQ', N'UR2X', '20070406 03:19:38.560', '20070713 04:53:43.330', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1891, N'4WES', N'LIT6', '20080531 22:40:50.890', '20080915 15:12:23.850', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1892, N'RXN1', N'8FJX', '20070226 17:38:27.020', '20071115 08:44:06.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1893, N'TW3N', N'LIMP', '20090116 03:59:23.120', '20090905 20:37:42.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1894, N'TAVR', N'8BYF', '20091031 14:28:34.900', '20100518 00:00:41.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1895, N'X3QT', N'LHO3', '20091005 23:43:40.130', '20091221 19:26:08.980', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1896, N'2JY8', N'FM3E', '20070811 23:27:48.680', '20080530 11:23:24.740', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1897, N'YX7D', N'1JNW', '20090927 12:03:01.450', '20100520 16:55:48.360', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1898, N'FJ0F', N'JPBV', '20070210 05:47:26.150', '20070724 05:36:11.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1899, N'0SLT', N'0QKV', '20070130 12:28:49.810', '20070207 15:38:13.370', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1900, N'6U4U', N'I5GG', '20080717 15:03:09.280', '20081226 22:31:42.220', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1901, N'SXLX', N'JIEW', '20091023 13:13:46.420', '20100206 16:35:00.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1902, N'8A1N', N'ECXF', '20070419 18:40:04.860', '20071217 05:01:27.410', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1903, N'MXR5', N'5BOE', '20080403 07:19:51.740', '20081025 03:37:52.230', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1904, N'MGS9', N'BG3W', '20090801 07:45:00.680', '20091129 15:36:44.930', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1905, N'JCV5', N'KZME', '20080701 06:10:52.480', '20081107 20:37:43.790', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1906, N'MKJQ', N'NWBF', '20070705 18:18:43.360', '20080127 20:52:50.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1907, N'75DZ', N'9Y8Q', '20091021 21:26:14.900', '20100417 22:24:10.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1908, N'E047', N'QYZV', '20090317 08:16:20.190', '20091022 14:47:40.860', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1909, N'OSWL', N'QCZD', '20090409 22:04:13.110', '20091202 08:54:05.400', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1910, N'UJ0A', N'PR9R', '20091116 11:59:46.990', '20100118 19:12:02.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1911, N'OM2B', N'BDUP', '20070315 23:45:21.540', '20071116 15:19:34.990', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1912, N'2GDQ', N'8OIQ', '20080613 17:19:45.920', '20090116 20:46:21.610', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1913, N'QP9S', N'3097', '20080919 23:41:06.190', '20081007 18:29:09.350', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1914, N'RJD2', N'UHOT', '20070930 02:46:11.110', '20080413 13:10:23.390', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1915, N'DQZF', N'SI0H', '20090518 08:58:05.550', '20100113 04:54:20.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1916, N'MNZY', N'69EY', '20080507 20:19:52.660', '20081211 19:20:40.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1917, N'R9NR', N'6TT2', '20090205 11:52:04.300', '20090409 01:08:31.250', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1918, N'NA2S', N'35YV', '20090609 15:36:39.010', '20091117 08:48:49.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1919, N'OTZQ', N'JWH3', '20090313 05:15:09.550', '20091218 06:41:00.890', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1920, N'GURU', N'9R3S', '20080622 23:13:14.990', '20090122 08:19:21.170', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1921, N'766Y', N'SLYN', '20080829 20:18:17.940', '20081202 09:34:02.270', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1922, N'HJXI', N'6WS4', '20090404 01:53:05.970', '20090706 13:58:11.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1923, N'A2S7', N'O5AK', '20090717 20:12:28.180', '20090728 17:48:33.750', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1924, N'NOG7', N'3HRB', '20070910 07:59:33.440', '20071228 11:17:34.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1925, N'KU0K', N'V4P7', '20080704 21:38:50.040', '20080818 18:02:30.430', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1926, N'TP7E', N'XIPU', '20081018 18:36:02.490', '20090106 23:23:17.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1927, N'QZSB', N'DLG2', '20080529 15:25:24.890', '20081115 12:03:52.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1928, N'ITM', N'BD30', '20080706 05:01:41.090', '20090130 04:09:13.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1929, N'IPVC', N'VTUT', '20070923 21:26:27.310', '20080320 18:05:28.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1930, N'JENA', N'CIZ8', '20070802 21:26:38.790', '20070815 08:05:07.010', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1931, N'6ZBM', N'B1YX', '20091205 07:08:36.980', '20100616 11:28:06.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1932, N'IWNI', N'1FRY', '20090531 19:20:36.430', '20091118 13:42:28.970', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1933, N'11NX', N'05M', '20070813 20:03:44.850', '20071213 17:38:36.830', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1934, N'OMDR', N'HKIP', '20070116 00:54:55.150', '20070630 06:22:45.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1935, N'NENM', N'S5U3', '20090630 02:42:00.920', '20100322 10:43:50.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1936, N'1336', N'AIPO', '20090102 17:15:22.880', '20090114 19:59:36.130', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1937, N'NSDJ', N'E9Y5', '20070504 05:29:05.770', '20080109 22:17:40.480', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1938, N'Q320', N'NGC8', '20070124 12:24:23', '20070524 23:58:54.600', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1939, N'QH5', N'PW8N', '20070215 19:00:29.410', '20070607 17:49:49.310', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1940, N'K6YA', N'V1FX', '20071210 16:57:33.560', '20080729 07:50:45.230', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1941, N'TAVR', N'0DMD', '20070912 06:12:44.300', '20080126 04:33:17.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1942, N'BGS0', N'FT1A', '20071024 06:42:26.520', '20071124 17:09:17.780', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1943, N'831K', N'LOUM', '20071020 08:42:36.570', '20080729 07:44:08.520', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1944, N'SJX1', N'0Q0L', '20071101 19:38:42.550', '20080409 07:32:50.020', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1945, N'PTUA', N'JW1L', '20070122 03:34:17.010', '20070623 13:34:09.340', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1946, N'D1D0', N'CFFP', '20091218 05:21:04.970', '20100625 18:26:03.250', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1947, N'431J', N'517H', '20080607 17:57:20.840', '20090206 14:14:58.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1948, N'4RF8', N'R0JW', '20080419 01:13:12.010', '20080525 07:27:19.800', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1949, N'O70R', N'G17C', '20070616 05:30:29.340', '20080229 19:06:22.180', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1950, N'M0CR', N'F4FU', '20080531 03:23:47.470', '20081106 00:05:29.560', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1951, N'WQCP', N'8MK9', '20080705 11:35:44.390', '20090220 10:14:54.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1952, N'XDS3', N'YF7X', '20070420 20:26:22.430', '20070704 08:07:00.100', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1953, N'PDNO', N'ZTGI', '20071130 00:32:16.610', '20080531 22:55:11.490', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1954, N'6UGS', N'R9TS', '20080808 13:15:34.820', '20081111 07:18:53.200', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1955, N'5WEQ', N'PBTO', '20091117 18:44:51.350', '20100124 12:57:40.960', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1956, N'SGNI', N'BQN1', '20070722 11:20:40.450', '20070804 02:36:49.910', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1957, N'UR8Z', N'QNHO', '20071002 22:27:36.690', '20080520 11:12:54.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1958, N'WC2S', N'1Y7W', '20070725 23:20:18.290', '20071029 16:20:19', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1959, N'PDQZ', N'H5T1', '20080128 10:06:10.630', '20080412 21:34:15.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1960, N'LM7K', N'N5U0', '20090912 11:34:50', '20091031 21:14:26.860', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1961, N'Q8WB', N'9Y8Q', '20090205 02:53:18.470', '20090313 08:48:58.970', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1962, N'0PNN', N'YRR2', '20080417 16:24:33.800', '20090112 18:14:58.260', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1963, N'RF80', N'UYD6', '20080624 10:49:52.870', '20080803 20:42:13.240', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1964, N'EFVB', N'DSJI', '20080908 00:37:34.320', '20090420 00:48:59.380', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1965, N'JTUD', N'EKYR', '20091212 04:51:10.010', '20100531 07:43:56.660', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1966, N'RXM5', N'9R9W', '20071015 04:24:45.120', '20071229 01:37:07.020', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1967, N'LFO5', N'8MBW', '20071101 21:16:01.060', '20080205 03:07:45.770', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1968, N'V6WP', N'MCP', '20080904 22:46:11.040', '20090204 12:06:24.670', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1969, N'BZYM', N'25JO', '20080401 00:04:10.200', '20081118 02:26:33.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1970, N'SW19', N'I5GG', '20070516 15:42:42.670', '20071230 08:54:45.640', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1971, N'49Q7', N'SCDW', '20080105 14:50:46.880', '20080928 21:03:00.930', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1972, N'LC0G', N'KGTW', '20090112 23:27:41.290', '20090912 01:09:37.650', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1973, N'M2G', N'DVYM', '20090424 20:36:09.600', '20090612 14:59:00.940', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1974, N'8OD1', N'OUSI', '20080403 12:17:35.980', '20080521 22:50:16.640', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1975, N'MC2G', N'9DTT', '20071012 17:00:30.690', '20071229 03:46:04.690', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1976, N'71T0', N'CU5U', '20071107 13:35:51.410', '20080109 16:24:45.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1977, N'D5P8', N'M5E7', '20080615 17:10:29.390', '20081004 06:14:04.420', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1978, N'RLU6', N'N5U0', '20080916 00:33:45.620', '20090214 10:15:44.720', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1979, N'VRHW', N'KZII', '20070820 04:25:16.430', '20080502 21:43:25.870', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1980, N'LXG7', N'IW5Z', '20080717 16:17:45.080', '20081219 23:36:28.200', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1981, N'CJDS', N'SJTL', '20070514 00:38:41.650', '20070927 09:08:20.470', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1982, N'SGNI', N'MTKM', '20070210 14:12:12.880', '20070624 04:36:33.660', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1983, N'LDYY', N'VHQW', '20080121 23:31:11.740', '20080927 09:02:51.820', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1984, N'0ALP', N'HKIP', '20090424 18:02:39.840', '20090514 18:00:00.030', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1985, N'O0BB', N'3W95', '20090127 09:50:54.410', '20090419 21:50:13.540', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1986, N'BNYZ', N'CU5U', '20090817 10:42:14.550', '20091214 03:21:07.450', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1987, N'IPR1', N'1MGK', '20080702 18:48:19.810', '20090415 14:47:18.480', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1988, N'6YQ3', N'8VMN', '20090104 06:48:10.030', '20090131 10:19:44.620', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1989, N'XSKY', N'S6EE', '20070228 06:10:03.800', '20070605 17:25:05.730', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1990, N'QG8G', N'GDFX', '20081209 15:21:20.460', '20090819 08:07:02.010', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1991, N'VD9L', N'KVMA', '20080402 18:47:46.180', '20080623 08:46:42.470', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1992, N'5CBO', N'BVRP', '20091009 06:08:47.490', '20100313 05:57:22.490', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1993, N'9D73', N'6DVJ', '20081227 02:18:12.370', '20090210 02:24:40.110', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1994, N'ZLE8', N'2OUE', '20070605 07:25:39.420', '20070806 20:35:23.450', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1995, N'Z58U', N'L9ER', '20081103 14:04:15.100', '20090517 23:01:47.270', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1996, N'WJCM', N'1PHE', '20090526 13:48:10.500', '20091108 10:18:20.210', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1997, N'VLQ8', N'LE76', '20090430 19:52:33.650', '20100215 20:27:05.550', 1)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1998, N'REK3', N'7KZY', '20090210 08:05:02.250', '20090410 06:55:10.130', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (1999, N'ADR', N'MS4', '20071120 14:47:32.550', '20080904 23:48:54.370', 2)
GO

INSERT INTO [dbo].[ChiTietHoaDon_Jade] ([MaChiTiet], [MaHD], [MaSP], [NgayTao], [NgayCapNhat], [TrangThai])
VALUES 
  (2000, N'H245', N'92UX', '20090408 23:09:31.890', '20090625 11:57:03.310', 2)
GO

--
-- Data for table dbo.HoaDon_Jade  (LIMIT 0,500)
--

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0047', N'G0G6', N'YWA4', '20090315 00:47:21.240', '20090811 10:41:37.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'00BJ', N'NNP9', N'2437', '20081210 16:38:51.760', '20090223 10:43:55.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'016K', N'5Q7V', N'VBT8', '20070419 04:19:05.900', '20070726 21:35:48', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'02GY', N'5LZ8', N'PFPW', '20090329 13:50:22.680', '20091117 04:48:22.260', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'03OB', N'O4JD', N'1EPQ', '20070630 05:03:05.380', '20070928 21:59:17.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'04T2', N'JJ50', N'60GH', '20080913 00:59:45.260', '20090702 07:11:29.740', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'055O', N'P1PL', N'NH4E', '20080416 23:55:09.040', '20080616 12:21:33.250', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'068B', N'TWPS', N'L31J', '20090321 11:59:57.390', '20091210 07:11:45.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'07WB', N'GVOP', N'57H2', '20070225 23:48:27.240', '20071213 23:15:20.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'080J', N'0ZRG', N'OUR7', '20090311 12:19:26.830', '20091024 22:14:32.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'09WT', N'IE87', N'9N5L', '20090819 14:56:46.510', '20100113 15:20:27.420', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0ACL', N'6LRC', N'344I', '20080415 08:54:40.890', '20081206 22:28:10.060', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0ALP', N'9N5Y', N'2ALX', '20090414 02:16:25.350', '20090901 19:59:14.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0C00', N'5REP', N'FHEL', '20071014 23:10:03.870', '20071112 16:00:35.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0CFI', N'QTWJ', N'B04V', '20080312 09:14:33.140', '20080805 03:08:42.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0CS', N'IYLM', N'PWL1', '20080803 02:21:28.410', '20081110 17:35:50.200', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0DMU', N'WBJI', N'80PP', '20080512 16:11:14.640', '20081202 15:57:42.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0HWY', N'JDTC', N'FRV2', '20081213 13:29:13.960', '20090829 04:56:21.110', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0ISE', N'ZIZV', N'6KZQ', '20090614 09:52:29.180', '20091029 00:21:57.180', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0JBB', N'3NRW', N'WPH4', '20081010 04:55:12.880', '20081230 20:05:16.140', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0JMR', N'U46M', N'2R39', '20091117 05:51:15.320', '20100731 10:49:07.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0K31', N'OB7Q', N'UVZ1', '20091120 08:16:12.150', '20091210 12:24:10.910', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0KEQ', N'E8BM', N'FU8U', '20090915 17:07:37.180', '20100103 05:01:11.990', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0L8P', N'44K8', N'BIZ0', '20090203 09:26:44.900', '20090224 13:51:22.520', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0NF5', N'3QKC', N'MM1T', '20091021 10:06:51.870', '20091229 06:10:18.110', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0PNN', N'AS48', N'HW3H', '20090722 18:34:43.210', '20090924 06:01:04.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0SLT', N'5J97', N'DP6F', '20070716 07:36:18.770', '20080506 07:44:37.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0SQ3', N'9EI5', N'F7KE', '20080303 10:43:59.800', '20080619 20:00:10.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0SVU', N'1HFI', N'XL9Z', '20070514 18:54:26.280', '20070814 18:59:43.090', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0THI', N'8WSG', N'9V0C', '20091130 14:07:01.200', '20100619 00:55:07.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0VZO', N'REPR', N'A78Y', '20070504 21:57:04.050', '20080208 22:11:23.730', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0XG4', N'3B6R', N'YWQ5', '20070828 07:44:10.870', '20080114 12:15:46.090', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0XJZ', N'LSW4', N'NNOU', '20091219 00:54:28.610', '20100322 13:30:14.500', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0Y2H', N'JT4S', N'1FSY', '20090930 21:54:24.190', '20100530 06:27:21.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0YU1', N'OONV', N'EW4Q', '20070128 08:51:56.660', '20070809 18:00:23.560', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'0Z83', N'2JHT', N'PWL1', '20070909 05:02:33.710', '20080415 15:35:29.720', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'11NX', N'2XQU', N'HRZS', '20080522 12:52:33.900', '20080930 16:41:09.820', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'11PV', N'CU7T', N'3W0O', '20080912 01:40:45.890', '20080925 03:56:19.750', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'132F', N'X3EY', N'39T3', '20070624 07:12:07.290', '20070904 22:54:25.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1336', N'RR0O', N'QNFD', '20080526 17:04:46.930', '20080720 12:30:42.540', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'15JZ', N'KVVZ', N'5X3C', '20081123 07:40:38.700', '20081226 17:36:39.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'17VW', N'4S0S', N'J35P', '20070528 16:25:27.860', '20080107 00:06:26.110', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'19N8', N'Q2KY', N'091N', '20070505 14:14:36.960', '20070710 09:23:54.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1AFN', N'2JHT', N'1JOV', '20090818 22:57:10.790', '20100323 03:33:37.570', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1CGC', N'H6JK', N'WIYF', '20090706 21:02:23.810', '20100223 21:51:24.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1CWJ', N'TJ4D', N'J926', '20081004 06:42:16.750', '20090413 22:50:57.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1D10', N'3B6R', N'HXF0', '20080116 16:35:15.100', '20080316 23:00:52.930', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1DGD', N'3GR', N'9SHL', '20080309 04:45:17.790', '20080811 16:00:59.550', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1G7O', N'YKH5', N'7OD6', '20081011 08:28:12.780', '20090729 11:51:42.780', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1KHT', N'G4Y', N'PZF1', '20091116 15:46:06.540', '20100111 17:24:21.920', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1OIQ', N'867J', N'A4WL', '20091028 21:49:25.550', '20100426 10:17:09.240', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1Q6R', N'9NAS', N'2M09', '20080401 11:46:41.060', '20081118 15:18:23.040', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1RUX', N'O5JB', N'1D4J', '20071030 00:30:34.610', '20080404 19:52:12.710', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1S62', N'7NT2', N'AATO', '20070617 17:50:33.530', '20070620 10:30:44.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1WZK', N'8GNZ', N'LGTW', '20090804 13:06:31.750', '20090909 00:15:34.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1XAJ', N'RHJ1', N'XCX5', '20081119 09:56:40.390', '20090225 17:13:06.650', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'1YYB', N'GX7E', N'SI0V', '20070614 08:20:44.380', '20071111 13:56:59.680', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'20OC', N'PACT', N'FAMF', '20090322 07:06:22.270', '20090408 19:23:59.090', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'22N6', N'RH68', N'K11Y', '20070214 00:30:16.690', '20070718 19:08:56.860', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'234L', N'PKI', N'3A6B', '20070426 10:11:40.860', '20070605 11:55:21.780', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'24Q0', N'5WSZ', N'DRDO', '20090731 21:56:33.060', '20091112 10:22:55.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'254L', N'OJFY', N'61H3', '20090629 06:11:47.430', '20091126 15:52:29.670', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'27I6', N'VCKE', N'BM9B', '20090607 23:50:43.660', '20090904 17:08:35.180', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2A86', N'5P3Y', N'AIY7', '20090128 10:04:11.090', '20090223 01:54:00.060', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2D6L', N'5BM7', N'YDA8', '20070616 20:04:06.190', '20070928 02:19:28.650', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2EFN', N'L0DD', N'NSOR', '20071217 05:15:30.940', '20081002 22:24:13.880', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2FN', N'Z1HU', N'SW2Q', '20070114 20:15:19.130', '20070320 23:49:54.400', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2FUU', N'MA8W', N'KJ1W', '20090324 02:48:39.550', '20091218 22:57:21.920', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2GD', N'0Z7K', N'NKCD', '20090406 06:03:07.610', '20091215 22:01:26.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2GDQ', N'64GG', N'AJT7', '20080915 20:50:52.460', '20090525 12:49:29.510', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2JR9', N'4TU7', N'X8QZ', '20081014 05:21:38.960', '20090101 07:28:56.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2JY8', N'TC52', N'M9Z5', '20070619 11:53:07.310', '20080108 00:29:46.710', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2KCL', N'VAK6', N'7IH7', '20070120 09:41:30.400', '20070925 19:12:21.020', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2KI5', N'IGGD', N'BFLD', '20080702 12:09:04.930', '20090122 12:44:54.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2KMJ', N'5IA8', N'T4KA', '20090224 10:28:09.250', '20090829 06:57:49.060', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2LZQ', N'V8S4', N'XP1O', '20071202 00:16:19.480', '20080620 11:09:11.730', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2M5W', N'PY6Z', N'5CED', '20081005 23:05:26.490', '20081017 14:24:20.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2MAG', N'G2H3', N'MMVF', '20090313 15:23:10.320', '20091115 05:08:31.680', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2OL1', N'6DLA', N'A78Y', '20080430 20:04:18.150', '20081026 10:40:51.870', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2UD9', N'KZDU', N'BS6M', '20070813 09:43:44.440', '20070905 01:16:32.350', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2VAO', N'367U', N'7DHU', '20091104 18:02:28.280', '20100531 06:54:05.270', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'2ZZV', N'D8HO', N'L5K6', '20070622 14:32:49.520', '20080122 08:14:09.010', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'31LO', N'JDTC', N'PAEE', '20070707 03:00:58.770', '20080111 06:40:55.740', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'323R', N'0F7T', N'5I9A', '20080928 12:28:52.010', '20081004 05:37:36.890', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'33YZ', N'A4UP', N'6BCS', '20090922 14:52:31.630', '20100404 16:55:29.700', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3486', N'6OT1', N'2AHQ', '20080305 04:05:47.580', '20081010 04:27:07.390', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'36FB', N'8I7P', N'R06L', '20080303 02:54:00.540', '20080308 21:26:23.270', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'379R', N'9HQW', N'LJHB', '20091128 21:24:05.220', '20100307 01:07:00.680', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'37AR', N'0A4E', N'VNV5', '20090129 18:16:40.760', '20090701 11:41:57.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3B61', N'6LRG', N'3W0O', '20070605 20:44:10.600', '20070803 14:39:43.970', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3CBF', N'X3E0', N'VWOP', '20080413 07:59:27.300', '20090129 12:00:15.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3DWE', N'Y3DN', N'QOJP', '20090106 20:02:40.510', '20090703 09:14:39.600', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3EDY', N'9SXE', N'0HJI', '20081002 14:06:40.480', '20081118 06:12:03.940', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3ELK', N'TBBP', N'4HA1', '20090409 12:28:28', '20090809 18:42:15.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3FVA', N'EP0C', N'6N1E', '20070611 21:32:33.630', '20070715 18:29:01.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3HBO', N'7FC1', N'VUSS', '20080501 10:31:32.860', '20080503 03:54:24.360', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3HZI', N'FZO0', N'L083', '20070523 15:20:42.420', '20071208 12:25:09.150', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3IRA', N'MVZH', N'086I', '20080720 14:20:24.700', '20080729 03:44:50.710', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3J6H', N'7YL7', N'UWPO', '20080316 14:31:27.790', '20081224 20:29:19', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3JW5', N'G2MK', N'NS6L', '20070210 18:08:00.440', '20070612 12:25:57.620', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3KIP', N'IKZ', N'T183', '20070910 17:21:00.400', '20080323 18:46:23.150', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3NWE', N'U3KT', N'P51T', '20080617 00:27:12.930', '20080903 18:18:49.390', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3O89', N'FNNY', N'LGTW', '20090306 06:42:45.920', '20091114 00:26:27.040', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3OFH', N'G1SD', N'Q3N8', '20090526 20:30:32.310', '20100209 14:25:26.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3Q99', N'VHSO', N'3A6B', '20080922 21:33:05.560', '20081015 05:16:39.250', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3RI2', N'E5XL', N'8X05', '20070324 06:18:04.850', '20071218 16:43:49.190', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3T5Q', N'GJJQ', N'63YM', '20070624 07:42:01.220', '20070810 02:52:43.180', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3TT0', N'FZZ1', N'WY35', '20090908 16:31:11.590', '20100529 06:03:22.730', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3UUF', N'UHVY', N'7W34', '20070309 02:22:19.370', '20071203 11:14:23.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3W32', N'SV1C', N'5CED', '20070228 19:49:38', '20071216 21:29:50.710', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'3XSD', N'KQDK', N'WNZD', '20091026 23:28:22.470', '20100814 21:53:32.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'40ZT', N'KCL0', N'BUOA', '20090629 05:11:55.210', '20091004 23:04:31.490', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'431J', N'HUYH', N'CTI0', '20070208 13:24:27.290', '20070909 17:13:37.770', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'43HN', N'SECX', N'ET67', '20090327 17:11:36.190', '20090424 10:54:38.940', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4887', N'TOAM', N'XVZT', '20070118 03:49:19.130', '20070212 08:44:57.250', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'48PO', N'WRPG', N'LI6R', '20070307 23:30:51.330', '20070807 11:21:44.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'49Q7', N'857F', N'BV2I', '20070328 11:06:57.920', '20071129 16:51:37.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4AQR', N'36MA', N'WAZX', '20081109 00:26:57.270', '20090219 16:03:39.190', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4EVD', N'DWWK', N'LBMH', '20081031 06:45:44.130', '20090505 01:20:18.610', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4F5J', N'JXFV', N'M7NK', '20080302 11:24:06.460', '20080416 02:49:50.570', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4JLR', N'WVA7', N'UJ1S', '20080219 09:35:08.320', '20081117 02:30:10.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4KAK', N'6ZEV', N'6ZAA', '20090720 19:28:00.640', '20091219 21:12:05.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4LI3', N'9Y7V', N'TPN1', '20080503 11:22:54.460', '20080520 10:19:35.320', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4MBY', N'8URA', N'FHEL', '20080815 05:59:27.350', '20090227 08:48:08.230', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4NER', N'K8FU', N'9ZSZ', '20070725 13:44:55.030', '20070823 00:51:04.560', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4NNF', N'9GPD', N'I9QA', '20070913 18:48:16.950', '20080628 02:35:54.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4OWO', N'OJFY', N'5PR1', '20080530 10:46:24.620', '20090123 10:17:21.340', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4Q9J', N'RAL6', N'7ZEE', '20071024 20:40:59.290', '20080127 04:41:06.420', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4QOB', N'VY2R', N'YK01', '20091215 17:27:26.520', '20091217 20:17:00.950', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4RF8', N'CHNI', N'6HGT', '20081017 11:17:53.180', '20081023 07:44:28.730', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4SWD', N'XZI2', N'27GP', '20090926 08:05:11.160', '20100516 01:22:37.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4TEG', N'NLBL', N'DGXQ', '20080824 19:56:44.580', '20090401 14:28:15.480', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4VSN', N'PNIU', N'YLBO', '20080109 05:14:20.390', '20080810 21:16:08.910', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4W54', N'FWHO', N'7UXD', '20071121 07:33:11.450', '20080311 14:59:57.040', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4WES', N'KZDU', N'6N1E', '20071204 14:49:03.570', '20080413 00:17:17', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4Z9O', N'1VE7', N'7OD7', '20070603 06:15:49.870', '20070622 04:51:14.490', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'4ZKQ', N'SED7', N'TDP4', '20081213 16:24:19.740', '20090505 14:40:17.920', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'50K8', N'Y7X7', N'P3W1', '20090707 09:36:21.050', '20100424 10:07:50.740', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'51I4', N'EM1Z', N'B5CT', '20090211 08:21:54.460', '20090312 11:22:31.450', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'51N2', N'EDPU', N'PTTW', '20070630 11:55:34.100', '20071228 10:09:59.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'52SA', N'6ACX', N'OW1Y', '20070817 22:11:56.020', '20080318 16:18:11.400', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'56PJ', N'MZP9', N'YC5U', '20081207 03:52:49.490', '20090316 20:46:59.600', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'58SD', N'662I', N'CEXL', '20090122 12:19:55.530', '20090129 14:45:10.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'598H', N'YSJP', N'DP13', '20071026 06:58:35.140', '20071216 10:27:16.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'59LG', N'KWTV', N'7IWC', '20071116 21:30:55.820', '20080308 13:53:49.160', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5ANG', N'QZQM', N'79C2', '20081030 16:56:11.880', '20081105 15:26:47.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5BYR', N'G2MK', N'HCQQ', '20080510 04:10:02.110', '20080914 22:43:47.350', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5CBO', N'965O', N'NX6D', '20090106 06:19:36.300', '20090726 07:27:57.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5CHJ', N'LSW4', N'TULU', '20080127 02:41:53.900', '20081015 18:44:28.920', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5DO6', N'QYF3', N'RXBD', '20090909 23:09:35.450', '20090912 10:56:03.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5FJ7', N'G79', N'UW3N', '20080923 07:15:22.010', '20081220 07:10:27.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5IA3', N'LSK', N'CDUR', '20080130 10:08:48.020', '20080521 05:03:25.070', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5JPH', N'20U9', N'TDP4', '20090327 21:32:16.520', '20091013 20:54:17.780', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5K9O', N'8N5Q', N'O3RW', '20080924 18:57:09.290', '20090214 13:53:47.250', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5KE1', N'8QO3', N'Q18O', '20090322 21:13:58.460', '20091101 15:31:36.350', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5KHA', N'GFTJ', N'6B41', '20090105 21:43:31.250', '20090227 00:40:55.870', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5LCZ', N'B9N6', N'5J9M', '20080819 15:39:06.750', '20090530 05:56:43.470', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5LFG', N'V06X', N'UVRI', '20081002 18:10:07.050', '20090104 17:23:26.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5OJ2', N'VFZT', N'FAMF', '20091226 17:39:03.560', '20100615 07:46:58.950', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5PO3', N'5VND', N'9LRN', '20070524 07:02:14.730', '20080318 18:50:59.200', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5QUJ', N'DAPB', N'MOY0', '20080311 13:09:24.850', '20080425 16:37:26.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5RB6', N'3QKC', N'H3K4', '20070615 22:21:55.420', '20080220 11:18:32.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5TKK', N'965O', N'6MHG', '20081225 12:07:20.420', '20090206 03:11:15.580', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5V7J', N'F5HU', N'2BH5', '20070310 09:50:43.790', '20070331 09:24:40.510', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WEQ', N'IZU', N'XW3G', '20070920 01:40:54.450', '20080226 02:15:45.180', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WQ2', N'BRPF', N'1VE4', '20070115 13:54:08.170', '20071107 01:41:13.670', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WQ5', N'KBD5', N'QNFD', '20090730 22:33:10.370', '20100517 12:25:40.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5WZ0', N'P4MB', N'K3DB', '20090110 00:11:27.240', '20090902 04:00:39.340', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'5Y8F', N'8VZ2', N'DGXQ', '20070923 02:34:28.730', '20071028 08:23:32.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'610I', N'5O1U', N'DTCN', '20080607 16:47:20.820', '20081127 11:41:16.690', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'614W', N'FUDK', N'6V7N', '20081110 15:33:33.190', '20081125 10:37:33', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'66RZ', N'J9VM', N'QLCX', '20071021 21:04:37.990', '20080614 00:17:54.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'67BI', N'T86N', N'VHPY', '20080703 03:04:33.920', '20080810 23:32:52.580', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'68KL', N'R1QK', N'BX49', '20080721 06:55:00.750', '20090215 09:20:08.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'68UK', N'Y64K', N'UVKY', '20090628 19:37:48.120', '20100225 10:57:04.920', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'693G', N'BQKA', N'KK03', '20091202 12:52:41.680', '20100320 21:35:49.300', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6EBE', N'ZNIZ', N'P51T', '20090317 00:01:40.360', '20091031 08:16:13.120', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ELD', N'EDPU', N'4CLP', '20091031 05:46:36.570', '20100623 13:28:18.670', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6FWM', N'213L', N'QU55', '20090715 08:07:56.690', '20100421 19:49:22.140', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6G5K', N'6OIN', N'TJVH', '20090627 10:43:00.730', '20100303 05:15:19.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6KDW', N'73E2', N'XOY6', '20070820 23:02:56.110', '20080113 07:26:02.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6LA8', N'F50K', N'44EN', '20090806 10:08:27.750', '20100213 01:02:38.920', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6O62', N'E2SB', N'KNA5', '20080226 13:28:31.160', '20080420 05:05:54.390', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6OVY', N'Q8H0', N'CEG6', '20090810 23:07:19.210', '20091206 08:54:21.550', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6Q84', N'5NE7', N'HRZS', '20071122 01:58:47.610', '20071223 05:09:17.100', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6R26', N'4UAE', N'KL23', '20090121 23:07:16.180', '20090914 14:51:04.810', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6R7L', N'0I04', N'RM60', '20070412 12:29:30.870', '20070812 17:02:33.840', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6S4A', N'FOGI', N'99KR', '20070702 18:33:41.600', '20070725 07:37:49.190', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6SB', N'GJRW', N'MMBM', '20071027 14:45:49.530', '20080724 22:33:43.550', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6TCI', N'WQGB', N'X4FS', '20070603 02:43:18.420', '20070918 06:31:43.500', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6U4U', N'180R', N'A4WL', '20070125 23:09:25.380', '20070910 18:53:21.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6UGS', N'LTT2', N'TB09', '20080319 04:58:34.500', '20090109 14:39:25.050', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6V64', N'JBSB', N'P7OD', '20080228 12:54:57.280', '20080317 16:12:36.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6W9B', N'0I04', N'S7EP', '20090803 21:39:42.260', '20100511 10:42:03.570', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6WPC', N'6DLA', N'LCTM', '20070713 08:17:06.340', '20080222 18:56:21.030', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6YB0', N'PVO4', N'9LRN', '20080501 11:05:24.740', '20081104 23:18:01.810', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6YQ3', N'J0RB', N'H942', '20081125 09:58:20.980', '20090721 00:29:38.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZBM', N'2NQK', N'VKW4', '20090809 09:05:38.600', '20100424 16:51:38.810', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZDF', N'NQ5S', N'PYQF', '20070924 05:12:29.860', '20080507 16:22:42.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZTL', N'KQDK', N'BMUR', '20091222 17:01:05.600', '20100707 13:32:54.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'6ZZC', N'SPFH', N'3G8X', '20090918 07:11:55.130', '20100425 08:11:25.640', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'71T0', N'8SHP', N'DTO4', '20091021 15:16:29.540', '20100317 11:35:40.830', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'71V0', N'4HND', N'REKD', '20080319 13:21:36.950', '20080330 21:25:45.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'72DM', N'FFUL', N'7V5J', '20081103 17:59:13.850', '20081105 13:20:56.070', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'72VU', N'D6IG', N'008T', '20070315 11:02:24.320', '20070424 12:40:21.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'73AT', N'4CD5', N'40VN', '20090522 13:39:07.700', '20091019 17:45:24.670', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'73KG', N'OSMK', N'5UAA', '20090711 23:14:18.410', '20091219 06:11:14.400', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'73LE', N'I8BM', N'GPG5', '20090725 13:32:38.520', '20091008 13:39:34.610', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'744F', N'YY7W', N'48Q0', '20080727 19:36:29', '20090507 15:54:28.290', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'75DZ', N'IJP8', N'BN4H', '20080611 06:43:35.170', '20081218 06:59:32.460', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'766Y', N'NNZ6', N'TPN1', '20090129 06:19:26.240', '20090713 15:24:45.050', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'77FL', N'TUML', N'A6X', '20070605 08:34:11.760', '20080329 00:37:45.360', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'78KC', N'OQ1K', N'9523', '20081203 10:56:21.910', '20081211 13:44:12.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7994', N'3DN6', N'2X0D', '20090502 13:04:13.910', '20090925 23:30:38.570', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'79E9', N'6ZXM', N'SCAP', '20070716 04:49:25.140', '20080101 01:05:42.450', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7A2Q', N'S517', N'9ZSZ', '20080421 23:01:07.920', '20081016 04:20:07.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7ADX', N'ODXE', N'DU8X', '20080911 20:49:28.720', '20090423 21:30:43.480', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7AJW', N'8HBX', N'4F5M', '20080918 09:32:35.350', '20080929 17:52:48.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7AMU', N'FU80', N'A6K', '20080622 12:34:34.520', '20090117 03:19:34.980', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7B2E', N'SKZW', N'H6UZ', '20080714 14:35:01.210', '20081226 19:14:14.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7CDQ', N'8WEX', N'TML9', '20080223 13:29:02.660', '20081129 07:43:06.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7DBD', N'QBC0', N'BUOA', '20071218 23:56:25.290', '20080319 22:23:40.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7GC0', N'P5S2', N'KDLV', '20080620 23:19:47.770', '20081020 03:50:26.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7IBQ', N'YY7W', N'6ZAA', '20080616 02:35:21.780', '20090204 02:14:14.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7JDD', N'1P21', N'PYQF', '20070612 16:48:14.530', '20071129 07:59:05.130', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7LJU', N'FB29', N'QT3S', '20090106 03:34:48.760', '20090701 18:59:16.920', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7N2P', N'BME4', N'3H2W', '20091005 13:59:14.810', '20100521 21:16:45.790', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7OCE', N'IQO2', N'T4KA', '20070714 01:38:05.550', '20071222 19:19:48.620', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7R4K', N'5YDM', N'VHPY', '20070114 21:26:13.190', '20070301 10:18:31.630', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7W06', N'BJ4Q', N'9523', '20081023 18:59:37.090', '20090805 21:33:27.320', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7WID', N'ADPF', N'Y703', '20090905 11:55:55.790', '20100513 08:27:58.880', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'7Y67', N'9NCX', N'NWIZ', '20090802 03:44:17.450', '20090817 16:08:10.790', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'800N', N'S76Y', N'PKUI', '20080211 07:47:06.300', '20080217 08:45:32.010', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'81LJ', N'682F', N'NH8L', '20090721 10:35:07.060', '20090802 11:39:13.310', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8203', N'SUHS', N'A50H', '20090402 06:38:58.650', '20090605 14:11:05.250', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'82QB', N'89EP', N'7HNP', '20070208 14:38:54.670', '20071025 17:21:21.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'82UZ', N'6V30', N'PSMC', '20080916 06:23:39.640', '20090118 17:18:28.850', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'82ZH', N'OMEK', N'PXCU', '20081007 00:27:43.930', '20090218 15:28:16.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'831K', N'L3GL', N'HNHX', '20070723 02:33:21.740', '20080413 15:58:38.380', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'852S', N'U0TA', N'Q125', '20080109 11:41:38.060', '20081019 07:32:28.540', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'861J', N'B5HR', N'2RNY', '20070221 19:57:40.180', '20070302 02:46:48.580', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'86FP', N'UEKK', N'65CQ', '20070104 20:39:14', '20070914 04:19:22.850', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'86TK', N'LHEF', N'M6B1', '20080401 17:02:50.380', '20080602 16:33:50.290', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'87BH', N'332P', N'O80V', '20090218 15:10:08.890', '20090928 07:17:12.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8A1N', N'HRVU', N'VPKR', '20090209 03:28:34.440', '20090717 09:05:32.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8AW9', N'S6CE', N'MIRH', '20080622 20:51:07.170', '20081004 00:26:28.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8BES', N'O44Q', N'X8OS', '20091021 13:36:50.800', '20100731 23:28:26.390', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8MB5', N'RVEF', N'UAX8', '20070118 21:21:57.800', '20070315 16:33:10.190', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8OCG', N'UWGC', N'P7OD', '20090813 09:57:15.550', '20090822 18:55:49.030', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8OD1', N'PXVS', N'ET67', '20080104 21:07:55.670', '20080327 03:17:49.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8P26', N'0FHQ', N'AA7F', '20091024 00:19:18.090', '20100416 10:50:56.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8R2R', N'0Z7K', N'TOZF', '20070806 23:38:09.610', '20080123 14:14:41.860', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8RA7', N'C9SU', N'NLEN', '20070828 10:02:49.380', '20080416 08:10:17.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8SXC', N'QN0N', N'P51T', '20070126 22:32:10.710', '20070507 14:29:40.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8T9O', N'5P3Y', N'L5K6', '20090426 03:39:45.870', '20100202 23:38:57.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8UGF', N'D18U', N'G950', '20090308 04:02:47.790', '20090310 12:28:44.260', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'8VNJ', N'ZF3K', N'5X3C', '20090723 07:36:11.420', '20100105 06:51:13.710', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'922F', N'1C3O', N'EW4Q', '20080902 04:38:03.870', '20090402 22:36:42.620', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'92JG', N'U5WL', N'9H68', '20070330 07:48:41.690', '20071224 23:15:23.670', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'92NL', N'7AY0', N'I5ZC', '20090907 21:32:04.710', '20091202 16:29:13.580', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'93FD', N'SUYB', N'5PR1', '20081218 10:48:07.110', '20090205 03:51:41.940', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'951I', N'15TH', N'H47G', '20080301 15:15:00.410', '20080601 05:35:22.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'994O', N'UU2L', N'5TRB', '20080917 09:25:58.110', '20090711 20:11:30.350', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9BS3', N'A0U2', N'NH55', '20071029 15:51:16.730', '20080722 13:09:20.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9D73', N'DRP8', N'8F6H', '20080404 10:42:52.090', '20081001 09:07:30.230', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9E67', N'F8DA', N'KJ1W', '20080130 06:12:56.710', '20080310 11:50:42.620', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9EIC', N'G5F2', N'FZ2V', '20070509 23:23:29.870', '20080102 22:40:36.320', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9GKT', N'REPR', N'ETOR', '20080729 18:19:22.420', '20090210 03:11:40.240', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9HF6', N'7FC1', N'M7NK', '20090628 16:49:45.230', '20090708 00:04:48.470', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9IS9', N'2ONB', N'4HA1', '20081017 10:49:41.320', '20081113 05:43:24.490', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9MCW', N'YDM2', N'SJSH', '20091229 23:07:13.280', '20100226 16:51:15.930', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9NN', N'YVSM', N'8SKB', '20080407 23:03:36.340', '20081003 15:20:12.180', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9P6F', N'332P', N'MH14', '20070926 11:01:34.990', '20080607 21:03:34.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9PN', N'YXWB', N'7VB4', '20080729 22:46:11.100', '20090404 11:06:21.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9R9T', N'74Z6', N'F6NP', '20090622 23:43:29.840', '20090831 22:41:09.310', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9T81', N'0RXC', N'P3W1', '20070421 03:21:03.090', '20070916 08:28:15.290', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9YIR', N'EUUQ', N'BFQR', '20090624 17:41:57.390', '20091002 07:51:17.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9ZIP', N'6UTT', N'101H', '20091201 03:19:33.630', '20100904 19:06:35', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'9ZUU', N'0A98', N'1YTC', '20081022 08:16:13.840', '20081210 02:34:54.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A0TU', N'LOPX', N'HCQS', '20090117 05:38:11.140', '20091009 21:27:33.240', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A0V1', N'NJHO', N'NPA8', '20080413 00:26:55.280', '20080608 07:37:40.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A1W3', N'EP0C', N'J5RI', '20080421 16:28:15.880', '20080801 23:08:45.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A1Y4', N'XZAK', N'3ZW0', '20080129 22:29:56.160', '20080805 14:43:05.570', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A275', N'08CL', N'HW3H', '20070203 03:15:56.620', '20070723 07:21:20.390', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A2S7', N'5IA8', N'8HJM', '20090503 10:00:19.510', '20090806 05:34:39.990', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A5TM', N'9NHE', N'5HB4', '20090621 00:47:31.400', '20091119 14:14:13.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'A9WP', N'GTMR', N'VTTR', '20090420 06:18:19.860', '20091102 16:17:45.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ABY6', N'IT1Y', N'Z6GG', '20070313 10:25:43.250', '20070428 08:04:59.670', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ADR', N'9ID9', N'8ZCS', '20070609 21:27:17.780', '20070621 12:58:02.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AE0U', N'FZO0', N'63YM', '20071216 04:14:49.430', '20080506 20:12:30.320', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AEP1', N'JBVT', N'HMTP', '20090305 02:15:38.790', '20091219 20:40:55.540', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AEWT', N'QZ2U', N'A9NK', '20080107 05:44:03.070', '20080501 13:22:09.730', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AF6S', N'3PV7', N'X911', '20070314 06:39:07.470', '20070514 06:13:57.240', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AG61', N'GJWX', N'BN4H', '20090202 18:44:12.920', '20090222 09:19:13.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AGVC', N'DIOW', N'1O8Z', '20080501 00:09:26.720', '20090110 23:53:53.230', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AIA5', N'AQN2', N'G950', '20091012 09:04:41.860', '20100211 04:13:48.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AN9P', N'JCLA', N'K5ZN', '20071018 09:55:20.270', '20080801 18:15:04.840', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ANG1', N'3WTS', N'BIZ0', '20070710 17:09:01.610', '20070717 10:01:57.580', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AQYZ', N'D5NP', N'WSVS', '20091029 08:19:13.480', '20100816 19:00:23.180', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ARMI', N'HSBJ', N'49YL', '20090413 23:49:27.990', '20090818 07:49:17.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AVT8', N'PLEC', N'DRDO', '20091008 00:36:04.680', '20100225 15:55:01.590', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AXS8', N'TD6Q', N'EYC', '20091105 17:54:40.140', '20100402 08:31:04.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AY8W', N'WO5A', N'8F6H', '20080404 15:27:16.240', '20081001 18:22:30.360', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'AZ4S', N'HS6Q', N'JK4Y', '20071115 11:23:50.440', '20071124 09:16:22.440', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B4Q0', N'RDDD', N'PX57', '20090527 00:47:05.360', '20100212 22:37:24.650', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B5PD', N'9JIY', N'DMRD', '20070110 03:19:23.930', '20070723 00:28:13.200', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B67', N'O4JD', N'JI4E', '20070609 10:12:15.160', '20080118 04:57:08.990', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B68F', N'16R7', N'TGTE', '20071204 17:10:50.820', '20080728 03:18:58.040', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B7AG', N'5NX', N'W5XX', '20080708 06:10:47.150', '20080813 12:53:48.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'B8D4', N'OCP', N'FEEY', '20090729 21:41:49.120', '20091025 11:27:49.130', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BE5F', N'4CD3', N'V6GT', '20070719 10:00:07.930', '20071216 21:16:07.350', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BEKS', N'13LJ', N'EYC', '20090727 04:02:40.760', '20091027 02:49:35.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BERP', N'IH31', N'BM9B', '20080113 08:38:23.570', '20080430 23:00:30.770', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BFOB', N'NR4M', N'6JXQ', '20080818 01:21:27.150', '20090517 07:13:37.020', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BGS0', N'9MXX', N'UVRI', '20070309 08:57:57.060', '20070528 02:15:55.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BKLK', N'E495', N'JB10', '20070716 08:00:33.210', '20080318 06:41:20.090', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BLXC', N'EZ3K', N'Y0T5', '20080614 12:30:39.360', '20080619 18:01:07.310', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BNYZ', N'8AIH', N'X7F', '20080929 10:55:12.130', '20081210 02:10:08.290', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BR7S', N'74M2', N'HXPG', '20080207 08:42:01.120', '20080419 03:25:18.550', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BRO2', N'2SG', N'DTPA', '20080422 21:10:08.690', '20080916 23:34:32.950', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BTT8', N'R2TE', N'XQ92', '20080406 06:27:01.530', '20090101 13:22:43.670', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BV3S', N'IOD7', N'YFVP', '20090408 07:08:29.210', '20090920 15:57:12.010', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BWGU', N'9O3A', N'K3X6', '20070622 18:42:41.090', '20080201 20:45:09.690', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BWM6', N'KX3C', N'A9NK', '20080601 02:54:13.130', '20081213 12:24:46.820', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'BZYM', N'BCEA', N'T20X', '20090612 14:51:10.280', '20100213 04:19:03.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C01Y', N'1HFI', N'3S3P', '20091122 13:21:21.320', '20100803 01:46:28.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C6RG', N'JHJZ', N'KDLV', '20090406 22:04:13.720', '20100112 00:13:25.580', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C6XT', N'OS09', N'N5JD', '20070531 00:42:44.800', '20071202 20:37:58.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C8BU', N'62LK', N'IL0', '20070311 15:00:39.950', '20070911 14:42:07.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C8L6', N'41UE', N'FRV2', '20081230 14:43:54.920', '20090924 10:38:04.870', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'C9B6', N'6VAU', N'F4VX', '20080802 20:33:23.080', '20090212 00:00:18.910', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CATH', N'56OB', N'OGDF', '20070105 19:22:30.740', '20070409 16:30:24.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CB2G', N'OIR1', N'ZU4L', '20090602 06:48:52.780', '20091203 18:29:20.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CCUI', N'2CJZ', N'W5XX', '20080419 16:15:44.100', '20090206 07:38:50.350', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CD2Z', N'5GC0', N'ZHBA', '20070111 02:12:16.250', '20070119 08:53:04.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CD4T', N'PT1T', N'R57K', '20070214 22:53:31.380', '20070521 14:48:38.960', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CH4F', N'U46M', N'GXH7', '20090222 21:13:36.820', '20091208 23:52:23.680', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CHIE', N'TBFH', N'FC6Z', '20070219 10:17:51.210', '20070906 19:46:30.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CHOE', N'43VK', N'OS1A', '20080831 01:55:14.150', '20081231 06:05:58.020', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CIB3', N'OJIX', N'GSMA', '20070204 02:40:26.580', '20070802 23:49:58.210', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CJDS', N'TSIU', N'1V6N', '20091005 17:14:43.390', '20100603 11:15:23.930', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CNO5', N'N43H', N'TJVH', '20091216 01:20:42.920', '20100127 19:15:10.260', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CO1O', N'AGKQ', N'KABG', '20070511 07:39:59.990', '20071126 06:21:10.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CONZ', N'K11H', N'2CHZ', '20080910 13:30:59.400', '20081002 02:34:50.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CR1N', N'APA4', N'1FSY', '20080321 11:16:35.190', '20081111 14:20:23.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CR6L', N'M64A', N'SXGB', '20070129 17:38:00.850', '20070412 13:51:10.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CVOE', N'0A4E', N'EZ0O', '20080316 09:26:57.890', '20080713 02:52:50.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CW2V', N'UWNT', N'L0J1', '20080216 17:48:47.210', '20080402 19:16:51.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CW4C', N'FBLA', N'1H6R', '20080426 03:37:34.030', '20090105 06:49:00.390', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CZ02', N'4TU7', N'V3JV', '20080409 01:09:27.980', '20090129 19:45:31.500', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'CZY9', N'UTLA', N'8HPB', '20070809 05:54:17.260', '20070925 12:59:48.730', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D1AW', N'KI8I', N'9MAN', '20090720 18:30:12.820', '20091129 02:58:30.980', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D1D0', N'MS24', N'WRX1', '20091211 18:10:06.270', '20091227 02:47:46.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D4VF', N'8J0U', N'UWPO', '20080121 01:46:47.750', '20080929 22:29:59.090', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D4Z2', N'KGJJ', N'F7KE', '20070317 21:43:37.770', '20071019 16:31:43.990', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D5BQ', N'4S0S', N'YIYD', '20080603 19:54:05.320', '20090326 17:05:43.560', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D5P8', N'99XA', N'AATO', '20081111 07:31:07.670', '20090821 18:58:16.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D6L0', N'WCZ', N'J6QS', '20090718 20:45:06.730', '20090907 03:06:06.950', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D80J', N'738G', N'JVRE', '20091017 17:39:20.500', '20100116 19:22:59.750', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D80N', N'ZCZL', N'TD6N', '20080816 16:51:46.230', '20081102 19:29:55.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D8RF', N'60J0', N'PFPW', '20090424 06:33:13.170', '20091226 22:47:14.840', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'D8RX', N'TQ30', N'CGDI', '20080726 04:04:33.570', '20090219 06:02:26.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DA7H', N'8I7P', N'T7CF', '20080105 02:47:09.470', '20080917 17:45:02.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DBNF', N'J3DY', N'HCQS', '20080531 09:29:47.750', '20081017 12:30:52.780', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DBOZ', N'9FJQ', N'2CHZ', '20080113 06:11:57.930', '20080720 16:14:40.540', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DFQE', N'8FGA', N'TG0S', '20091116 09:19:18.920', '20091213 19:36:18.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DGQE', N'IOZI', N'5AM1', '20080527 09:26:33.650', '20090122 08:57:41.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DIRR', N'ZSV5', N'E7IY', '20080905 06:03:23.270', '20090411 23:14:13.390', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DK2H', N'23A1', N'0BND', '20070315 13:09:50.020', '20070421 10:49:33.550', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DKP2', N'VFZT', N'6BCS', '20080505 18:42:58.840', '20081209 08:48:00.850', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DNVN', N'HUTT', N'24T8', '20080206 04:21:49.830', '20080829 06:56:44.190', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DOH4', N'4123', N'DRT1', '20070914 02:48:40.920', '20071010 19:12:20.870', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DQ8Z', N'G2YG', N'C9NV', '20080719 19:28:45.110', '20090211 12:35:03.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DQZF', N'YVD7', N'9S13', '20070605 13:49:38.170', '20070609 17:56:08.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DRUO', N'08CL', N'1IY0', '20091127 19:48:42.050', '20100826 17:44:02.190', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DS46', N'3WTS', N'YCT0', '20090403 08:01:05.560', '20090913 13:08:39', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DSJB', N'Q249', N'7J9V', '20071026 13:38:46.990', '20080204 05:23:39.530', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DTR1', N'ID0R', N'L0J1', '20080526 21:20:57.430', '20080904 18:22:08.490', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DW8M', N'20DY', N'F6U', '20071006 07:24:12.080', '20071102 06:01:51.460', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DYOF', N'IJP8', N'K2KN', '20091122 23:04:48.930', '20100312 03:35:37.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DYW4', N'FFKZ', N'9V0C', '20070917 21:10:50.150', '20071116 09:37:40.400', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DZLE', N'M33Z', N'WIYF', '20071206 16:19:05.340', '20080708 18:41:55.950', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'DZUR', N'H3OY', N'GLY1', '20071028 07:44:53.730', '20071124 15:08:21.350', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E047', N'008V', N'MIRH', '20071014 06:25:25.840', '20080704 20:23:07.620', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E1C', N'ID0R', N'VBY4', '20080626 03:40:03.900', '20080801 05:22:41.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E3XS', N'ZU8B', N'VNV5', '20080802 12:50:56.090', '20080925 14:24:11.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E41F', N'SES2', N'SDI6', '20071117 15:16:41', '20080711 07:33:29.020', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E4EU', N'CZIL', N'Q3N8', '20080415 03:35:45.480', '20080520 19:11:55.490', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E5GP', N'LRPZ', N'AA7F', '20081005 02:33:19.300', '20090626 05:49:15.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E71', N'2L0B', N'H3K4', '20080711 17:39:40.930', '20081222 18:30:54.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E7TP', N'0FHQ', N'I5XD', '20071014 04:14:55.370', '20071019 11:50:19.340', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'E897', N'H3EQ', N'5LHG', '20070824 09:04:31.880', '20071117 11:07:30.450', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EFVB', N'YCRI', N'T7CF', '20081019 17:17:35.350', '20090211 16:14:42.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ELGZ', N'UWG8', N'P25Q', '20091011 17:51:03.260', '20091124 18:59:46.200', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EMFK', N'2D3T', N'RIMK', '20070318 22:44:30.560', '20070706 08:16:53.930', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EMHB', N'7T76', N'I5QM', '20070812 17:46:39.170', '20080510 06:16:33.860', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EN00', N'3MHO', N'EKOW', '20070314 07:33:42.980', '20071021 04:13:32.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EO4D', N'VABI', N'2H13', '20070725 21:51:59.630', '20071028 19:25:31.260', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EOPN', N'213L', N'T64J', '20091217 04:29:58.470', '20100202 12:08:03.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EP1O', N'2MOF', N'LI6R', '20090706 12:21:51.700', '20090725 14:14:16.340', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EP3N', N'1EK9', N'S215', '20080328 14:14:46.620', '20080408 22:45:17.640', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ERB2', N'P4VT', N'8T9K', '20070923 19:23:06.060', '20071203 03:51:19.140', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EU8U', N'CUL2', N'NWTB', '20070705 08:41:08.590', '20080120 18:46:06.860', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'EZMA', N'JFK9', N'FAMF', '20091224 06:10:20.300', '20100611 12:32:01.020', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F2YJ', N'HBGD', N'8U93', '20090424 23:34:37.760', '20090721 13:27:50.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F3G3', N'KWTV', N'CI8Y', '20080930 10:34:19.760', '20090601 15:10:33.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F4OX', N'JIVF', N'5AM1', '20080324 15:20:32.480', '20081015 21:23:04.180', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F4PN', N'C5V7', N'T3IS', '20070530 08:04:25.520', '20071014 21:14:47.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F4R0', N'TH20', N'2X8F', '20080324 03:25:53.870', '20081103 11:00:17.330', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F55', N'951D', N'YFVP', '20070415 15:31:58.610', '20070623 14:03:29.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F6G0', N'OD3Q', N'4Y46', '20071015 14:02:54.740', '20080212 03:38:00.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F8G6', N'OBB9', N'RAUD', '20080517 17:51:06.180', '20080701 05:39:44.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F8KK', N'LAPA', N'0FGV', '20090826 04:30:17.220', '20100409 20:58:37.560', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'F8Q7', N'9IYS', N'0WTR', '20090128 09:53:10', '20090518 07:05:51.170', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FCH8', N'WZP5', N'GA5G', '20090425 18:47:03.940', '20090524 10:40:08.030', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FCP7', N'UDA5', N'JXSR', '20090604 16:19:10.630', '20090620 22:23:35.980', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FDXB', N'7OJJ', N'Q09Q', '20071008 11:38:50.740', '20080528 22:03:03.840', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FH6K', N'LJJM', N'2C3', '20080806 12:15:39.190', '20080809 04:52:32.210', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FJ0F', N'AJRX', N'HNHX', '20090115 09:09:09.610', '20091005 02:59:48.650', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FJAE', N'8FGA', N'HNHX', '20090913 16:01:15.220', '20091217 12:17:09.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FK7H', N'EGJ3', N'L0J1', '20071103 22:02:07.670', '20080818 10:55:08.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FKWJ', N'HQAG', N'27GP', '20080823 15:51:05.590', '20080906 01:10:21.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FLJT', N'BJ4Q', N'4T5', '20071022 02:30:09.640', '20080223 18:40:54.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FLTW', N'N0U9', N'J926', '20091217 15:17:21.840', '20100428 21:53:00.060', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FOCR', N'ZY6O', N'UH80', '20080603 10:12:31.200', '20080703 02:49:12.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FOI1', N'RZH6', N'6BRP', '20091022 10:59:50.270', '20100520 11:14:41.930', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FPG8', N'M9XT', N'K5ZN', '20081213 10:12:27.150', '20090720 20:47:59.470', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FQHV', N'NDFH', N'I1LD', '20070918 21:22:26.870', '20080707 19:02:14.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FRRV', N'B9N6', N'T183', '20091119 02:56:10.800', '20091222 16:32:45.420', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FRX8', N'P4P1', N'DR2H', '20080301 02:26:40.700', '20080629 00:54:22.060', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FSTI', N'YXYE', N'DNBL', '20071105 21:11:02.720', '20080102 10:26:07.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FT3C', N'LYTX', N'TEVL', '20071130 06:49:39.480', '20080721 22:24:40.830', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FW78', N'459O', N'2O9L', '20070604 22:30:52.770', '20070809 10:34:24.620', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FWIM', N'NLQN', N'FLQS', '20090514 02:53:00.210', '20090626 19:37:18.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FWVC', N'PF0L', N'Y8J0', '20090317 03:02:27.340', '20090818 22:00:29.660', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FWXJ', N'EJBN', N'ZMGR', '20071229 00:33:01.800', '20080716 07:55:37.040', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FY9O', N'JT4S', N'6WB8', '20080917 16:14:01.440', '20090629 10:33:50.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'FYIR', N'0RXC', N'GUI9', '20091208 19:11:03.860', '20100506 06:41:55.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G09J', N'LGMF', N'D30H', '20080705 21:56:23.480', '20090115 03:55:45.500', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G0GF', N'9NCX', N'N5HP', '20091130 13:57:20.940', '20100225 20:43:34.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G0N0', N'G4Y', N'G7UF', '20090625 12:08:50.990', '20090827 01:51:16.920', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G0VL', N'9WS5', N'PAEE', '20070613 14:51:28.890', '20071205 19:25:06.770', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G1DV', N'KSYQ', N'4NBW', '20070803 19:58:16.940', '20071026 02:50:47.670', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G3MK', N'3RTG', N'2KXX', '20071120 13:11:16.900', '20080427 01:36:24.230', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G5U', N'4QJY', N'IV8P', '20091206 02:30:50.590', '20100415 10:15:10.670', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G94P', N'E4T8', N'6ZAA', '20081205 04:43:46.160', '20090101 12:01:51.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'G95F', N'YZLJ', N'9XLH', '20080322 22:58:24.010', '20080831 02:23:03.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GA78', N'3RT5', N'8U93', '20081015 14:01:04.310', '20090725 04:52:28.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GABI', N'6AS', N'20AQ', '20091114 14:39:03.660', '20100802 13:11:35.460', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GABT', N'9ZDE', N'167Y', '20070714 20:25:08.380', '20071023 07:35:27', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GB4O', N'EYTK', N'AB1I', '20080907 21:10:50.820', '20090513 21:50:53.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GD1J', N'VXAZ', N'J3P2', '20090715 09:31:36.570', '20090902 22:28:42.030', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GFS', N'Z0IT', N'IIIO', '20091028 12:23:36.370', '20100217 05:30:45.420', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GH97', N'5GC0', N'ZCCD', '20081012 23:36:04.700', '20081213 13:57:38.640', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GIVI', N'535K', N'GAJR', '20091107 15:29:39.680', '20100323 02:57:48.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GKH1', N'CK68', N'ESYN', '20091108 08:29:11.020', '20100409 00:44:39.330', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GLD5', N'JFMV', N'1BWX', '20080821 16:04:35.840', '20080911 06:19:07.860', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GREK', N'IVJ6', N'J71O', '20080825 10:01:52.520', '20090212 00:34:34.910', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GSKU', N'48IA', N'SXGB', '20080330 10:08:52.080', '20080405 11:11:52.770', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GURU', N'ZKBR', N'JEPJ', '20071104 23:13:26.220', '20071111 17:26:58.120', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GX97', N'PVO4', N'UWPO', '20090730 16:45:28.390', '20100414 10:44:25.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GXL0', N'35R1', N'DP6F', '20080620 07:26:16.660', '20081218 12:50:30.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GXVH', N'Q61T', N'8BHO', '20090517 02:38:25.590', '20090829 04:45:35.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GXY0', N'7TKB', N'FJT8', '20090823 16:00:49.800', '20091201 16:18:15.360', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GZ12', N'ZVU2', N'489P', '20091209 22:38:22.990', '20100825 05:46:16.020', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'GZ4M', N'D50Q', N'406E', '20080722 23:26:38.100', '20090503 10:35:23.110', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H0LA', N'E8BM', N'4QJN', '20080712 03:31:47.110', '20090408 12:47:18.780', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H23K', N'UMSS', N'6QX5', '20070719 17:05:39.160', '20070911 03:43:53.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H245', N'C1I9', N'Q05F', '20070205 02:08:13.730', '20070515 07:31:24.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H25', N'EWS4', N'BUOA', '20071209 23:20:45.410', '20080305 21:42:26.290', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H2HG', N'5VND', N'LJHB', '20080722 02:51:10.200', '20081125 22:54:51.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H2TQ', N'I5PL', N'YWA4', '20080605 02:18:26.880', '20090326 11:08:56.170', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H30G', N'EGJ3', N'M9P5', '20080725 23:02:52.440', '20081126 15:57:49.670', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H39A', N'JQDH', N'PSG0', '20091014 23:56:54.030', '20091124 08:32:51.930', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H3BB', N'B5HR', N'RL66', '20090618 09:52:07.020', '20100305 01:18:03.980', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'H5UN', N'IZHQ', N'4PKR', '20070628 14:28:26.170', '20070830 14:05:35.190', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HAE', N'0ZRG', N'XOY6', '20070703 04:22:36.880', '20071029 19:49:58.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HARA', N'GCVP', N'7LRJ', '20071007 10:24:10.860', '20080104 20:23:13.540', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HE8V', N'BME4', N'UUTX', '20070108 19:09:41.540', '20070225 07:40:07.090', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HFDJ', N'QD1M', N'GXH7', '20090614 12:59:00.640', '20090803 18:53:44.230', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HG3O', N'5REP', N'ITZV', '20071021 09:23:27.350', '20071026 16:54:40.270', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HGES', N'KGJJ', N'4OJ', '20090312 03:13:24.450', '20090624 09:40:25.990', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HJXI', N'0QD1', N'WWYR', '20090326 22:03:42.490', '20090914 23:07:31.890', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HL6I', N'WDSK', N'WHUH', '20091204 22:10:20.320', '20091220 14:05:23.570', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HM83', N'BGOZ', N'DRT1', '20070624 23:13:35.610', '20080402 04:34:23.460', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HO60', N'L2DP', N'EZP6', '20080203 13:07:00.500', '20080509 03:21:48.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HON5', N'1GOQ', N'J4VK', '20071106 17:28:33.910', '20071118 08:06:19.110', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HPW3', N'I9HJ', N'WY35', '20090211 15:54:19.870', '20090709 17:34:45.210', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HPX', N'FBLA', N'SIQ3', '20080610 05:45:29.930', '20080728 07:59:11.650', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HT3K', N'MTRW', N'63ZW', '20080613 05:56:49.750', '20090209 07:26:31.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HTZC', N'FNNY', N'J35P', '20080816 04:44:41.370', '20090130 15:56:31.440', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HV2U', N'JAG6', N'6V7N', '20081020 15:28:44.760', '20081023 16:31:03.010', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'HZDC', N'JROV', N'BN4H', '20090813 22:56:31.600', '20091216 22:54:52.060', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I1EI', N'7K64', N'9MI8', '20090216 20:41:17.140', '20090404 07:53:07.040', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I2YI', N'8KSE', N'4PKR', '20070204 13:57:21.230', '20071115 14:01:39.410', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I8IP', N'8QO3', N'TZPF', '20080616 22:24:57.950', '20080726 09:30:00.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I94P', N'MAM8', N'Z9ZD', '20080505 12:31:38.670', '20090204 08:51:20.390', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'I9O9', N'6HT5', N'LBMH', '20091211 21:47:42.090', '20100330 06:06:40.100', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IB5S', N'5O1U', N'USM5', '20081027 07:33:08.210', '20090212 08:57:31.050', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IG83', N'DT8J', N'5DH4', '20081012 18:29:35.320', '20081027 20:10:26.960', 2)
GO

--
-- Data for table dbo.HoaDon_Jade  (LIMIT 1000,500)
--

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IH1W', N'36JU', N'27GP', '20091126 17:04:37.650', '20100819 03:56:01.050', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IHWE', N'C6RA', N'OS1A', '20090209 10:30:11.110', '20090908 15:03:16.880', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IIR7', N'HJ7Y', N'LHB7', '20090728 12:42:40.300', '20090828 22:51:06.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IOQT', N'J3DY', N'LUS8', '20090902 01:50:00.170', '20091020 07:15:34.870', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IOVM', N'3SLE', N'PTTW', '20081208 06:33:52.080', '20090526 23:06:05.370', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IPR1', N'J87R', N'JJF', '20070725 23:25:38.310', '20080329 18:35:59.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IPVC', N'K11H', N'H3JN', '20070519 12:26:04.320', '20080109 05:27:58.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IQ8T', N'UPIC', N'AAN8', '20080327 09:41:53.570', '20080901 16:58:58.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IR5Q', N'M64A', N'FO83', '20080613 08:15:11.130', '20081119 09:59:39.090', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ISSS', N'4S57', N'CNKT', '20090425 18:19:12.090', '20090620 19:39:20.910', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IT30', N'XCXJ', N'OUR7', '20090511 00:09:49.580', '20100126 09:31:47.960', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ITM', N'207K', N'5AM1', '20080118 17:59:42.100', '20080705 17:09:12.740', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IW0K', N'BY12', N'NFTV', '20091201 01:40:32.030', '20100224 19:52:57.740', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IWNI', N'FBLP', N'FNYO', '20070218 20:01:24.110', '20070902 23:18:53.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IWR', N'SVIU', N'9N5L', '20071016 10:01:26', '20080102 09:40:47.990', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IX4T', N'ZYTB', N'VFDR', '20090101 16:11:04.130', '20090520 23:37:46.750', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'IX69', N'008V', N'RSF4', '20070718 00:41:08.040', '20080107 14:21:00.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'J3CY', N'NBRF', N'JICJ', '20070724 09:02:25.080', '20080327 13:42:54.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'J6OQ', N'00XS', N'BRV1', '20090712 00:51:59.740', '20091025 16:55:28.390', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JA23', N'U410', N'GXH7', '20091028 12:24:59.640', '20100302 02:55:38.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JAWW', N'21EL', N'2437', '20070629 03:53:25.430', '20070921 01:01:09.790', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JCV5', N'UYKZ', N'BS6M', '20080131 09:08:52.520', '20080526 17:31:07.720', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JCXT', N'RVEF', N'QVUN', '20090609 12:41:19.410', '20100225 06:03:13.360', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JENA', N'5Q7V', N'BV2I', '20090131 03:28:23.180', '20090216 01:00:25.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JGUT', N'QB6Q', N'QHI6', '20081020 13:09:42.450', '20090306 02:48:56.420', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JH58', N'UL6W', N'4NBW', '20081127 16:04:43.660', '20090114 01:07:46.100', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JHCL', N'NDL', N'7IWC', '20080504 01:36:19.830', '20081125 13:36:42.980', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JJ4Q', N'H4HJ', N'IV8P', '20070905 05:12:30.930', '20080610 15:50:23.530', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JLJV', N'G7L5', N'GTUN', '20080208 18:23:33.770', '20080430 22:07:16.110', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JNAY', N'PKI', N'5KVS', '20080125 02:04:58.250', '20080712 16:16:58.510', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JNUW', N'NA5V', N'167Y', '20080123 17:39:00.380', '20080816 18:47:51.190', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JO1O', N'0XK7', N'HMTP', '20071107 15:25:19.840', '20071202 15:40:01.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JP18', N'8MNB', N'SIQ3', '20090730 21:30:33.430', '20100502 19:54:54.110', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JS3', N'DDEJ', N'167Y', '20071015 16:27:30.100', '20080314 17:55:45.130', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JTC8', N'064P', N'6I8M', '20070226 20:46:47.020', '20071201 14:45:23.290', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JTKR', N'4MW3', N'M7NK', '20071112 20:01:29.850', '20080822 21:12:37.810', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JTUD', N'4D2S', N'6YDI', '20071014 06:52:35.800', '20080120 22:06:33.160', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JVSS', N'3RT5', N'7IH7', '20080803 15:17:34.940', '20090416 15:48:14.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'JZBH', N'P5S2', N'H787', '20090907 04:21:18.580', '20091210 23:21:25.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K0PW', N'7N3V', N'9CRV', '20071122 12:40:43.380', '20080301 20:13:43.180', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K1B0', N'IWVD', N'Y35E', '20081110 08:47:02.120', '20090204 20:36:37.800', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K1YH', N'33DQ', N'NSOR', '20090911 08:07:42.370', '20091019 14:46:51.200', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K2NB', N'4XPI', N'WRX1', '20070201 00:55:29.840', '20070315 23:37:38.140', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K30K', N'7T76', N'XYJ3', '20090123 10:14:28.810', '20090531 02:46:22.710', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K3DJ', N'D6KA', N'O9FI', '20080306 08:29:50.550', '20080405 02:13:41.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K56Z', N'IS3W', N'K6QJ', '20080323 02:39:45.270', '20080604 22:52:53.130', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K5SI', N'BRQ3', N'ZARR', '20091104 02:04:52.790', '20100805 17:55:14.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K6YA', N'JFMV', N'669C', '20091101 10:20:27.640', '20100606 14:07:45.770', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K8HM', N'F6TA', N'7HNP', '20090629 17:36:34.010', '20091113 21:54:57.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'K9JD', N'NC74', N'WGQK', '20070930 19:30:04.190', '20080328 07:25:24.480', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KAN8', N'JBVT', N'ITZV', '20090410 05:59:56.140', '20100203 16:18:45.860', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KCKP', N'5TI5', N'CRKT', '20090118 10:43:54.250', '20090120 22:19:09.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KDEY', N'FB1N', N'MRUT', '20080726 13:18:12.880', '20081122 11:30:31.710', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KDO4', N'YWD1', N'JQ30', '20070831 00:23:47.260', '20080522 14:52:34.510', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KGCG', N'867M', N'W5XX', '20071015 21:24:11.740', '20080423 01:28:54.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KIRA', N'H3EQ', N'HC2V', '20070718 07:04:06.310', '20080408 17:42:35.670', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KKOB', N'JAG6', N'9ZSZ', '20070901 20:39:25.180', '20071021 08:19:39.250', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KMDO', N'2L5W', N'JICJ', '20091031 08:32:25.180', '20100210 08:28:23.140', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KN09', N'3MCM', N'MQTJ', '20081211 00:23:08.400', '20090623 09:54:46.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KOAO', N'RYLG', N'898P', '20080228 15:21:04.590', '20080808 03:52:00.760', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KQGF', N'D6KA', N'1PB8', '20081129 14:36:55.860', '20090208 17:48:52.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KQMW', N'CPWP', N'RBU2', '20070324 21:41:37.370', '20070717 06:12:26.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KSM8', N'FZZ1', N'9SBT', '20080902 16:49:31.390', '20090513 22:28:25.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KU0K', N'6UTT', N'CMUG', '20080620 23:03:31.200', '20081225 04:24:19', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KVS7', N'N5X0', N'QN1K', '20090413 01:33:17.290', '20091130 12:54:52.010', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'KY6D', N'5M1I', N'3H2W', '20090716 13:06:45.640', '20100116 07:29:53.370', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L00L', N'HUYH', N'FEEY', '20071014 06:12:07.470', '20071112 00:48:21.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L3PN', N'NY21', N'PXFC', '20080326 12:25:27.870', '20080423 08:26:24.780', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L6W5', N'7GII', N'RBU2', '20091019 12:33:11.670', '20091117 15:57:16.970', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L72L', N'RSB8', N'9N5L', '20081230 01:51:53.970', '20090118 17:02:37.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L8HQ', N'KP5', N'TG0S', '20081125 22:45:35.710', '20090407 12:37:56.420', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L8KD', N'JBSB', N'4HNE', '20070413 13:50:22.840', '20070507 05:45:49.960', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'L974', N'JFK9', N'154J', '20081015 17:00:17.150', '20081206 18:06:21.870', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LBOY', N'LMHE', N'5LHG', '20090305 01:23:57.960', '20090604 04:25:51.960', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LC0G', N'94EW', N'WVJ7', '20090425 17:50:51.730', '20091031 09:02:03.310', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LC99', N'20DY', N'DP13', '20081101 17:46:28.810', '20090715 00:28:27.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LDYY', N'YKKF', N'SJN0', '20090111 08:47:19.590', '20090626 00:14:58.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LFO5', N'KD5W', N'B5P8', '20090619 00:01:46.650', '20090925 20:14:55.950', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LFQU', N'IRFC', N'LDZ1', '20091019 09:51:05.670', '20100105 17:40:33.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LGGQ', N'2AZ4', N'EV3R', '20070829 08:41:17.210', '20070909 00:17:56.380', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LH2V', N'6LRC', N'KDLV', '20070924 04:30:08.880', '20080623 03:25:45.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LH62', N'ZU6I', N'47OZ', '20070730 15:35:07.090', '20071024 11:06:20.890', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LIVZ', N'NKSL', N'2RNY', '20080718 19:19:09.230', '20090504 04:05:13.240', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LKPQ', N'UHW', N'C06X', '20070125 02:47:24.220', '20070823 23:02:18.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LM7K', N'LOPX', N'HROX', '20070103 10:10:48.590', '20070607 03:36:16.550', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LP1V', N'X5ZX', N'CRKT', '20080905 07:40:31.570', '20090421 17:11:02.200', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LPTV', N'GX7E', N'X4FS', '20070316 15:04:55.060', '20070519 18:40:16.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LQHG', N'EXTZ', N'F8YN', '20090916 20:33:26.790', '20100111 03:16:36.380', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LRY6', N'H4Z7', N'XQCR', '20080407 15:51:51.260', '20090103 09:40:49.490', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LSBS', N'6HT5', N'5PR1', '20090210 18:49:58.650', '20090430 03:31:24.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LUWX', N'9LT6', N'IAM7', '20080623 03:26:11.820', '20081113 08:25:09.710', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LV3Q', N'IEPN', N'ZCCD', '20070818 11:22:47.970', '20071227 06:42:59.080', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LXG7', N'WXQO', N'KEGX', '20090106 20:07:50', '20090825 06:29:32.340', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LXKN', N'VOC7', N'W4TP', '20080712 09:14:09.910', '20080820 15:01:13.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'LZNH', N'NTQS', N'D30H', '20090914 05:30:31.900', '20100124 03:09:05.560', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M0CR', N'5J3G', N'BN6N', '20080626 20:59:06.490', '20090111 04:39:33.380', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M0I', N'3RTG', N'VK3D', '20070904 00:11:45.940', '20080223 12:53:13.790', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M1C3', N'56HA', N'JEPJ', '20090305 09:23:44.740', '20091203 22:12:26', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M2G', N'6U2J', N'Z7L4', '20091112 07:40:39.750', '20100819 04:46:55.950', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M778', N'2L5A', N'LZGZ', '20090301 03:17:28.210', '20091102 07:25:02.950', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M8Q1', N'74M2', N'1FFM', '20071229 04:30:25.890', '20080706 07:20:25.290', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'M9PO', N'L72J', N'GKCL', '20070723 09:25:37.150', '20080422 19:01:51.420', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MB25', N'3PIR', N'9MI8', '20090802 19:35:16.930', '20091219 00:07:54.700', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MBJ4', N'KI8I', N'L5K6', '20080818 19:43:19.810', '20090111 12:39:58.110', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MC2G', N'BQ0F', N'3ZW0', '20080416 14:36:09.890', '20081203 19:09:18.180', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MDBX', N'543K', N'TD6N', '20081001 05:21:55.420', '20090112 01:59:57.420', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MDRN', N'NCZY', N'8OIB', '20090922 03:51:09.140', '20100312 12:30:47.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ME1K', N'QZQM', N'W98U', '20070501 22:16:01.730', '20070808 00:17:44.200', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MEP3', N'E93I', N'65CQ', '20070911 10:46:25.790', '20071209 17:00:11.040', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MF8Y', N'I3NX', N'GTUN', '20090820 03:46:26.800', '20091116 07:35:10.570', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MG4P', N'VXAZ', N'AWK', '20090214 08:02:57.400', '20090319 01:17:33.140', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MGS9', N'IJAX', N'YCJG', '20070703 05:17:38.920', '20071023 23:10:51.610', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MHHP', N'9O3A', N'7UXD', '20081012 19:13:24.060', '20090730 01:49:57.350', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MHJI', N'B5N2', N'YZD4', '20070921 22:43:09.520', '20080220 22:18:02.260', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MHRP', N'OQRO', N'E415', '20090903 06:08:39.250', '20091229 21:28:12.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MJ1U', N'YHOI', N'AY71', '20090618 12:56:04.540', '20090926 14:28:36.480', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MJ7O', N'21EL', N'Y7F8', '20071115 17:08:14.790', '20080521 19:58:33.010', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MKJQ', N'FZRX', N'T64J', '20091117 19:27:38.450', '20091218 18:48:39.340', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ML03', N'RSB8', N'WIYF', '20070113 02:16:51.580', '20070217 14:39:46.680', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MLQ9', N'H4ML', N'Y7F8', '20070908 16:53:34.040', '20080206 09:42:24.470', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MNZY', N'RUCW', N'8SKB', '20070623 14:23:27.310', '20070713 19:33:44.940', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MQ0O', N'Z0CS', N'A4WL', '20081227 19:12:50.080', '20090109 04:12:19.750', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MSBM', N'QMQA', N'4MI0', '20080211 04:22:56.070', '20080817 16:15:33.930', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MURY', N'1GOQ', N'0M0O', '20070424 10:41:39.610', '20070620 06:23:08.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MWYT', N'J5R5', N'Q3N8', '20071005 01:21:09.220', '20080522 00:58:52.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'MXR5', N'OE8M', N'GBJ0', '20080607 22:08:13.780', '20081106 14:00:47.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N0W4', N'BCMU', N'AATO', '20091213 17:22:08.200', '20100703 03:05:22.540', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N3YC', N'UQYU', N'WIBB', '20070320 14:18:20.850', '20070601 07:06:57.620', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N8Y0', N'MAMK', N'WO18', '20070109 02:29:04.400', '20070209 15:34:36.910', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'N9A5', N'OSMK', N'5Z88', '20090704 00:50:22', '20091205 01:57:45.130', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NA2S', N'MY25', N'6I8M', '20070126 18:58:47.580', '20071014 05:36:22.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NC5G', N'OCP', N'6JXQ', '20080201 09:17:50.430', '20080713 19:31:02.340', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NCA', N'ZQNW', N'VW2H', '20080329 17:33:05.760', '20090107 08:47:55', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NCTI', N'Z381', N'1YKW', '20071223 17:37:12.390', '20080623 13:51:38.300', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NENM', N'4WG6', N'Q125', '20081023 00:48:05.920', '20090313 06:14:34.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NHYY', N'4QJY', N'6BUO', '20091016 11:18:41.730', '20100510 23:43:53.660', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NIOC', N'HJB4', N'VTTR', '20090306 03:52:37.870', '20090824 20:11:25.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NJ5P', N'VAQR', N'DRDO', '20081011 09:50:18.510', '20090611 02:20:44.220', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NLV8', N'PACT', N'6OKK', '20080703 17:59:58.010', '20090306 08:55:06.490', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NMLM', N'7YHW', N'7W34', '20091003 00:28:42.430', '20100404 19:00:00.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NOG7', N'PF0L', N'FK76', '20090922 16:19:43.230', '20100116 15:55:12.810', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NPP0', N'6YLS', N'RIEW', '20090529 01:04:41.870', '20100202 05:44:47.340', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NR60', N'MT6V', N'7UXD', '20080226 02:18:56.710', '20080808 11:15:47.020', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NRE3', N'EJBN', N'OHSW', '20090103 20:28:13.190', '20090715 19:30:55.370', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NRH7', N'DWWK', N'F7KE', '20081215 03:00:43.100', '20090906 16:14:14.650', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NS05', N'PLO5', N'I1LD', '20071113 06:36:30', '20071206 09:55:58.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NSDJ', N'TPO2', N'H6UZ', '20081017 00:38:18.780', '20090521 19:26:27.820', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NSP3', N'535K', N'8HJM', '20080126 21:42:28.680', '20080616 04:49:14.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NTNQ', N'WYVQ', N'PSMC', '20090310 11:23:52.170', '20091016 22:00:08.010', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NUG7', N'HZCZ', N'IIIO', '20090222 11:30:56.840', '20091125 05:59:52.780', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NUSR', N'XGLY', N'8HJM', '20081214 20:46:33.010', '20090102 08:17:30.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NUW3', N'BXRS', N'70ZD', '20080708 20:26:09.050', '20090310 12:28:51.790', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NX1T', N'3CND', N'AXHL', '20071109 15:36:55.490', '20080127 12:49:05.350', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NX6R', N'J9VM', N'9ZSZ', '20090315 06:59:05.550', '20090510 22:26:06.390', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NY58', N'ZX3S', N'4NBW', '20090315 10:45:31.630', '20090629 20:16:37.820', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'NZID', N'HRX2', N'HZNO', '20071111 23:46:31.350', '20071204 20:16:14', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O0BB', N'T4XF', N'N9R6', '20090404 03:45:43.120', '20091215 03:35:31.450', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O0OA', N'LON9', N'O9FI', '20091030 19:43:12.290', '20091230 08:41:40.010', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O1P5', N'5PK0', N'MH14', '20090930 02:07:16.850', '20091127 01:56:36.160', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O4B6', N'Y36U', N'HZNO', '20080203 21:00:56.330', '20080412 16:16:15.990', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O5RG', N'CP5P', N'NPA8', '20070626 14:19:33.700', '20080108 23:48:01.900', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O70R', N'1PDV', N'MXA3', '20091017 13:17:08.230', '20091220 13:08:02.570', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O7UF', N'LS4H', N'2C3', '20081019 15:44:39.800', '20081202 03:02:45.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O8ZB', N'2BQ', N'Q1LL', '20081210 20:40:28.550', '20090527 08:25:10.170', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'O947', N'JHJZ', N'H6UZ', '20070701 17:34:19.470', '20080315 09:31:08.500', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OAQ7', N'ALW2', N'Q09Q', '20070902 00:56:05.980', '20080402 12:45:42.590', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OBAJ', N'23YJ', N'W53G', '20081121 00:35:41.240', '20090311 22:55:36.150', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OBZ', N'AX2U', N'VKW4', '20071101 22:35:46.830', '20080524 02:59:02.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OCN0', N'9MAZ', N'HOJI', '20090605 18:19:41.630', '20090715 06:28:00.490', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OCTO', N'A6K6', N'X8QZ', '20070902 01:24:14.710', '20080204 09:59:42.250', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OEAI', N'SDRD', N'ZBE5', '20090128 08:32:15.760', '20090529 08:09:50.370', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OECD', N'56OB', N'JICJ', '20080827 04:40:51.090', '20090209 07:41:49.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OEK7', N'2SXQ', N'WB6Q', '20081214 23:51:09.700', '20090415 19:55:40.500', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OIJH', N'IZU', N'AQBD', '20090808 12:20:14.100', '20091216 17:56:11.270', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OIKG', N'09NB', N'REKD', '20090610 08:52:00.050', '20100222 02:44:16.290', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OK0Z', N'LJPZ', N'7V5J', '20080523 18:13:18.910', '20081221 22:01:22.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OLII', N'SKEO', N'NH55', '20071221 18:06:09.950', '20081012 17:45:28.360', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OLKY', N'513Z', N'KMM4', '20090914 21:48:10.360', '20091118 06:57:14.010', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OM2B', N'NRD', N'24T8', '20080327 08:37:29.610', '20081114 21:42:06.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OMDR', N'9MAZ', N'58VF', '20070609 20:28:27.760', '20070727 08:30:01.340', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OQID', N'9NAS', N'A9NK', '20071021 20:59:23.350', '20080102 17:55:54.970', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OSNQ', N'VY2R', N'YWKW', '20090421 01:45:03.660', '20091007 02:59:24.720', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OSWL', N'ONLR', N'KN1D', '20080816 07:28:12.660', '20090111 05:09:18.230', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OTZQ', N'VMQQ', N'KNA5', '20090109 19:07:54.880', '20090825 20:02:16.540', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OVC7', N'OIU8', N'B5CT', '20070412 13:28:24.630', '20071230 04:44:00.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'OWEC', N'2D3T', N'7ZEE', '20091226 14:12:22.740', '20100812 20:14:41.860', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'P0D', N'IWVD', N'QNFD', '20080224 11:48:27.380', '20080228 23:06:36.040', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'P2LN', N'99AE', N'V8A0', '20080805 05:49:13.960', '20081003 22:35:11.340', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'P9P1', N'867M', N'2R39', '20070911 13:27:13.630', '20080108 09:37:07.530', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PAHC', N'U3KT', N'QT3S', '20081129 08:31:12.670', '20090504 06:44:58.830', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PBMX', N'GAF', N'48Q0', '20070626 12:15:04.210', '20070831 21:36:27.590', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PCIK', N'YLLN', N'9S13', '20070501 15:17:19.510', '20080210 12:52:36.450', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PCMT', N'REU2', N'7PBI', '20080715 22:49:20.890', '20090315 15:19:42.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PD8B', N'OET2', N'3TU5', '20090104 01:13:05.630', '20090321 10:13:23.020', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PDNO', N'HS6Q', N'5WSJ', '20090827 01:13:26.870', '20100228 05:53:01.140', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PDQZ', N'48IA', N'H3JN', '20080219 14:46:58.250', '20080515 12:55:22.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PEPH', N'33AI', N'FO83', '20091017 05:07:52.170', '20100222 08:50:42.740', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PGGP', N'11MR', N'21SN', '20070411 18:13:01.090', '20070523 02:44:24.130', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PKCY', N'GJJQ', N'SCAP', '20080802 09:33:37.690', '20081020 02:57:58.790', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PLQX', N'R2TE', N'3WN2', '20070802 09:13:36.500', '20071031 09:57:51.680', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PN7V', N'8MNB', N'YDA8', '20080731 00:51:07.710', '20080827 22:21:42.370', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PNEA', N'BXRS', N'B5CT', '20070515 22:56:34.680', '20080219 18:29:49.040', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PORE', N'GGK4', N'YLBO', '20070504 06:25:02.570', '20070720 18:13:53.340', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PQ22', N'PAJF', N'Q09Q', '20071227 19:21:04.880', '20080930 00:38:06.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PR0E', N'4MW3', N'M81I', '20070317 22:03:22.460', '20070817 04:53:03.310', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PTC8', N'ECMY', N'6HGT', '20090813 02:54:36.760', '20100130 05:16:27.540', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PTUA', N'DT8J', N'J71O', '20080205 11:05:02.540', '20080405 10:52:28.300', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PYJK', N'XUFO', N'1VE4', '20081221 02:07:37.260', '20090313 03:44:55.200', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PZFB', N'YZOV', N'NNOU', '20091108 06:50:11.570', '20100118 10:15:16.100', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'PZSV', N'9MXX', N'WVJ7', '20080104 04:12:12.500', '20080818 06:12:32.570', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q0FH', N'9LD7', N'FZ2V', '20090424 22:20:42.280', '20090525 00:14:50.730', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q320', N'2XQU', N'XQCR', '20081029 21:18:45.890', '20090121 03:00:57.610', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q407', N'6LBR', N'3BUM', '20091022 06:19:02.730', '20100617 10:33:10.950', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q4KM', N'J5R5', N'NH4E', '20070202 16:44:49.870', '20070602 12:19:31.730', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q4UB', N'OQRO', N'LZGZ', '20081120 22:44:55.860', '20090531 07:03:18.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q569', N'A2F3', N'TML9', '20090924 18:26:34.950', '20100719 03:40:04.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q85B', N'LIC1', N'JVV5', '20080925 16:14:52.050', '20090323 13:00:45.530', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q8WB', N'GV6Q', N'P49', '20091130 11:40:05.910', '20100209 03:33:31.980', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Q9NT', N'5428', N'WWYR', '20080205 19:45:06.450', '20081007 08:54:53.050', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QB81', N'5PK0', N'QLCX', '20080122 12:15:26.690', '20081104 13:46:05.260', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QBIQ', N'IMRQ', N'ZC74', '20071218 03:10:34.620', '20080702 18:26:07.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QD57', N'B5N2', N'9B1Y', '20080415 13:36:43.450', '20081012 15:31:30.400', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QEFM', N'JMY7', N'XQ92', '20070827 05:32:16.610', '20080122 08:43:13.980', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QERL', N'GZXX', N'HCQS', '20070512 15:23:00.270', '20071226 22:29:54.150', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QF0L', N'TT', N'RHVC', '20081116 05:08:52.160', '20090408 11:36:38.650', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QG8G', N'NDFH', N'A3HZ', '20091216 14:59:37.080', '20100711 16:35:40.720', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QH5', N'PCP4', N'DRDO', '20090905 07:42:03.540', '20100106 05:28:43.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QI8X', N'G0G6', N'NW7C', '20080304 01:10:43.320', '20080406 04:25:24.490', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QJF0', N'VU9Q', N'F94E', '20080128 23:16:10.680', '20080426 18:47:54.240', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QKNU', N'H4HJ', N'G950', '20091030 23:44:16.170', '20100312 02:00:37.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QMJM', N'23A1', N'2R39', '20090118 21:20:16.080', '20090419 03:45:13.740', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QP6W', N'9HZ6', N'4HRZ', '20090701 17:45:08.200', '20091216 00:20:29.370', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QP9S', N'2TVF', N'M9QK', '20071109 20:08:05.540', '20080817 08:20:40.410', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QQUC', N'4W1Y', N'AZDS', '20090716 13:19:30.040', '20091108 13:18:39.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QS6X', N'41UE', N'I2YX', '20080517 22:07:21.920', '20080919 18:53:21.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QSGS', N'5OB0', N'ZCEF', '20080801 18:02:43.040', '20080823 14:14:16.880', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QTG7', N'H6JK', N'HKC0', '20071013 20:23:28.920', '20071026 09:05:41.740', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QVFP', N'PXVS', N'PYQF', '20090608 15:37:58.850', '20100303 13:07:05.100', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QXDR', N'TH7H', N'5HB4', '20071029 01:42:12.300', '20080228 10:00:58.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QXHL', N'HJWK', N'L19T', '20091103 21:08:37.150', '20100131 08:42:06.260', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'QZSB', N'3CND', N'DTCN', '20070723 00:33:52.090', '20080515 06:06:10.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R3PA', N'EYTK', N'O6QY', '20090104 15:02:29.460', '20090721 11:17:12.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R59A', N'JL7D', N'2C3', '20080122 13:05:46.900', '20080804 11:41:06.150', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R93G', N'V132', N'F6BT', '20081120 03:24:07.540', '20090730 20:24:33.490', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'R9NR', N'ALW2', N'6HGT', '20090928 00:05:05.540', '20100411 06:29:09.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RA9D', N'4YD4', N'E415', '20081227 01:13:14.890', '20091003 15:01:59.920', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RAZD', N'IWM8', N'2X8F', '20081207 18:32:29.840', '20090211 19:01:54.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RCS1', N'UWGC', N'UH80', '20091228 00:49:58.220', '20100209 14:48:29.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'REK3', N'9LT6', N'4MI0', '20090527 12:42:00.760', '20091021 08:06:03.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RF80', N'D140', N'7V5J', '20071214 23:09:27.080', '20080416 22:01:58.120', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RHNI', N'TI83', N'V8A0', '20070623 06:41:42.050', '20071105 18:40:40.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RJD2', N'LSK', N'33RD', '20081107 00:22:10.050', '20081225 15:50:15.260', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RKIH', N'X8DU', N'8BHO', '20071215 21:17:42.860', '20080414 03:03:23.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RLU6', N'JMY7', N'HCQQ', '20091102 08:20:04.140', '20100306 15:18:40.950', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RMWR', N'M33Z', N'J71O', '20080919 11:09:53.890', '20090322 22:09:42.060', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RTRP', N'X3BU', N'OIME', '20090328 09:00:18.480', '20091121 13:52:48.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RUEW', N'Q8U9', N'FA8Z', '20070415 06:27:32.150', '20071201 19:01:56.600', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RVUA', N'AWZT', N'NMQE', '20090114 07:40:09.160', '20090810 10:39:54.310', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RVWT', N'AXZV', N'Q0TM', '20081212 22:17:06.820', '20090531 08:58:41.470', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RXHA', N'33DQ', N'D3ZB', '20080908 11:04:50', '20090424 20:59:10.870', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RXM5', N'FFKZ', N'1H6R', '20080424 14:29:13.820', '20090102 19:44:41.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RXN1', N'QFVG', N'SFM', '20070610 22:21:40.110', '20071107 00:15:32.020', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'RY0H', N'NSYH', N'WGQK', '20091124 21:43:06.170', '20091205 09:37:01.790', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S26L', N'S517', N'V8WT', '20080815 17:48:50.840', '20081019 12:02:38.980', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S29J', N'3PV7', N'63YM', '20080825 00:46:31.880', '20090602 00:23:15.780', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S3TP', N'HI4N', N'X5JW', '20080525 07:28:48.180', '20080527 21:09:12.690', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S809', N'LS4H', N'G7UF', '20071226 23:04:44.490', '20080227 23:17:35.760', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'S8CC', N'BCEA', N'LFGO', '20090307 00:00:11.140', '20091115 11:58:59.990', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SBHI', N'VX8H', N'VFDR', '20070221 03:34:03.420', '20070428 11:55:14.210', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SCLR', N'D50Q', N'VK3D', '20080717 02:42:48.780', '20080901 06:14:58.240', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SE2E', N'MAM8', N'GBJ0', '20090529 13:28:13.480', '20090715 03:30:36.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SGNI', N'IZHQ', N'7BCY', '20090206 02:44:20.100', '20090406 07:29:42.320', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SGQX', N'A3BN', N'U2EU', '20081209 20:06:24.180', '20090423 20:21:24.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SHVC', N'IS3W', N'SIQ3', '20070429 05:50:41.370', '20070831 19:52:28.960', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SIOY', N'FMRN', N'2K6W', '20090920 09:24:34.360', '20100504 13:05:57.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SISQ', N'DIOW', N'GA5G', '20081110 13:37:05.540', '20090706 04:45:42.300', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SJX1', N'JAQA', N'7J9V', '20090203 02:56:49.080', '20090331 02:05:22.630', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SP4X', N'SREB', N'BOFP', '20070821 02:50:15.800', '20070917 21:42:08.820', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'STOB', N'GD4P', N'FOP', '20071209 05:48:06.750', '20080203 13:54:13.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SU4F', N'9YDB', N'JFY5', '20090915 07:49:58.030', '20091203 15:47:18.900', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SUHI', N'PZ0A', N'X8QZ', '20080229 00:57:26.890', '20081108 23:53:23.600', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SVI3', N'207K', N'VCAP', '20090328 02:16:46.750', '20090930 11:29:47.150', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SW19', N'1G8R', N'GSBE', '20090606 20:57:39.760', '20090724 22:19:23.420', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SWUG', N'YVSA', N'IX5Q', '20070410 21:10:46.880', '20071025 14:07:25.290', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SXLX', N'PM9C', N'1IQ7', '20070206 13:25:06.700', '20070216 23:03:48.530', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'SYQW', N'HPAN', N'Q18O', '20080606 07:17:04.990', '20080810 03:06:28.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T0CB', N'9IYS', N'008T', '20090717 01:06:00.210', '20100210 07:45:13.350', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T161', N'2O5X', N'2X8F', '20070321 03:46:17.250', '20070412 10:19:08.130', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T2XR', N'4GA1', N'GXGQ', '20080129 08:40:06.460', '20080413 18:42:03.740', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T3U4', N'8AIH', N'4DQC', '20071016 14:58:29.400', '20080220 03:52:25.390', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T4DD', N'ONLR', N'GJS8', '20080924 23:00:05.290', '20090423 03:09:50.640', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T5SM', N'866Y', N'CTI0', '20080218 22:03:30.270', '20080616 22:04:18.310', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T6RU', N'L45F', N'LFGO', '20080430 09:58:30.470', '20080722 23:02:02.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T8W4', N'Z954', N'WOD7', '20070207 21:18:58.820', '20070327 09:12:16.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'T9GV', N'AJRX', N'MGCN', '20091214 11:04:49.810', '20100324 03:00:53.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TAVR', N'QENQ', N'I5ZC', '20091226 11:35:13.330', '20100521 06:05:32.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TEZT', N'62LK', N'AJT7', '20090819 07:55:40.580', '20100102 20:23:01.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TGHK', N'99AE', N'TPM5', '20071022 21:23:17.200', '20080521 00:25:31.910', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'THC9', N'5UWJ', N'3H2W', '20070428 06:45:04.290', '20070607 00:29:53.740', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'THNK', N'I8BM', N'928L', '20070119 07:04:34.700', '20070909 23:35:33.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'THOQ', N'FOMW', N'HO2J', '20070306 05:04:38.580', '20070911 12:38:56.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TIIB', N'5M1I', N'DIYY', '20090927 10:15:48.980', '20100212 00:48:17.520', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TIX0', N'HALE', N'TEVL', '20090326 07:21:06.020', '20091011 05:18:24.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TJ88', N'3AIF', N'5WSJ', '20070127 03:08:00.870', '20071022 18:21:54.700', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TMBF', N'D5NP', N'LJH', '20070808 14:04:08.620', '20080331 20:20:48.930', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TNF7', N'866Y', N'RS9L', '20090708 05:09:49.630', '20100403 02:20:26.920', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TO3B', N'9ID9', N'5ZV9', '20080104 22:41:28.350', '20080607 12:09:12.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TOZG', N'EHHP', N'A6X', '20080115 11:19:25.930', '20080514 21:03:55.970', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TP2C', N'94ZX', N'M6B1', '20070502 21:51:23.090', '20071028 10:51:22.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TP7E', N'SW8I', N'7DHU', '20080920 12:10:44.480', '20090630 08:18:05.400', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TQ8R', N'LTN9', N'6KZQ', '20081107 20:56:42.750', '20081124 11:31:24.070', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TUQ1', N'7RBJ', N'1D4J', '20080714 14:30:43.130', '20090510 03:26:17.300', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TV81', N'C6RA', N'MZTT', '20070211 23:22:23.630', '20070619 15:49:54.160', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TW3N', N'RCUL', N'3H2W', '20070104 23:13:11.420', '20071009 15:11:59.060', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TW5E', N'1VE7', N'BN4H', '20080812 04:26:59.550', '20090324 01:35:27', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TX8G', N'XOB1', N'ON3D', '20070702 05:36:14.360', '20080107 20:39:17.820', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'TYW6', N'572Q', N'9WPW', '20090904 09:51:44.380', '20100203 10:45:48.860', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U17F', N'4W1Y', N'7OD6', '20071108 07:59:53.070', '20080222 06:32:28.520', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U1M3', N'NKUG', N'VNV5', '20081226 23:28:55.910', '20090510 07:44:18.890', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U3JV', N'XQUJ', N'2ECW', '20080421 19:18:55.470', '20081221 15:10:05.580', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U3XU', N'GB8C', N'N1DV', '20080807 18:41:14.980', '20081210 13:59:20.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U4EN', N'K630', N'N1DV', '20080718 14:50:17.550', '20081109 02:36:00.320', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U6TA', N'2L5W', N'CEG6', '20080526 01:21:26.640', '20081117 05:50:31.760', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'U8OI', N'KVVZ', N'ZU4L', '20091215 20:45:06.860', '20101004 01:01:33.180', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UB8P', N'2IUE', N'4PKR', '20080626 06:07:00.020', '20090315 13:51:07.290', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UBBN', N'KMBI', N'I5ZC', '20090823 11:21:21.040', '20091108 20:01:05.710', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UDDS', N'FVYR', N'5MSR', '20080710 15:48:08.990', '20090328 11:15:37.820', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UE0B', N'D1I7', N'2437', '20070828 15:26:22.390', '20071223 16:11:25.580', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UEPP', N'WJQK', N'CC21', '20081101 18:06:21.430', '20090723 18:28:32.910', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UEYL', N'4XPI', N'7W34', '20070828 02:15:37.140', '20071030 19:19:39.890', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UF74', N'F6TA', N'HKJB', '20080726 04:12:28.610', '20090111 06:53:08.370', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UHU5', N'ADTJ', N'INH3', '20070402 10:58:40.340', '20071015 02:02:34.690', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UHUR', N'8WSG', N'FH6N', '20090912 02:29:25.070', '20100101 15:24:35.320', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UJ0A', N'A2N2', N'EB2I', '20090108 13:02:12.190', '20091022 10:04:45.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UJSG', N'XYD4', N'FIQQ', '20080519 23:43:18.990', '20081014 20:14:39.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UKCD', N'CUL2', N'XSES', '20070718 01:07:21.870', '20071120 12:17:43.810', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UL2', N'TEPC', N'N5HP', '20071223 20:07:53.460', '20081018 09:26:08.770', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ULFC', N'IPQ1', N'ZMGR', '20070721 06:23:40.230', '20071110 13:12:00.560', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UMTW', N'IKO1', N'61H3', '20091014 02:34:50.460', '20100511 01:49:19.540', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UQ0L', N'G2H3', N'63ZW', '20070115 21:11:12.690', '20071002 01:32:25.780', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UQ9C', N'N5JF', N'YDA8', '20070820 20:41:57.140', '20080106 15:03:03.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UR8Z', N'86R', N'9V0C', '20080825 18:25:57.800', '20090430 01:31:46.530', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'URMC', N'R0K0', N'K1PG', '20071120 22:10:42.020', '20071128 19:02:53.050', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UUV3', N'28E3', N'50G9', '20090515 08:35:15.510', '20090928 07:03:36.010', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'UYQX', N'0Y6J', N'6MHG', '20080618 22:34:18.840', '20090212 11:02:14.810', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V1CS', N'33AI', N'E12R', '20080718 06:39:28.620', '20090126 18:56:22.050', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V1TZ', N'FLS6', N'JKNB', '20090421 13:27:11.880', '20100210 18:21:40.770', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V2JM', N'0J82', N'6KZQ', '20070305 14:37:05.680', '20071211 05:49:48.780', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V3OC', N'C9YV', N'3U0D', '20091230 06:41:26.100', '20100929 16:41:02.770', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V3R6', N'4C7E', N'MMT9', '20070901 09:33:43.510', '20080428 15:09:32.290', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V4KJ', N'MHS7', N'O80V', '20080110 21:48:53.390', '20081105 17:18:32.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V6OM', N'NEMH', N'B40L', '20070330 03:46:52.700', '20071209 14:55:32.890', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V6WP', N'M2MD', N'UVRI', '20080227 01:36:29.200', '20081126 23:04:31.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'V8B3', N'D8Z3', N'TZPF', '20090215 10:01:08.830', '20090807 12:16:26.330', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VA5Q', N'40B', N'GBJ0', '20090222 03:11:41.580', '20091212 17:59:22.270', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VBC6', N'ZKU', N'4F5M', '20090214 22:43:50.030', '20090519 06:32:22.120', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VD9L', N'84I9', N'TB2A', '20071016 14:00:56.610', '20080515 00:24:16.940', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VEEQ', N'NLIW', N'H47G', '20071014 05:56:47.330', '20071029 11:02:48.040', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VEIR', N'NKSL', N'SHR2', '20080217 16:49:07.270', '20081130 05:46:33', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VEOA', N'F6TX', N'RPC7', '20081126 16:29:22.250', '20090422 19:56:06.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VFUS', N'15TH', N'9LRN', '20070121 12:01:46.360', '20070910 19:02:59.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VFYO', N'I7G7', N'K9LM', '20081011 21:38:08.860', '20090413 19:53:23.230', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VGL8', N'73E2', N'GVU0', '20091214 06:08:54.070', '20100514 08:42:00.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VGZ5', N'GFKZ', N'4JLY', '20081213 14:03:42.010', '20090208 19:41:05.440', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VHEI', N'73CX', N'YIYD', '20071231 06:26:32.500', '20080728 19:42:43.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VHOT', N'1ZN9', N'LBMH', '20090123 14:41:40.350', '20090912 09:23:36.740', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VJ6N', N'9LD7', N'GCN5', '20091111 15:59:01.620', '20100329 00:40:37.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VK89', N'TY2L', N'FNYO', '20091130 16:36:17.590', '20100502 09:11:37.480', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VLQ8', N'A8SQ', N'8F6H', '20081110 08:20:06.350', '20081110 14:59:54.660', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VMS5', N'459O', N'6016', '20091125 03:04:42.910', '20100715 17:08:24.220', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VNF6', N'J7TO', N'EC30', '20070811 23:57:47.320', '20070815 22:14:23.920', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VNIT', N'E2K6', N'7W34', '20080617 08:16:14.880', '20090128 03:38:58.560', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VPX0', N'J3KP', N'FLQS', '20070324 09:11:57.010', '20071025 21:48:55.890', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VQJ6', N'6YLS', N'FRV2', '20081109 07:25:57.720', '20090707 03:09:13.270', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VR4W', N'C9YV', N'PKUI', '20070829 13:18:58.080', '20080331 15:20:32.130', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VRHW', N'MRV0', N'4XQ9', '20070602 12:41:35.870', '20070718 13:22:46.970', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VRR7', N'1SLS', N'XXZH', '20071203 07:06:06.370', '20080619 17:09:54.170', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VRZ4', N'5G58', N'Z02R', '20080205 11:45:57.080', '20080919 03:02:32.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VSR4', N'OQ1K', N'4WCN', '20080614 17:40:32.940', '20090223 01:28:41.600', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VTC2', N'FZVE', N'DP6F', '20070612 01:48:32.270', '20080314 08:05:08.680', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VV5N', N'NR4M', N'MZTT', '20070427 04:41:34.730', '20071012 09:42:28.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VV63', N'NQ06', N'SHR2', '20090220 02:11:49.470', '20090827 09:34:05.100', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'VWM7', N'GJWX', N'TPM5', '20080306 07:50:43.640', '20081216 21:09:33.140', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W03', N'0APT', N'DSEX', '20080623 16:53:33.250', '20081222 12:24:40.830', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W0I5', N'7P7I', N'406E', '20080821 18:48:12.680', '20080822 08:35:32.270', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W2DK', N'DLDW', N'OIME', '20091201 21:56:14.050', '20100214 12:41:44.710', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W2XI', N'TPO2', N'NMQE', '20080427 04:01:11.890', '20080630 18:39:07.990', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W2Y3', N'35R1', N'JI3Q', '20091022 23:15:21.770', '20100128 20:39:52.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W443', N'9EI5', N'1O8Z', '20090202 18:47:41.170', '20090520 23:37:58.630', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W8G6', N'EEEZ', N'ZU4L', '20090517 00:23:15.980', '20091108 10:55:37.690', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W8OT', N'94ZX', N'9WPW', '20080511 06:28:06.960', '20081115 15:41:29.560', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'W9UJ', N'WYR2', N'NH55', '20090111 03:48:03.670', '20090806 19:42:14.240', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WAJ0', N'C4EY', N'JL24', '20080103 15:32:04.350', '20080207 08:36:59.520', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WC2S', N'6O8J', N'C0FC', '20071221 13:27:14.230', '20080322 04:38:59.230', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WCWJ', N'97BH', N'BN4H', '20070206 10:08:59.710', '20070915 13:31:03.570', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WDDB', N'WVGR', N'OHSW', '20070809 17:38:55', '20080308 07:39:16.940', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WDIK', N'682F', N'DP6F', '20080901 03:13:56.330', '20090410 04:14:07.670', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WEAF', N'AGKQ', N'CXJT', '20080815 02:11:07.480', '20090319 08:16:36.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WIGY', N'Z6NA', N'VK3D', '20080220 02:18:58.500', '20081111 06:05:46.540', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WIZY', N'8HBX', N'WIXF', '20070404 17:33:13.990', '20070624 06:05:25.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WJ4B', N'YMTI', N'NWIZ', '20090602 09:40:28.940', '20100311 16:48:57.270', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WJCM', N'CU7T', N'EVT7', '20090326 04:41:31.130', '20090420 14:28:31.610', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WK43', N'BMVW', N'ZTBG', '20090911 05:50:26.630', '20100509 08:40:54.110', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WMNV', N'MGCB', N'9T5B', '20091230 19:03:48.320', '20100805 18:21:55.510', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WNTA', N'MSFT', N'Z6GG', '20081202 10:16:00.110', '20090303 12:47:16.500', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WO9Y', N'8OHR', N'1IY0', '20080228 01:00:38.720', '20081006 15:54:49.430', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WQCP', N'R782', N'PB1B', '20080913 02:17:59.260', '20090116 19:04:21.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WU0C', N'CHNI', N'LU3R', '20080321 23:27:06.100', '20080519 15:27:44.940', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WUH0', N'03YD', N'70ZD', '20090902 20:08:23.490', '20100225 05:06:02.360', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WX7V', N'XIL2', N'BQTV', '20071113 08:50:22.640', '20080126 00:08:39.560', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WXAM', N'H4ML', N'6RPV', '20090504 14:50:36.220', '20090824 05:55:49.460', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WXBA', N'513Z', N'N1DV', '20080609 03:30:22.930', '20080909 03:06:40', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'WZD9', N'MMX', N'5WSJ', '20081007 16:00:03.610', '20081015 17:03:01.640', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X0E6', N'S3RG', N'80PP', '20070522 23:38:00.370', '20070531 21:35:35.460', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X1XE', N'8ML1', N'K8QO', '20080927 03:37:59.880', '20090322 07:30:10.510', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3HV', N'3DN6', N'G0VT', '20090310 06:37:28.760', '20090315 06:07:34.230', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3PM', N'W262', N'D30H', '20080801 02:57:02.520', '20090224 18:33:51.660', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3QT', N'AQ2M', N'4WCN', '20081108 00:45:41.220', '20081211 17:10:55.530', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X3TC', N'TREW', N'SSVR', '20070129 16:38:16.460', '20070413 01:06:04.580', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X5UL', N'LWVD', N'0GQS', '20070312 03:55:49.120', '20070415 10:01:43.840', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X7AZ', N'Z0ZN', N'DNBL', '20070922 16:01:39.330', '20071025 19:46:19.440', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X7O1', N'3GR', N'AA7F', '20070802 09:52:14.300', '20070831 02:47:55.760', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X8L2', N'VZLD', N'UJ1S', '20070722 15:40:34.080', '20071225 06:54:57.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'X9QV', N'MEGK', N'TB2A', '20090916 17:02:02.390', '20100709 04:36:23.460', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XA28', N'SXA0', N'HOJI', '20070730 03:39:26.800', '20080423 22:57:32.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XAYB', N'H4Z7', N'C06X', '20090407 09:49:49.350', '20090528 07:54:30.170', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XBMY', N'PD95', N'99KR', '20071228 23:56:06.480', '20080427 16:20:16.880', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XCTM', N'Q7D3', N'Q09Q', '20071009 11:02:09.460', '20080530 07:11:35.830', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XD26', N'GXWG', N'J6QS', '20080820 23:03:21.150', '20090205 11:38:48.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XDS3', N'T8MK', N'LBMH', '20080904 23:38:12.090', '20090206 17:00:53.090', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XGO2', N'TO84', N'2437', '20090204 01:27:30', '20090520 01:17:35.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XHV', N'2SXQ', N'QKFH', '20090311 23:27:55.990', '20091012 08:36:48.530', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XI7', N'P33X', N'8ZCS', '20080121 05:33:34.230', '20080604 04:13:51.330', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XJCV', N'ICUM', N'BX49', '20081217 08:57:31.210', '20091004 00:56:02.440', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XK5R', N'WDQ7', N'QKFH', '20070913 20:03:48.520', '20080416 11:57:54.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XM9', N'U9BO', N'C1VI', '20080111 14:03:02.420', '20080423 08:07:28.470', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XP9G', N'3MHO', N'X41E', '20090202 05:26:33.770', '20090624 00:43:14.140', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XPNY', N'00XS', N'H3K4', '20090106 08:48:15.340', '20090925 11:34:36.930', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XQI3', N'49AT', N'GSMA', '20080804 11:28:28.750', '20090131 08:36:55.250', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XRMV', N'NHD0', N'898P', '20080722 05:28:20.410', '20090319 20:58:09.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XSD4', N'K1GE', N'E12R', '20091125 20:45:50.500', '20100509 04:00:45.410', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XSJG', N'43VK', N'MMBM', '20090426 08:12:53.690', '20100122 06:19:47.720', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XSKY', N'LPV3', N'WHUH', '20080324 01:57:43.090', '20081224 07:59:36.830', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XT53', N'R0K0', N'HKJB', '20080110 07:42:32.150', '20080310 23:34:21.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XVCY', N'HM3I', N'ODXP', '20090102 14:54:14.080', '20090716 06:46:12.450', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XVWM', N'U6HR', N'ZIK7', '20090630 04:11:07.990', '20100117 21:38:23.270', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XXOC', N'D8HO', N'LVPB', '20070422 05:25:11.900', '20071013 18:23:54.970', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XZCR', N'AWZT', N'IIIO', '20071208 20:33:31.040', '20080111 16:01:28.300', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'XZSQ', N'0XK7', N'60GH', '20081211 01:17:47.830', '20090120 20:04:44.030', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y08Y', N'217H', N'LF1B', '20090312 23:28:41.360', '20091125 06:55:24.850', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y162', N'JIIH', N'CEG6', '20081016 09:09:51.490', '20090627 02:47:06.380', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y2FS', N'Z656', N'NKCD', '20080214 07:00:34.170', '20080310 11:50:58.720', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y2FT', N'A6K6', N'CEXL', '20090705 02:10:33.440', '20091009 22:21:10.370', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y2HF', N'LAPA', N'K8', '20070520 13:40:23.850', '20071211 11:17:53.990', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y30P', N'MLBY', N'YCJG', '20090921 12:13:19.620', '20100605 20:54:52.380', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y5FG', N'A2F3', N'RXBD', '20070214 22:21:43.040', '20070514 09:56:08.780', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y7KU', N'89EP', N'3S3P', '20080127 07:41:28.580', '20080803 08:33:43.970', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Y8UU', N'867J', N'M7NK', '20080903 02:40:09.630', '20090126 21:58:48.200', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YBOD', N'53AM', N'LGTW', '20080418 11:22:31.430', '20080703 19:49:13.800', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YF15', N'4UAE', N'5GI', '20090220 09:51:38.470', '20090517 03:21:40.380', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YJL1', N'NSYH', N'ITZV', '20080715 17:05:29.400', '20081214 19:24:52.980', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YL1B', N'8FG8', N'Y35E', '20080514 17:25:05.560', '20090226 18:05:04.080', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YL1M', N'5GQT', N'OIME', '20080120 10:23:42.910', '20080121 10:19:54.050', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YLJ0', N'SE19', N'GTUN', '20070626 17:50:25.760', '20080310 10:17:46.920', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YM31', N'QD1M', N'ZU4L', '20081031 06:29:24.390', '20090106 13:54:12.820', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YNYC', N'SYEP', N'NF21', '20080906 05:33:04.260', '20090123 05:34:17.250', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YPPT', N'XW0H', N'A3HZ', '20090326 19:54:15.770', '20090527 18:01:41.910', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YQC7', N'8H9D', N'OW1Y', '20080907 10:28:54.610', '20090110 21:58:37.120', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YQYJ', N'CPR8', N'7HNP', '20090621 04:34:47.700', '20091031 17:00:49.580', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YVIU', N'5TTD', N'JQ30', '20071127 15:41:19.380', '20071211 22:11:20.690', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'YX7D', N'667O', N'H8I0', '20090103 13:28:17.580', '20090919 19:34:28.710', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z1H3', N'0QD1', N'X911', '20070425 07:46:00.780', '20070718 13:02:45.580', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z2Z2', N'K8RG', N'JJF', '20090416 15:15:27.800', '20100203 21:12:48.960', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z3UK', N'IZ69', N'YDA8', '20090624 10:48:21.530', '20100118 07:07:07.200', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z4AK', N'572Q', N'6ZAA', '20090923 21:40:44.720', '20100330 14:56:14.790', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z58U', N'9WS5', N'LI6R', '20091210 06:49:40.910', '20100325 05:37:28.960', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z5Z3', N'U7HJ', N'INH3', '20070314 22:07:37.180', '20070916 14:14:43.150', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z79I', N'36JU', N'F8YN', '20080717 17:33:04.050', '20090116 10:53:15.430', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z7Z8', N'6ACX', N'AIY7', '20090603 00:07:07.350', '20090905 10:29:19.750', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'Z8OJ', N'JL7D', N'AW4P', '20091120 05:38:27.040', '20100524 22:24:54.900', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZFL6', N'JPCL', N'TZPF', '20090509 09:31:53.970', '20091213 23:23:47.420', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZI3O', N'9JIY', N'KEGX', '20070310 08:06:39.350', '20070821 11:24:29.210', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZJE0', N'1D4I', N'FC6Z', '20071009 09:22:24.370', '20071105 00:21:15.410', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZJTT', N'HNG9', N'IVTR', '20080206 09:01:50', '20080409 13:43:50.100', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZLE8', N'LMHE', N'I1LD', '20070207 17:35:42.140', '20070728 06:40:11.240', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZLYU', N'XOZW', N'GJS8', '20090908 05:52:08.700', '20091218 09:31:09.410', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZNSL', N'UPND', N'2O9L', '20080130 23:57:41.280', '20080815 03:58:51.430', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZOSD', N'FZNP', N'9UNG', '20070719 20:51:50.610', '20070815 19:23:17.940', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZPOJ', N'738G', N'PXFC', '20090713 16:30:24.850', '20100427 02:29:55.320', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZQIB', N'VN1I', N'J9CN', '20090331 15:12:41.690', '20100114 09:34:13.050', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZRY6', N'QJQN', N'CNKT', '20090702 22:29:25.290', '20091004 11:51:21.540', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZSC4', N'GD4P', N'UAX8', '20080518 21:45:41.040', '20080610 03:37:53.590', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZSOQ', N'KUYO', N'70ZD', '20070411 08:59:13.450', '20080201 04:28:10.640', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZT1X', N'9YDB', N'DGXQ', '20080831 00:41:28.130', '20090411 02:41:11.070', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZV97', N'C8EP', N'4NBW', '20071010 20:12:57.690', '20080208 13:06:56.210', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZWAZ', N'5LI0', N'TJVH', '20081206 20:58:28.920', '20090423 09:16:13.060', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZXDE', N'LIQ6', N'4F5M', '20080507 22:24:16.990', '20090101 01:51:11.280', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZXER', N'UUJR', N'T183', '20080414 13:23:45.230', '20080428 10:10:20.600', 2)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZYBL', N'SO1Z', N'BRV1', '20080906 16:07:30.100', '20090501 08:41:17.060', 1)
GO

INSERT INTO [dbo].[HoaDon_Jade] ([MaHD], [MaKH], [MaCH], [NgayBan], [NgayCapNhat], [TrangThai])
VALUES 
  (N'ZZTW', N'G79', N'TZYE', '20080312 14:02:11.570', '20081223 23:46:12.050', 2)
GO

--
-- Data for table dbo.KhachHang_Jade  (LIMIT 0,500)
--

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'008V', N'Andrea Romero', N'Kazakhstan - Alabama', '20080921 18:17:40.830', '20090506 12:02:32.600', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'00XS', N'Shawn Sheppard', N'Jersey - Virginia', '20070323 09:32:21.320', '20070422 07:20:16.260', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'03YD', N'Leah Hobbs', N'Western Sahara - Maryland', '20080810 01:18:15.920', '20090221 04:22:12.700', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'064P', N'Kristian Leon', N'Saudi Arabia - Idaho', '20071128 16:12:55.900', '20080904 08:37:42.090', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'06VT', N'Geoffrey Colon', N'Montenegro - Hawaii', '20070418 05:01:59.230', '20070724 12:26:20', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'08CL', N'Joni Sampson', N'Kazakhstan - Georgia', '20090219 08:13:31.990', '20090717 08:23:25.930', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'09NB', NULL, N'Azerbaijan - New Jersey', '20080704 22:58:22.510', '20090214 22:06:59.910', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0A4E', N'Seth Morrow', N'Sweden - Michigan', '20070921 08:42:41.380', '20080317 05:40:10.070', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0A98', N'Edward Choi', N'Georgia - Delaware', '20080229 08:51:23.080', '20080308 00:02:12.870', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0APT', N'Jarrod Gardner', N'Lithuania - Oklahoma', '20091013 18:58:55.920', '20100621 16:37:44.340', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0F7T', N'Sandy Smith', N'French Guiana - Tennessee', '20070515 19:14:20.290', '20080301 13:27:34.250', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0FHQ', N'Abel Donaldson', N'Niue - Massachusetts', '20070314 05:18:05.790', '20070717 03:16:54.700', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0I04', N'Camille Kelly', N'Costa Rica - Florida', '20090501 09:04:03.490', '20091115 00:30:41.880', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0J82', N'Calvin Shelton', N'Palau - Arkansas', '20070228 22:16:33.420', '20071007 02:44:47.250', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0LF4', N'Candace Mac Donald', N'Serbia - Vermont', '20080321 01:51:02.010', '20081204 21:38:07.270', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0QD1', N'Beth Gross', N'Namibia - Texas', '20080403 21:06:40.720', '20090110 07:03:00.720', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0RXC', N'Rhonda Beasley', N'Taiwan - Alaska', '20090720 14:14:51.670', '20091001 08:20:56.670', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0XK7', N'Isaac Zimmerman', N'Madagascar - Oregon', '20070921 18:23:41.930', '20080322 16:13:13.660', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0Y6J', N'Heath Beltran', N'Réunion - Indiana', '20081103 18:18:20.120', '20090122 21:08:14.590', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0Z7K', N'Irene Guerrero', N'Nepal - Texas', '20080722 07:44:16.500', '20080919 22:40:22.490', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'0ZRG', N'Caroline Steele', N'Italy - New Hampshire', '20080210 00:00:04.730', '20080801 22:50:11.700', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'11MR', N'Molly Osborn', N'Kuwait - Nevada', '20090815 03:25:11.330', '20091215 13:55:33.630', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'13LJ', N'Alana Duke', N'Micronesia - California', '20070123 04:02:31.710', '20071106 09:25:35.010', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'15TH', N'Toby Landry', N'Cape Verde - North Carolina', '20090823 16:14:34.160', '20090910 17:25:04.500', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'16R7', N'Andy Hamilton', N'Timor-Leste - South Carolina', '20081101 21:28:55.620', '20090405 10:05:10.350', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'180R', N'Norma Estrada', N'Malawi - South Carolina', '20070803 00:18:39.350', '20071016 08:27:25.860', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1AXU', N'Clayton Shaw', N'North Korea - North Carolina', '20080428 18:01:35.790', '20080602 05:49:26.710', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1BZS', N'Cari Sanders', N'Qatar - Wisconsin', '20090721 03:06:57.350', '20100502 03:30:07.950', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1C3O', N'Rachelle Hancock', N'Yemen - Massachusetts', '20080108 18:39:27.680', '20080919 16:34:34.400', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1D4I', N'Pete Chandler', N'Niue - Arizona', '20071023 13:58:51.280', '20080228 22:02:20.770', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1EK9', N'Rickey Proctor', N'Zimbabwe - Missouri', '20080507 19:15:48.610', '20090222 10:28:51.730', 1, NULL, NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1G09', N'Derek Robertson', N'India - Florida', '20070127 18:52:05.700', '20071024 04:27:39.820', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1G8R', N'Margarita Simmons', N'Somalia - North Carolina', '20070126 13:34:09.550', '20070607 02:58:09.140', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1GOQ', N'Suzanne Crawford', N'Andorra - Illinois', '20070206 19:29:35.300', '20070501 11:58:13.990', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1HFI', N'Shawna Ward', N'Liechtenstein - Utah', '20070613 09:30:18.500', '20080217 09:33:57.550', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1O2A', N'Earnest Callahan', N'Montenegro - Rhode Island', '20070105 15:48:59.150', '20071008 22:05:30.880', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1P21', N'Reginald Maxwell', N'San Marino - Oregon', '20070806 00:54:02.210', '20080326 01:49:22.860', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1PDV', N'Joel Rogers', N'China - Michigan', '20080504 12:05:12.380', '20080523 09:27:31.160', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1PYU', N'Gabrielle Fitzgerald', N'Saint Lucia - Maryland', '20091024 22:11:21.620', '20100517 11:51:26.370', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1S7M', N'Staci Arellano', N'Afghanistan - Connecticut', '20080317 21:52:04.740', '20080902 14:22:54.990', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1SLS', N'Traci Lamb', N'Grenada - Arizona', '20080216 09:43:27.290', '20081103 03:08:36.470', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1VE7', N'Blanca Hodges', N'Grenada - Louisiana', '20071123 00:21:52.830', '20080525 12:42:00.340', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1VJE', N'Brooke Cameron', N'Guinea-Bissau - Nebraska', '20081206 02:57:03.820', '20090429 13:39:37.820', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'1ZN9', N'Scot Santos', N'Ghana - West Virginia', '20070103 17:10:35.570', '20070723 11:41:07.260', 1, NULL, NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'207K', N'Felix Roach', N'Norway - Georgia', '20091218 16:01:37.870', '20101002 18:51:35.880', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'20DY', N'Randall Burke', N'Denmark - Arizona', '20070829 05:19:46.590', '20080523 03:15:27.470', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'20U9', N'Christie Lester', N'Guinea - Massachusetts', '20071206 01:04:56.600', '20071219 21:59:58.520', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'213L', N'Randi Leonard', N'Belize - Vermont', '20070402 21:00:37.700', '20070527 17:49:37.220', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'217H', N'Gregory Mullen', N'Greenland - Utah', '20081019 04:46:12.300', '20090223 11:43:37.130', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'21EL', N'Juanita Edwards', N'Réunion - Wyoming', '20070318 20:34:45.460', '20070521 17:16:37.590', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'21WW', N'Joey Mullins', N'Japan - Oklahoma', '20081109 20:19:31.640', '20090618 11:07:28.220', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'23A1', N'Dan Walls', N'Virgin Islands - Maryland', '20090819 12:11:45.790', '20091013 13:50:00.760', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'23YJ', N'Karl Marks', N'Senegal - Michigan', '20071116 12:51:06.220', '20080806 04:19:49.160', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'28E3', N'Kathleen Morse', N'Mexico - Indiana', '20071022 00:59:19.870', '20080227 01:30:28.870', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2AZ4', N'Garrett Hubbard', N'Australia - Kentucky', '20091118 07:03:56.160', '20091202 08:00:33.290', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2BQ', N'Glenn Rodriguez', N'Colombia - Florida', '20070505 21:32:34.790', '20071220 21:07:20.430', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2CJZ', N'Whitney Bowen', N'Iceland - Wisconsin', '20070711 11:27:25.410', '20080203 00:22:28.720', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2D3T', N'Stacie Decker', N'Malvinas - Texas', '20071101 00:14:12.770', '20080420 19:01:43.060', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2FT', N'Darnell Bernard', N'Greenland - Idaho', '20090919 02:55:34.810', '20091130 01:11:37.270', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2IUE', N'Jerome Pollard', N'Virgin Islands - Colorado', '20070513 20:36:29.310', '20071027 14:54:30.320', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2JHT', N'Vivian Forbes', N'Jordan - Oregon', '20080814 09:59:23.710', '20090514 01:04:18.230', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2L0B', N'Warren Austin', N'New Caledonia - Washington', '20090212 15:25:15.570', '20090729 01:15:14.550', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2L5A', N'Antoine Jefferson', N'Kazakhstan - Ohio', '20070721 18:00:46.450', '20080413 06:04:09.690', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2L5W', N'Sherman Tran', N'Puerto Rico - Maine', '20091108 12:25:14.480', '20100807 12:59:49.500', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2MOF', N'Moses George', N'Mongolia - Missouri', '20070725 11:35:43.110', '20080229 07:33:05.640', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2NQK', N'Marcus Moore', N'Swaziland - Indiana', '20070409 22:52:08.240', '20070610 06:17:59.360', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2O5X', N'Maurice Rosario', N'Kenya - Michigan', '20070517 02:39:09.110', '20070604 09:40:54.740', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2ONB', N'Mark O''Connor', N'Kyrgyzstan - New Hampshire', '20080713 23:22:08.020', '20081117 09:33:02.100', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2SG', N'Sarah Hammond', N'Togo - Texas', '20070530 13:03:41.880', '20071005 17:13:20.780', 2, NULL, NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2SXQ', N'Sabrina Welch', N'Mayotte - Vermont', '20090629 05:36:51.810', '20100328 16:00:06.960', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2TVF', N'Jack Schmidt', N'Portugal - Oklahoma', '20080925 09:11:12.680', '20081027 04:07:39.960', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'2XQU', N'Yesenia Mullen', N'Malaysia - New Jersey', '20090713 10:03:55.210', '20090912 14:28:03.380', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'332P', N'Lena Casey', N'Saint Helena - Arizona', '20081209 22:48:46.160', '20090125 06:12:17.290', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'33AI', N'Kristian Willis', N'Belize - Oklahoma', '20091006 15:50:52.880', '20100707 22:50:06.040', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'33DQ', N'Erica Craig', N'India - Arkansas', '20071026 20:45:00.200', '20071124 09:04:43.050', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'35R1', N'Patrice Vazquez', N'Namibia - North Carolina', '20080415 13:24:51.300', '20080506 08:22:30.220', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'367U', N'Steven Rogers', N'Fiji - Georgia', '20091015 20:53:25.970', '20100619 15:51:38.460', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'36JU', N'Kenya Braun', N'Czech Republic - Illinois', '20070414 09:05:31.980', '20070510 21:47:05.370', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'36MA', N'Corey Campos', N'Mali - Hawaii', '20070618 22:54:28.130', '20070829 03:27:49.190', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3AIF', N'Vickie Ball', N'Barbados - Utah', '20070315 17:44:23', '20070622 15:03:18.770', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3B6R', N'Otis Harper', N'Iceland - Rhode Island', '20090814 16:57:24.940', '20091104 16:52:23.680', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3CND', N'Krista Kidd', N'Bhutan - Massachusetts', '20070903 21:40:36.590', '20080202 19:26:33.950', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3DHT', N'Jacob Mooney', N'Italy - New Mexico', '20080721 12:34:00.240', '20090128 04:20:30.190', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3DN6', N'Andrea Dennis', N'Malaysia - Washington', '20070908 09:42:09.970', '20080218 09:12:55.710', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3GN4', N'Johnathan Savage', N'Saint Helena - Michigan', '20090110 00:55:00.780', '20090127 00:02:25.280', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3GR', N'Candy Cortez', N'Burundi - Utah', '20070724 02:16:53.880', '20080403 17:24:57.650', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3MCM', N'Gordon Thornton', N'Benin - Hawaii', '20070105 06:57:07', '20070504 12:04:20.270', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3MHO', N'Angelia Bridges', N'Ecuador - Mississippi', '20091018 23:45:48.130', '20100425 00:10:57.590', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3MPI', N'Melanie Morris', N'Antarctica - Colorado', '20070807 11:25:24.360', '20080511 08:37:56.220', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3NRW', N'Bryce Conrad', N'Guam - Ohio', '20080320 18:32:00.340', '20080524 00:59:36.560', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3PIR', N'Constance Herring', N'Benin - Washington', '20070921 06:36:26.250', '20080308 20:01:25.330', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3PV7', N'Demond Cooley', N'Georgia - Louisiana', '20091129 01:55:21.880', '20100609 08:27:27.530', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3QKC', N'Sandy Randall', N'Czech Republic - Washington', '20080613 15:35:49.850', '20080923 11:55:32.550', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3RT5', N'Herman Gibson', N'Rwanda - Utah', '20090227 01:46:32.690', '20090520 18:40:14.290', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3RTG', N'Louis Lloyd', N'Burkina Faso - Wyoming', '20070706 07:16:50.990', '20071026 14:35:04.130', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3SLE', N'Nicolas Moody', N'Estonia - Nevada', '20080424 02:14:16.380', '20081227 00:20:59.310', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3WO5', N'Matthew Henderson', N'Peru - Louisiana', '20090319 16:29:44.430', '20090814 22:06:33.860', 1, NULL, NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3WTS', N'Maggie Schroeder', N'Monaco - Mississippi', '20080816 23:19:50.060', '20081205 03:45:20.830', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'3ZO5', N'Lamar Chandler', N'Botswana - Georgia', '20090602 10:55:01.080', '20090612 17:08:35.510', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'40B', N'Pamela Mora', N'Cameroon - Delaware', '20091203 10:18:08.250', '20100801 09:07:49.910', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4123', N'Arturo Kirby', N'Antarctica - Utah', '20081031 09:40:16.380', '20090507 00:58:54.200', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'41UE', N'Jessica Collier', N'Serbia - New Hampshire', '20080815 10:06:09.880', '20090509 12:45:50.290', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'43VK', N'Barry Roach', N'Tuvalu - Maine', '20070520 12:04:57.190', '20071215 06:13:47.890', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'44K8', N'Erin Gomez', N'Burkina Faso - Illinois', '20091229 16:45:55.550', '20100818 13:26:58.400', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'459O', N'Tammie Rasmussen', N'Dominica - New Jersey', '20070615 14:53:10.680', '20071130 21:30:04', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'48IA', N'Tara Monroe', N'China - Texas', '20071123 04:24:02.220', '20080526 09:12:03.370', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'49AT', N'Allen Huynh', N'Isle of Man - Virginia', '20090824 18:03:54.680', '20090912 14:23:52.130', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4C7E', N'Latoya Anderson', N'Nicaragua - West Virginia', '20080415 17:10:43.850', '20080905 17:25:12.550', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4CD3', N'Alfred Wall', N'Mayotte - Nevada', '20070705 15:27:26.230', '20070927 16:34:24.630', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4CD5', N'Dion Peters', N'Albania - Colorado', '20070712 13:01:56.770', '20071121 23:06:37.790', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4D2S', N'Mario Downs', N'Greenland - Louisiana', '20091019 02:45:40.610', '20100410 05:04:49.330', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4GA1', N'Teri Mc Cormick', N'New Caledonia - Wisconsin', '20070909 20:47:47.480', '20071229 14:47:13.460', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4HND', N'Gordon Gibson', N'Namibia - Connecticut', '20080313 19:15:11.980', '20080827 19:34:27.890', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4MW3', N'Kelvin Kemp', N'Croatia - North Carolina', '20090427 07:39:39.560', '20090625 02:19:53.240', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4QJY', N'Darius Schmitt', N'Sri Lanka - Washington', '20091217 11:31:41.750', '20100325 07:30:41.330', 2, NULL, NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4S0S', N'Leanne Short', N'Fiji - Washington', '20070424 06:27:16.180', '20080210 20:17:12.260', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4S57', N'Jaime Wilkinson', N'Thailand - Nevada', '20071023 09:21:44.950', '20080505 11:22:33.160', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4TU7', N'Laura Chan', N'Greenland - Utah', '20080114 21:22:41.140', '20080412 14:10:05', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4UAE', N'Sonya Mays', N'Tuvalu - Oklahoma', '20071007 11:15:00.450', '20071117 02:03:02.930', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4W1Y', N'Ryan Cantu', N'Bahrain - Washington', '20080423 03:04:09.720', '20080915 09:16:37.670', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4WG6', N'Kirsten Greer', N'Paraguay - Louisiana', '20080826 17:34:06.030', '20090417 01:45:18.200', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4XPI', N'Kristy Clarke', N'Kyrgyzstan - North Carolina', '20070331 16:46:15.340', '20070425 09:13:53.490', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'4YD4', N'Angelia Stevenson', N'Gabon - Oregon', '20080123 09:57:08.420', '20080425 15:13:12.430', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'513Z', N'Irene Gilmore', N'Falklands - Idaho', '20070715 09:58:04.490', '20080127 16:04:54.470', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'535K', N'Pamela Soto', N'Germany - Utah', '20080702 19:57:05.240', '20090317 11:30:28.070', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'53AM', N'Joel Bishop', N'Angola - Florida', '20081023 15:05:08.740', '20090117 07:47:21.480', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5428', N'Esther Gordon', N'Monaco - Washington', '20091007 23:57:50.330', '20100604 03:41:23.390', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'543K', N'Marjorie Bell', N'Belize - Minnesota', '20070718 23:56:38.280', '20071030 12:23:02.380', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'56HA', N'Amber Whitehead', N'Eritrea - Utah', '20071127 05:53:52.950', '20080609 12:26:08.890', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'56OB', N'Kyle Morse', N'Guatemala - California', '20080725 15:43:58.090', '20090327 14:08:48.740', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'572Q', N'Arturo Newton', N'Montserrat - Illinois', '20080622 12:28:33.840', '20080713 12:44:11.770', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'590P', N'Jason Wilcox', N'Isle of Man - South Carolina', '20080121 05:15:44.170', '20081111 07:12:35.250', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5BM7', N'Marty Pacheco', N'Switzerland - Missouri', '20071230 08:17:24.290', '20080224 18:11:54.390', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5G58', N'Eric Sullivan', N'Moldova - Hawaii', '20070528 21:54:20.440', '20080128 21:16:27.640', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5GC0', N'Robbie Griffith', N'Nigeria - Utah', '20090619 17:54:07.230', '20100115 01:09:08.310', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5GQT', N'Dennis Bond', N'Monaco - Wisconsin', '20091020 02:16:02.270', '20091207 02:21:38.850', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5HRU', N'Sheri Galvan', N'Myanmar - South Carolina', '20091102 02:37:38.120', '20091110 07:17:37.740', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5IA8', N'Cassandra Shea', N'Comoros - Alabama', '20080101 01:40:12.300', '20080418 16:46:50.430', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5IH5', N'Anne Huang', N'Comoros - Vermont', '20090309 17:38:50.020', '20090514 04:47:32.940', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5J3G', N'Kareem Lane', N'Canada - Illinois', '20070923 10:45:10.920', '20080117 21:02:47.930', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5J97', N'Judy Beard', N'Ukraine - Ohio', '20080326 02:37:33.290', '20081219 20:12:04.230', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5LI0', N'Lance Mack', N'Uganda - Texas', '20090420 01:15:02.520', '20090512 20:35:15.520', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5LZ8', N'Eileen Spencer', N'Slovakia - Wyoming', '20080105 06:05:03.080', '20080622 01:26:48.720', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5M1I', N'Kyle Vargas', N'South Africa - California', '20070626 14:32:30.210', '20070917 01:38:20.230', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5NE7', N'Lawanda Atkins', N'Puerto Rico - Mississippi', '20080116 20:29:09.710', '20080319 07:18:08.110', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5NX', N'Sammy Montoya', N'Fiji - Colorado', '20070424 03:59:30.580', '20071212 23:03:57.700', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5O1U', N'Glenda Wagner', N'Russia - Maine', '20090918 15:32:42.510', '20100120 19:42:32.790', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5OB0', N'Milton Lester', N'Sudan - Georgia', '20091007 11:36:23.570', '20100430 09:40:42.190', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5P3Y', N'Jayson Kane', N'Guinea - Alabama', '20070819 17:57:29.960', '20080608 06:41:08.030', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5PK0', N'Alisha Dawson', N'Greenland - Alaska', '20071102 01:18:45.260', '20080813 23:53:54.070', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5Q7V', N'Anthony Carlson', N'Réunion - Colorado', '20081111 04:34:07.480', '20090706 05:53:22.870', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5REP', N'Austin Calderon', N'Turkey - Idaho', '20091221 01:58:57.700', '20100519 12:21:07.760', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5TI5', N'Shannon Gordon', N'Netherlands - Alaska', '20090814 07:34:10.400', '20091219 09:43:04.340', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5TTD', N'Jocelyn Maxwell', N'Iran - Ohio', '20080616 13:28:04.420', '20081021 00:42:12.590', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5UWJ', N'Celeste Reese', N'Malawi - Kansas', '20081211 21:54:50.190', '20090707 16:26:41.680', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5VND', N'Melinda Little', N'Tanzania - New Hampshire', '20080208 13:56:53.640', '20080928 06:16:04.250', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5WSZ', N'Melisa Rosales', N'Saint Helena - Mississippi', '20090906 07:34:20.380', '20091227 14:34:07.670', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'5YDM', N'Steve Valdez', N'Yemen - Nebraska', '20080904 07:19:31.730', '20080924 07:50:41.870', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'60J0', N'Rusty Castro', N'Slovakia - Arizona', '20090403 15:36:57.110', '20090928 03:45:33.390', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'62LK', N'Chadwick Adkins', N'Iraq - Wyoming', '20091011 16:25:55.220', '20100119 23:47:19.160', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'64GG', N'Ramiro Bailey', N'Mozambique - Louisiana', '20080618 16:26:17.800', '20090125 12:30:44.650', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'662I', N'Stuart Leblanc', N'Andorra - Texas', '20090520 06:50:08.010', '20100117 10:11:36.190', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'667O', N'Patrick Kirk', N'Taiwan - Florida', '20070217 09:33:58.930', '20070818 00:33:11.740', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'682F', N'Christy Poole', N'Swaziland - Alabama', '20090909 05:15:08.210', '20091105 11:48:47.150', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'68H7', N'Francisco Wu', N'Czech Republic - Arizona', '20080306 07:49:40.640', '20080608 09:21:23.850', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6ACX', N'Betty Bolton', N'Bangladesh - Alaska', '20070824 21:03:21.520', '20080115 19:03:32.920', 2, NULL, NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6AS', N'Leonardo Fleming', N'Fiji - Wisconsin', '20080320 14:35:38.020', '20080813 21:59:44.740', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6B5V', N'Darren Russell', N'Malta - South Dakota', '20081217 14:06:48.270', '20090524 01:55:47.090', 1, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6DLA', N'Shanna Hall', N'Jersey - New Jersey', '20090831 10:07:52.900', '20090923 22:57:57.590', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6DN1', N'Wanda Holland', N'South Korea - Rhode Island', '20080402 08:13:46.910', '20081026 10:34:55.840', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6HT5', N'Ross Dodson', N'Uruguay - Tennessee', '20091106 10:57:40.560', '20100525 23:09:29.730', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6HZH', N'Wade Medina', N'Andorra - New Jersey', '20090819 05:44:43.320', '20100307 10:42:48.690', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6LBR', N'Ronda Kramer', N'Montserrat - Alaska', '20080320 20:27:53.100', '20080923 08:52:57.940', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6LRC', N'Hope Ryan', N'Ethiopia - Texas', '20080119 00:47:16.170', '20080503 08:36:58.130', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6LRG', N'Sergio Sheppard', N'Vanuatu - Washington', '20090921 21:35:52.220', '20100508 14:52:40.930', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6O8J', N'Tisha Sexton', N'Kazakhstan - Georgia', '20070929 22:56:18.280', '20071230 05:11:46.540', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6OIN', N'Marie Wu', N'Haiti - Wyoming', '20070223 05:30:45.140', '20070820 07:54:10.170', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6OT1', N'Keri Lawrence', N'Tonga - Nevada', '20091028 18:30:44.230', '20091106 18:42:37.080', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6U2J', N'Brandie Pineda', N'Uruguay - Oklahoma', '20081005 19:33:56.370', '20090404 21:39:57.740', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6UTT', N'Benjamin Pugh', N'Estonia - Mississippi', '20081015 15:31:20.860', '20090609 06:43:30.080', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6V30', N'Beverly Porter', N'South Korea - New Mexico', '20081015 18:54:59.330', '20081222 07:33:49.610', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6VAU', N'Courtney Lawson', N'Turkey - Oklahoma', '20080506 06:34:09.460', '20090221 04:35:07.490', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6YLS', N'Autumn Hanson', N'Israel - Oklahoma', '20070708 09:40:34.870', '20071119 00:50:31.280', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6ZEV', N'Jenna Pineda', N'Serbia - Missouri', '20090226 07:14:57.090', '20090714 13:14:56.650', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'6ZXM', N'Wallace Herman', N'Bahamas - Pennsylvania', '20080428 13:10:20.160', '20081108 09:13:08.870', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'701A', N'Darlene Newton', N'Tanzania - Florida', '20070329 01:39:42.030', '20070415 12:46:16.290', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'738G', N'Andre Vega', N'Austria - Mississippi', '20091018 00:02:46.650', '20091104 15:26:52.410', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'73CX', N'Janine Calhoun', N'Kazakhstan - Vermont', '20090928 22:39:34.370', '20100505 13:43:05.210', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'73E2', N'Gabriela Schneider', N'Japan - South Carolina', '20091015 09:59:43.680', '20091029 05:30:33.860', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'74M2', N'Marshall Sanford', N'Cameroon - Arizona', '20070224 13:37:33.870', '20070830 21:38:46.710', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'74Z6', N'Marlon Campos', N'Oman - Arizona', '20080529 09:42:05.660', '20090211 19:20:10.360', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'79R', N'Patrick Henson', N'American Samoa - Minnesota', '20090325 05:24:00.970', '20091226 23:30:47.630', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7AY0', N'Christine Nolan', N'Afghanistan - Idaho', '20070207 00:49:56.800', '20070615 01:18:36.110', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7ERL', N'Shari Day', N'Malaysia - Minnesota', '20071013 09:57:44.880', '20080619 08:50:14.610', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7FC1', N'Sheldon Terry', N'Kyrgyzstan - Utah', '20071020 01:49:40.360', '20080718 07:51:32.890', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7GII', N'Shana Browning', N'Micronesia - Vermont', '20080310 00:52:40.320', '20081127 03:54:14.300', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7K64', N'Allyson Merritt', N'Samoa - Iowa', '20091224 23:24:53.620', '20101013 06:26:05.290', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7KN2', N'Roger Rose', N'Estonia - North Carolina', '20090309 12:20:23.950', '20090811 20:10:04.570', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7KVV', N'Kristy Becker', N'Italy - Arizona', '20070304 22:19:42.460', '20070909 06:48:53.090', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7N3V', N'Betty Rangel', N'Bahrain - Kentucky', '20070525 17:16:11.810', '20071126 10:55:27.160', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7NT2', N'Frederick Shaw', N'Indonesia - South Carolina', '20081225 22:31:38.070', '20090302 05:00:50.690', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7NY4', N'Johnny Owens', N'Jamaica - Oklahoma', '20090813 02:41:36.450', '20100312 20:49:49.090', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7OJJ', N'Scot Burton', N'Mongolia - West Virginia', '20080407 09:50:02.140', '20080419 22:48:03.580', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7P7I', N'Gabriela Barton', N'Portugal - Maryland', '20090330 05:58:35.470', '20091230 14:22:17.910', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7RBJ', N'Chad Francis', N'Niger - Kentucky', '20081106 08:19:35.030', '20090614 18:58:13.990', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7T76', N'Natalie Moore', N'Indonesia - Hawaii', '20080225 00:54:32.660', '20081220 21:35:39.490', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7TKB', N'Victor Huang', N'South Georgia - Delaware', '20081019 09:11:33.790', '20090616 20:25:55.170', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7WKL', N'Leslie Lloyd', N'Malvinas - New Hampshire', '20070508 01:38:10.950', '20070623 11:37:10.590', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7YHW', N'Leslie Meyer', N'Portugal - Illinois', '20070727 20:34:14.280', '20071024 11:12:44.090', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7YL7', N'Shawna Mc Clure', N'Andorra - Pennsylvania', '20080102 22:39:20.440', '20080920 11:30:07.480', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'7ZBZ', N'Brad Cummings', N'Argentina - Minnesota', '20070215 15:12:46.810', '20070718 11:54:36.130', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'83BT', N'Andrea Walters', N'Seychelles - Michigan', '20070412 00:02:13.470', '20070923 19:35:25.840', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'84I9', N'Olga Meyers', N'Ghana - Kentucky', '20090608 03:05:37.120', '20091013 23:30:37.150', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'857F', N'Noah Nixon', N'Belarus - Iowa', '20091219 10:16:20.290', '20100726 03:21:54.660', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'866Y', N'Herbert Faulkner', N'New Zealand - Tennessee', '20090314 01:12:47.590', '20090906 23:40:40.780', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'867J', N'Roman Gilmore', N'Fiji - Nebraska', '20090603 19:40:12.230', '20090720 23:44:53.620', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'867M', N'Jean Shaw', N'Zimbabwe - Oklahoma', '20091111 02:00:49.480', '20091204 04:38:02.110', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'86R', N'Kellie Mercado', N'Uganda - Minnesota', '20080307 18:52:12.420', '20080409 16:17:25.410', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'89EP', N'Tonya House', N'Canada - Nebraska', '20090922 05:29:41.360', '20100203 07:44:11.040', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8AIH', N'Jonathan Avila', N'Madagascar - Arkansas', '20090914 20:04:41.920', '20100428 13:58:32', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8FG8', N'Norma Love', N'Jordan - Illinois', '20070227 18:34:55.120', '20070421 08:42:42.610', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8FGA', N'Randall Peterson', N'American Samoa - New York', '20080229 09:46:05.150', '20081113 07:54:51.870', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8GNZ', N'Mickey Villarreal', N'Georgia - Oklahoma', '20091009 01:52:18.230', '20100529 22:28:31.990', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8H9D', N'Tara Hogan', N'Liberia - Idaho', '20070727 16:31:31.630', '20070905 17:10:59.230', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8HBX', N'Martha Marsh', N'Algeria - Oregon', '20081230 06:28:10.340', '20090529 14:57:05.560', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8I7P', N'Jacob O''Neill', N'China - New Mexico', '20080218 21:08:22.820', '20080915 08:03:26.220', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8IOH', N'Manuel Bell', N'India - Missouri', '20070211 06:59:04.390', '20070502 04:46:32.410', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8J0U', N'Jerrod Macias', N'Guatemala - Mississippi', '20090413 04:49:49.660', '20091222 12:22:00.220', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8KSE', N'Sherrie Dalton', N'Jordan - Idaho', '20080308 20:33:25.600', '20080915 09:52:23.390', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8ML1', N'Kurt Ritter', N'Netherlands - Hawaii', '20071212 23:34:06.700', '20080827 00:18:36.570', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8MNB', N'Colby Knight', N'Burkina Faso - South Dakota', '20080313 22:14:23.400', '20080821 00:24:11.530', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8N5Q', N'Cherie Barajas', N'Serbia - Arkansas', '20090203 01:27:56.010', '20090622 00:52:45.210', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8NGY', N'Efrain Barker', N'Tunisia - California', '20090909 20:02:07.040', '20100506 12:37:31.280', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8OHR', N'Sheryl Griffin', N'Netherlands - Alabama', '20070926 02:05:56.620', '20080515 20:40:26.920', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8QO3', N'Wendy Jennings', N'Indonesia - Alabama', '20070821 10:05:46.620', '20080331 23:29:25.600', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8R4Z', N'Loretta Farmer', N'Canada - New York', '20090710 14:11:22.540', '20091217 12:05:02.400', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8SHP', N'Bernard Atkinson', N'Fiji - Kansas', '20070330 15:20:23.350', '20070918 03:15:07.360', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8URA', N'Patricia Mc Donald', N'Georgia - Rhode Island', '20091022 11:41:53.620', '20100308 12:45:03.790', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8V8G', N'Shana Harmon', N'Tajikistan - Hawaii', '20070609 11:42:48.670', '20080208 10:30:46.370', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8VZ2', N'Kathryn Gould', N'Togo - South Carolina', '20071124 09:57:12.240', '20080806 13:33:42.070', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8WEX', N'Brett Willis', N'South Africa - Wisconsin', '20090923 17:10:18.100', '20100209 21:20:36.020', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'8WSG', N'Ann Wong', N'China - Delaware', '20090526 18:26:41.380', '20100115 04:41:27.620', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'94EW', N'Anita Olson', N'South Korea - Texas', '20081122 22:53:39.430', '20090117 05:21:35.320', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'94ZX', N'Rafael Mack', N'Montenegro - Arizona', '20091103 22:55:05.870', '20100615 04:15:47.330', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'951D', N'Nelson Franklin', N'Mongolia - New Hampshire', '20070207 15:24:29.590', '20070616 08:48:05.970', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'965O', N'Clifford Castro', N'Libya - Colorado', '20070408 15:43:15.560', '20070409 22:31:22.310', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'97BH', N'Margaret Adkins', N'Mozambique - Arizona', '20081013 06:50:20.100', '20090105 22:54:30.380', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'97CO', N'Katrina Terry', N'Iran - Louisiana', '20091023 17:30:06.780', '20091128 01:59:28.400', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'99AE', N'Neal Kaiser', N'Kiribati - Maryland', '20071218 18:06:55.900', '20080324 20:38:18.540', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'99XA', N'Sidney Dennis', N'Jordan - New Hampshire', '20080213 00:51:11.560', '20081016 17:49:44.810', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9EI5', N'Kimberley Griffith', N'Uzbekistan - Illinois', '20090728 15:38:10.180', '20091215 20:21:20.840', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9F1L', N'Mike O''Neal', N'Zimbabwe - Minnesota', '20070608 11:39:06.690', '20070703 02:23:51.140', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9FJQ', N'Calvin Hutchinson', N'Nigeria - Georgia', '20080915 17:19:24.370', '20081210 15:23:49.340', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9GPD', N'Tina Velasquez', N'Saint Lucia - Nebraska', '20091006 03:01:17.300', '20091009 21:27:02.240', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9HQW', N'Elena Levy', N'Nepal - Delaware', '20071121 18:09:40.420', '20080527 07:44:21.240', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9HZ6', N'Micheal Blackburn', N'Kiribati - Oregon', '20071010 08:17:49.520', '20080509 10:25:52.850', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9I8P', N'Victoria Carroll', N'Mauritius - Oregon', '20091113 13:11:18.760', '20091208 04:12:54.470', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9ID9', N'Bryan Farley', N'Spain - Montana', '20070209 19:44:48.660', '20071003 15:58:02.490', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9IYS', N'Sonja Wiggins', N'Saint Helena - New Hampshire', '20070909 19:53:58.500', '20071010 06:04:08.780', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9JIY', N'Darin Rowe', N'Luxembourg - Utah', '20070422 09:08:52.590', '20071205 23:51:23.750', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9LD7', N'Hilary Navarro', N'Swaziland - Tennessee', '20081217 03:37:02.400', '20090921 04:21:30.340', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9LT6', N'Stuart Barrera', N'Norway - Georgia', '20070705 08:17:44.590', '20071201 08:07:55.800', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9M5Q', N'Alana Spears', N'Bahrain - Missouri', '20080710 23:14:17.240', '20081014 01:16:30.250', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9MAZ', N'Andrea Maxwell', N'Comoros - New Mexico', '20080428 04:58:54.530', '20080903 22:01:51.990', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9MXX', N'Jodi Harrell', N'Uzbekistan - Iowa', '20090722 20:35:21.980', '20100329 19:01:57.450', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9N5Y', N'Lee Moody', N'Uzbekistan - Vermont', '20091130 01:42:23.100', '20100112 07:02:16.900', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9NAS', N'Perry Klein', N'Cape Verde - Arkansas', '20090126 03:32:03.210', '20090523 05:23:16.410', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9NCX', N'Dena Barron', N'Iceland - Indiana', '20091216 16:20:05.180', '20100518 07:57:46.070', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9NHE', N'Isabel Li', N'Falklands - Oklahoma', '20090825 16:45:47.540', '20100228 11:30:22.040', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9O3', N'Shad Henderson', N'Burundi - Ohio', '20091228 12:23:13.280', '20100203 03:49:58.610', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9O3A', N'Nicolas Mercer', N'Ecuador - Utah', '20090531 00:10:36.380', '20091012 19:57:44.110', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9SXE', N'Marie Escobar', N'Brazil - Hawaii', '20090920 12:56:00.380', '20100705 18:51:30.960', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9V27', N'Colleen Crosby', N'Falklands - Idaho', '20080708 23:52:16.420', '20090324 03:05:46.720', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9WS5', N'Ricardo Wong', N'Trinidad - California', '20090330 02:56:42.850', '20090420 07:13:13.320', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9Y7V', N'Ericka Brock', N'Dominica - Utah', '20091225 10:35:50.370', '20100621 06:06:09.350', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9YDB', N'Jessica Sandoval', N'Nauru - New Hampshire', '20080603 21:50:12.090', '20080609 18:51:26.900', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'9ZDE', N'Julius Weber', N'Thailand - Pennsylvania', '20081224 19:51:27.820', '20090319 06:55:28.210', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A0U2', N'Caroline Chandler', N'South Georgia - Missouri', '20070925 03:34:47.940', '20080416 11:44:49.080', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A2F3', N'Kellie Zavala', N'Isle of Man - Washington', '20090320 16:06:39.060', '20091227 20:53:07.150', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A2N2', N'Daniel George', N'Turkey - Washington', '20070731 21:16:52.740', '20080312 11:04:59.740', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A3BN', N'Marisa Davies', N'American Samoa - Michigan', '20071230 09:24:05.080', '20080608 01:39:37.800', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A4UP', N'Roberto Joseph', N'Taiwan - Pennsylvania', '20090326 22:52:02.170', '20090709 16:06:24.150', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A6BQ', N'Cassie Washington', N'Estonia - Rhode Island', '20080731 13:54:52.230', '20081231 07:32:16.410', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A6K6', N'Jarrod Mc Donald', N'Martinique - Oregon', '20080819 08:37:52.670', '20081201 23:11:16.590', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A8SQ', N'Quincy Elliott', N'Gibraltar - Connecticut', '20071021 21:35:57.610', '20080609 20:28:14.170', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'A8U4', N'Samantha Knight', N'Bahrain - North Carolina', '20070615 19:22:08.260', '20071119 12:41:54.150', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ADPF', N'Alan Mccoy', N'Congo - Oklahoma', '20080724 15:50:17.020', '20080902 03:10:54.200', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ADTJ', N'Calvin Carson', N'Canada - New Jersey', '20080201 23:48:23.960', '20080509 01:47:43.200', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AE4U', N'Leah Greer', N'Gibraltar - Mississippi', '20070520 02:28:37.100', '20080310 11:54:25.150', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AGKQ', N'Dora Rasmussen', N'Liechtenstein - Oklahoma', '20090814 15:00:33.590', '20100306 07:44:17.530', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AJRX', N'Rose Barry', N'Malvinas - New Hampshire', '20090901 10:40:20.880', '20100613 07:05:43.880', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ALW2', N'Jonathon Ramsey', N'South Korea - Ohio', '20080819 19:10:42.690', '20090115 15:47:49.920', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'APA4', N'Kara Ryan', N'Suriname - Massachusetts', '20080917 14:13:21.480', '20090526 01:08:04.060', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AQ2M', N'Danielle Rowland', N'Uganda - Oklahoma', '20080827 04:28:00.650', '20080916 06:41:19.290', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AQN2', N'Jenny Charles', N'Portugal - North Carolina', '20080501 11:12:32.690', '20081229 07:16:04.700', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AS48', N'Bryce Pratt', N'Kiribati - Florida', '20070307 00:20:18.910', '20071226 09:43:15.180', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AWZT', N'Katrina Bennett', N'Togo - Nevada', '20091219 13:11:33.290', '20100103 22:11:56.910', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AX2U', N'Stefanie Burgess', N'New Caledonia - West Virginia', '20080228 23:42:10.780', '20080913 19:20:46.460', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AX3X', N'Marc Frank', N'Paraguay - Texas', '20090212 11:15:08.670', '20090930 09:48:53', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'AXZV', N'Bryan Collins', N'Sudan - Texas', '20090513 00:56:29.090', '20100130 16:14:27.810', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'B5HR', N'Nick Nixon', N'Martinique - Hawaii', '20090505 05:54:45.900', '20091125 13:48:43.330', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'B5N2', N'Janice Gill', N'Colombia - Hawaii', '20070804 05:09:14.130', '20070904 15:32:08.450', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'B9N6', N'Jean Mc Donald', N'Nigeria - Kansas', '20080516 16:15:36.410', '20080530 20:55:02.900', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BCEA', N'Sylvia Downs', N'Samoa - Virginia', '20081127 10:27:42.950', '20090523 01:53:57.560', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BCMU', N'Tammi Aguilar', N'Barbados - Nevada', '20071226 05:25:12.190', '20080831 06:12:33.540', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BDT8', N'Olivia Delgado', N'Tonga - Oregon', '20090807 04:45:59.670', '20091226 18:06:47.840', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BGOZ', N'Darrell Nixon', N'Mali - Alaska', '20090604 20:09:01.120', '20091127 05:55:38.450', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BJ4Q', N'Alberto Hardin', N'Czech Republic - West Virginia', '20071117 03:24:04.380', '20080813 17:03:01.130', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BK1O', N'Peggy O''Neal', N'Zimbabwe - Virginia', '20071105 01:48:35.050', '20080323 07:43:53.090', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BKT', N'Amanda Bradford', N'France - Mississippi', '20090602 15:43:01.100', '20090802 08:44:21.230', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BME4', N'Deana Beard', N'Mauritania - Connecticut', '20080308 00:59:26.270', '20080827 14:24:51.360', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BMVW', N'Claude Erickson', N'Azerbaijan - Florida', '20080205 16:56:11.090', '20080515 00:07:20.040', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BQ0F', N'Yvette Schwartz', N'Ethiopia - Utah', '20081207 02:32:24.960', '20081216 14:28:17.640', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BQ1G', N'Elena Blackwell', N'Philippines - Indiana', '20070104 09:11:06', '20070125 19:31:36.410', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BQKA', N'Herman Waller', N'Martinique - New Mexico', '20080701 03:16:30.320', '20081003 14:36:48.290', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BRPF', N'Jayson Morse', N'Eritrea - Minnesota', '20070619 18:08:16.910', '20080205 10:51:03.950', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BRQ3', N'Herman Bowman', N'New Caledonia - Kentucky', '20070331 00:25:31.490', '20070428 03:11:34.420', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BT33', N'Howard Burke', N'Finland - Kentucky', '20071012 16:50:31.190', '20071029 07:44:59.790', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BW1M', N'Heidi Saunders', N'Pitcairn - New Mexico', '20090104 16:32:31.080', '20090619 13:33:25.270', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BXRS', N'Stanley Townsend', N'Malta - Virginia', '20071215 05:20:10.100', '20080115 01:43:00.800', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'BY12', N'Joel Hendrix', N'Saint Lucia - New Hampshire', '20090111 22:30:29.750', '20090227 09:39:21.120', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C1I9', N'Marcos Bentley', N'Senegal - Mississippi', '20080212 20:25:15.130', '20080502 10:20:05.920', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C4EY', N'Lakeisha Brewer', N'Sri Lanka - Wyoming', '20071005 00:28:50.640', '20080419 17:40:54.280', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C5V7', N'Samantha Kline', N'El Salvador - Alaska', '20080319 03:41:45.080', '20080808 04:44:31.440', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C6RA', N'Kenneth Stevenson', N'Mali - Ohio', '20070427 17:00:53.780', '20070919 22:05:24.320', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C8EP', N'Kenneth Benton', N'Ghana - Mississippi', '20080529 09:36:04.360', '20080610 19:18:02.890', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C9SU', N'Alexis Michael', N'Djibouti - Mississippi', '20080113 07:26:01.350', '20080129 13:02:30.780', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C9YV', N'Clayton Hampton', NULL, '20080517 11:25:38', '20090215 22:01:18.050', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'C9Z3', N'Susan Miranda', N'Oman - Arkansas', '20090705 02:10:34.450', '20100413 09:14:32.760', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CD1U', N'Dianna Rodriguez', N'Suriname - South Carolina', '20071031 13:43:25.620', '20080816 03:09:30.620', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CDPL', N'Allen Hudson', N'Oman - Arizona', '20070722 16:35:58.670', '20080118 13:31:07.920', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CHNI', N'Clayton Cain', N'Peru - Montana', '20080708 18:09:32.560', '20090322 17:35:25.700', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CK68', N'Ricardo Ayala', N'Puerto Rico - Alabama', '20091012 04:10:47.900', '20100613 14:46:35.810', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CP5P', N'Brandon Lopez', N'Belize - North Dakota', '20090729 16:12:00.980', '20090907 23:28:09.150', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CPR8', N'Benjamin Morton', N'Bermuda - New Jersey', '20080123 23:00:01.260', '20080221 15:11:31.260', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CPWP', N'Bridgett Alexander', N'Uzbekistan - Alaska', '20080406 14:58:13.260', '20080708 07:16:47.610', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CR8Z', N'Ruby Mcgrath', N'Azerbaijan - Iowa', '20081128 05:15:29.790', '20090613 02:38:30.160', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CU7T', N'Oscar Chavez', N'Djibouti - Alaska', '20071027 11:07:10.930', '20080721 18:24:22.600', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CUL2', N'Kristi Arellano', N'Guam - Idaho', '20070329 06:12:45.880', '20070517 11:24:35.560', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CZBZ', N'Brent O''Neill', N'Malawi - Delaware', '20081228 10:14:57.500', '20090906 14:53:36.480', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'CZIL', N'Jason Cardenas', N'Timor-Leste - Missouri', '20091211 08:16:25.760', '20100131 12:58:58.510', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D140', N'Cesar Morales', N'Canada - Tennessee', '20071108 01:53:51.640', '20080827 17:27:49.790', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D18U', N'Lillian Sawyer', N'Mauritania - South Dakota', '20081111 02:46:34.270', '20090607 01:49:04.760', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D1I7', N'Rachael Juarez', N'Kiribati - New Mexico', '20081010 01:27:59.510', '20081128 06:08:48.280', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D266', N'Marianne Mora', N'Isle of Man - Ohio', '20090515 14:09:02.340', '20100121 08:18:39.210', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D4WZ', N'Norma Bean', N'Mongolia - Hawaii', '20070811 14:20:26.350', '20080224 00:41:35.630', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D50Q', N'Dwayne Harrington', N'Portugal - Mississippi', '20071202 21:12:26.490', '20080120 10:49:19.970', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D56T', N'Rose Gibbs', N'Latvia - Montana', '20071023 00:47:15.580', '20080120 05:16:27.180', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D5NP', N'Justin Clayton', N'Cape Verde - Oklahoma', '20090924 14:53:27.200', '20100420 16:48:04.060', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D6IG', N'Jennifer Duran', N'Vanuatu - Colorado', '20070716 13:56:17.340', '20080210 22:52:07.820', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D6KA', N'Raymond Cross', N'Germany - California', '20070406 08:23:48.060', '20070415 03:33:27.300', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D8HO', N'Christine Berry', N'Mexico - Maryland', '20090817 03:54:32.100', '20091128 09:42:41.610', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'D8Z3', N'Brendan Pacheco', N'Azerbaijan - Kentucky', '20080523 00:53:44.740', '20081207 05:57:56.010', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DAPB', N'Guadalupe Thornton', N'Mauritius - Arizona', '20081004 10:04:47.850', '20090210 20:21:34.380', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DDEJ', N'Heather Petersen', N'Mayotte - South Dakota', '20080321 20:06:34.870', '20081127 13:34:29.680', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DI2J', N'Raquel Nixon', N'Kuwait - Wisconsin', '20080302 07:19:39.800', '20081123 03:08:57.570', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DIOW', N'Hilary Herring', N'Andorra - Louisiana', '20080308 23:06:52.230', '20080526 19:36:19.840', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DJWV', N'Quincy Spears', N'South Korea - Washington', '20070720 22:33:11.460', '20080419 05:43:47.980', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DKKC', N'Iris Evans', N'Timor-Leste - Kentucky', '20071028 16:01:08.800', '20080120 08:53:04.310', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DLDW', N'Harold Bolton', N'Panama - Alabama', '20071114 02:51:51.050', '20080711 12:44:04.500', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DRP8', N'Myra Sherman', N'Germany - Utah', '20071221 11:02:55.170', '20080108 21:15:18.590', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DT8J', N'Jayson Reyes', N'Suriname - California', '20090326 17:40:31.270', '20100120 08:42:26.440', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DWSN', N'Patricia Brady', N'Botswana - Colorado', '20081016 16:40:18.960', '20081101 10:30:10.490', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DWWK', N'Grant Chapman', N'French Guiana - Delaware', '20090501 08:36:07.670', '20090914 05:48:28.580', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'DZFJ', N'Jacob Tyler', N'Vatican City - Nebraska', '20071021 13:21:09.680', '20080616 03:41:08.230', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E1J6', N'Vicky Cuevas', N'Russia - Utah', '20080614 12:32:22.010', '20090120 22:22:26.250', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E2K6', N'Mickey Mcclain', N'Pakistan - Arizona', '20080817 07:19:39.090', '20090313 14:01:42.250', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E2SB', N'Victoria Drake', N'Sri Lanka - New York', '20071014 17:46:36.980', '20080125 10:55:04.350', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E495', N'Quincy Mora', N'Pitcairn - Colorado', '20070610 18:46:13.100', '20070806 16:34:51.740', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E4T8', N'Teresa Warner', N'Mauritius - Kansas', '20090723 12:51:42.820', '20091031 15:23:10.520', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E4TN', N'Tania Herrera', N'Russia - Arizona', '20080305 16:02:22.760', '20080402 01:58:11.310', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E5JI', N'Joe Cowan', N'Greece - Idaho', '20080321 16:26:29.470', '20081026 14:13:29.570', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E5XL', N'Stacy Caldwell', N'Bahrain - South Carolina', '20080821 10:25:44.410', '20090203 17:00:13.350', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E64M', N'Kari Estrada', N'Sudan - Kentucky', '20080408 12:57:51.950', '20080419 02:17:44.210', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E8BM', N'Dylan Carr', N'Morocco - Alaska', '20070731 11:05:00.020', '20070902 08:29:31.260', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'E93I', N'Candy Jimenez', N'Nepal - South Dakota', '20080415 12:30:47.990', '20081130 00:42:32.430', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ECMY', N'Lara Ferguson', N'Senegal - Wyoming', '20070522 06:05:18.710', '20070901 08:59:34.560', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EDPU', N'Brett Yates', N'Kenya - Arizona', '20090302 00:17:24.610', '20091208 22:29:57.960', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EDU2', N'Chasity Bradshaw', N'Mayotte - Iowa', '20090907 01:00:25.810', '20100612 01:10:09.950', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EEEZ', N'Whitney Escobar', N'Benin - Washington', '20090202 00:21:04.520', '20090308 21:07:01.270', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EGCK', N'Saul Perkins', N'Cameroon - Texas', '20090622 18:12:12.320', '20100320 04:06:07.640', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EGJ3', N'Kelvin Lang', N'Ukraine - Alabama', '20070930 13:24:49.200', '20080626 21:44:19.330', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EHHP', N'Abraham Waller', N'Hungary - Minnesota', '20080104 15:08:01.710', '20081026 14:51:33.790', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EJBN', N'Leigh Wiley', N'Cape Verde - Pennsylvania', '20071230 08:29:36.930', '20080726 02:50:19.070', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EM1Z', N'Theresa Greene', N'Bangladesh - Virginia', '20071224 08:01:55.720', '20080224 07:12:58.530', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EMG9', N'Iris Haley', N'Bermuda - Pennsylvania', '20090812 20:28:55.970', '20100404 09:12:44.820', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EMK3', N'Sonja Everett', N'Belgium - Massachusetts', '20090914 20:11:06.340', '20100401 05:05:54.070', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EP0C', N'Justin Hopkins', N'San Marino - Vermont', '20071110 09:52:52.090', '20071204 10:22:57.220', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EUUQ', N'Dustin Campbell', N'Romania - Wyoming', '20070626 19:01:01.940', '20080114 20:15:11.800', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EWJB', N'Yolanda Potts', N'Benin - Oregon', '20071025 20:32:06.730', '20071102 05:46:20.950', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EWS4', N'Alan Mercer', N'Peru - Rhode Island', '20080213 21:10:06.630', '20080901 15:11:38.270', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EXTZ', N'Olga Wright', N'Singapore - Ohio', '20080508 18:30:45.370', '20081101 18:44:51.260', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EYTK', N'Anthony Tyler', N'Kazakhstan - Virginia', '20070216 10:56:00', '20070717 19:09:24.630', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'EZ3K', N'Miguel Weiss', N'Mongolia - New Mexico', '20080620 01:02:40.330', '20080805 04:51:09.230', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F294', N'Nikki Gilmore', N'Jersey - Maryland', '20090626 01:56:31.830', '20100307 02:37:56.810', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F50K', N'Edith Keller', N'Latvia - Wyoming', '20080726 04:32:30.790', '20090320 04:48:43.190', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F5HU', N'Ginger Allen', N'Panama - Kentucky', '20070830 12:23:13.260', '20080409 09:54:02.860', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F6TA', N'Lonnie Allison', N'Aruba - Virginia', '20070907 10:50:46.690', '20080307 01:06:25.300', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F6TX', N'Travis Burnett', N'Estonia - Minnesota', '20080519 12:59:47.270', '20090301 23:14:05.720', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'F8DA', N'Carl Gay', N'Iran - Maryland', '20091104 03:39:21.830', '20100604 09:04:20.840', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FB1N', N'Frankie Woodard', N'China - California', '20080929 12:21:58.940', '20090711 19:15:20.710', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FB29', N'Derick Glass', N'Guinea - Delaware', '20080401 07:58:47.880', '20080924 10:58:44.800', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FBLA', N'Yvette Vang', N'Saint Helena - Vermont', '20081121 05:31:50.850', '20090320 19:03:20.130', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FBLP', N'Henry Mac Donald', NULL, '20070425 13:41:20.630', '20070625 06:50:14.850', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FFKZ', N'Joan Goodwin', N'Morocco - Pennsylvania', '20080529 20:45:48.110', '20080911 03:08:18.170', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FFUL', N'Ramiro Glenn', NULL, '20081229 13:50:20.180', '20090407 02:52:23.160', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FHZ9', N'Billy Tyler', N'Cuba - West Virginia', '20090119 23:52:43.530', '20091115 10:21:38.700', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FI9V', N'Diane Hinton', N'Suriname - Arizona', '20070518 14:24:29.660', '20071212 02:28:52.260', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FLS6', N'Jocelyn Solis', N'Uzbekistan - Utah', '20081106 20:06:04.140', '20090502 06:37:20.020', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FMRN', N'Leigh Pitts', N'Lesotho - Wisconsin', '20080615 18:53:40.260', '20080929 14:29:53.890', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FNNY', N'Scott Lynch', N'Guernsey - Pennsylvania', '20080719 16:50:38.910', '20090119 23:55:20.830', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FNZF', N'Tanisha Horn', N'Austria - Ohio', '20080416 00:07:22.180', '20080822 22:20:02.920', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FOGI', N'Leanne Mccann', N'Peru - New Hampshire', '20090416 23:50:58.400', '20090504 05:59:24.910', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FOMW', N'Ron Craig', N'Armenia - New Jersey', '20080507 06:27:24.010', '20090218 09:01:44.270', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FQBW', N'Trina Watson', N'Fiji - Alabama', '20080701 19:27:51.060', '20080926 09:12:53.770', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FU80', N'Joanne Lara', N'Bangladesh - Virginia', '20080705 01:09:54.610', '20090126 20:20:06.850', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FUDK', N'Katherine Buchanan', N'Eritrea - Utah', '20080806 06:23:42.430', '20090406 09:54:13.590', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FVYR', N'Joey Guerra', N'Macao - Virginia', '20091130 18:24:54.510', '20100219 10:23:40.340', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FWHO', N'Scott Hatfield', N'Guernsey - North Carolina', '20070221 16:14:07.030', '20070516 02:39:52.390', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FXRA', N'Roberta Clarke', N'Zambia - Arkansas', '20090805 16:31:03.340', '20100226 18:34:01.110', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZNP', N'Charlie Barker', N'American Samoa - Alabama', '20080607 15:15:45.020', '20090321 23:53:09.560', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZO0', N'Cari Welch', N'Ghana - Washington', '20081204 15:13:09.350', '20090701 14:01:23.930', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZRX', N'Francisco Fuentes', N'Nicaragua - Oklahoma', '20081119 16:19:54.120', '20090707 12:58:30.370', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZVE', N'Darrell Reynolds', N'Ecuador - New Hampshire', '20080902 14:16:55.780', '20081220 22:48:00.380', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'FZZ1', N'Andrea Ball', N'Trinidad - Louisiana', '20090116 20:12:55.620', '20091009 09:27:25.800', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G0G6', N'Anna Lara', N'Niger - New Hampshire', '20081120 21:12:05.290', '20081126 16:43:55.170', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G1SD', N'Shelia Durham', N'Pakistan - South Dakota', '20070526 03:10:19.850', '20080301 14:21:38.480', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G2H3', N'Chandra Olsen', N'Ghana - New York', '20090131 08:59:21.980', '20091028 10:12:10.280', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G2MK', N'Katina Beltran', N'Croatia - South Carolina', '20091113 18:43:30.600', '20091231 22:00:33.260', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G2YG', N'Lillian Lucas', N'Jordan - Kansas', '20091009 20:09:07.350', '20100309 06:39:48.840', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G4Y', N'William Riggs', N'Niue - Maryland', '20091119 09:08:27.440', '20100421 21:21:38.320', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G5F2', N'Janelle Chapman', N'Niue - Colorado', '20070405 13:21:31.520', '20071030 00:09:55.350', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G61P', N'Michele Mullen', N'Samoa - Pennsylvania', '20080713 12:20:03.020', '20090225 10:13:47.600', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G79', N'Nichole Lang', N'Kuwait - Kentucky', '20070615 17:15:45.030', '20080327 00:35:12.880', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'G7L5', N'David Mosley', N'Tunisia - Illinois', '20070516 04:21:55.360', '20071112 19:55:28.870', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GAF', N'Brent Miranda', N'Uruguay - North Dakota', '20070917 20:49:44.880', '20080329 08:28:34.220', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GB8C', N'Erika Waller', N'Palau - Colorado', '20081108 16:57:20.760', '20090809 09:43:20.490', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GCVP', N'Yvonne Mills', N'Grenada - South Dakota', '20090603 08:36:10.350', '20100203 21:14:09.470', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GD4P', N'Jami Baldwin', N'Dominica - Georgia', '20090303 18:43:37.580', '20090821 05:02:33.460', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GE0C', N'Jocelyn Doyle', N'France - Georgia', '20070929 06:13:13.170', '20080122 21:50:00.610', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GEQW', N'Brandy Parrish', N'Azerbaijan - Alabama', '20080516 00:31:59.120', '20090121 15:13:09.520', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GFKZ', N'Darren Liu', N'Aruba - New York', '20070825 08:32:50.930', '20071123 11:09:23.020', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GFTJ', N'Gordon Sparks', N'Bolivia - North Carolina', '20070509 18:43:51.190', '20080118 11:31:54.230', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GGK4', N'Erica Ayala', N'North Korea - Maine', '20091217 00:23:27.700', '20100205 05:19:59.320', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GI48', N'Jeannette Phelps', N'Libya - Alabama', '20071023 22:26:03.080', '20080411 01:13:30.050', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GJJQ', N'Victoria Acevedo', N'Guyana - Delaware', '20070325 19:01:45.510', '20071017 23:55:01.050', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GJRW', N'Duane Boone', N'Colombia - Iowa', '20080220 10:24:56.140', '20080611 10:54:35.270', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GJWX', N'Peggy Ballard', N'South Africa - Utah', '20080629 12:11:40.610', '20080712 14:34:37.490', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GLTE', N'Erick Simpson', N'Congo - Montana', '20090204 00:58:17.790', '20090815 02:35:11.980', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GRM5', N'Terra Hatfield', N'North Korea - South Carolina', '20090723 01:52:24.170', '20090820 05:35:41.680', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GSR6', N'Claire Jarvis', N'Grenada - Colorado', '20080524 09:08:41.070', '20081027 09:05:02.110', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GTMR', N'Jolene Grimes', N'Ethiopia - Illinois', '20091201 22:28:06.620', '20100509 02:20:53.550', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GTOL', N'Bethany Bailey', N'Spain - Georgia', '20081003 13:47:53.310', '20090726 11:28:27.170', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GV6Q', N'Gordon Cisneros', N'Georgia - Idaho', '20090523 20:51:03.780', '20100110 15:47:40.490', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GVOP', N'Gilbert Hardin', N'Sweden - North Carolina', '20070628 04:19:49.490', '20080210 08:47:11.880', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GWCY', N'Jake Butler', N'Liberia - Delaware', '20080208 15:10:58.730', '20080720 01:21:22.620', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GX7E', N'Sarah Lawrence', N'Botswana - Utah', '20070222 22:30:57.640', '20070503 18:59:23.860', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GXWG', N'Darren Hammond', N'Monaco - Virginia', '20080428 13:51:19.420', '20080905 17:04:52.850', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'GZXX', N'Neil Hendrix', N'Tajikistan - South Dakota', '20080808 15:20:30.390', '20090219 08:48:50.410', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H1Z0', N'Sergio Clay', N'Malta - Delaware', '20081108 13:24:11.210', '20090827 21:17:15.810', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3EQ', N'Brent Hendricks', N'Colombia - Florida', '20070911 03:45:22.550', '20071122 23:37:05.510', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3J3', N'Jeffrey Krueger', N'Cuba - Delaware', '20080323 04:33:26.220', '20080731 05:29:33.730', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3OY', N'Benjamin O''Neal', N'Sudan - Oklahoma', '20070225 16:11:09.740', '20070713 12:29:11.830', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H3YZ', N'Clint Whitney', N'Ecuador - Idaho', '20070710 13:34:35.140', '20080117 04:22:39.470', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H4HJ', N'Felix Spencer', N'Algeria - Illinois', '20090511 02:51:25.620', '20090611 01:08:03.840', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H4ML', N'Forrest Keller', N'Ukraine - Kansas', '20080829 10:27:24.940', '20081209 23:07:51.670', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H4Z7', N'Chadwick Cervantes', N'South Africa - Montana', '20081222 01:15:59.010', '20090304 13:52:33.250', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'H6JK', N'Rafael Sandoval', N'Slovakia - Florida', '20091205 01:25:57.310', '20091211 04:21:43.380', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HALE', N'Luke Becker', N'Chile - South Dakota', '20090325 11:28:56.180', '20090613 05:04:24.740', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HBGD', N'Dexter Webster', N'Sweden - Delaware', '20091030 12:29:49.010', '20100818 03:01:12.440', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HBKZ', N'Kenneth Delacruz', N'Mexico - California', '20070116 17:39:26.780', '20070702 19:19:29', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HI4N', N'Kellie Potter', N'Ukraine - Washington', '20080516 11:13:13.300', '20080516 14:27:35.540', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HJ7Y', N'Virginia Stokes', N'New Zealand - Illinois', '20090515 08:34:10.970', '20090517 09:52:02.950', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HJB4', N'Victoria Lester', N'Mayotte - Virginia', '20080408 12:01:23.350', '20081202 08:16:47.260', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HJWK', N'Ryan Burns', N'India - New York', '20081119 11:51:45.440', '20090109 03:04:30.360', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HM3I', N'Dwight Reynolds', N'Latvia - Colorado', '20090702 04:35:19.060', '20090720 20:06:09.150', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HNG9', N'Melody Chung', N'Sierra Leone - Ohio', '20090523 09:15:00.120', '20091020 19:55:58.330', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HPAN', N'James Collier', N'Benin - Maryland', '20070131 21:50:39.100', '20070309 15:41:57.620', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HQAG', N'Deborah O''Neill', N'Zambia - Washington', '20070910 00:50:41.850', '20080108 12:49:03.900', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HRVU', N'Dean Orozco', N'Djibouti - Pennsylvania', '20080909 06:56:44.900', '20081216 02:03:23.860', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HRX2', N'Marshall Hubbard', N'Israel - Texas', '20080722 22:08:16.880', '20080815 15:19:02.060', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HS6Q', N'Dianna Baldwin', N'Iceland - Washington', '20071208 22:44:19', '20080821 11:43:25.960', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HSBJ', N'Claude Watson', N'Liberia - Tennessee', '20090621 18:33:10.500', '20090803 08:20:19.440', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HUTT', N'Maureen Collins', N'Tunisia - Michigan', '20070816 17:06:05.600', '20080424 08:06:56.620', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HUYH', N'Holly Owens', N'Slovakia - Maine', '20081027 17:36:37.250', '20090218 07:56:18.230', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HWDB', N'Lawanda Lawrence', N'Malawi - Washington', '20090504 02:12:55.750', '20091116 14:53:20.590', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HX6J', N'Jamal Gill', N'Croatia - South Dakota', '20080726 03:03:36.800', '20090518 14:33:09.280', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'HZCZ', N'Jordan Stewart', N'Chile - South Carolina', '20090809 23:40:40.380', '20091004 04:53:28.910', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I3NX', N'Patrice Moore', N'United States - Massachusetts', '20080107 09:16:40.820', '20080426 11:55:07.370', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I5I3', N'Rex Santana', NULL, '20080210 21:16:39.950', '20080919 20:12:03.620', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I5PL', N'Clyde Cummings', N'Bahamas - Illinois', '20090806 05:13:36.160', '20090826 01:44:13.900', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I7G7', N'Clifton Lyons', N'Tajikistan - Delaware', '20091025 18:27:50.300', '20100730 04:25:20.020', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I8BM', N'Harry Hurst', N'Togo - Kentucky', '20070521 18:43:45.230', '20071226 02:00:51.490', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'I9HJ', N'Lisa Duarte', N'Malta - West Virginia', '20090828 23:52:55.170', '20100410 19:42:38.390', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IBPF', N'Stephan Todd', N'Isle of Man - California', '20080519 22:58:35.850', '20081202 19:57:02.350', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ICUM', N'Angie Knox', N'Congo - Utah', '20091107 12:36:12.370', '20091124 10:38:58.740', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ID0R', N'Ericka Reid', N'Hong Kong - Texas', '20080923 14:37:58.230', '20081026 10:51:15.310', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IE87', N'Renee Strickland', N'Yemen - New Mexico', '20090702 18:59:08.210', '20091101 07:28:45.840', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IEPN', N'Rose Weeks', N'Iraq - South Dakota', '20070909 08:24:29.090', '20071202 13:58:18.680', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IGGD', N'Rusty Schaefer', N'Lesotho - Kentucky', '20090625 05:23:34.460', '20090728 14:43:18.740', 1, N'N', NULL, N'Automotive')
GO

--
-- Data for table dbo.KhachHang_Jade  (LIMIT 1000,500)
--

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IH31', N'Frances Kane', N'Mauritania - Missouri', '20081114 07:31:33.410', '20081130 15:05:32.600', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IJAX', N'Edward Schroeder', N'Bermuda - Idaho', '20090806 19:43:33.030', '20100310 07:29:52.090', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IJP8', N'Tim Hammond', N'Cambodia - Maryland', '20090808 14:59:35.330', '20090815 21:50:43.330', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IJWZ', N'Shelley Whitehead', N'Haiti - Nebraska', '20080110 18:55:06.920', '20080803 13:31:17.350', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IK9O', N'Jessie Whitehead', N'Macao - Texas', '20090806 23:49:09.260', '20091129 01:15:15.760', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IKO1', N'Ethan Mc Neil', N'Guam - Oklahoma', '20080804 10:22:04.260', '20080818 14:27:55.220', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IKZ', N'Joyce Edwards', N'Hungary - Delaware', '20070321 00:22:22.090', '20070729 13:09:40.920', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IMRQ', N'Donnell Mc Mahon', N'Libya - Alaska', '20071212 09:26:09.360', '20080802 01:17:46.020', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IO5', N'Hugh Barr', N'Azerbaijan - Arizona', '20070121 14:53:27.230', '20070927 02:38:59.270', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IOD7', N'Kristian Haney', N'Falklands - Texas', '20080813 01:47:49.900', '20090416 16:56:40.900', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IOZI', N'Fred Lam', N'Eritrea - Illinois', '20080728 01:17:53.650', '20081224 10:29:02.920', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IPQ1', N'Karl Carter', N'China - Wyoming', '20080909 17:50:13.310', '20081012 01:56:41.900', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IQO2', N'Peter Graham', N'Trinidad - Maryland', '20091123 18:39:29.360', '20100423 10:53:58.850', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IRFC', N'Rene Sparks', N'Estonia - Alaska', '20081206 12:31:24.390', '20081209 11:38:16.330', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IS3W', N'Gustavo O''Connor', N'Albania - Hawaii', '20090725 01:23:43.210', '20091121 18:59:56.550', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IT1Y', N'Sherman French', N'Russia - Mississippi', '20080122 07:20:27.520', '20080815 22:37:07.310', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IVJ6', N'Lloyd Sanders', N'New Zealand - Washington', '20081226 05:03:06.940', '20090819 19:04:46.770', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IWM8', N'Serena Mc Knight', N'Sweden - Virginia', '20081022 01:32:27.790', '20081029 04:11:16.110', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IWVD', N'Charlie Livingston', N'Lesotho - Nebraska', '20070609 10:12:05.160', '20071216 17:14:57.920', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IYLM', N'Nichole Pineda', N'Belize - South Dakota', '20090519 02:03:05.050', '20090709 22:48:35.880', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IZ69', N'Jenny Moreno', N'Côte d''Ivoire - Alaska', '20080322 00:04:26.660', '20080914 08:25:52.060', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IZHQ', N'Bryon Mccann', N'Italy - Delaware', '20070310 10:46:11.860', '20071013 01:03:12.480', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'IZU', N'Cheri Diaz', N'Uruguay - South Dakota', '20080806 22:25:30.320', '20081006 06:45:21.940', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J0HJ', N'Malcolm Sandoval', N'Samoa - Georgia', '20080725 02:50:34.480', '20080820 22:19:29.210', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J0RB', N'Leonardo Ibarra', N'Taiwan - Oklahoma', '20080702 19:28:51.220', '20080714 03:58:51.550', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J3DY', N'Juanita Mc Intyre', N'Mexico - Nebraska', '20081214 09:31:36.910', '20090603 12:36:44.060', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J3KP', N'Clifton Schaefer', N'Canada - Montana', '20090829 14:56:38.810', '20090915 19:56:21.750', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J5R5', N'Frankie Lynn', N'Macao - Massachusetts', '20091031 11:28:42.980', '20100506 05:58:56.240', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J7TO', N'Randal Washington', N'Latvia - Kansas', '20091110 18:37:10.920', '20100128 13:54:01.540', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J87R', N'Kerrie Bradley', N'Eire - Mississippi', '20070816 02:34:06.200', '20080406 01:14:00.840', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'J9VM', N'Vicki Rodriguez', N'Burundi - Massachusetts', '20080209 19:48:55.710', '20080425 03:01:26.470', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JAG6', N'Heather Henderson', N'El Salvador - Missouri', '20070211 11:47:29.490', '20070214 18:19:18.600', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JAQA', N'Louis Arias', N'Jordan - Delaware', '20081009 05:40:01.100', '20090509 00:04:45.910', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JBSB', N'Antonio Sharp', N'El Salvador - New York', '20080430 18:35:40.020', '20080905 19:10:29.830', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JBVT', N'Kenny Olsen', N'Cuba - Alaska', '20070701 11:41:18.790', '20071205 13:46:29.260', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JCLA', N'Joyce Middleton', N'Lebanon - Tennessee', '20081229 11:35:57.440', '20090102 01:09:14.230', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JDFU', N'Grant Villa', N'Bahrain - Idaho', '20091020 04:08:24.710', '20100208 23:15:40.080', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JDN0', N'Damion Reynolds', N'Australia - Oregon', '20071007 23:47:26.150', '20080406 21:47:26.590', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JDTC', N'Lesley Abbott', N'Malvinas - Kansas', '20071027 20:50:42.060', '20080410 23:21:32.850', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JFK9', N'Marcella Mc Intyre', N'Uganda - Illinois', '20070724 20:25:52.440', '20070911 08:00:53.400', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JFMV', NULL, N'San Marino - New Mexico', '20080829 22:52:59.460', '20081206 02:23:08.790', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JHJZ', N'Alice George', N'Timor-Leste - New Hampshire', '20090513 06:56:28.070', '20100217 21:42:21.620', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JIIH', N'Andrea Clay', N'Lesotho - Michigan', '20091124 21:32:59.880', '20091211 16:51:41.810', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JIVF', N'Keri Charles', N'Bahrain - California', '20070711 18:48:31.180', '20071223 02:06:46.970', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JJ50', N'Glenn Woodard', N'Guinea-Bissau - Wisconsin', '20091110 23:14:33.510', '20100819 18:13:04.910', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JL7D', N'Clarissa Ayers', N'Togo - Wyoming', '20090301 02:39:40.070', '20091202 02:22:11.370', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JMY7', N'Faith Cantrell', N'Italy - Missouri', '20080912 05:33:42.250', '20080925 11:55:18.880', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JOCU', N'Gordon Mays', N'Mexico - Tennessee', '20090629 05:05:50.260', '20090803 12:08:06.780', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JPCL', N'Tamiko Stanton', N'Argentina - Tennessee', '20091031 10:06:43.020', '20100216 08:22:28.640', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JQDH', N'Jodie Mccarty', N'Sierra Leone - Wyoming', '20091219 00:44:47.610', '20100822 06:47:18.720', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JROV', N'Deborah Faulkner', N'Guinea-Bissau - Oregon', '20090917 01:45:09.750', '20091116 22:29:08.320', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JT4S', N'Frank Rojas', N'Isle of Man - Vermont', '20071227 22:11:55.270', '20080607 20:11:35.460', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'JXFV', N'Heather Dougherty', N'Serbia - Ohio', '20090319 04:45:17.390', '20091117 03:04:51.330', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K11H', N'Jennifer Hall', N'Rwanda - Virginia', '20091020 21:28:22.320', '20100702 00:40:01.240', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K1GE', N'Summer Hines', N'North Korea - Maryland', '20071021 01:31:07.080', '20080608 11:18:29.840', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K3WH', N'Becky Bautista', N'Honduras - South Carolina', '20091106 19:36:07.860', '20100407 07:11:37.680', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K630', N'Cedric Nielsen', N'Panama - Pennsylvania', '20090612 21:38:54.180', '20091221 16:53:05.180', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K8FU', N'Jasmine Marquez', N'Nicaragua - Maryland', '20070121 14:40:07.980', '20070602 08:46:48.680', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'K8RG', N'Preston Navarro', N'Samoa - California', '20081203 22:48:39.810', '20090319 14:33:20.700', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KBD5', N'Cedric Barnes', N'Cuba - Illinois', '20071129 10:36:31.870', '20080726 03:59:16.880', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KCL0', N'Mia Clayton', N'Egypt - Oklahoma', '20070628 02:57:20.760', '20070809 03:35:39.190', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KD5W', N'Annie Hawkins', N'Bolivia - Massachusetts', '20080210 13:44:14.360', '20080615 17:15:44.770', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KGJJ', N'Sonja Holder', N'Finland - Illinois', '20080102 03:33:13.540', '20080521 07:46:15.200', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KH2H', N'Carey Fry', N'Uzbekistan - Wyoming', '20091004 04:02:03.650', '20091025 11:44:22.100', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KI8I', N'Christina Franco', N'Bermuda - Nevada', '20090727 18:31:56.400', '20100204 06:09:16.240', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KLSX', N'Ian Calderon', N'Argentina - Wisconsin', '20090521 18:14:58.400', '20091121 09:31:15.980', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KMBI', N'Shawn Carr', N'Somalia - Nevada', '20070301 20:07:34.830', '20071129 04:50:17.250', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KP5', N'Carey Cohen', N'Slovakia - North Carolina', '20090616 20:10:03.930', '20091101 00:36:12.720', 1, N'F', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KQDK', N'Alvin Baldwin', N'Slovenia - New Mexico', '20070101 11:29:29.400', '20070904 16:05:51.090', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KSYQ', N'Neal Faulkner', N'Serbia - Rhode Island', '20081019 04:31:20.620', '20090125 21:59:17.200', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KUYO', N'Connie Walters', N'Senegal - Arkansas', '20081114 18:29:22.270', '20090220 02:18:42.320', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KVVZ', N'Olga Hardin', N'New Caledonia - Illinois', '20090131 00:38:32.490', '20090326 09:13:15.740', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KWTV', N'Cassie Evans', N'Monaco - Florida', '20070312 08:04:05.040', '20070713 03:52:12.270', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KX3C', N'Kristen Roberts', N'Belgium - Virginia', '20081110 00:10:00.770', '20081112 05:20:09.420', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KXOT', N'Katie Camacho', N'South Georgia - Indiana', '20071124 06:16:16.980', '20080724 09:15:55.120', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'KZDU', N'Ginger Randall', N'Timor-Leste - Oklahoma', '20070331 10:25:06.900', '20070719 12:30:59.470', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L04S', N'Tera Finley', N'Ukraine - Missouri', '20091212 10:51:46.700', '20100301 18:16:00.620', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L0DD', N'Yvette Christian', N'Estonia - Montana', '20090218 14:50:57.590', '20090620 02:06:18.420', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L0QS', N'Nancy Wise', N'Vietnam - Pennsylvania', '20070713 23:13:44.810', '20070907 19:36:49.160', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L2DP', N'Celeste Stokes', N'Iran - Ohio', '20081116 21:24:58.680', '20090207 19:05:30.350', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L38F', N'Johnathan Durham', N'Armenia - Arizona', '20090714 12:13:55.840', '20100405 07:19:28.490', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L3GL', N'Tracy Moon', NULL, '20081020 09:47:00.810', '20081217 06:43:01.880', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L45F', N'Drew Farmer', N'Virgin Islands - Indiana', '20080507 13:14:48', '20080618 08:09:03.630', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L6M8', N'Bridget Edwards', N'Greenland - Georgia', '20080630 18:12:47.610', '20080925 08:15:47.580', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'L72J', N'Clinton Mccann', N'Estonia - Montana', '20080323 00:35:52.700', '20080917 23:56:15.240', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LAPA', N'Tonia Schaefer', N'Cambodia - Minnesota', '20070806 09:43:28.050', '20071013 02:08:42.240', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LGMF', N'Ruben Baird', N'Somalia - Massachusetts', '20070615 13:31:11.600', '20070828 11:32:59.850', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LHEF', N'Dexter Chase', N'Andorra - North Dakota', '20090805 09:29:16.170', '20091216 02:18:57.930', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LIC1', N'Alexander Richards', N'Honduras - Colorado', '20090902 19:44:59.660', '20100503 19:24:05.290', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LIQ6', N'Alexandra Hanson', N'Seychelles - Ohio', '20090412 08:46:16.350', '20100110 21:55:42.180', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LJJM', N'Lisa Dickson', N'Antarctica - Iowa', '20081127 18:09:52.570', '20090625 12:08:12.120', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LJPZ', N'Marilyn Juarez', N'Latvia - Idaho', '20090504 03:24:37.350', '20090530 08:13:31.230', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LMHE', N'Dana Wagner', N'France - West Virginia', '20070216 00:10:46.470', '20070515 18:49:36.160', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LN7J', N'Laura Montoya', N'Kazakhstan - Florida', '20080613 22:26:45.390', '20080708 05:25:29.410', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LNZ6', N'Efrain Murphy', N'Pakistan - California', '20081128 13:40:43.040', '20090919 21:07:09.740', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LOM0', N'Carl Chan', N'Jordan - Delaware', '20081208 23:39:42.910', '20090115 20:50:24.050', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LON9', NULL, N'Greenland - South Dakota', '20070529 14:46:06.150', '20070729 06:34:23.010', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LOPX', N'Vincent Mc Daniel', N'Israel - Tennessee', '20081111 02:10:33.710', '20090131 19:18:12.580', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LPV3', N'Terence Pace', N'Nepal - Iowa', '20090318 22:23:50.410', '20091025 06:02:46.220', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LRPZ', N'Nikki Ayala', N'Kuwait - Mississippi', '20080124 03:26:02.540', '20080318 14:11:49.370', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LS4H', N'Sandy Cross', N'Turkey - North Dakota', '20070124 19:05:30.230', '20070508 09:42:53.430', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LSK', N'Elisabeth Reeves', N'Lesotho - South Dakota', '20070702 17:41:47.020', '20080411 14:42:57.890', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LSUP', N'Janice Pitts', N'Somalia - Tennessee', '20081010 14:30:50.290', '20090127 02:00:44.620', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LSW4', N'Colin Clements', N'Mali - Wyoming', '20080310 18:07:57.080', '20080712 11:19:54.340', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LTN9', N'Warren Glass', N'Malta - Delaware', '20091005 15:17:24.760', '20091128 04:30:43.350', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LTT2', N'Cory Warren', N'Pitcairn - Nevada', '20091217 01:34:59.040', '20100903 10:34:11.310', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LU5T', N'Bruce Pena', N'Belize - Connecticut', '20070819 20:45:25.970', '20071111 07:34:24.750', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LWVD', N'Calvin Moran', N'Rwanda - Tennessee', '20070221 00:05:24.140', '20070727 19:17:17.160', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'LYTX', N'Jake Peterson', N'Isle of Man - Vermont', '20090722 06:58:24.400', '20091111 11:53:08.410', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M2MD', N'Dwight King', N'Montserrat - Delaware', '20070502 15:00:56.450', '20070703 01:10:28.700', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M33Z', N'Clarence Reilly', N'Gibraltar - Wyoming', '20070607 21:58:30.070', '20071128 12:21:04.740', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M46F', N'Isabel Contreras', N'Somalia - Washington', '20080509 10:48:31.060', '20080625 17:59:40.840', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M64A', N'Philip Hubbard', N'Bulgaria - Wyoming', '20090923 15:16:34.420', '20100717 17:03:29.170', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'M9XT', N'Jeannie Vasquez', N'Bermuda - North Dakota', '20070427 00:21:42.340', '20070701 15:46:04.310', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MA8W', N'Staci Stanton', N'Bangladesh - New York', '20080802 01:25:54.320', '20090419 16:30:45.190', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MAM8', N'Joanna Carey', N'Aruba - Wyoming', '20090721 05:56:12.880', '20090919 13:12:22.020', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MAMK', N'Leroy Wyatt', N'Malvinas - Rhode Island', '20080828 02:30:29.320', '20090522 07:43:15.930', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MCR8', N'Brandy Henry', N'Réunion - Utah', '20080415 01:56:23.300', '20081216 18:47:53.170', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MEGK', N'Alice Ashley', N'Morocco - Connecticut', '20070504 07:12:16.910', '20070722 15:41:40.320', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MGCB', N'Colleen Ingram', N'Peru - North Dakota', '20091112 20:40:09.410', '20100708 08:47:39.840', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MHS7', N'Lorraine Valdez', N'Norway - Wyoming', '20090210 23:47:11.970', '20091031 19:38:40.990', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MLBY', N'Beth Stark', N'Ghana - Hawaii', '20070916 22:01:49.930', '20080702 23:27:45.060', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MM9O', N'Monica Pearson', N'Croatia - Georgia', '20080209 13:32:08.260', '20080831 23:04:57.510', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MMX', N'Melisa Carrillo', N'Latvia - Vermont', '20090111 08:12:11.990', '20090723 16:50:35.320', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MRV0', N'Franklin Dunlap', N'Cuba - Tennessee', '20080805 12:19:26.700', '20080930 21:18:25.980', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MS24', NULL, N'Kazakhstan - Minnesota', '20071215 22:36:50.350', '20080506 02:10:32.800', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MSFT', N'Edgar Conley', N'Kenya - New Mexico', '20081103 07:02:57.590', '20090112 11:36:22.400', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MT6V', N'Wallace Merritt', N'Guatemala - Oregon', '20080614 00:54:23.500', '20080713 04:49:03.470', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MTRW', N'Kirsten Copeland', N'Liechtenstein - Idaho', '20081214 01:00:28.310', '20090815 09:35:48.650', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MVZH', N'Vernon Huynh', N'Georgia - Utah', '20090524 22:46:06.710', '20091104 08:11:41.540', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MY25', N'Bernard Barrett', N'Iran - New Hampshire', '20071130 15:44:56.310', '20080713 10:37:03.010', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MZIP', N'Stanley Goodman', N'Burundi - South Carolina', '20071102 23:22:27.810', '20080514 16:32:30.530', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'MZP9', N'Amie Blanchard', NULL, '20080207 19:31:44.270', '20080915 12:37:50.560', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N06L', N'Terence Gibbs', N'Kyrgyzstan - Mississippi', '20080905 02:15:38.470', '20081114 15:50:53.650', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N0U9', N'Kelvin Rosario', N'South Korea - Colorado', '20081127 14:45:26.920', '20090101 14:26:06.600', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N2OI', N'Marla Preston', N'South Georgia - Kansas', '20090918 06:18:03.550', '20100415 11:36:50.410', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N43H', N'Kristina Hurley', N'Cameroon - Louisiana', '20070503 16:57:50.610', '20071218 14:42:50.950', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N5JF', N'Joni Boyer', N'Germany - Nevada', '20080417 16:35:48.290', '20090209 15:35:10.320', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N5X0', N'Ian Gallegos', N'Venezuela - New Mexico', '20090510 20:53:14.220', '20091020 15:16:56.510', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'N6FG', N'Belinda Barnes', N'Cook Islands - Montana', '20090731 03:41:29.940', '20091019 07:32:40.440', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NA5V', N'Monte Nicholson', N'Kenya - New Mexico', '20090117 14:32:56.520', '20090723 04:53:45.830', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NBRF', N'Javier Chapman', N'Fiji - Mississippi', '20090312 07:13:09.550', '20090821 21:58:25.680', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NC74', N'Lloyd Hood', N'Malaysia - Georgia', '20070716 17:53:27.150', '20080402 09:39:27', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NCBO', N'Alejandro Stewart', N'Egypt - Wisconsin', '20071119 03:55:51.560', '20080709 14:07:43.600', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NCZY', N'Jamie Dudley', N'Guam - South Dakota', '20080727 07:17:45.860', '20090120 23:19:26.070', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NDFH', N'Kimberley Maxwell', NULL, '20090905 17:00:51.470', '20100428 20:26:29.530', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NDL', N'Edwin Mosley', N'Malta - Nebraska', '20070920 15:01:34.970', '20080705 18:53:46.220', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NEMH', N'Monte Reese', N'Iceland - Oklahoma', '20090812 10:59:43.080', '20091205 06:43:08.380', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NF5T', N'Vicki Waters', N'Lebanon - Alabama', '20090523 14:57:27.460', '20090601 20:17:58.230', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NHD0', N'Mandy Baldwin', N'South Africa - Wisconsin', '20080429 13:10:50.200', '20090106 14:48:58.810', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NIK0', N'Glenda Randolph', N'Liberia - South Dakota', '20080520 20:22:14', '20080827 19:32:37.020', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NJHO', N'Harry Mccarty', N'Guadeloupe - Alabama', '20080829 23:41:16.630', '20090407 12:23:26.820', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NKSL', N'Irma Duncan', N'Micronesia - North Carolina', '20090130 15:06:09.110', '20090511 23:25:06.370', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NKUG', N'Shari Guerra', N'Nauru - Tennessee', '20090824 19:46:44.410', '20100331 02:01:17.760', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NLBL', N'Roman Vang', NULL, '20070124 09:56:36.260', '20070204 00:44:25.550', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NLIW', N'Darrick O''Connor', N'Iran - West Virginia', '20080531 15:03:04.440', '20090213 07:55:37.210', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NLQN', N'Bethany Meadows', N'France - Alabama', '20080110 20:29:39.650', '20080531 23:00:57.990', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NNP9', N'Bernard Carter', N'Georgia - Missouri', '20080807 16:41:19.700', '20080816 17:02:01.830', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NNXG', N'Derek Farley', N'Iceland - Alaska', '20080921 17:59:57.640', '20090313 21:02:52.640', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NNZ6', N'Ray Ortiz', N'Singapore - Indiana', '20081222 20:09:46.850', '20090103 04:21:38.760', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NQ06', N'Teresa Shelton', N'Malaysia - Virginia', '20071124 03:54:20.780', '20080810 08:48:50.870', 1, NULL, NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NQ5S', N'Ruby Cantu', N'Honduras - Oklahoma', '20080528 19:16:29.990', '20080923 12:33:11.360', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NR4M', N'Brandi Stein', N'Hungary - California', '20071011 21:29:53.480', '20080206 22:40:23.600', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NRD', N'Shonda Henry', N'Russia - Minnesota', '20070102 07:51:24.050', '20070213 17:32:57.730', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NSYH', N'Joanna Underwood', N'Burundi - Missouri', '20071126 06:15:33.380', '20080404 02:52:53.620', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NTQS', N'Abraham Page', N'Slovenia - Oregon', '20070804 16:21:50.620', '20070823 07:03:26.790', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'NY21', N'Edward Stevens', N'Virgin Islands - Connecticut', '20070523 01:44:14.220', '20071228 07:31:02.400', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'O44Q', N'Damian Kaiser', N'Bangladesh - Wyoming', '20090302 06:47:29.590', '20091125 05:45:44.100', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'O4JD', N'Irma Padilla', N'Mali - New Hampshire', '20090722 14:21:45.730', '20090923 07:56:41.540', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'O5JB', N'Tasha Peck', N'Cuba - Missouri', '20091126 16:20:38.780', '20100207 10:22:32.160', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OB7Q', N'Katina Poole', N'Ghana - Pennsylvania', '20080502 10:25:29.260', '20080614 05:46:49.730', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OBB9', N'Luke Santos', N'Uruguay - Utah', '20070227 20:09:12.220', '20070423 17:35:38.440', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OCP', N'Charles Winters', N'Rwanda - Maine', '20090825 10:11:32.410', '20090906 13:18:07.470', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OCRG', N'Loretta Mccall', N'Anguilla - Georgia', '20080303 06:45:12.620', '20080627 16:13:43.480', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OD3Q', N'Sheryl Ho', N'Nigeria - Mississippi', '20090526 22:18:41.790', '20090613 11:40:01.970', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ODXE', N'Salvatore Mckay', N'Egypt - Virginia', '20090222 16:08:35.730', '20091205 21:24:34.780', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OE7B', N'Tonia Pope', N'Libya - Virginia', '20090509 23:25:16.670', '20090731 14:15:53.670', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OE8M', N'Kenya Hardy', N'Congo - New Mexico', '20081021 07:16:55.940', '20090321 04:06:14.290', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OET2', N'Josephine Tucker', N'Syria - Missouri', '20080325 03:24:32.620', '20080824 09:23:20.540', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OIR1', N'Shannon Stevenson', N'French Guiana - Wisconsin', '20071222 09:46:19', '20080727 01:50:36.010', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OIU8', N'Diane Brock', N'Montserrat - North Carolina', '20080604 23:57:50.830', '20090324 21:48:57.340', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OJFY', N'Stacy Todd', N'Ghana - Virginia', '20070731 19:18:16.450', '20071209 00:58:14.740', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OJIX', N'Mary Solomon', N'American Samoa - Wyoming', '20081209 22:06:45.940', '20090508 15:51:20.670', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OM3D', N'Penny Choi', N'Mauritius - Missouri', '20090831 05:19:58.160', '20100613 16:19:04.620', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OMEK', N'Christian Holmes', N'Russia - Tennessee', '20081008 08:46:26.310', '20090305 02:49:52.710', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ONLR', N'Naomi Snyder', N'Cape Verde - Kentucky', '20090928 01:39:12.280', '20100518 05:48:38.750', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ONVO', N'Jenny De Leon', N'Samoa - Massachusetts', '20091120 09:46:10.770', '20091126 00:41:27.830', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OONV', N'Matt Haney', N'Lebanon - Alabama', '20090212 06:23:06.250', '20090914 08:37:09.130', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OQ1K', N'Andy Carroll', N'Costa Rica - Wyoming', '20070206 07:26:18.250', '20070630 21:10:13.220', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OQ9O', N'Sonny Aguilar', N'Honduras - Illinois', '20071226 19:37:04.380', '20080608 10:23:52.560', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OQRO', N'Katrina Blackburn', N'Virgin Islands - South Dakota', '20080303 11:55:05.410', '20081003 04:13:06.140', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OS09', N'Jesus Chambers', N'Puerto Rico - Kentucky', '20081229 12:05:31.510', '20090919 20:40:07.360', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OSLC', N'Emma Steele', N'Mongolia - Wyoming', '20090922 23:34:02.950', '20100218 02:51:35.220', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OSMK', N'Tomas Mcintosh', N'Benin - Missouri', '20090530 18:27:49.390', '20091117 03:19:56.420', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OXEZ', N'Terrence Wheeler', N'Slovakia - Texas', '20080818 14:19:18.350', '20090310 01:00:29.990', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OZEB', N'Marisol Melendez', N'Trinidad - Massachusetts', '20070327 03:46:30.180', '20071023 20:55:30.580', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'OZGG', N'Claire O''Neill', N'Liberia - Virginia', '20090704 10:41:31.210', '20100413 18:21:30.880', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P1G0', N'Jorge Bullock', N'Samoa - Idaho', '20090206 21:19:38.400', '20090525 01:45:46.980', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P1PL', N'Latasha Vaughn', N'South Korea - Mississippi', '20070503 16:40:51.610', '20071227 17:09:02.430', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P33X', N'Quincy Green', N'Isle of Man - Florida', '20090216 01:52:23.640', '20091016 09:04:08.250', 2, NULL, NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P4MB', N'Leonardo Johns', N'Jersey - Arkansas', '20070617 18:57:00.930', '20070621 02:53:43.210', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P4P1', N'Anitra Ochoa', N'Antarctica - Oklahoma', '20081108 20:34:34.340', '20090313 00:11:31.690', 1, NULL, NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P4VT', N'Wesley Hale', N'Panama - Wisconsin', '20071208 16:15:26.840', '20080928 08:04:14.700', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'P5S2', N'Olga Benjamin', N'Serbia - Arkansas', '20070416 07:53:21.450', '20071017 16:21:42.800', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PACT', N'Lorena Bird', N'Antarctica - Iowa', '20070126 02:13:39.290', '20070528 01:24:15.270', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PAJF', N'Casey Benson', N'Portugal - Alaska', '20080925 04:12:35.220', '20090411 01:50:06.850', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PCOK', N'Marshall Erickson', N'Taiwan - Kentucky', '20070220 15:59:45.620', '20070426 16:55:06.040', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PCP4', NULL, N'Vatican City - Idaho', '20091212 21:34:17.190', '20100930 12:22:22.820', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PD95', N'Laurie Casey', N'Eire - Wyoming', '20070211 10:57:12.490', '20071028 11:40:16.080', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PF0L', N'Damian Skinner', N'Benin - Utah', '20080628 06:02:03.420', '20090305 11:37:31.700', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PKI', N'Maribel Combs', N'Saint Lucia - West Virginia', '20080812 14:30:03.210', '20081011 23:47:55.680', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PLEC', N'Willie Fields', N'Kazakhstan - Vermont', '20080715 19:27:24.190', '20080725 19:23:33.600', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PLO5', N'Tameka Stewart', N'Cape Verde - Wisconsin', '20070519 11:56:48.720', '20070710 11:51:35.970', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PM9C', N'Vincent Mercado', N'Ethiopia - New York', '20090527 21:09:31.110', '20091210 21:52:02.620', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PNIU', N'Fred Olson', N'Singapore - West Virginia', '20080927 23:36:39.340', '20090511 14:26:10.190', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PT1T', N'Felicia Shepherd', N'Romania - Delaware', '20080528 10:28:25.690', '20080721 07:40:17.820', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PVO4', N'Norma Simmons', N'Venezuela - Michigan', '20080413 06:27:09.860', '20081124 12:06:12.140', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PXVS', N'Sonja Moreno', N'Fiji - Washington', '20090919 22:17:33.970', '20100319 17:54:05.030', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PY6Z', N'Alyssa Navarro', N'Bahrain - Tennessee', '20070122 10:59:56.230', '20070729 04:54:54.120', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'PZ0A', N'Erica Cherry', N'Argentina - New Hampshire', '20090331 13:26:55', '20091201 22:38:13.080', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q249', N'Tracy Acevedo', N'Thailand - Oregon', '20080808 13:59:47.080', '20090117 10:11:22.080', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q2KY', N'Nakia Moreno', N'Mongolia - Washington', '20090606 04:21:18.900', '20090801 10:34:30.490', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q2ZS', N'Latisha Harper', N'Congo - Colorado', '20070615 01:00:54.720', '20080130 12:00:14.810', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q425', N'Wendi Kemp', N'Samoa - California', '20080105 00:19:09.560', '20080226 11:01:10.100', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q5GM', N'Patricia Adkins', N'Turkey - Texas', '20090414 05:24:34.690', '20090831 00:03:14.170', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q61T', N'Carmen Krueger', N'Benin - South Dakota', '20090826 08:19:09.520', '20100313 03:00:21.040', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q7D3', N'Lynette Graves', N'Slovakia - Mississippi', '20090507 14:52:46.280', '20091108 22:22:52.390', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q7M9', N'Randall Barnes', N'Burundi - Ohio', '20080824 19:53:29.950', '20080826 05:42:16.460', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q8H0', N'Guillermo Le', N'Guyana - South Dakota', '20090709 22:56:53.180', '20100319 03:01:16.710', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Q8U9', N'Vickie Chase', N'India - North Dakota', '20090612 14:51:14.910', '20090710 14:52:36.980', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QA9S', N'Natalie Sanchez', N'Montserrat - Arkansas', '20071201 20:15:31.240', '20080224 13:10:17.280', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QB4H', NULL, N'Angola - Michigan', '20081126 21:55:12.980', '20090411 14:27:15.470', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QB6Q', N'Latonya Gregory', N'American Samoa - South Dakota', '20091115 03:31:45.370', '20100611 20:31:24.080', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QBC0', N'Leslie Stokes', N'Guadeloupe - Texas', '20091122 02:43:49.920', '20100206 16:25:13.930', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QBX2', N'Mark Everett', N'Pakistan - Arkansas', '20090612 14:31:32.290', '20100210 11:58:40.040', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QD1M', N'Marisa Petersen', N'Côte d''Ivoire - South Carolina', '20071224 05:02:15.920', '20080112 02:16:31.080', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QENQ', N'Sandra Escobar', N'Pitcairn - New York', '20080716 08:44:24.430', '20080719 01:44:31.140', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QFVG', N'Ricardo Hanna', N'Congo - Pennsylvania', '20080206 14:40:05.790', '20080405 04:13:49.800', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QHUY', N'Marsha Hayes', N'Morocco - Hawaii', '20070515 06:01:02.480', '20070616 12:41:36.440', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QJQN', N'Howard Moss', N'Slovenia - Oregon', '20081209 15:29:42.780', '20090829 01:58:04.450', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QLT8', N'Damian Andrews', N'Austria - New Hampshire', '20090405 06:04:34.760', '20091125 09:00:10.580', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QMQA', N'Karrie Barr', N'Netherlands - Oregon', '20090104 22:30:04.460', '20090712 05:51:58.730', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QN0N', N'Lashonda Huerta', N'Vanuatu - Montana', '20091211 08:15:19.990', '20100420 21:28:13.320', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QQW4', N'Jacob Calhoun', N'Guyana - Tennessee', '20071028 22:49:27.280', '20080414 09:40:05.230', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QS4T', N'Angelina Vega', N'Eritrea - North Dakota', '20070706 04:16:57.310', '20070728 08:57:17.440', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QSAZ', N'Justin Dalton', N'Tanzania - Colorado', '20070121 13:30:07.400', '20070829 19:27:39.040', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QT5C', N'Jenna Gordon', N'Kenya - New Mexico', '20070926 05:04:32.760', '20080216 14:15:49.960', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QTWJ', N'Teddy Sparks', N'Russia - Missouri', '20090402 09:38:16.950', '20090618 03:49:53.460', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QTYJ', N'Emily Sampson', N'Togo - Colorado', '20070827 09:13:11.660', '20080529 16:48:02.590', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QY45', N'Jerry Nicholson', N'Sri Lanka - Arizona', '20080302 06:35:56.610', '20080330 04:10:07.250', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QYF3', N'Walter Sosa', N'Sweden - Arizona', '20081115 22:08:00.330', '20081215 13:39:45.300', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QZ2U', N'Colby Dominguez', N'Guyana - Arkansas', '20090404 09:12:52.440', '20100104 19:54:37.670', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'QZQM', N'Julio Raymond', N'Mongolia - California', '20090501 17:19:28.340', '20090723 13:02:35.390', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R0GE', N'Lance Reilly', N'Micronesia - Pennsylvania', '20090805 01:53:44.060', '20100306 13:03:39.110', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R0K0', N'Carla Monroe', N'Guinea - Indiana', '20080130 11:00:38.720', '20080525 14:58:48.860', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R1QK', N'Bridgette Hall', N'Peru - Minnesota', '20090615 12:27:34.220', '20090626 02:16:00.110', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R2TE', N'Herman Pearson', N'Indonesia - Arizona', '20090111 06:52:53.580', '20090221 03:49:14.040', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R32', N'Damian Wood', N'Zambia - Mississippi', '20070104 06:31:38.340', '20070620 19:56:52.720', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R3SJ', N'Ricky Tanner', N'Peru - Kentucky', '20071106 20:07:06.460', '20080515 08:02:03.820', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R5N8', N'Eileen Briggs', N'Latvia - Michigan', '20090402 11:56:41.370', '20091023 05:11:38.500', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R6Q3', N'Edwin Waller', N'Malta - Tennessee', '20080706 10:24:54.850', '20090129 16:16:23.260', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'R782', N'Ted Davila', N'Bahamas - Idaho', '20090619 05:12:21.590', '20091209 01:45:41.680', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RAL6', N'Shawna Morton', N'Saint Helena - North Carolina', '20090508 10:04:30.600', '20091216 13:33:14.360', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RCUL', N'Brian Farmer', N'Liberia - Nebraska', '20090205 01:36:12.930', '20091017 23:43:29.240', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RDDD', N'Chadwick Short', N'Isle of Man - Colorado', '20090401 17:33:37.960', '20100115 18:23:31.150', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'REPR', N'Candace Spence', N'Micronesia - Nevada', '20070110 02:41:45.620', '20070210 05:29:58.720', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'REU2', N'Charlie Spears', N'Slovakia - Alaska', '20080731 15:05:20.130', '20080804 00:35:26.800', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RH68', N'Joshua Suarez', N'South Georgia - Indiana', '20070426 08:48:59.090', '20071010 04:26:23.280', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RHJ1', N'Patrick Lucas', N'Guatemala - Colorado', '20090909 12:08:18.200', '20091017 18:24:30.790', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RR0O', N'Gabriel Cox', N'Netherlands - Colorado', '20090113 09:41:49.440', '20090426 04:52:44.710', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RRSD', N'Angelo Barker', N'Fiji - North Carolina', '20090702 15:44:23.950', '20100312 09:09:34', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RRT7', N'Joseph Duarte', N'Vanuatu - Maine', '20081216 02:52:49.580', '20081229 12:50:35.020', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RSB8', N'Alana Gill', N'Tunisia - Utah', '20090411 01:52:27.860', '20100106 23:36:42.870', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RUCW', N'Quincy Good', N'Syria - Illinois', '20091212 10:57:28.180', '20100314 00:15:47.690', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RUP2', N'Ira Herring', N'Mongolia - Connecticut', '20090325 18:19:16.570', '20091124 15:05:23.940', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RVEF', N'Dena Arellano', N'Guam - Wyoming', '20091022 20:23:54.730', '20100418 18:31:52.370', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RYLG', N'Adrian Stone', N'San Marino - California', '20070911 01:42:34.740', '20080129 14:41:13.360', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'RZH6', N'Regina Robles', N'Jordan - Pennsylvania', '20070630 17:12:28.530', '20070703 03:28:27.290', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S3RG', N'Krista Haney', N'Guatemala - Georgia', '20070202 22:27:41.750', '20071010 02:40:04.960', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S4PO', N'Daryl Macias', N'Bolivia - Delaware', '20070805 20:00:32.610', '20080507 02:26:24.830', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S517', N'Heather Calderon', N'Mayotte - Alaska', '20091208 18:28:18.170', '20100723 09:06:00.020', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S6CE', N'Dan Benton', N'Iran - Maine', '20081109 02:30:50.710', '20090823 07:41:46.720', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S736', N'Marco Marshall', N'Belize - South Dakota', '20080518 07:17:27.030', '20080610 12:54:20.780', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'S76Y', N'Lakesha Watkins', N'Virgin Islands - Tennessee', '20080423 21:53:42.520', '20080809 00:52:44.150', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SDRD', N'Natalie Hodge', N'Vatican City - California', '20081108 13:51:49.270', '20090120 18:02:19.240', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SE19', N'Jaime Cisneros', N'Gambia - Tennessee', '20070609 07:38:47.080', '20071126 04:20:55.250', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SECX', N'Kara Riley', N'Montenegro - Nebraska', '20090206 06:54:15.590', '20091122 12:36:46.790', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SED7', N'Tami Weber', N'Nepal - Alaska', '20080805 07:45:28.270', '20090324 08:57:24.140', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SES2', N'Tera Compton', N'Iceland - Alabama', '20091213 12:00:27.230', '20100508 19:32:11.970', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SFQ6', N'Lonnie Huynh', N'Moldova - Montana', '20090716 07:47:28.240', '20090903 21:26:22.850', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SKEO', N'Kari Rodgers', N'Estonia - Maryland', '20070416 18:34:52.150', '20070417 21:28:24.730', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SKZW', NULL, N'Greenland - New Hampshire', '20090902 12:05:02.730', '20091212 02:50:30.610', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SO1Z', N'Tyson Mercer', N'Djibouti - New York', '20071022 13:38:49.900', '20080607 15:25:39.530', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SPFH', N'Carey Aguilar', N'Montserrat - Maryland', '20090810 23:38:11.510', '20100130 18:55:58.790', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SREB', N'Joe Cohen', N'Japan - South Carolina', '20080329 21:57:07.470', '20080513 06:15:35.080', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'STM2', N'Randi Mckinney', N'Cuba - Florida', '20090823 06:03:39.860', '20091125 11:55:38.980', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SUHS', N'Adrian Mercado', N'Hong Kong - Delaware', '20090702 02:42:15.210', '20090705 23:59:40.420', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SUYB', N'Mason Pham', N'Pakistan - Michigan', '20080503 04:26:49.430', '20080831 17:13:30.800', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SV1C', N'Melvin Avila', N'Anguilla - Oklahoma', '20080730 06:56:01.610', '20080928 06:37:26.510', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SVIU', N'Robin Weiss', N'American Samoa - Montana', '20081231 13:54:01.090', '20090330 11:46:56.850', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SW8I', N'Lawrence Bowen', N'Nigeria - Alabama', '20080731 06:12:42.600', '20081127 21:18:01.830', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SXA0', N'Rafael Sloan', N'Djibouti - Oklahoma', '20071209 20:44:58.380', '20080712 15:16:57.400', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'SYEP', N'Roy Byrd', N'Qatar - Missouri', '20071126 08:31:39.160', '20080107 16:19:19.420', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'T4XF', N'Harvey Bell', N'Kyrgyzstan - Nebraska', '20080302 05:08:25.230', '20080306 15:33:53.490', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'T86N', N'Jamal Mejia', N'Mali - Louisiana', '20081014 18:03:34.110', '20090424 02:56:32.560', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'T8MK', N'Rex Nixon', N'Egypt - Colorado', '20070113 08:55:46.330', '20070730 11:31:55.070', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TA6I', N'Jami Banks', N'Luxembourg - Montana', '20080909 01:20:32.250', '20090527 00:01:14.490', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TB8S', N'Ty Sexton', N'Sri Lanka - Maine', '20091203 20:34:32.080', '20100611 09:52:01.650', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TBBP', N'Clay Whitney', N'Malawi - Wisconsin', '20090413 05:56:38.290', '20091009 12:30:09.450', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TBFH', N'Angelina Keith', N'Bhutan - Delaware', '20080916 14:15:55.030', '20090511 04:58:57.830', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TBWZ', N'Mario Charles', N'Armenia - New Jersey', '20090129 21:07:06.430', '20090929 22:04:51.530', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TC3T', N'Nora Edwards', N'Mauritius - Mississippi', '20080628 04:11:54.200', '20081130 13:35:01.700', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TC52', NULL, N'Trinidad - North Dakota', '20081025 20:50:51.750', '20090225 13:24:37.740', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TD6Q', N'Maggie Rios', N'San Marino - Virginia', '20080430 03:58:28.230', '20081020 20:43:02.090', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TEPC', N'Ricky Clay', N'French Guiana - Pennsylvania', '20090603 18:40:44.850', '20100129 17:05:34.860', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TH20', N'Denise Coffey', N'Réunion - New Hampshire', '20070111 10:22:53.510', '20070905 06:39:16.130', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TH7H', N'Cheryl Williams', N'North Korea - Massachusetts', '20080813 10:51:30.500', '20090530 19:25:54.240', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TI83', N'Robbie Scott', N'Afghanistan - Massachusetts', '20070615 06:29:37.700', '20071002 15:39:07.130', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TIIY', N'Jessica Mcclain', N'Burundi - Iowa', '20091023 22:37:45.600', '20100218 14:05:30.290', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TIKG', N'Myra Pham', N'Czech Republic - Idaho', '20070921 00:33:15.400', '20080322 12:03:44.220', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TJ4D', N'Calvin Jensen', N'Montserrat - Montana', '20070708 01:25:48.090', '20071117 07:48:46.950', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TLYI', N'Neal Bass', N'Kyrgyzstan - Hawaii', '20080317 19:12:37.730', '20080415 23:47:44.500', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TO84', N'Toby Alexander', N'Mayotte - Kansas', '20080522 12:58:00.840', '20081116 06:43:56.650', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TOAM', N'Daniel Richards', N'Slovakia - Tennessee', '20070317 21:59:55', '20070716 12:49:50.090', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TOMF', N'Bradley Huffman', N'Timor-Leste - Utah', '20081212 15:58:52.270', '20090914 17:23:35.500', 1, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TPO2', N'Staci Beard', N'Georgia - Nebraska', '20070502 18:18:44.680', '20070510 23:15:38.760', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TQ30', N'Norman Medina', N'Estonia - Arkansas', '20090908 01:29:12.370', '20100418 20:44:22.270', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TREW', N'Guadalupe Robbins', N'Singapore - New Mexico', '20091122 09:08:31.940', '20100104 13:11:19.580', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TSIU', N'Darnell Bryan', N'Angola - Maine', '20070714 15:15:22.340', '20071223 06:17:26.060', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TT', N'Cristina Giles', N'Micronesia - North Dakota', '20090117 07:51:06.950', '20091001 09:49:01.450', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TUML', N'Tricia Rios', N'Bahrain - Georgia', '20070814 19:23:34', '20070917 04:59:03.260', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TUND', N'Cary Allison', N'Uzbekistan - Arizona', '20070902 00:06:25.110', '20071011 00:50:05.190', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TWPS', N'Sheila Cochran', N'Antarctica - Idaho', '20090613 22:17:28.170', '20100117 18:26:56.720', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TY2L', N'Randolph Flowers', N'Cook Islands - Arizona', '20080221 08:27:29', '20080805 20:11:55.170', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'TY6W', N'Garrett Dudley', N'Libya - Tennessee', '20070211 18:13:04.720', '20071002 15:00:59.150', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U0TA', N'Chester Spence', N'Pitcairn - Nebraska', '20091014 23:10:11.670', '20100619 04:07:37.960', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U1A2', N'Ronald Boyle', N'Belgium - Oklahoma', '20070528 20:50:20.360', '20071130 02:32:51.160', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U3KT', N'William Bryan', N'Belize - Alaska', '20080312 03:27:11.160', '20080607 19:55:26.570', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U410', N'Ted Lara', N'Eire - Wyoming', '20080604 14:31:19.710', '20080813 10:43:33', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U46M', N'Hollie Vaughn', N'Somalia - New York', '20090922 07:35:07.360', '20100624 03:39:39.770', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U5OK', N'Darrick Stephenson', N'Cuba - Kentucky', '20081012 14:04:41.060', '20090606 02:35:38.070', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U5WL', N'Clayton Hanna', N'Bahrain - Vermont', '20080804 16:26:07.090', '20090224 10:41:07.080', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U6HR', N'Dina Flynn', N'Romania - Louisiana', '20081108 05:36:46.980', '20090405 09:18:15.690', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U768', N'Staci Erickson', N'Vatican City - Missouri', '20081016 13:00:23', '20090209 08:24:07.290', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U7HJ', N'Ernesto Clements', N'Iraq - Maryland', '20080325 00:06:41.960', '20080807 13:40:08.780', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U8PW', N'Carla Meyer', N'South Africa - Arkansas', '20080623 13:00:22.650', '20090110 21:33:10.650', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'U9BO', N'Rodolfo Spears', N'Aruba - Missouri', '20070111 10:09:15.760', '20070602 23:29:35.220', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UAL', N'Stephan Morse', N'Anguilla - Wisconsin', '20080414 13:45:24.370', '20081216 06:34:41.920', 1, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UDA5', N'Noel Rasmussen', N'Nicaragua - South Dakota', '20090824 05:33:35.160', '20091215 18:18:14.410', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UDU4', N'Tricia Duffy', N'Indonesia - Montana', '20080303 08:52:18.460', '20081019 12:55:12.750', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UEKK', N'Felicia Watson', N'Lithuania - Kentucky', '20081201 20:55:44.920', '20090423 04:01:10.790', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UHVY', N'Garry Warner', N'Greece - Maine', '20080618 10:06:57.430', '20080801 08:35:12.120', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UHW', N'Dawn Mills', N'Burundi - North Carolina', '20090824 00:49:05.860', '20100514 17:46:56.500', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UI9Q', N'Elton De Leon', N'Kazakhstan - West Virginia', '20081022 00:49:45.580', '20090117 00:06:02.760', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UIH1', N'Erika Sawyer', N'Jamaica - Iowa', '20080905 23:28:01.780', '20090114 18:19:35.800', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UL6W', N'Kelli Jacobs', N'Pitcairn - Minnesota', '20080502 20:03:58.350', '20081007 17:54:26.890', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UMSS', N'Gabriel Schultz', N'Poland - Nebraska', '20080221 11:42:31.140', '20080926 17:23:38.880', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UNKU', N'Brett Fitzgerald', N'Aruba - Illinois', '20070812 12:01:07.770', '20080121 15:59:51.490', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UPIC', N'Alan Mercer', N'China - Nevada', '20071116 07:32:02.970', '20080529 10:41:14.080', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UPND', N'Tracie Martin', N'United States - Ohio', '20070411 10:01:18.850', '20080124 13:28:20.990', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UQYU', N'Seth Archer', N'Denmark - Kansas', '20070401 01:07:37.740', '20070905 02:04:01.940', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UTLA', N'Alfonso Shea', N'Jamaica - Illinois', '20080722 08:06:45.380', '20081217 03:45:21.930', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UU2L', N'Brock Watts', N'Liberia - Louisiana', '20080213 05:37:49.200', '20080708 00:41:37.320', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UUJR', N'Billie Short', N'Hong Kong - Georgia', '20080401 21:23:43.050', '20090101 05:54:31.880', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UWG8', N'Jenifer Luna', N'Norway - Virginia', '20090320 19:17:05.630', '20090724 17:54:18.770', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UWGC', N'Angel Crane', N'Palau - Kansas', '20081228 01:46:41.860', '20090915 19:41:17.550', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UWNT', N'Kari Mc Lean', N'Nicaragua - Kansas', '20091220 14:05:53.770', '20100917 19:22:02.770', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'UYKZ', N'Mandy Stout', N'Malaysia - Ohio', '20090320 09:26:31.260', '20090711 10:20:06.400', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'V06X', N'Angelo Phillips', N'Latvia - Connecticut', '20070113 14:51:05.430', '20070203 02:50:49.510', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'V132', N'Warren Warner', N'South Georgia - Pennsylvania', '20071218 01:41:41.280', '20080801 10:00:45.220', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'V8S4', N'Carol Cameron', N'Ukraine - New Mexico', '20070302 11:19:56.910', '20070709 10:56:59.540', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VABI', N'Joan Nolan', N'Oman - Wisconsin', '20090810 05:10:45.040', '20100116 21:20:54.150', 1, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VAK6', N'Freddie Mills', N'Saint Lucia - Wisconsin', '20080815 20:16:06.830', '20090606 14:03:20.180', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VAQR', N'Angelina Knapp', N'French Guiana - Alaska', '20090116 19:36:40.700', '20090308 08:56:53.650', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VBBD', N'Robert Valdez', N'Gambia - Tennessee', '20081204 03:16:30.470', '20090208 16:54:37.150', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VBPJ', N'Cara Morton', N'Costa Rica - Vermont', '20070506 04:22:47.160', '20071102 01:11:24.300', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VC0H', N'Wayne Holmes', N'Iran - Arizona', '20071224 17:24:09.690', '20080503 03:34:55.610', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VCKE', N'Morgan Larson', N'Guyana - Idaho', '20070721 02:40:17.430', '20080427 00:38:09.310', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VFZT', N'Luke Lamb', N'Bangladesh - New Hampshire', '20071017 21:30:35.750', '20071024 01:44:14.880', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VHSO', N'Mia Rowland', N'Kyrgyzstan - Connecticut', '20071208 14:17:33.940', '20080129 02:42:30.180', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VLD5', N'Michele Bryant', N'China - Wisconsin', '20090707 02:55:55.190', '20090927 23:42:29.440', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VMQQ', N'Terence Ramsey', N'Montenegro - Wyoming', '20090227 22:48:01.830', '20091108 05:10:39.390', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VN1I', N'Dina Beard', N'Singapore - West Virginia', '20090528 05:14:30.990', '20090801 01:24:19.100', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VOC7', N'Gloria Stephenson', N'Moldova - Missouri', '20081020 23:51:16.550', '20081214 02:08:03.690', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VQTZ', N'Wallace French', N'Tonga - Wyoming', '20090810 23:50:49.880', '20091114 12:06:54.690', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VU9Q', N'Theodore Stephenson', N'Eire - Mississippi', '20090622 18:11:55.880', '20091225 06:19:49.070', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VUAS', N'Rose Rivera', N'Sweden - Maine', '20090515 21:35:51.250', '20091011 05:58:23.060', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VX8H', N'Kate Lloyd', N'Taiwan - Iowa', '20070317 03:21:33.700', '20070728 13:46:34.180', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VXAZ', N'Alvin Watts', N'Montserrat - Idaho', '20080718 01:34:48.810', '20080811 10:09:00.420', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VY2R', N'Marlon Wheeler', N'Liechtenstein - West Virginia', '20090419 13:42:35.480', '20091107 06:28:39.020', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'VZLD', N'Megan Middleton', N'Syria - South Carolina', '20081107 05:32:41.780', '20090131 21:31:30.150', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W1T9', N'Charity Conley', N'Sudan - Iowa', '20080113 11:10:22.350', '20080608 14:25:36.620', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W262', N'Josh Blair', N'Mozambique - Mississippi', '20080524 14:53:55.560', '20080618 08:02:37.730', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W7AB', N'Cari Wright', N'Norway - Hawaii', '20090523 20:11:24.230', '20090714 05:21:55.910', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'W9PL', N'Jeanette Dudley', N'Uruguay - Wyoming', '20070205 03:11:03.190', '20070601 17:01:54.810', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WBJI', N'Janelle Andrade', N'American Samoa - Arizona', '20090104 22:46:22.750', '20090912 13:34:14.970', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WCZ', N'Everett Humphrey', N'Haiti - New Jersey', '20080601 11:17:00.030', '20081114 21:32:04.240', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WDQ7', N'Tamiko Mendoza', N'Pakistan - New Jersey', '20090522 10:05:39.420', '20091028 03:22:32.740', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WDSK', N'Penny Flores', N'Greenland - Louisiana', '20070213 21:35:21.220', '20070404 12:24:27.140', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WJ0H', N'Alonzo Harvey', N'Trinidad - Illinois', '20080425 09:44:01.590', '20090217 22:30:24.160', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WJQK', N'Norman Flynn', N'Nepal - Louisiana', '20070529 15:05:31.900', '20080206 13:37:57.790', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WKEV', N'Ruben Brewer', N'Costa Rica - Louisiana', '20091118 15:41:24.960', '20091222 14:28:00.540', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WLDH', N'Nicole Barron', N'Bhutan - Nebraska', '20070228 12:03:45.140', '20070715 04:01:48.160', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WO5A', N'Monte Wagner', N'Syria - Montana', '20070307 08:08:01.240', '20070616 02:29:35.490', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WPE2', N'Israel Henry', N'Benin - Illinois', '20090316 10:22:57.220', '20091224 13:25:22.390', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WQGB', N'Neal Leon', N'Venezuela - Arkansas', '20081226 19:29:19.260', '20091018 14:31:30.020', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WRPG', NULL, NULL, '20070107 07:36:28.520', '20070108 19:08:17.930', 1, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WVA7', N'Victor Velez', N'Nauru - Minnesota', '20071024 01:08:54.890', '20080121 05:32:04.920', 1, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WVGR', N'Charles Brown', N'Niue - Wisconsin', '20071031 15:36:47.890', '20080620 22:30:44.560', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WXQO', N'Marissa Elliott', N'Gabon - Utah', '20070814 11:54:48.250', '20070914 16:45:51.680', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WYR2', N'Dean Carr', N'India - Maryland', '20090707 17:09:56.990', '20091013 15:58:01.460', 2, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WYVQ', N'Roberto Ali', N'Congo - Oklahoma', '20091109 16:39:33.980', '20100326 12:23:14.020', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'WZP5', N'Gregory Hicks', N'Nigeria - Wyoming', '20090323 23:13:09.850', '20090605 17:36:11.750', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X3BU', N'Aisha Snow', N'Myanmar - Wyoming', '20080801 12:47:17.020', '20090112 14:16:48.870', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X3E0', N'Doris Shannon', N'Switzerland - Vermont', '20090424 23:26:54.960', '20100108 03:34:40.050', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X3EY', N'Joshua Mccoy', N'Morocco - Rhode Island', '20071204 16:03:16.720', '20080802 00:19:41.650', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X5ZX', N'Nathaniel Mayo', N'Czech Republic - North Carolina', '20090521 00:50:47.340', '20091201 05:03:24.770', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X77K', N'Irma Wolfe', N'San Marino - Illinois', '20090920 17:17:24.110', '20100511 14:48:18.140', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X8DU', N'Brandie Barton', N'Sierra Leone - Ohio', '20070912 10:38:41.780', '20080319 18:19:36.190', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'X9W', N'Tom Harper', N'Vietnam - Rhode Island', '20080718 23:23:40.740', '20081226 00:25:08.110', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XA15', N'Paul Lloyd', N'Belarus - Colorado', '20071107 07:18:16.690', '20080211 10:45:07.530', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XCXJ', N'Austin Schmidt', N'Niger - Alabama', '20070114 03:20:59.130', '20070926 17:15:41.430', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XEYQ', N'Wendell Vaughan', N'Kiribati - California', '20080109 16:28:54.160', '20080725 16:22:57.430', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XGLY', N'Ebony Lowery', N'Oman - Massachusetts', '20080413 17:15:54.640', '20090112 07:42:39.600', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XIL2', N'Brad Rowe', N'Latvia - Maine', '20090902 18:37:30.940', '20100419 15:49:44.220', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XLTD', N'Edward Weiss', N'San Marino - Utah', '20090312 17:29:14.270', '20090707 03:21:19.110', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XOB1', N'Donovan Parrish', N'Niue - Virginia', '20080705 09:10:44.080', '20080811 07:53:05.880', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XOZW', N'Alejandro Garcia', N'Egypt - Alabama', '20081104 10:09:59.560', '20090205 16:55:37.730', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XQUJ', N'Rolando Hampton', N'Kazakhstan - Idaho', '20071009 16:46:19.800', '20071130 06:33:26.770', 1, NULL, NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XU92', N'Tia Merritt', N'San Marino - Wyoming', '20091207 14:56:20.440', '20100219 23:10:09.380', 2, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XUFO', N'Maureen Blevins', N'Uruguay - Mississippi', '20091205 10:13:53.670', '20100131 08:29:10.220', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XW0H', N'Janette Melton', N'Micronesia - Virginia', '20080822 17:11:07.810', '20090313 12:08:48.260', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XYD4', N'Andres Lloyd', N'Honduras - Oregon', '20090823 06:30:37.740', '20100605 02:54:20', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XZAK', N'Amy Sexton', N'Bhutan - Florida', '20090116 00:02:49.870', '20090820 17:41:40.390', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'XZI2', N'Beverly Peters', N'Argentina - Arizona', '20070908 10:58:07.800', '20080112 05:13:10.210', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y2NR', N'Arlene Leach', N'Hong Kong - Wyoming', '20090404 15:32:38.100', '20100104 22:48:07.480', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y36U', N'Isabel Juarez', N'Iran - Connecticut', '20071208 23:52:45.880', '20071224 10:06:43.990', 2, N'N', NULL, NULL)
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y3DN', N'Sonja Mccoy', N'Cuba - Nevada', '20070316 13:07:16.080', '20071015 03:00:34.430', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y5QL', N'Cristina Orr', N'Iceland - Missouri', '20070909 13:54:57.620', '20070912 10:32:51.800', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y64K', N'Levi Chaney', N'Monaco - California', '20070720 08:29:49.740', '20071212 23:10:10.650', 2, N'F', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y7UB', N'Kristine Kemp', N'Japan - North Dakota', '20090902 16:39:53.500', '20100109 02:23:54.220', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Y7X7', N'Philip Simpson', N'Croatia - Indiana', '20070319 17:38:17.290', '20071128 12:59:15.700', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YCRI', N'Kate Mc Bride', N'Pitcairn - Maine', '20091013 00:21:48.100', '20091023 13:51:49.640', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YDM2', N'Nancy Ayers', N'Kazakhstan - Ohio', '20070824 11:54:52.090', '20071106 18:20:43.490', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YEA', N'Linda Chang', N'Niger - Rhode Island', '20080616 04:40:54.840', '20081114 14:24:01.110', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YHOI', N'Garry Morse', N'Tajikistan - California', '20070112 05:29:50.330', '20070520 08:42:12.930', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YIXM', N'Jeffery Nielsen', N'Monaco - Kansas', '20080510 22:49:48.660', '20081215 03:57:53.560', 1, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YKH5', N'Felix Underwood', N'Saint Lucia - Nevada', '20090731 09:45:15.060', '20090831 08:56:02.370', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YKKF', N'Whitney Bradford', N'Aruba - North Carolina', '20091222 02:12:22.180', '20100828 14:50:26.640', 2, N'N', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YLLN', N'Krista Bonilla', N'Martinique - Michigan', '20090628 04:04:20.590', '20091223 09:17:14.260', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YLNN', N'Dianna Horn', N'Kazakhstan - South Dakota', '20080411 16:36:58.540', '20080822 11:59:50.850', 1, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YMTI', N'Grace Choi', N'Sierra Leone - Tennessee', '20090517 15:44:55.760', '20091205 23:11:29.890', 2, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YRN6', N'Kevin Barker', N'Cape Verde - Nevada', '20090305 06:35:08.460', '20091222 08:02:52.650', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YSJP', N'Joy Boyd', N'Lithuania - North Carolina', '20070321 01:22:40.830', '20070412 07:16:11.050', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YTKS', N'Carolyn Blackwell', N'Tuvalu - Iowa', '20080310 14:13:04.320', '20081205 03:56:23.220', 1, N'N', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YUGA', N'Dorothy Evans', N'Bulgaria - South Carolina', '20080904 12:38:06.480', '20090125 07:04:28.630', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YVD7', N'Shaun Hess', N'Aruba - Nevada', '20070327 10:17:33.760', '20080115 07:07:13.880', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YVSA', N'Carrie Chandler', N'Gambia - New Jersey', '20080122 01:16:10.940', '20081001 04:25:30.270', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YVSM', N'Jeannette Crawford', N'Myanmar - Wisconsin', '20090908 04:03:40.140', '20091001 20:51:52.550', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YWD1', N'Saul Anthony', N'Nigeria - Hawaii', '20081101 06:12:39.300', '20090807 14:57:58.660', 1, N'F', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YXPU', N'Teri Schneider', N'Saint Helena - Texas', '20070114 00:34:18.450', '20071018 05:46:37.870', 2, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YXWB', N'Francisco Mata', N'Romania - Maine', '20080822 05:57:24.480', '20090222 19:27:18.550', 2, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YXYE', N'Keri Scott', N'Jordan - Montana', '20070224 05:13:02.300', '20071027 09:07:34.620', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YY7W', N'Catherine Carr', N'Cuba - New Jersey', '20090717 04:04:57.630', '20091124 12:52:38.750', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YYYV', N'Shannon Church', N'Tunisia - Vermont', '20090407 14:49:55.320', '20090512 22:20:05.180', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YZLJ', N'Marjorie Mendez', N'Costa Rica - Florida', '20080805 13:46:09.100', '20090514 21:55:54.650', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'YZOV', N'Ramona Luna', N'Costa Rica - Utah', '20070820 15:05:18.980', '20071022 23:03:18.070', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z0CS', N'Tracey Terrell', N'Aruba - South Carolina', '20090609 06:31:12.020', '20091031 08:40:59.010', 1, N'F', NULL, N'Marine')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z0IT', N'Rachael Rivera', N'Isle of Man - New Jersey', '20090421 06:33:19.590', '20091023 20:42:31.280', 1, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z0ZN', N'Abigail Norman', N'Iraq - Hawaii', '20090707 16:31:46.520', '20100315 02:41:00.130', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z1HU', N'Michele Hill', N'Saint Lucia - Montana', '20070126 00:26:17.350', '20071103 04:22:06.110', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z2TG', N'Jessie Mc Millan', N'Gibraltar - Oklahoma', '20080122 11:54:45.960', '20080126 07:57:40.900', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z381', N'Nick Cannon', N'American Samoa - Tennessee', '20070321 13:45:21.040', '20071211 04:57:43.870', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z5Y4', N'Orlando Leon', N'Gibraltar - Minnesota', '20071018 12:27:40.860', '20071212 15:45:41.330', 1, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z656', N'Alfonso Terry', N'Togo - North Carolina', '20091125 16:39:42.380', '20100428 07:30:08.720', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z6NA', N'Tasha Miles', N'Swaziland - South Dakota', '20091031 21:53:45', '20100316 01:15:16.780', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z701', N'Jared Brewer', N'Slovakia - Florida', '20091105 04:37:08.390', '20091112 08:37:51.490', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z954', N'Jermaine Bright', N'Mauritius - Idaho', '20071103 09:55:06.200', '20071129 13:02:22.930', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'Z9QY', N'Amanda Trevino', N'Greece - Oklahoma', '20070724 16:53:37.950', '20071210 21:55:49.850', 2, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZCZL', N'Cheri Mckenzie', N'South Africa - Hawaii', '20070206 10:08:37.680', '20070502 15:24:42.530', 2, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZESQ', N'Kelley Glass', N'Swaziland - California', '20080629 13:53:27.470', '20090418 05:10:28.440', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZF0L', N'Sabrina Nichols', N'Afghanistan - Michigan', '20091007 09:13:14.110', '20100320 13:23:36.220', 1, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZF3K', N'Rafael Short', N'Comoros - Vermont', '20081114 23:23:26.320', '20090122 02:26:56.020', 2, N'N', NULL, N'Power')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZIZV', N'Donovan Marks', N'French Guiana - Georgia', '20080808 21:56:10.720', '20081207 05:11:19.730', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZKBR', N'Gabrielle Bradshaw', N'Romania - Maryland', '20081207 08:22:36.990', '20090224 02:08:04.350', 2, N'N', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZKU', N'Carl Lucero', N'Seychelles - New York', '20090621 22:22:57.160', '20090903 13:26:47.930', 2, N'N', NULL, N'Automotive')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZL1O', N'Dwight Shaffer', N'Pakistan - New Hampshire', '20070125 05:17:01.010', '20070804 06:49:25.260', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZMFO', N'Fred Callahan', N'Paraguay - New York', '20091030 06:16:40.470', '20100518 05:43:58.890', 1, N'F', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZNIZ', N'Jay Robertson', N'Bahamas - Tennessee', '20090327 20:11:28.230', '20091223 15:12:20.580', 1, N'N', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZNUE', N'John Fernandez', N'Saint Helena - Maine', '20070128 09:13:18.310', '20070218 15:16:49.360', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZQNW', N'Diana Glenn', N'Costa Rica - Pennsylvania', '20080330 22:42:43.020', '20090112 04:21:25.960', 1, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZSV5', N'Elaine Mueller', N'Bahamas - Kentucky', '20080828 21:18:13.790', '20081206 03:20:40.630', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZU6I', N'Katrina Hale', N'Samoa - North Dakota', '20090811 08:36:55.750', '20091112 00:54:42.430', 2, N'N', NULL, N'Airports')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZU8B', N'Tabatha Lucero', N'Comoros - South Carolina', '20090531 03:02:49.720', '20090705 06:04:23.880', 1, N'F', NULL, N'Chemicals')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZVU2', N'Holly Mac Donald', N'Cape Verde - New York', '20080220 22:20:00.610', '20080913 20:16:04.730', 2, N'F', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZX3S', N'Amie Burton', N'Trinidad - Minnesota', '20070416 11:22:14.740', '20070809 10:20:22.500', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZXU', N'Earnest Weiss', N'Panama - Nebraska', '20070924 09:30:20.710', '20080614 18:12:34.580', 2, N'F', NULL, N'Environment')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZY6O', N'Earl Peterson', N'Morocco - Massachusetts', '20070530 03:53:38.660', '20070715 05:47:03.970', 1, N'F', NULL, N'Water')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZYJ5', N'Ivan Padilla', N'Puerto Rico - North Carolina', '20070524 13:45:36.850', '20071012 23:23:52.880', 2, N'N', NULL, N'Mining')
GO

INSERT INTO [dbo].[KhachHang_Jade] ([MaKH], [TenKH], [DiaChi], [NgayTao], [NgayCapNhat], [TrangThai], [GioiTinh], [SoThich], [NgheNghiep])
VALUES 
  (N'ZYTB', N'Bennie Malone', N'Ecuador - California', '20071007 11:39:03.750', '20080514 19:03:24.400', 1, N'F', NULL, N'Environment')
GO

--
-- Data for table dbo.sysdiagrams  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[sysdiagrams] ON
GO

INSERT INTO [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition])
VALUES 
  (N'Diagram_0', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF0A000000FEFFFFFF0400000005000000060000000700000008000000090000000B000000FEFFFFFF0C0000000D0000000E0000000F00000010000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF0200000000000000000000000000000000000000000000000000000000000000302CD48D3912CC0103000000C0180000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000012030000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000D0000009209000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000340000005F000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C000000FEFFFFFF0E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F00000030000000310000003200000033000000FEFFFFFF35000000FEFFFFFF3700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F000000500000005100000052000000530000005400000055000000FEFFFFFFFEFFFFFF58000000590000005A0000005B0000005C0000005D0000005E0000005F0000006000000061000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000430000A1E100C05000080070000000F00FFFF07000000007D000040670000B3400000367F0000186100000000000061F3FFFFDE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C07000000200200000087010000003C00A50900000700008001000000B602000000800000120000805363684772696400903300007CFCFFFF43686954696574486F61446F6E5F4A616465000000003400A50900000700008002000000A8020000008000000B00008053636847726964007206000000000000486F61446F6E5F4A6164650000008800A5090000070000800300000052000000018000005F000080436F6E74726F6C00DC290000FFFEFFFF52656C6174696F6E736869702027464B5F43686954696574486F61446F6E5F4A6164655F486F61446F6E5F4A61646527206265747765656E2027486F61446F6E5F4A6164652720616E64202743686954696574486F61446F6E5F4A616465270000002800B50100000700008004000000310000007500000002800000436F6E74726F6C00C32400008FFEFFFF00003800A50900000700008005000000AE020000008000000E0000805363684772696400000000008A1B00004B6861636848616E675F4A616465000000008000A50900000700008006000000520000000180000057000080436F6E74726F6C00F5080000E713000052656C6174696F6E736869702027464B5F486F61446F6E5F4A6164655F4B6861636848616E675F4A61646527206265747765656E20274B6861636848616E675F4A6164652720616E642027486F61446F6E5F4A616465270000002800B50100000700008007000000310000006D00000002800000436F6E74726F6C0043F6FFFF7918000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000214334120800000096240000A2160000785634120700000014010000430068006900540069006500740048006F00610044006F006E005F004A0061006400650000006E003D0032002E0030002E0030002E0030002C002000430075006C0074007500720065003D006E00650075007400720061006C002C0020005000750062006C00690063004B006500790054006F006B0065006E003D00620037003700610035006300350036003100390033003400650030003800390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000096240000A2160000000000002D010000080000000C000000070000001C010000BC07000054060000D0020000840300007602000038040000460500002A03000046050000AE060000920400000000000001000000151500006612000000000000060000000600000002000000020000001C010000AB0900000000000001000000C71100001008000000000000020000000200000002000000020000001C010000BC0700000100000000000000C7110000ED03000000000000000000000000000002000000020000001C010000BC0700000000000000000000072C0000DE20000000000000000000000D00000004000000040000001C010000BC07000024090000A005000078563412040000006E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000013000000430068006900540069006500740048006F00610044006F006E005F004A006100640065000000214334120800000096240000A216000078563412070000001401000048006F00610044006F006E005F004A006100640065000000140000000000000001000000C5ADB97A00000080F0009B74000000000000000000000000C6A2B97AF0670080FE009B74389F9B7440A29B7428A29B740CA39B7440A39B742CA39B740000000000000000000000000000000000000000000000000000000000010000140000000000000001000000D8ADB97A00000080FE009B7400000000000000000000000000002B0B50B92F0BB4ADB97A389F008001019B7428A29B740CA39B7440A39B742CA39B740000000000000000000000000000000000000000000000000000000010010000140000000000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000096240000A2160000000000002D010000080000000C000000070000001C010000BC07000054060000D0020000840300007602000038040000460500002A03000046050000AE060000920400000000000001000000151500006612000000000000060000000600000002000000020000001C010000AB0900000000000001000000C71100001008000000000000020000000200000002000000020000001C010000BC0700000100000000000000C7110000ED03000000000000000000000000000002000000020000001C010000BC0700000000000000000000072C0000DE20000000000000000000000D00000004000000040000001C010000BC07000024090000A005000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C00000048006F00610044006F006E005F004A00610064006500000002000B00082B00009600000090330000960000000000000002000000F0F0F00001000000000000000000000000000000010000000400000000000000C32400008FFEFFFF8415000058010000300000000100000200008415000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61210046004B005F00430068006900540069006500740048006F00610044006F006E005F004A006100640065005F0048006F00610044006F006E005F004A00610064006500214334120800000096240000FA1A00007856341207000000140100004B006800610063006800480061006E0067005F004A006100640065000000B97A00000080450100000000000072A1B97A000000805201000000000000100100001400000000000000010000000627F67E000000802D019B7400000000000000000000000000002B0B68F32E0BA8A29B74389F9B7440A29B7428A29B740CA39B7440A39B742CA39B740000000000000000000000000000000000000000000000000000000063AEB97A140000805601B97A010000805801B97A0000008006015468616E6700000000000000000000002B0B78F42E0BA8A29B74389F9B7440A29B7428A29B740CA39B7440A39B742CA3000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000096240000FA1A0000000000002D0100000A0000000C000000070000001C010000BC07000054060000D0020000840300007602000038040000460500002A03000046050000AE06000092040000000000000100000015150000BD16000000000000080000000800000002000000020000001C010000AB0900000000000001000000C7110000FF05000000000000010000000100000002000000020000001C010000BC0700000100000000000000C7110000ED03000000000000000000000000000002000000020000001C010000BC0700000000000000000000072C0000DE20000000000000000000000D00000004000000040000001C010000BC07000024090000A005000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F0000004B006800610063006800480061006E0067005F004A00610064006500000002000B008C0A00008A1B00008C0A0000A21600000000000002000000F0F0F0000100000000000000000000000000000001000000070000000000000043F6FFFF791800009A13000058010000300000000100000200009A13000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F0048006F00610044006F006E005F004A006100640065005F004B006800610063006800480061006E0067005F004A00610064006500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B2710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000000000000061F3FFFF0100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E0000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000100000001000000000000000000000000000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000036000000F40700000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000560000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000057000000AC0200000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000620000001200000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003600320030002C0035002C0031003000380030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003400370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003900380030002C00310032002C0032003300340030002C00310031002C0031003400340030000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003600320030002C0035002C0031003000380030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003400370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003900380030002C00310032002C0032003300340030002C00310031002C0031003400340030000000030000000300000000000000540000000100000001000000640062006F00000046004B005F00430068006900540069006500740048006F00610044006F006E005F004A006100640065005F0048006F00610044006F006E005F004A0061006400650000000000000000000000C40200000000040000000400000003000000080000000100000078DB450E0000000000000000AD070000000000050000000500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003600320030002C0035002C0031003000380030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003400370035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0031003900380030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0031003900380030002C00310032002C0032003300340030002C00310031002C00310034003400300000000600000006000000000000004C00000001FF4D5501000000640062006F00000046004B005F0048006F00610044006F006E005F004A006100640065005F004B006800610063006800480061006E0067005F004A0061006400650000000000000000000000C40200000000070000000700000006000000080000000100000038DC450E0000000000000000AD0700000000000A0000000300000002000000010000007B00000086000000060000000500000002000000220000000D000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F5739000002006030D28D3912CC01020200001048450000000000000000000000000000000000580100004400610074006100200053006F0075007200630065003D004C004F004E0047002D00500043003B0049006E0069007400690061006C00200043006100740061006C006F0067003D004A006100640065003B0049006E00740065006700720061007400650064002000530065006300750072006900740079003D0054007200750065003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0030000000000226001E0000004B006800610063006800480061006E0067005F004A00610064006500000008000000640062006F000000000226001800000048006F00610044006F006E005F004A00610064006500000008000000640062006F0000000002240026000000430068006900540069006500740048006F00610044006F006E005F004A00610064006500000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00390031003500310030003600300038002D0038003800300039002D0034003000320030002D0038003800390037002D004600420041003000350037004500320032004400350034007D0000000000000000000000000000000000000000000000010003000000000000000C0000000B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
GO

SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
GO

--
-- Definition for indices : 
--

ALTER TABLE [dbo].[KhachHang_Jade]
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

ALTER TABLE [dbo].[KhachHang_Jade]
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

ALTER TABLE [dbo].[KhachHang_Jade]
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

