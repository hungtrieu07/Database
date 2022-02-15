CREATE DATABASE QLKS;

USE QLKS;

CREATE TABLE tb_NhanVien
(
    Ma_nhan_vien         VARCHAR(10)   NOT NULL PRIMARY KEY,
    Ten_nhan_vien        NVARCHAR(100) NOT NULL,
    Ngay_sinh            DATE          NOT NULL,
    Gioi_tinh            BIT           NOT NULL,
    CCCD                 VARCHAR(100)  NOT NULL,
    Dia_chi              NVARCHAR(500) NOT NULL,
    So_dien_thoai        VARCHAR(20)   NOT NULL,
    Luong_thang          FLOAT DEFAULT 7000000,
    Luong_chuc_vu        FLOAT         NOT NULL,
    Email                VARCHAR(100)  NOT NULL,
    Ma_nhan_vien_Quan_ly VARCHAR(10) FOREIGN KEY REFERENCES tb_NhanVien (Ma_nhan_vien)
);


CREATE TABLE tb_Phong
(
    Ma_phong   VARCHAR(10)  NOT NULL PRIMARY KEY,
    Trang_thai BIT DEFAULT '1',
    So_giuong  TINYINT      NOT NULL,
    Gia_phong  FLOAT        NOT NULL,
    Loai_phong NVARCHAR(20) NOT NULL,
);


CREATE TABLE tb_KhachHang
(
    Ma_khach_hang  VARCHAR(10) PRIMARY KEY NOT NULL,
    Ten_khach_hang NVARCHAR(100)           NOT NULL,
    CCCD           VARCHAR(100)            NOT NULL,
    Ngay_sinh      DATE                    NOT NULL,
    Gioi_tinh      BIT                     NOT NULL,
    Quoc_tich      NVARCHAR(50)            NOT NULL,
    So_dien_thoai  VARCHAR(20)             NOT NULL
);


CREATE TABLE tb_GoiDichVu
(
    Ma_dich_vu      VARCHAR(10) PRIMARY KEY NOT NULL,
    Loai_goi        NVARCHAR(50)            NOT NULL,
    Gia_goi_dich_vu FLOAT                   NOT NULL
);

CREATE TABLE tb_ChiTieu
(
    Ma_chi_tieu          VARCHAR(10) PRIMARY KEY NOT NULL,
    Ten_phi_chi_tieu     NVARCHAR(100)           NOT NULL,
    Tong_phi             FLOAT                   NOT NULL,
    Ngay_chi             DATETIME                NOT NULL,
    Ma_nhan_vien_Quan_ly VARCHAR(10)             NOT NULL FOREIGN KEY REFERENCES tb_NhanVien (Ma_nhan_vien)
);


CREATE TABLE tb_QuanLyPhong
(
    Ma_nhan_vien VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_NhanVien (Ma_nhan_vien),
    Ma_phong     VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_Phong (Ma_phong),
    CONSTRAINT PK_QuanLyPhong PRIMARY KEY (Ma_nhan_vien, Ma_phong)
);

CREATE TABLE tb_ChamCong
(
    Ma_cham_cong VARCHAR(10) NOT NULL PRIMARY KEY,
    Ngay_di_lam  DATE        NOT NULL,
    Gio_quet_ra  TIME        NOT NULL,
    Gio_quet_vao TIME        NOT NULL,
    Ca_lam       TINYINT     NOT NULL,
    Ma_nhan_vien VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_NhanVien (Ma_nhan_vien)
);


CREATE TABLE tb_HoaDon
(
    Ma_hoa_don                      VARCHAR(10) NOT NULL PRIMARY KEY,
    Ten_hoa_don                     NVARCHAR(100) DEFAULT 'Hoa don phong',
    Ngay_gio_xuat_hoa_don           DATETIME    NOT NULL,
    Ma_nhan_vien_Xuat_hoa_don_phong VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_NhanVien (Ma_nhan_vien),
    Ma_khach_hang                   VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_KhachHang (Ma_khach_hang)
);

CREATE TABLE tb_HoaDonDichVu
(
    Ma_hoa_don_Dich_vu                VARCHAR(10)   NOT NULL PRIMARY KEY,
    Ten_hoa_don                       NVARCHAR(100) NOT NULL DEFAULT 'Hoa don dich vu',
    Ngay_gio_xuat_hoa_don             DATETIME      NOT NULL,
    Ma_nhan_vien_Xuat_hoa_don_dich_vu VARCHAR(10)   NOT NULL FOREIGN KEY REFERENCES tb_NhanVien (Ma_nhan_vien),
    Ma_khach_hang                     VARCHAR(10)   NOT NULL FOREIGN KEY REFERENCES tb_KhachHang (Ma_khach_hang)
);

CREATE TABLE tb_DatPhong
(
    Ma_phong   VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_Phong (Ma_phong),
    Ma_hoa_don VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_HoaDon (Ma_hoa_don),
    Don_gia    FLOAT       NOT NULL,
    So_luong   TINYINT DEFAULT 1,
    Tong_gia   FLOAT       NOT NULL
);

CREATE TABLE tb_DatDichVu
(
    Ma_dich_vu         VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_GoiDichVu (Ma_dich_vu),
    Ma_hoa_don_Dich_vu VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES tb_HoaDonDichVu (Ma_hoa_don_Dich_vu),
    Tong_gia           FLOAT       NOT NULL,
    CONSTRAINT PK_DatDichVu PRIMARY KEY (Ma_dich_vu, Ma_hoa_don_Dich_vu)
);

-- Insert du lieu Phong
INSERT INTO tb_Phong
    (Ma_phong, So_giuong, Gia_phong, Loai_phong)
VALUES ('P101', 1, 10.00, 'Normal'),
       ('P102', 1, 10.00, 'Normal'),
       ('P103', 1, 10.00, 'Normal'),
       ('P104', 1, 10.00, 'Normal'),
       ('P105', 1, 10.00, 'Normal'),
       ('P201', 2, 15.00, 'Normal'),
       ('P202', 2, 15.00, 'Normal'),
       ('P203', 2, 15.00, 'Normal'),
       ('P204', 2, 15.00, 'Normal'),
       ('P205', 2, 15.00, 'Normal'),
       ('P301', 2, 25.50, 'Vip'),
       ('P302', 2, 25.50, 'Vip'),
       ('P303', 2, 25.50, 'Vip'),
       ('P304', 2, 25.50, 'Vip'),
       ('P305', 2, 25.50, 'Vip'),
       ('P401', 1, 20.50, 'Vip'),
       ('P402', 1, 20.50, 'Vip'),
       ('P403', 1, 20.50, 'Vip'),
       ('P404', 1, 20.50, 'Vip'),
       ('P405', 1, 20.50, 'Vip')

-- Insert du lieu Goi dich vu
INSERT INTO tb_GoiDichVu
    (Ma_dich_vu, Loai_goi, Gia_goi_dich_vu)
VALUES ('DV01', 'Normal', '5.00'),
       ('DV02', 'Vip', '10.00'),
       ('DV03', 'Family', '11.50'),
       ('DV04', 'Luxury', '25.5')

-- Insert du lieu Khach hang
INSERT INTO tb_KhachHang
(Ma_khach_hang, Ten_khach_hang, CCCD, Ngay_sinh, Gioi_tinh, Quoc_tich, So_dien_thoai)
VALUES ('KH01', 'Pham Hung', '982346287356', '2001-01-19', 0, 'Viet Nam', '0983785181'),
       ('KH02', 'Tran Khanh', '894785973495', '2001-02-19', 0, 'Viet Nam', '0974378654'),
       ('KH03', 'Nguyen Anh', '783947593875', '2001-11-08', 1, 'Viet Nam', '0973247624'),
       ('KH04', 'Tran Linh', '875349579853', '2002-06-27', 1, 'Viet Nam', '0974365874'),
       ('KH05', 'Duy Dan', '892782758943', '2001-03-07', 0, 'Viet Nam', '0893742387')

-- Insert du lieu Nhan Vien
INSERT INTO tb_NhanVien
(Ma_nhan_vien, Ten_nhan_vien, Ngay_sinh, Gioi_tinh, CCCD, Dia_chi, So_dien_thoai, Luong_chuc_vu, Email, Ma_nhan_vien_Quan_ly)
VALUES ('NV03', 'Vu Duy Dan', '2001-03-07', 1, '98347593759', 'Quat Lam', '0958778643', 2.5, 'dan@gmail.com','NV03'),
       ('NV01', 'Tran Duy Khanh', '2001-02-19', 1, '97983274894', 'Hung Yen', '0987348278', 1.5, 'khanh@gmail.com', 'NV03'),
       ('NV06', 'Pham Huy Hung', '2001-01-19', 0, '89745573485', 'Thai Binh', '0983785181', 1.5, 'hung@gmail.com', 'NV03'),
       ('NV02', 'Dao Viet Cuong', '2001-03-20', 1, '97983274894', 'Hai Phong', '0958654789', 1.5, 'cuong@gmail.com','NV03'),
       ('NV04', 'Nguyen Lan Anh', '2001-06-24', 0, '97983274894', 'Hung Yen', '0987348278', 1.5, 'lananh@gmail.com','NV06'),
       ('NV05', 'Nguyen Hong Hanh', '1990-07-01', 0, '97994256987', 'Ha Noi', '0984569523', 1.5, 'hanh@gmail.com','NV06'),
       ('NV07', 'Nguyen Dinh Quy', '1994-11-11', 0, '79357934234', 'Thai Binh', '0984287478', 1.5, 'quy@gmail.com','NV03')

-- Insert du lieu Chi Tieu
INSERT INTO tb_ChiTieu
(Ma_chi_tieu, Ten_phi_chi_tieu, Tong_phi, Ngay_chi, Ma_nhan_vien_Quan_ly)
VALUES ('CT01', 'Thue thuong nien', '150.00', '2021-10-17', 'NV06'),
       ('CT02', 'Tien dien thang 10', '100.50', '2021-10-17', 'NV06'),
       ('CT03', 'Phi bao tri khach san', '200.00', '2021-09-03', 'NV01'),
       ('CT04', 'Tien mua thuc pham nha hang', '175.50', '2021-10-14', 'NV03'),
       ('CT05', 'Phi ha tang', '50.50', '2021-09-01', 'NV03')

-- Insert du lieu Quan Ly Phong
INSERT INTO tb_QuanLyPhong
    (Ma_nhan_vien, Ma_phong)
VALUES ('NV01', 'P101'),
       ('NV01', 'P102'),
       ('NV01', 'P103'),
       ('NV01', 'P104'),
       ('NV01', 'P105'),
       ('NV02', 'P201'),
       ('NV02', 'P202'),
       ('NV02', 'P203'),
       ('NV02', 'P204'),
       ('NV02', 'P205'),
       ('NV03', 'P301'),
       ('NV03', 'P302'),
       ('NV03', 'P303'),
       ('NV03', 'P304'),
       ('NV03', 'P305'),
       ('NV06', 'P401'),
       ('NV06', 'P402'),
       ('NV06', 'P403'),
       ('NV06', 'P404'),
       ('NV06', 'P405')

-- Insert du lieu Cham Cong
INSERT INTO tb_ChamCong
(Ma_cham_cong, Ngay_di_lam, Gio_quet_ra, Gio_quet_vao, Ca_lam, Ma_nhan_vien)
VALUES ('CC0001', GETDATE(), '11:30:00', '07:00:00', 1, 'NV01'),
       ('CC0002', GETDATE(), '11:30:00', '07:00:00', 1, 'NV02'),
       ('CC0003', GETDATE(), '17:00:00', '13:30:00', 2, 'NV03'),
       ('CC0004', GETDATE(), '17:00:00', '13:30:00', 2, 'NV04'),
       ('CC0005', GETDATE(), '19:00:00', '22:00:00', 3, 'NV05'),
       ('CC0006', GETDATE(), '19:00:00', '22:00:00', 3, 'NV06'),
       ('CC0007', GETDATE(), '19:00:00', '22:00:00', 3, 'NV07'),
       ('CC0008', GETDATE(), '19:00:00', '22:00:00', 3, 'NV03')

-- Insert du lieu Hoa Don
INSERT INTO tb_HoaDon
(Ma_hoa_don, Ngay_gio_xuat_hoa_don, Ma_nhan_vien_Xuat_hoa_don_phong, Ma_khach_hang)
VALUES ('HD0001', GETDATE(), 'NV01', 'KH01'),
       ('HD0002', GETDATE(), 'NV01', 'KH02'),
       ('HD0003', GETDATE(), 'NV03', 'KH03'),
       ('HD0004', GETDATE(), 'NV06', 'KH04'),
       ('HD0005', GETDATE(), 'NV07', 'KH05'),
       ('HD0006', GETDATE(), 'NV04', 'KH01'),
       ('HD0007', GETDATE(), 'NV03', 'KH03'),
       ('HD0008', '2021-09-09 07:00:00', 'NV05', 'KH05'),
       ('HD0009', '2021-10-08 08:00:00', 'NV07', 'KH03'),
       ('HD00010', '2021-03-17 08:00:00', 'NV02', 'KH02')

-- Insert du lieu Hoa Don Dich Vu
INSERT INTO tb_HoaDonDichVu
(Ma_hoa_don_Dich_vu, Ngay_gio_xuat_hoa_don, Ma_nhan_vien_Xuat_hoa_don_dich_vu, Ma_khach_hang)
VALUES ('HDDV001', GETDATE(), 'NV01', 'KH03'),
       ('HDDV002', GETDATE(), 'NV04', 'KH01'),
       ('HDDV003', GETDATE(), 'NV06', 'KH05'),
       ('HDDV004', GETDATE(), 'NV02', 'KH02'),
       ('HDDV005', GETDATE(), 'NV03', 'KH04')

-- Insert dư lieu Dat Phong
DECLARE @i INT = 0
WHILE @i < 9
    BEGIN
        DECLARE @DSDatPhong TABLE
                            (
                                Id   INT,
                                MaP  VARCHAR(10),
                                MaHD VARCHAR(10),
                                SL   INT
                            )
        INSERT INTO @DSDatPhong
        VALUES (1, 'P101', 'HD0001', 2),
               (2, 'P102', 'HD0002', 1),
               (3, 'P103', 'HD0003', 2),
               (4, 'P404', 'HD0004', 2),
               (5, 'P205', 'HD0005', 1),
               (6, 'P201', 'HD0006', 2),
               (7, 'P301', 'HD0007', 1),
               (8, 'P203', 'HD0008', 1)
        DECLARE @MaP VARCHAR(20)
        DECLARE @MaHD VARCHAR(20)
        DECLARE @SL INT
        SELECT @MaP = MaP FROM @DSDatPhong WHERE Id = @i
        SELECT @MaHD = MaHD FROM @DSDatPhong WHERE Id = @i
        SELECT @SL = SL FROM @DSDatPhong WHERE Id = @i
        IF (SELECT Trang_thai FROM tb_Phong WHERE Ma_phong = @MaP) = 1
            BEGIN
                INSERT INTO tb_DatPhong (Ma_phong, Ma_hoa_don, Don_gia, So_luong, Tong_gia)
                VALUES (@MaP, @MaHD, (SELECT Gia_phong FROM tb_Phong WHERE tb_Phong.Ma_phong = @MaP), @SL,
                        (SELECT Gia_phong FROM tb_Phong WHERE tb_Phong.Ma_phong = @MaP) * @SL)
                UPDATE tb_Phong
                SET Trang_thai = 0
                WHERE Ma_phong = @MaP
            END
        ELSE
            BEGIN
                PRINT @MaP + 'da duoc dat'
            END
        SET @i = @i + 1
    END


-- Insert du lieu Dat Dich Vu
INSERT INTO tb_DatDichVu
    (Ma_dich_vu, Ma_hoa_don_Dich_vu, Tong_gia)
VALUES ('DV01', 'HDDV001', (SELECT Gia_goi_dich_vu FROM tb_GoiDichVu WHERE tb_GoiDichVu.Ma_dich_vu = 'DV01')),
       ('DV02', 'HDDV002', (SELECT Gia_goi_dich_vu FROM tb_GoiDichVu WHERE tb_GoiDichVu.Ma_dich_vu = 'DV02')),
       ('DV03', 'HDDV003', (SELECT Gia_goi_dich_vu FROM tb_GoiDichVu WHERE tb_GoiDichVu.Ma_dich_vu = 'DV03')),
       ('DV02', 'HDDV004', (SELECT Gia_goi_dich_vu FROM tb_GoiDichVu WHERE tb_GoiDichVu.Ma_dich_vu = 'DV02')),
       ('DV03', 'HDDV005', (SELECT Gia_goi_dich_vu FROM tb_GoiDichVu WHERE tb_GoiDichVu.Ma_dich_vu = 'DV03'))


-- Query data
-- 1. Lay tat ca du lieu tu cac bang
SELECT *
FROM tb_NhanVien
SELECT *
FROM tb_KhachHang
SELECT *
FROM tb_Phong
SELECT *
FROM tb_GoiDichVu
SELECT *
FROM tb_ChamCong
SELECT *
FROM tb_ChiTieu
SELECT *
FROM tb_QuanLyPhong
SELECT *
FROM tb_HoaDon
SELECT *
FROM tb_HoaDonDichVu
SELECT *
FROM tb_DatPhong
SELECT *
FROM tb_DatDichVu

-- 2. Kiem tra thong tin nhan vien theo thong tin
--     Lay ra nhan vien lon hon 18 tuoi
SELECT *
FROM tb_NhanVien
WHERE (YEAR(GETDATE()) - YEAR(tb_NhanVien.Ngay_sinh)) > 18

--  Lay ra nhan vien co luong cao hon 1.5
SELECT *
FROM tb_NhanVien
WHERE tb_NhanVien.Luong_chuc_vu > 1.5

-- Lay ra nhan vien theo nguoi quan ly (nguoi quan ly NV03 va NV06
SELECT *
FROM tb_NhanVien
WHERE tb_NhanVien.Ma_nhan_vien_Quan_ly = 'NV06'
SELECT *
FROM tb_NhanVien
WHERE tb_NhanVien.Ma_nhan_vien_Quan_ly = 'NV03'

-- Lay ra nhan vien xuat nhieu hoa don phong nhat
WITH tb_TongHD(Ma_NV, TongHD) AS (SELECT Ma_nhan_vien_Xuat_hoa_don_phong,
                                         COUNT(Ma_nhan_vien_Xuat_hoa_don_phong) AS TongSoHD
                                  FROM tb_HoaDon
                                  GROUP BY Ma_nhan_vien_Xuat_hoa_don_phong)
SELECT tb_NhanVien.Ma_nhan_vien, tb_NhanVien.Ten_nhan_vien, tb_TongHD.TongHD
FROM tb_NhanVien,
     tb_TongHD
WHERE tb_NhanVien.Ma_nhan_vien IN (SELECT Ma_NV
                                   FROM tb_TongHD
                                   WHERE tb_TongHD.TongHD = (SELECT MAX(TongHD) AS maxHD
                                                             FROM tb_TongHD))
  AND tb_NhanVien.Ma_nhan_vien = tb_TongHD.Ma_NV

-- Lay ra thong tin nhan vien kem theo thong tin quan ly
WITH tb_QuanLy(Ma_nhan_vien_quan_ly, Ten_nhan_vien) AS (SELECT Ma_nhan_vien, Ten_nhan_vien FROM tb_NhanVien)
SELECT tb_NhanVien.Ma_nhan_vien, tb_NhanVien.Ten_nhan_vien, tb_QuanLy.Ma_nhan_vien_quan_ly, tb_QuanLy.Ten_nhan_vien
FROM tb_NhanVien,
     tb_QuanLy
WHERE tb_NhanVien.Ma_nhan_vien_Quan_ly = tb_QuanLy.Ma_nhan_vien_quan_ly

-- 2. Kiem tra thong tin phong theo dieu kien
-- Xuat ra phong con trong
SELECT *
FROM tb_Phong
WHERE tb_Phong.Trang_thai = 1

-- Xuat ra cac phong vip con trong
SELECT *
FROM tb_Phong
WHERE tb_Phong.Trang_thai = 1
  AND tb_Phong.Loai_phong = 'Vip'

-- 3. Kiem tra thong tin khach hang theo dieu kien
-- Lay ra danh sach khach hang
SELECT *
FROM tb_KhachHang

-- Lay ra so lan dat phong cua tung khach hang
SELECT tb_HoaDon.Ma_khach_hang, tb_KhachHang.Ten_khach_hang, COUNT(tb_HoaDon.Ma_khach_hang) AS So_lan_dat_phong
FROM tb_HoaDon
         INNER JOIN tb_KhachHang ON tb_KhachHang.Ma_khach_hang = tb_HoaDon.Ma_khach_hang
GROUP BY tb_HoaDon.Ma_khach_hang, tb_KhachHang.Ten_khach_hang
-- 4. Kiem tra thong tin Goi dich vu
-- Lay ra danh sach goi dich vu
SELECT *
FROM tb_GoiDichVu

-- 5. Kiem tra thong tin Chi tieu
-- Lay ra danh sach chi tieu kem ten nhan vien quan ly chi tieu
SELECT tb_ChiTieu.*, tb_NhanVien.Ma_nhan_vien, tb_NhanVien.Ten_nhan_vien
FROM tb_ChiTieu,
     tb_NhanVien
WHERE tb_ChiTieu.Ma_nhan_vien_Quan_ly = tb_NhanVien.Ma_nhan_vien

-- Lay ra chi tieu cao nhat
SELECT *
FROM tb_ChiTieu
WHERE Tong_phi = (SELECT MAX(Tong_phi) FROM tb_ChiTieu)


-- 6. Kiem tra thong tin Quan ly phong
-- Lay ra thong tin phong kem theo thong tin nhan vien quan ly phong do
SELECT tb_QuanLyPhong.*,
       Ten_nhan_vien,
       Trang_thai,
       So_giuong,
       Gia_phong,
       Loai_phong
FROM (tb_QuanLyPhong INNER JOIN tb_NhanVien ON tb_NhanVien.Ma_nhan_vien = tb_QuanLyPhong.Ma_nhan_vien)
         INNER JOIN tb_Phong ON tb_Phong.Ma_phong = tb_QuanLyPhong.Ma_phong

-- 7. Kiem tra thong tin Cham cong
-- Lay ra chi tiet cham cong theo ngay/ca/gio vi du (2021-10-31 ca 3) gom co Ten nhan vien, gio quet ra,
-- gio quet vao, so dien thoai, ngay, ca
SELECT Ten_nhan_vien,
       Gio_quet_ra,
       Gio_quet_vao,
       So_dien_thoai,
       Ngay_di_lam,
       Ca_lam
FROM tb_NhanVien
         INNER JOIN tb_ChamCong on tb_NhanVien.Ma_nhan_vien = tb_ChamCong.Ma_nhan_vien
WHERE Ngay_di_lam = '2021-10-31' AND Ca_lam = 3

-- Lay ra thong tin nhan vien cham cong nhieu nhat trong thang + so lan cham cong
WITH tb_SoCaLam(Ma_NV, So_ca) AS (SELECT Ma_nhan_vien, COUNT(tb_ChamCong.Ma_nhan_vien) AS So_ca_lam
                                  FROM tb_ChamCong
                                  GROUP BY Ma_nhan_vien)
SELECT Ma_nhan_vien, Ten_nhan_vien, So_dien_thoai, So_ca
FROM tb_SoCaLam
         INNER JOIN tb_NhanVien ON tb_NhanVien.Ma_nhan_vien = tb_SoCaLam.Ma_NV
WHERE So_ca = (SELECT MAX(So_ca) FROM tb_SoCaLam)


-- Tinh luong cho tung nhan vien theo so lan cham cong (Luong = So ca cham cong * Luong chuc vu),
-- hien thi ra ten nhan vien, so lan cham cong, luong chuc vu, tong tien luong
WITH tb_SoCaLam(Ma_NV, So_ca) AS (SELECT Ma_nhan_vien, COUNT(tb_ChamCong.Ma_nhan_vien) AS So_ca_lam
                                  FROM tb_ChamCong
                                  GROUP BY Ma_nhan_vien)
SELECT Ma_NV, Ten_nhan_vien, So_ca, So_ca * Luong_chuc_vu AS Tong_Luong_Thang
FROM tb_SoCaLam
         INNER JOIN tb_NhanVien ON Ma_nhan_vien = Ma_NV

-- 8. Kiem tra thong tin Hoa don + Dat phong
/*
Lay ra thong tin chi tiet hoa don : Ten + sdt khach hang dat phong, ten + sdt nhan vien xuat hoa don Phong,
ten hoa don, ngay gio xuat hoa don, ma phong duoc dat
Don gia, so luong, tong gia
*/
SELECT Ten_khach_hang,
       tb_KhachHang.So_dien_thoai,
       Ten_nhan_vien,
       Ten_hoa_don,
       Ngay_gio_xuat_hoa_don,
       tb_DatPhong.Ma_phong,
       So_luong,
       Tong_gia,
       tb_Phong.Gia_phong
FROM ((((tb_HoaDon INNER JOIN tb_KhachHang ON tb_KhachHang.Ma_khach_hang = tb_HoaDon.Ma_khach_hang)
    INNER JOIN tb_NhanVien ON tb_NhanVien.Ma_nhan_vien = tb_HoaDon.Ma_nhan_vien_Xuat_hoa_don_phong)
    INNER JOIN tb_DatPhong ON tb_DatPhong.Ma_hoa_don = tb_HoaDon.Ma_hoa_don)
         INNER JOIN tb_Phong ON tb_Phong.Ma_phong = tb_DatPhong.Ma_phong)
-- 9. Kiem tra thong tin Hoa don dich vu + Dat dich vu
/*
Tuong tu nhu hoa don Phong :vvv
*/
SELECT Ten_khach_hang,
       tb_KhachHang.So_dien_thoai,
       Ten_nhan_vien,
       Ten_hoa_don,
       Ngay_gio_xuat_hoa_don,
       tb_DatDichVu.Ma_dich_vu,
       Tong_gia,
       tb_GoiDichVu.Gia_goi_dich_vu
FROM ((((tb_HoaDonDichVu INNER JOIN tb_KhachHang ON tb_KhachHang.Ma_khach_hang = tb_HoaDonDichVu.Ma_khach_hang)
    INNER JOIN tb_NhanVien ON tb_NhanVien.Ma_nhan_vien = tb_HoaDonDichVu.Ma_nhan_vien_Xuat_hoa_don_dich_vu)
    INNER JOIN tb_DatDichVu ON tb_DatDichVu.Ma_hoa_don_Dich_vu = tb_HoaDonDichVu.Ma_hoa_don_Dich_vu)
         INNER JOIN tb_GoiDichVu ON tb_GoiDichVu.Ma_dich_vu = tb_DatDichVu.Ma_dich_vu)

-- 10. Tong quan
-- Tinh doanh thu cua khach san theo thang(ngay) bang tong tien hoa don trong thang
-- Doang thu phong
SELECT SUM(tb_DatPhong.Tong_gia) AS Doanh_thu_phong
FROM tb_DatPhong
         INNER JOIN tb_HoaDon ON tb_HoaDon.Ma_hoa_don = tb_DatPhong.Ma_hoa_don
WHERE tb_HoaDon.Ngay_gio_xuat_hoa_don IN (SELECT Ngay_gio_xuat_hoa_don
                                          FROM tb_HoaDon
                                          WHERE Ngay_gio_xuat_hoa_don > '2021-09-09'
                                            AND Ngay_gio_xuat_hoa_don < '2021-10-27')

-- Doanh thu Dich vu
SELECT SUM(tb_DatDichVu.Tong_gia) AS Doanh_thu_dich_vu
FROM tb_DatDichVu
         INNER JOIN tb_HoaDonDichVu on tb_HoaDonDichVu.Ma_hoa_don_Dich_vu = tb_DatDichVu.Ma_hoa_don_Dich_vu
WHERE tb_HoaDonDichVu.Ngay_gio_xuat_hoa_don IN (SELECT Ngay_gio_xuat_hoa_don
                                                FROM tb_HoaDonDichVu
                                                WHERE Ngay_gio_xuat_hoa_don > '2021-09-09'
                                                  AND Ngay_gio_xuat_hoa_don < '2021-10-27')


