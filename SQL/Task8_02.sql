Create database Libary
Go
Create table BookSold(
BookSoldID int primary key,
CustomerID int,
Date datetime,
Price int,
Amount int,
)
GO
Create table Books(
BookCode int primary key,
Category varchar(50),
Author varchar(50),
Publisher varchar(50),
Title varchar(100),
Price int,
InStore int,
)
GO
Insert into Books(BookCode, Category, Author, Publisher, Title, Price, InStore) values(100, 'Tieu Thuyet', 'J.K.Rowling', 'HFB', 'Harry Potter', 300, 100)
Insert into Books(BookCode, Category, Author, Publisher, Title, Price, InStore) values(111, 'Van Hoc', 'Nam Cao', 'Kim Dong', 'Lao Hac', 250, 200)
Insert into Books(BookCode, Category, Author, Publisher, Title, Price, InStore) values(122, 'Van Hoc', 'Nguyen Du', 'Viet Nam', 'Truyen Kieu', 260, 198)
Insert into Books(BookCode, Category, Author, Publisher, Title, Price, InStore) values(133, 'Van Hoc', 'Nam Cao', 'Kim Dong', 'Chi Pheo', 245, 300)
Insert into Books(BookCode, Category, Author, Publisher, Title, Price, InStore) values(144, 'Van Hoc', 'Vu Trong Phung', 'Ha Nam', 'So Do', 132, 231)
GO
Create table Customers(
CustomerID int primary key,
CustomerName varchar(50),
Address varchar(100),
Phone varchar(12),
)
GO
Insert into Customers(CustomerID, CustomerName, Address, Phone) values(243, 'Nguyen Van Lap 1', 'Nam Tu Liem, Ha Noi', 0398408820)
Insert into Customers(CustomerID, CustomerName, Address, Phone) values(244, 'Nguyen Van Lap 2', 'Nam Tu Liem, Ha Noi', 09232434724)
Insert into Customers(CustomerID, CustomerName, Address, Phone) values(245, 'Nguyen Van Lap 3', 'Ha Dong, Ha Noi', 0936323622)
Insert into Customers(CustomerID, CustomerName, Address, Phone) values(246, 'Nguyen Van Lap 4', 'Dong Da, Ha Noi', 08273643265)
Insert into Customers(CustomerID, CustomerName, Address, Phone) values(247, 'Nguyen Van Lap 5', 'Thanh Xuan, Ha Noi', 093742233)
GO
Select * from Books
GO
Select * from Customers
Go