--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):

--Cau 2
SELECT *
FROM SANPHAM ,KHACHHANG
GO

--Cau 3
SELECT MASP,TENSP,GIA,NUOCSX
FROM SANPHAM
WHERE NUOCSX = N'Thai Lan'
UPDATE SANPHAM SET GIA =GIA+GIA/(100/5)
GO

--Cau 4
SELECT MASP,TENSP,GIA,NUOCSX
FROM SANPHAM
WHERE NUOCSX =N'Trung Quoc' AND GIA >10000
UPDATE SANPHAM SET GIA=GIA/(100/5)+GIA
GO

--Cau 5
DECLARE @VIP TINYINT
SELECT *
FROM KHACHHANG
UPDATE KHACHHANG SET LOAIKH = @VIP 
WHERE (NGDK < cast('2011/1/1' as date) AND DOANHSO>=10000000) 
OR (NGDK > cast('2011/1/1' as date) AND DOANHSO >=2000000)
GO

--III. Ngôn ngữ truy vấn dữ liệu có cấu trúc:
--CAU 1
SELECT MASP,TENSP
FROM  SANPHAM
WHERE NUOCSX='TRUNG QUOC'
GO

--CAU 2
SELECT MASP,TENSP
FROM  SANPHAM
WHERE DVT='CAY' OR DVT='QUYEN'
GO
--CAU 3
SELECT MASP,TENSP
FROM  SANPHAM
WHERE MASP LIKE 'B%01'
GO

--CAU 4
SELECT MASP,TENSP
FROM  SANPHAM
WHERE NUOCSX='TRUNG QUOC' AND GIA BETWEEN 30000 AND 40000
GO

--CAU 5
SELECT MASP,TENSP
FROM  SANPHAM
WHERE (NUOCSX='TRUNG QUOC' OR NUOCSX='THAI LAN') AND GIA BETWEEN 30000 AND 40000
GO

--CAU 6
SELECT SOHD,TRIGIA
FROM  HOADON
WHERE NGHD='1/1/2007' OR NGHD='2/1/2007'
GO

--CAU 7
SELECT SOHD,TRIGIA
FROM  HOADON
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007
ORDER BY  NGHD ASC,TRIGIA DESC
GO

--CAU 8
SELECT A.MAKH,HOTEN
FROM  HOADON A, KHACHHANG B
WHERE A.MAKH=B.MAKH AND NGHD='1/1/2007'
GO

--CAU 9
SELECT SOHD,TRIGIA
FROM  HOADON A, NHANVIEN B
WHERE A.MANV=B.MANV AND NGHD='28/10/2006' AND HOTEN='NGUYEN VAN B'
GO

--CAU 10
SELECT C.MASP, TENSP
FROM  HOADON A, KHACHHANG B, CTHD C, SANPHAM D
WHERE A.MAKH=B.MAKH AND A.SOHD=C.SOHD AND C.MASP=D.MASP AND
  MONTH(NGHD)=10 AND YEAR(NGHD)=2006 AND HOTEN='NGUYEN VAN A'
GO