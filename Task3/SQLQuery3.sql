﻿IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
	DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO
--Tạo bảng Lớp học
CREATE TABLE LopHoc(
	MaLopHoc INT PRIMARY KEY IDENTITY,
	TenLopHoc VARCHAR(10)
)
GO
--Tạo bảng Sinh Viên có khóa học là cột MaLopHoc, nối với bảng LopHoc
CREATE TABLE SinhVien(
	MaSV int PRIMARY KEY,
	TenSV varchar(40),
	MaLopHoc int,
	CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc (MaLopHoc)
)
GO
--Tạo bảng SanPham với 1 cột NULL, một cột NOT NULL
CREATE TABLE SanPham (
	MaSP int NOT NULL,
	TenSP varchar(40) NULL
)
--Tạo bảng với thuộc tính defaullt cho cột Price
CREATE TABLE StoreProduct(
	ProductID int NOT NULL,
	Name varchar(40) NOT NULL,
	Price money NOT NULL DEFAULT (100)
)
--Thử kiểm tra giá trị default có được sử dụng hay không
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, Rivets)
GO
--Tạo bảng ContactPhone với thộc tính IDENTITY
CREATE TABLE ContactPhone (
	Person_ID int IDENTITY(500, 1) NOT NULL,
	MobileNumber bigint NOT NULL
)
GO
--Tạo cột nhận dạng duy nhất tổng thể
CREATE TABLE CellularPhone (
	Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
)
--Chèn một record vào
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT * FROM CellularPhone
GO
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
CREATE TABLE ContactPhone (
	Person_ID int PRIMARY KEY,
	MobileNumber bigint UNIQUE,
	ServiceProvider varchar(30),
	LandlineNumber bigint UNIQUE
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LandlieNumber để quan sát lỗi
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (101, 983345674, 'Alex', NULL)
GO
--Tạo bảng PhoneExpeses có một CHECT ở mỗi cột Amount
CREATE TABLE PhoneExpenses(
	Expenses_ID int PRIMARY KEY,
	MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone(MobileNumber)
	Amount bigint CHECK (Amount >0)
)
GO
--Chỉnh sửa cột trong bảng
ALTER TABLE ContactPhone
	ALTER COLUMN ServiceProvider
GO
--Thêm một ràng buộc vào bảng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--Xóa một ràng buộc
ALTER TABLE Person ContactPhone
	DROP CONSTRAINT CHK_RC