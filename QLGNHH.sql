create database QLGNHH
use QLGNHH

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
nglv datetime2,
calamviec varchar(10),
phuongtien_vc varchar(20),
);

create table DONHANG(
MADH char(4) not null primary key,
makh char(4) references KHACHHANG(makh),
mahh char(4) references MATHANG(mahh),
manv char(4) references SHIPPER(manv),
diachinhan varchar(100),
pt_thanhtoan varchar(20),
dongia_vc money,
ung money,
ngaydathang date,
ngaygiaohang date
);

insert into KHACHHANG values 
('KH01', 'Trieu Viet Hung', '0822010701', '18/62, Mai Dong, Hoang Mai, Ha Noi'),
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
('DH01', 'KH01', 'MH04', 'SP02', '18/62, Mai Dong, Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '30-10-2021', '01-11-2021'),
('DH02', 'KH01', 'MH02', 'SP05', '18/62, Mai Dong, Hoang Mai, Ha Noi', 'Tien mat', 30000, 2000000, '30-10-2021', '01-11-2021'),
('DH03', 'KH05', 'MH05', 'SP04', 'Hai Ba Trung, Ha Noi', 'Tien mat', 30000, 200000, '26-10-2021', '28-10-2021'),
('DH04', 'KH03', 'MH03', 'SP05', 'Thanh Xuan, Ha Noi', 'Tien mat', 30000, 100000, '01-10-2021', '02-10-2021'),
('DH05', 'KH02', 'MH05', 'SP02', 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '14-08-2021', '16-08-2021'),
('DH06', 'KH03', 'MH02', 'SP03', 'Thanh Xuan, Ha Noi', 'Tien mat', 30000, 2000000, '22-09-2021', '22-09-2021'),
('DH07', 'KH05', 'MH03', 'SP01', 'Hai Ba Trung, Ha Noi', 'The ngan hang', 30000, 0, '14-10-2021', '14-10-2021'),
('DH08', 'KH04', 'MH04', 'SP05', 'Cau Giay, Ha Noi', 'Tien mat', 30000, 3000000, '07-09-2021', '09-09-2021'),
('DH09', 'KH02', 'MH01', 'SP04', 'Hoang Mai, Ha Noi', 'The ngan hang', 30000, 0, '09-10-2021', '10-10-2021'),
('DH10', 'KH04', 'MH05', 'SP01', 'Cau Giay, Ha Noi', 'Tien mat', 30000, 200000, '18-10-2021', '19-10-2021')

-- Lap danh sach cac khach hang
select * from KHACHHANG
-- Lap danh sach cac mat hang
select * from MATHANG
-- Lap danh sach cac shipper
select * from SHIPPER
-- Lap danh sach cac don hang
select * from DONHANG

-- thiet lap dinh dang ngay, thang, nam (dd/mm/yyyy)
set dateformat dmy

--Lap danh sach tat ca don hang ma khach hang da mua
select KHACHHANG.HOTEN as 'Ten khach', MATHANG.tenhang as 'Ten mat hang', FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang',
	   FORMAT(DONHANG.ngaygiaohang, 'dd/MM/yyyy') as 'Ngay giao hang'
from KHACHHANG, MATHANG, DONHANG
where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh

-- Lap danh sach don hang da giao trong 1 ngay cu the
Select KHACHHANG.HOTEN as 'Ten khach', MATHANG.tenhang as 'Ten mat hang', 
	   FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang', FORMAT(DONHANG.ngaygiaohang, 'dd/MM/yyyy') as 'Ngay giao hang'
from KHACHHANG, DONHANG, MATHANG
Where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh and DONHANG.ngaygiaohang = '01-11-2021'

-- Lap danh sach don hang ma khach hang cu the da mua
select KHACHHANG.HOTEN as 'Ten khach', MATHANG.tenhang as 'Ten mat hang',
	   FORMAT(DONHANG.ngaydathang, 'dd/MM/yyyy') as 'Ngay dat hang'
from KHACHHANG, MATHANG, DONHANG
where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh and KHACHHANG.HOTEN='Trieu Viet Hung'

-- Lap danh sach khach hang da mua hang va tong gia tri don hang do
select DONHANG.MADH as 'Ma don hang', KHACHHANG.HOTEN as 'Ten khach', MATHANG.tenhang as 'Ten mat hang', DONHANG.ngaydathang as 'Ngay dat hang', 
	   DONHANG.dongia_vc as 'Gia van chuyen', MATHANG.dongia as 'Don gia', DONHANG.dongia_vc + MATHANG.dongia as [Thanh tien]
from KHACHHANG, MATHANG, DONHANG
where MATHANG.MAHH=DONHANG.mahh and KHACHHANG.MAKH=DONHANG.makh
order by DONHANG.ngaydathang ASC