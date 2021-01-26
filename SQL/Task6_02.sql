--Bài 1
Create table Product_02(
ProductId int,
Name varchar(40),
Description varchar(40),
Unit varchar(30),
Price money,
So_luong_hien_co int,
CatId int,
)
GO

Drop table Product_02
GO

Insert into Product_02(ProductId, Name, Description, Unit, Price, So_luong_hien_co) values(1, 'Laptop T450', 'Old', 'Piece', $1000, 10), (2, 'Smartphone', 'Hot', 'Piece', $200, 200), (3, 'May in SamSung 450', 'Normal', 'Piece', $100, 10)
GO

Select * from Product_02
GO

Create table Category_02(
CatId int,
Name varchar(30),
)
GO

Drop table Category_02
GO

Insert into Category_02(Name) values('Laptop'), ('Smartphone'), ('May in')
GO

Select * from Category_02
GO

Create table Brand_Products(
Brand_Id int,
Name varchar(10),
Adress varchar(20),
Telephone int,
)
GO

Drop table Brand_Products
GO

Insert into Brand_Products(Name, Adress, Telephone) values('Asus', 'USA', 983232), ('Dell', 'France', 983233), ('Gsad', 'England', 467364)
GO

Select * from Brand_Products
GO

Create table Order_Petails(
ProductId int,
Price money,
Qty int,
)
GO

Drop table Order_Petails
GO

Insert into Order_Petails(Price, Qty) values ($1000, 10), ($200, 200), ($100, 10)
GO

Select * from Order_Petails
GO

--Bài 2
Select * from Product_02
GO
Select * from Category_02
GO
Select * from Brand_Products
GO
Select * from Order_Petails
GO

--Bài 3
Insert into Category_02(Name) values('May Chieu')
GO

Select * from Category_02
GO

--Bài 4
--a:
Select Name from Brand_Products
GO
--b:
Select Name from Product_02
GO

--Bài 5
--A: Liệt kê danh sách theo thứ tự ngược lại alphabet
Select * from Brand_Products
Order by Name desc
GO
-- Liệt kê danh sách theo thứ alphabet
Select * from Brand_Products
Order by Name
GO
--B: liệt kê danh sách theo thứ tự giá giảm dần
Select * from Product_02
Order by Price desc
GO
--C: Hiển thị thông tin của nhãn hàng Arsu
Select * from Brand_Products
Where Name ='Asus'
GO
--D: Liệt kê danh sách nhỏ hơn 11
Select * from Product_02
Where So_luong_hien_co < 11
GO
--E: Liệt kê danh sách sản phẩm Asus
Select Name from Product_02
Go

--Bài 6:
--A: Số hãng sản phẩm mà cửa hàng có
Select Name from Brand_Products
GO
--B số mặt hàng mà cửa hàng bán
Select name from product_02
GO
--C tổng số loại sản phẩm của mỗi hãng có trong cửa hàng
Select sum(ProductId) from product_02
GO

--D tổng số đầu sản phẩm của toàn cửa hàng
Select sum(ProductId) from product_02
Where ProductId <= 1
GO