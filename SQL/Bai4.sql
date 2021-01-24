--A--
CREATE TABLE Temp_one(
Name_order varchar(50),
Date_order datetime
)
Go



SELECT *FROM Temp_one
go
INSERT INTO Temp_one (Name_Order, Date_order)
	SELECT Name_order, Date_order FROM Order_one
go



--B--
CREATE TABLE List(
Species varchar(50)

)
Go

SELECT *FROM List
go

INSERT INTO List (Species)
	SELECT Species FROM Category_one
go


--C--
CREATE TABLE List_order_one(
Code_order int,
Name_order varchar(50),
address nvarchar (199),
Number_Phone int,
Date_order datetime
)
Go

SELECT *FROM List_order_one
go
INSERT INTO List_order_one(Code_order,Name_Order,address,Number_Phone, Date_order)
	SELECT Code_order,Name_Order,address,Number_Phone, Date_order FROM  Order_one
go