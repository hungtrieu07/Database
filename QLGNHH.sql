create database QLGNHH
use QLGNHH
set dateformat dmy
-- drop database QLGNHH

create table KHACHHANG (
MAKH char(4) not null primary key,
HOTEN varchar(40),
sdt varchar(11),
diachi varchar(50),
);

create table MATHANG(
MAHH char(4) not null primary key,
tenhang varchar(30),
dongia money
);

create table SHIPPER(
manv char(4) not null primary key,
hoten varchar(40) not null,
gt varchar(5) default 'Nam',
sdt varchar(11) unique,
nglv date,
calamviec varchar(10),
phuongtien_vc varchar(20),
);

create table DONHANG(
MADH char(4) not null primary key,
makh char(4) references KHACHHANG(makh),
mahh char(4) references MATHANG(mahh),
manv char(4) references SHIPPER(manv),
vanchuyennhanh bit not null,
diachinhan varchar(100),
pt_thanhtoan varchar(20),
dongia_vc money,
ung money,
ngaydathang date,
ngaygiaohang date,
tinhtrang varchar(10)
);

insert into KHACHHANG values 
('KH01', 'Trieu Viet Hung', '0822010701', 'Hoang Mai, Ha Noi'),
('KH02', 'Le Van Long', '0129384794', 'Hoang Mai, Ha Noi'),
('KH03', 'Vu Trung Kien', '0678534183', 'Thanh Xuan, Ha Noi'),
('KH04', 'Phi Hoang Long', '0938674154', 'Cau Giay, Ha Noi'),
('KH05', 'Pham Duc Nhan', '0912456378', 'Hai Ba Trung, Ha Noi')

insert into MATHANG values
('MH01', 'May tinh', 5000000),
('MH02', 'Man hinh may tinh', 2000000),
('MH03', 'Chuot may tinh', 100000),
('MH04', 'May in', 3000000),
('MH05', 'Ban phim may tinh', 200000)

insert into SHIPPER values
('SP01', 'Nguyen Hai Bang', 'Nam', '0397067138', '13-12-2019', 'Sang', 'Xe may'),
('SP02', 'Pham Tung Anh', 'Nam', '0837701273', '07-01-2020', 'Chieu', 'Xe may'),
('SP03', 'Bui Ba Phuoc', 'Nam', '0838594225', '17-04-2021', 'Fulltime', 'O to'),
('SP04', 'Le Thuy Phuong', 'Nu', '0438688165', '28-03-2018', 'Chieu', 'Xe may'),
('SP05', 'Dang Nha Linh', 'Nu', '0483894767', '05-08-2019', 'Sang', 'Xe may')

insert into DONHANG values
('DH01', 'KH01', 'MH04', 'SP02', 1, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '30-10-2021', '30-10-2021', 'Da giao'),
('DH02', 'KH01', 'MH02', 'SP05', 0, 'Hoang Mai, Ha Noi', 'COD', 30000, 2000000, '30-10-2021', '01-11-2021', 'Da giao'),
('DH03', 'KH05', 'MH05', 'SP04', 0, 'Hai Ba Trung, Ha Noi', 'COD', 30000, 200000, '26-10-2021', '28-10-2021', 'Da giao'),
('DH04', 'KH03', 'MH03', 'SP05', 1, 'Thanh Xuan, Ha Noi', 'COD', 30000, 100000, '01-10-2021', '01-10-2021', 'Da giao'),
('DH05', 'KH02', 'MH05', 'SP02', 0, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '14-08-2021', '16-08-2021', 'Da giao'),
('DH06', 'KH03', 'MH02', 'SP03', 1, 'Thanh Xuan, Ha Noi', 'COD', 40000, 2000000, '22-09-2021', '22-09-2021', 'Da giao'),
('DH07', 'KH05', 'MH03', 'SP01', 0, 'Hai Ba Trung, Ha Noi', 'The ngan hang', 30000, 0, '14-10-2021', '14-10-2021', 'Da giao'),
('DH08', 'KH04', 'MH04', 'SP05', 0, 'Cau Giay, Ha Noi', 'COD', 30000, 3000000, '07-09-2021', NULL, 'Don bi huy'),
('DH09', 'KH02', 'MH01', 'SP04', 1, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '09-10-2021', '10-10-2021', 'Da giao'),
('DH10', 'KH04', 'MH05', 'SP01', 1, 'Cau Giay, Ha Noi', 'COD', 30000, 200000, '18-10-2021', '19-10-2021', 'Da giao'),
('DH11', 'KH02', 'MH02', 'SP02', 0, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '14-02-2022', NULL, 'Dang giao'),
('DH12', 'KH01', 'MH04', 'SP02', 0, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '10-02-2022', '12-02-2022', 'Da giao'),
('DH13', 'KH01', 'MH02', 'SP05', 1, 'Hoang Mai, Ha Noi', 'COD', 30000, 2000000, '09-02-2022', '09-02-2022', 'Da giao'),
('DH14', 'KH05', 'MH05', 'SP04', 1, 'Hai Ba Trung, Ha Noi', 'COD', 30000, 200000, '16-02-2022', NULL, 'Don bi huy'),
('DH15', 'KH03', 'MH03', 'SP05', 0, 'Thanh Xuan, Ha Noi', 'COD', 30000, 100000, '19-02-2022', NULL, 'Don bi huy'),
('DH16', 'KH02', 'MH05', 'SP02', 1, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '17-02-2022', '17-02-2022', 'Da giao'),
('DH17', 'KH03', 'MH02', 'SP03', 1, 'Thanh Xuan, Ha Noi', 'COD', 40000, 2000000, '19-02-2022', '19-02-2022', 'Da giao'),
('DH18', 'KH05', 'MH03', 'SP01', 0, 'Hai Ba Trung, Ha Noi', 'The ngan hang', 30000, 0, '01-02-2022', '02-02-2022', 'Da giao'),
('DH19', 'KH04', 'MH04', 'SP05', 0, 'Cau Giay, Ha Noi', 'COD', 30000, 3000000, '07-02-2022', NULL, 'Dang giao'),
('DH20', 'KH02', 'MH01', 'SP04', 0, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '09-02-2022', '10-02-2022', 'Da giao'),
('DH21', 'KH04', 'MH05', 'SP01', 1, 'Cau Giay, Ha Noi', 'COD', 30000, 200000, '19-02-2022', NULL, 'Dang giao'),
('DH22', 'KH02', 'MH02', 'SP02', 0, 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '04-11-2022', NULL, 'Don bi huy')

-- 1.Lap danh sach cac khach hang
select * from KHACHHANG
-- 2.Lap danh sach cac mat hang
select * from MATHANG
-- 3.Lap danh sach cac shipper
select * from SHIPPER
-- 4.Lap danh sach cac don hang
select * from DONHANG
-- 5. Lap danh sach nhan vien ship di lam buoi sang hay chieu hay fulltime
select hoten as 'Ho ten', calamviec as 'Ca lam viec'
from SHIPPER
where calamviec='Sang'
-- Lap danh sach don hang ma shipper cu the giao
select * from DONHANG
where DONHANG.manv='SP03'
-- 6.Lap danh sach tat ca don hang ma khach hang da mua
select KHACHHANG.HOTEN as 'Ten khach hang', MATHANG.tenhang as 'Ten mat hang', FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang',
	   FORMAT(DONHANG.ngaygiaohang, 'dd/MM/yyyy') as 'Ngay giao hang'
from KHACHHANG, MATHANG, DONHANG
where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh

-- 7.Lap danh sach don hang da giao trong 1 ngay cu the
Select KHACHHANG.HOTEN as 'Ten khach hang', MATHANG.tenhang as 'Ten mat hang', 
	   FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang', FORMAT(DONHANG.ngaygiaohang, 'dd/MM/yyyy') as 'Ngay giao hang'
from KHACHHANG, DONHANG, MATHANG
Where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh and DONHANG.ngaygiaohang = '01-11-2021'

-- 8.Lap danh sach don hang ma khach hang cu the da mua
select KHACHHANG.HOTEN as 'Ten khach hang', MATHANG.tenhang as 'Ten mat hang',
	   FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang'
from KHACHHANG, MATHANG, DONHANG
where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh and KHACHHANG.HOTEN='Trieu Viet Hung'

-- 9.Lap danh sach khach hang da mua hang va tong gia tri don hang do
select DONHANG.MADH as 'Ma don hang', KHACHHANG.HOTEN as 'Ten khach', MATHANG.tenhang as 'Ten mat hang', DONHANG.ngaydathang as 'Ngay dat hang', 
	   DONHANG.dongia_vc as 'Gia van chuyen', MATHANG.dongia as 'Don gia', DONHANG.dongia_vc + MATHANG.dongia as [Thanh tien]
from KHACHHANG, MATHANG, DONHANG
where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh
order by DONHANG.ngaydathang ASC

-- 10.Lap danh sach so don hang ma moi shipper da giao
select SHIPPER.hoten as 'Ten nhan vien', DONHANG.manv as 'Ma nhan vien', count(*) as 'So don hang da giao'
from SHIPPER, DONHANG
where DONHANG.manv=SHIPPER.manv and DONHANG.tinhtrang='Da giao'
group by SHIPPER.hoten, DONHANG.manv
having count(*)>=1

-- 11.Lap danh sach cac don hang giao nhanh hay binh thuong
Select KHACHHANG.HOTEN as 'Ten khach hang', MATHANG.tenhang as 'Ten mat hang', 
	   FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang', FORMAT(DONHANG.ngaygiaohang, 'dd/MM/yyyy') as 'Ngay giao hang'
from KHACHHANG, DONHANG, MATHANG
Where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh and DONHANG.vanchuyennhanh=0

-- 12. Xác định đơn hàng cụ thể đã giao thành công hay chưa
select MADH as 'Ma don hang', KHACHHANG.HOTEN as 'Ten khach hang',
	DONHANG.diachinhan as 'Dia chi giao hang',
	case when tinhtrang='Da giao' then 'Don hang da duoc giao'
		 when tinhtrang='Dang giao' then 'Don hang dang duoc giao'
		 when tinhtrang='Don bi huy' then 'Don hang da bi huy'
	end as 'Tinh trang don hang'
from DONHANG, KHACHHANG
where DONHANG.diachinhan='Hoang Mai, Ha Noi' and KHACHHANG.MAKH=DONHANG.makh

--13. Truy xuat danh sach don hang theo quan
select DONHANG.MADH as 'Ma don hang', KHACHHANG.HOTEN as 'Ten khach hang', MATHANG.tenhang as 'Ten mat hang',
	   DONHANG.diachinhan as 'Dia chi giao hang'
from KHACHHANG, MATHANG, DONHANG
where KHACHHANG.MAKH=DONHANG.makh and MATHANG.MAHH=DONHANG.mahh and diachinhan='Cau Giay, Ha Noi'

--14. Tinh tien luong cho shipper trong 1 thang
declare @luongcoban money
set @luongcoban = 1000000
declare @thuong money
select SHIPPER.hoten as 'Ten nhan vien', SHIPPER.manv as 'Ma nhan vien', count(*) as 'So don hang da giao', 
sum(DONHANG.dongia_vc * 70 / 100) as 'Tien luong dua tren don hang', @luongcoban as 'Luong co ban',
sum(DONHANG.dongia_vc * 70 / 100) + @luongcoban as 'Tong luong'
from SHIPPER, DONHANG
where DONHANG.manv=SHIPPER.manv and DONHANG.tinhtrang='Da giao'
group by SHIPPER.hoten, SHIPPER.manv
	





