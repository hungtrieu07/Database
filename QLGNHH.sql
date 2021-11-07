create database QLGNHH
use QLGNHH
set dateformat DMY

create table KHACHHANG (
MAKH char(4) not null primary key,
HOTEN varchar(40),
sdt varchar(11),
diachi varchar(50),
);

select * from KHACHHANG
drop table KHACHHANG

create table MATHANG(
MAHH char(4) not null primary key,
tenhang varchar(30),
dongia money
);

select * from MATHANG
drop table MATHANG

create table SHIPPER(
manv char(4) not null primary key,
hoten varchar(40) not null,
sdt varchar(11) unique,
gt varchar(5) default 'Nam',
ngvl smalldatetime,
calamviec varchar(5),
phuongtien_vc varchar(20),
);

select * from SHIPPER
drop table SHIPPER

create table DONHANG(
MADH char(4) not null primary key,
makh char(4) references KHACHHANG(makh),
mahh char(4) references MATHANG(mahh),
manv char(4) references SHIPPER(manv),
diachinhan varchar(50),
pt_thanhtoan varchar(10),
dongia_vc money,
ung money,
ngaydathang smalldatetime,
ngaygiaohang smalldatetime
);

select * from DONHANG
drop table DONHANG

insert into KHACHHANG values 
('KH01', 'Trieu Viet Hung', '0822010701', '18/62, Mai Dong, Hoang Mai, Ha Noi'),
('KH02', 'Le Van Long', '0129384794', 'Hoang Mai, Ha Noi'),
('KH03', 'Vu Trung Kien', '0678534183', 'Thanh Xuan, Ha Noi'),
('KH04', 'Phi Hoang Long', '0938674154', 'Cau Giay, Ha Noi'),
('KH05', 'Pham Duc Nhan', '0912456378', 'Hai Ba Trung, Ha Noi')

insert into MATHANG values
('MT01', 'May tinh van phong'),
