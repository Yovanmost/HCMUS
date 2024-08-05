use master
go
use QLDETAI
go

----function
--1. viết hàm truyền vào mã gv tính số đề tài tham gia

CREATE OR ALTER FUNCTION F_COUNT_DETAI (@MAGV CHAR(3))
RETURNS INT
AS 
BEGIN
	DECLARE @CNT INT
	SET @CNT = (SELECT COUNT(*)
				FROM THAMGIADT TG
				WHERE TG.MAGV = @MAGV
				GROUP BY TG.MAGV)
	RETURN @CNT
END

PRINT dbo.F_COUNT_DETAI('001')


--2. viết hàm truyền vào madt tính số công việc chưa hoàn thành

CREATE OR ALTER FUNCTION F_COUNT_CV_CHUA_XONG (@MADT CHAR(3))
RETURNS INT
AS 
BEGIN
	DECLARE @CNT INT
	SET @CNT = (SELECT COUNT(*)
				FROM CONGVIEC CV
				WHERE CV.MADT = @MADT AND CV.NGAYKT IS NULL
				GROUP BY CV.MADT)
	RETURN @CNT
END

PRINT dbo.F_COUNT_DETAI('001')

--3. viết hàm truyền vào madt tính số công việc đã hoàn thành

CREATE OR ALTER FUNCTION F_COUNT_CV_DA_XONG (@MADT CHAR(3))
RETURNS INT
AS 
BEGIN
	DECLARE @CNT INT
	SET @CNT = (SELECT COUNT(*)
				FROM CONGVIEC CV
				WHERE CV.MADT = @MADT AND CV.NGAYKT IS NOT NULL
				GROUP BY CV.MADT)
	RETURN @CNT
END

PRINT dbo.F_COUNT_CV_DA_XONG('001')


--4. viết hàm truyền vào madt xuất danh sách công việc trong đề tài 
-- (stt, tencv,số giáo viên tham gia, tổng phục cấp)

CREATE OR ALTER FUNCTION F_PRINT_CV_OF_DT (@MADT CHAR(3))
RETURNS TABLE
AS 
RETURN (
	SELECT CV.SOTT, CV.TENCV, ISNULL(COUNT(TG.MAGV), 0) AS SLGV, ISNULL(SUM(TG.PHUCAP), 0) AS TONG_PHU_CAP
	FROM CONGVIEC CV
		LEFT JOIN THAMGIADT TG ON TG.MADT = CV.MADT AND TG.STT = CV.SOTT
	WHERE CV.MADT = @MADT
	GROUP BY SOTT, TENCV
)

SELECT * FROM dbo.F_PRINT_CV_OF_DT('001')


--5. Viết hàm truyền vào MaGV tính số đề tài tham gia

CREATE OR ALTER FUNCTION F_COUNT_DT (@MAGV CHAR(3))
RETURNS INT
AS 
BEGIN
	DECLARE @CNT INT
	SET @CNT = (SELECT COUNT(*)
				FROM THAMGIADT TG
				WHERE TG.MAGV = @MAGV
				GROUP BY TG.MAGV)
	RETURN @CNT
END

--6. Viết hàm truyền vào magv xuất danh sách đề tài tham gia

CREATE OR ALTER FUNCTION F_PRINT_LIST_DETAI (@MAGV CHAR(3))
RETURNS TABLE
AS 
RETURN (
	SELECT DISTINCT DT.TENDT
	FROM THAMGIADT TG
		JOIN DETAI DT ON DT.MADT = TG.MADT
	WHERE TG.MAGV = @MAGV
)

SELECT * FROM dbo.F_PRINT_LIST_DETAI('001')

--1. VIẾT THỦ TỤC THÊM ĐỀ TÀI
--INPUT: CÁC THUỘC TÍNH CỦA ĐỀ TÀI
--OUTPUT: 1 -> NẾU THÊM KO ĐC, 0 -> THÊM ĐƯỢC
--ĐIỀU KIỆN:
---> MÃ ĐỀ TÀI KHÔNG ĐƯỢC TRÙNG
---> TÊN ĐỀ TÀI KHÔNG RỖNG
---> GIÁO VIÊN CHỦ NHIỆM PHẢI LÀ GIÁO VIÊN TRÊN 35 TUỔI
---> KINH PHÍ CỦA ĐỀ TÀI CẤP TRƯỜNG < 100; ĐHQG < 1000
---> NGÀY BẮT ĐẦU < NGÀY KẾT THÚC

CREATE OR ALTER PROCEDURE P_ADD_DT @MADT CHAR(3), @TENDT NVARCHAR(150), @CAPQL NVARCHAR(10), @KINHPHI DECIMAL(10,1), 
								   @NGAYBD DATE, @NGAYKT DATE, @MACD NCHAR(4), @GVCNDT CHAR(3),
								   @CAN_ADD INT OUT
AS
	BEGIN 
		-- Kiểm tra mã đề tài trùng
		IF (EXISTS (SELECT * FROM DETAI WHERE MaDT = @MaDT))
		BEGIN
			SET @CAN_ADD = 1
			PRINT @CAN_ADD -- Mã đề tài trùng
			RETURN
		END
    
		-- Kiểm tra tên đề tài không rỗng
		IF (@TenDT IS NULL OR @TenDT = '')
		BEGIN
			SET @CAN_ADD = 1
			PRINT @CAN_ADD -- Tên đề tài rỗng
			RETURN
		END
    
		-- Kiểm tra giáo viên chủ nhiệm trên 35 tuổi
		IF (NOT EXISTS (SELECT * FROM GIAOVIEN GV WHERE MaGV = @GVCNDT AND DATEDIFF(YEAR, GV.NGSINH, GETDATE()) > 35))
		BEGIN
			SET @CAN_ADD = 1
			PRINT @CAN_ADD -- Giáo viên chủ nhiệm không đủ điều kiện
			RETURN
		END
    
		-- Kiểm tra kinh phí   
		IF ((@CAPQL = 'TRUONG' AND @KINHPHI >= 100) OR (@CAPQL= 'DHQG' AND @KINHPHI >= 1000))
		BEGIN
			SET @CAN_ADD = 1
			PRINT @CAN_ADD -- Kinh phí không hợp lệ
			RETURN
		END
    
		-- Kiểm tra ngày bắt đầu và ngày kết thúc
		IF (@NgayBD >= @NgayKT)
		BEGIN
			SET @CAN_ADD = 1
			PRINT @CAN_ADD -- Ngày bắt đầu không hợp lệ
			RETURN
		END
    
		-- Thêm đề tài
		INSERT INTO DETAI (MADT, TENDT, NGAYBD, NGAYKT,KINHPHI, GVCNDT)
		VALUES (@MADT, @TENDT, @NGAYBD, @NGAYKT, @KINHPHI, @GVCNDT)
 

		SET @CAN_ADD = 0
		PRINT @CAN_ADD  -- Thêm thành công
	END

--2. VIẾT THỦ TỤC XÓA ĐỀ TÀI CHƯA CÓ GIÁO VIÊN THAM GIA
--INPUT: MÃ ĐT
--OUTPUT: XÓA THÀNH CÔNG HAY KHÔNG
--ĐIỀU KIỆN:
---> ĐỀ TÀI ĐÃ KẾT THÚC VÀ KHÔNG CÓ NGƯỜI THAM GIA
---> ĐỀ TÀI KHÔNG CÓ CHỦ NHIỆM

CREATE OR ALTER PROCEDURE P_DELETE_DT @MADT NCHAR(3)
AS
BEGIN
    -- Kiểm tra điều kiện xóa đề tài
    IF (EXISTS (SELECT * 
				FROM DETAI DT 
				WHERE DT.MADT = @MADT 
					AND (DT.NGAYKT < GETDATE() -- kết thúc đề tài
						 AND NOT EXISTS (SELECT *
										 FROM THAMGIADT TG 
										 WHERE TG.MADT = @MADT)) -- không có ai tham gia
					OR DT.GVCNDT IS NULL)) -- không có chủ nhiệm
		BEGIN
			DELETE FROM DETAI WHERE MADT = @MaDT
			PRINT 'Xóa thành công';
		END

    ELSE
        PRINT 'Không thể xóa đề tài';
END

--3. VIẾT THỦ TỤC GIA HẠN ĐỀ TÀI
--INPUT: MADT, NGAYKT
--OUTPUT: GIA HẠN THÀNH CÔNG KHÔNG
--ĐIỀU KIỆN
---> ĐỀ TÀI TỒN TẠI
---> ĐỀ TÀI ĐÃ BẮT ĐẦU VÀ CHƯA KẾT THÚC
---> ĐỀ TÀI ĐÃ CÓ ÍT NHẤT 1 GIÁO VIÊN THAM GIA

CREATE OR ALTER PROCEDURE P_GiaHan_DT @MADT NCHAR(3), @NGAYKT DATE
AS
BEGIN
    -- Kiểm tra đề tài tồn tại và điều kiện gia hạn
    IF (EXISTS (SELECT * 
				FROM DETAI DT 
				WHERE DT.MADT = @MaDT 
					AND (DT.NGAYBD < GETDATE() OR DT.NGAYBD IS NOT NULL) -- đã bắt đầu
					AND (DT.NGAYKT > GETDATE() OR DT.NGAYKT IS NULL) -- chưa kết thúc
					AND EXISTS (SELECT * 
								FROM THAMGIADT TG 
								WHERE TG.MADT = @MADT))) -- có giáo viên tham gia
		BEGIN
			UPDATE DETAI
			SET NGAYKT = @NGAYKT
			WHERE MADT = @MADT
			PRINT 'Gia hạn thành công';
		END
    
	ELSE
        PRINT 'Không thể gia hạn đề tài';

END

--4. VIẾT THỦ TỤC IN THÔNG TIN THỐNG KÊ SAU
--INPUT: MAGV
--MẪU THỐNG KÊ
---> MÃ GV:
---> HỌ TÊN:
---> TÊN BM:
---> SỐ ĐỀ TÀI THAM GIA:
---> DANH SÁCH ĐỀ TÀI THAM GIA
---	 MADT	TENDT	PHUCAP	KETQUA
------------------------------------

CREATE OR ALTER PROCEDURE P_ThongKe_GV @MAGV NCHAR(3)
AS
BEGIN
    SELECT @MAGV AS [Mã GV], 
           GV.HoTen, 
           BM.TENBM, 
           (SELECT COUNT(*) 
			FROM THAMGIADT TG 
			WHERE TG.MAGV = @MAGV) AS SoDeTaiThamGia
    FROM GIAOVIEN GV
		JOIN BOMON BM ON GV.MABM = BM.MABM
    WHERE GV.MAGV = @MAGV

	SELECT DT.MADT, DT.TENDT, TG.PHUCAP, TG.KETQUA 
	FROM DETAI DT
		JOIN THAMGIADT TG ON TG.MADT = DT.MADT AND TG.MAGV = @MAGV
END

EXEC DBO.P_ThongKe_GV '003'

--5. VIẾT THỦ TỤC IN THÔNG TIN THỐNG KÊ SAU
--INPUT: MADT
--MẪU THỐNG KÊ
--> MADT:
--> TÊN DT:
--> TÊN GVCN:
--> SỐ CÔNG VIỆC HOÀN THÀNH:
--> SỐ CÔNG VIỆC CHƯA HOÀN THÀNH:
--> DANH SÁCH CÔNG VIỆC TRONG ĐỀ TÀI
----STT	TÊN CV	SỐGVTG	TỔNGPHUCAP

CREATE OR ALTER PROCEDURE P_ThongKeTheoDeTai @MADT NCHAR(3)
AS
BEGIN
    SELECT @MADT,
           DT.TENDT,
           GV.HOTEN AS GVCNDT,

           (SELECT DISTINCT COUNT(*) 
		    FROM CONGVIEC CV
			WHERE CV.MADT = @MaDT AND (CV.NGAYKT < GETDATE() OR CV.NGAYKT IS NOT NULL)) AS SoCongViecHoanThanh,

           (SELECT DISTINCT COUNT(*) 
		    FROM CONGVIEC CV
			WHERE MaDT = @MaDT AND (CV.NGAYKT > GETDATE() OR CV.NGAYKT IS NULL)) AS SoCongViecChuaHoanThanh
    FROM DETAI DT
		LEFT JOIN GIAOVIEN GV ON DT.GVCNDT = GV.MAGV -- có thể ko có gvcndt -> left join
    WHERE DT.MADT = @MADT

	SELECT CV.SOTT, CV.TENCV, ISNULL(COUNT(TG.MAGV), 0) AS SLGV, ISNULL(SUM(TG.PHUCAP), 0) AS TONG_PHU_CAP
	FROM CONGVIEC CV
		LEFT JOIN THAMGIADT TG ON TG.MADT = CV.MADT AND TG.STT = CV.SOTT
	WHERE CV.MADT = @MADT
	GROUP BY SOTT, TENCV

END

EXEC DBO.P_ThongKeTheoDeTai '002'

declare @i int = 1, @n int = (select count(*) from GIAOVIEN)
declare @magv varchar(10),@hoten nvarchar(50),@luong int

while @i<= @n
begin
	select @magv= magv,@hoten = isnull(hoten, '-'), @luong = isnull(luong,0)
	from 	(select ROW_NUMBER() OVER (ORDER BY magv) stt, magv,hoten, luong
			from GIAOVIEN) gv
	where  gv.stt = @i
	
	print cast(@i as char(5))  + @magv + space(5) + @hoten + space(20 - len(@hoten)) + cast(@luong as varchar(10))
	set @i = @i + 1
end
