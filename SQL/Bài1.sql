--Bài 1
USE AdventureWorks2019
GO

CREATE TABLE Product3(
STT int identity,
Name varchar(100),
description varchar(50),
Unit varchar(20),
Price money
)
GO
SELECT *FROM Product3
GO

INSERT INTO Product3(Name,Description,Unit, Price) values ('May Tinh T450','New','Piece',$1000)
INSERT INTO Product3(Name,Description,Unit, Price) values ('Dien thoai Nokia5670','Hot','Piece',$400)
INSERT INTO Product3(Name,Description,Unit, Price) values ('May In Samsung 450','Nomar','Piece',$100)
GO


CREATE TABLE  Category_one3(
STT int identity,
Species varchar(50)
)
GO

INSERT INTO Category_one3 (Species) VALUES ('MAY TINH'),('DIEN THOAI'),('MAY IN')
GO

SELECT * FROM Category_one3
GO

CREATE TABLE Order_one3(
Code_order int,
Name_order varchar(50),
address nvarchar (199),
Number_Phone int,
Date_order datetime
)
GO

SELECT * FROM Order_one3
Go

INSERT INTO Order_one3(Code_order,Name_order,address,Number_Phone,Date_order)VALUES (123,'Nguyen Van An','111 Nguyen Trai, Thanh Xuan, Ha Noi', 987654321,2021/01/22)
Go

CREATE TABLE OrderDetails(
description varchar(50),
Price money,
)
GO

Drop table OrderDetails
Go

INSERT INTO [OrderDetails] (description, Price) VALUES ('NEW',$1000), ('HOT',$200), ('NOMAR',$100)
GO

SELECT * FROM OrderDetails
GO


CREATE TABLE Customer(
Name_order varchar(50),
address nvarchar (199),
Number_Phone int,
)
Go

INSERT INTO Customer (Name_order,address,Number_Phone) VALUES ('Nguyen Van An','111 Nguyen Trai, Thanh Xuan, Ha Noi', 987654321)
GO

SELECT * FROM Customer
GO

