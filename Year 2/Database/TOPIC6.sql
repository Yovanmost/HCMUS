use master
go
use QLDETAI
go

-- Q58. Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.
SELECT GV.HOTEN
FROM GIAOVIEN GV, THAMGIADT TG, DETAI DT, CHUDE CD
WHERE GV.MAGV = TG.MAGV AND TG.MADT = DT.MADT AND DT.MACD = CD.MACD
GROUP BY GV.HOTEN
HAVING COUNT(CD.MACD) = (SELECT COUNT(*)
							FROM CHUDE CD)

-- Q59. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn HTTT tham gia.
SELECT DT.TENDT
FROM DETAI DT, GIAOVIEN GV, THAMGIADT TG
WHERE TG.MAGV = GV.MAGV AND TG.MADT = DT.MADT AND GV.MABM = 'HTTT'
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT GV.MAGV) = (SELECT COUNT(*)
							FROM GIAOVIEN GV
							WHERE GV.MABM = 'HTTT')

-- Q60. Cho biết tên đề tài có tất cả giảng viên bộ môn “Hệ thống thông tin” tham gia
SELECT DT.TENDT
FROM DETAI DT, GIAOVIEN GV, THAMGIADT TG, BOMON BM
WHERE TG.MAGV = GV.MAGV AND TG.MADT = DT.MADT AND GV.MABM = BM.MABM AND BM.TENBM = N'Hệ thống thông tin'
GROUP BY DT.TENDT, BM.MABM, BM.TENBM
HAVING COUNT(DISTINCT GV.MAGV) = (SELECT COUNT(*)
							FROM GIAOVIEN GV
							WHERE GV.MABM = BM.MABM
									AND BM.TENBM = N'Hệ thống thông tin')

-- Q61. Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD.
SELECT GV.*
FROM GIAOVIEN GV, THAMGIADT TG
WHERE NOT EXISTS(SELECT MADT 
					FROM DETAI DT, CHUDE CD
					WHERE CD.MACD = DT.MACD AND CD.MACD = 'QLGD'
					EXCEPT
					SELECT TG.MADT
					FROM THAMGIADT TG
					WHERE TG.MAGV = GV.MAGV)


-- Q62. Cho biết tên giáo viên nào tham gia tất cả các đề tài mà giáo viên Trần Trà Hương đã tham gia.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV, THAMGIADT TG
WHERE NOT EXISTS(SELECT MADT
					FROM THAMGIADT TG, GIAOVIEN GV2
					WHERE TG.MAGV = GV2.MAGV AND GV2.HOTEN = N'Trần Trà Hương'
					EXCEPT
					SELECT TG.MADT
					FROM THAMGIADT TG
					WHERE TG.MAGV = GV.MAGV)

-- Q63. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn Hóa Hữu Cơ tham gia.
SELECT DISTINCT DT.TENDT
FROM DETAI DT, THAMGIADT TG
WHERE NOT EXISTS(SELECT MAGV
					FROM GIAOVIEN GV, BOMON BM
					WHERE GV.MABM = BM.MABM AND BM.TENBM = N'Hóa Hữu Cơ'
					EXCEPT
					SELECT MAGV
					FROM GIAOVIEN GV
					WHERE GV.MAGV = TG.MAGV AND TG.MADT = DT.MADT)
		AND EXISTS(SELECT MAGV
					FROM GIAOVIEN GV, BOMON BM
					WHERE GV.MABM = BM.MABM AND BM.TENBM = N'Hóa Hữu Cơ')



-- Q64. Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài 006.

-- Q65. Cho biết giáo viên nào đã tham gia tất cả các đề tài của chủ đề Ứng dụng công nghệ.

-- Q66. Cho biết tên giáo viên nào đã tham gia tất cả các đề tài của do Trần Trà Hương làm chủ nhiệm.

-- Q67. Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa CNTT tham gia.

-- Q68. Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài Nghiên cứu tế bào gốc.

-- Q69. Tìm tên các giáo viên được phân công làm tất cả các đề tài có kinh phí trên 100 triệu?

-- Q70. Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa Sinh Học tham gia.

-- Q71. Cho biết mã số, họ tên, ngày sinh của giáo viên tham gia tất cả các công việc của đề tài “Ứng dụng hóa học xanh”.

-- Q72. Cho biết mã số, họ tên, tên bộ môn và tên người quản lý chuyên môn của giáo viên tham gia tất cả các đề tài thuộc chủ đề “Nghiên cứu phát triển”.