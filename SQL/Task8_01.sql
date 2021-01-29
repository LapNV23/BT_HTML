--Phần 1

--Bài 1:
Create database Lab11
GO
Use Lab11
Create View ProductList
As Select ProductID, Name from AdventureWorks2019.Production.Product
Select * from ProductList
GO
--Bài 2:
Create view SalesOrderDetail
As
	Select pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty, od.UnitPrice * od.OrderQty as [Total Price]
	from AdventureWorks2019.Sales.SalesOrderDetail od
	JOIN AdventureWorks2019.Production.Product pr
	ON od.ProductID=pr.ProductID
Select * from SalesOrderDetail
GO
--Bài 3: Code theo vd
--Tạo khung hình nhìn lấy ra thông tin cơ bản trong bảng Person.Contact
Use AdventureWorks2019

Create view V_Contact_Info AS
Select FirstName, MiddleName, LastName
From Person.Person
GO

--Tạo khung nhìn lấy ra thông tin về thông tin
Create view V_Employee_Contact AS
Select p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
From HumanResources.Employee e
Join Person.Person AS p ON e.BusinessEntityID=p.BusinessEntityID;
GO
--Xem một khung hình
Select * From V_Employee_Contact
GO

--Thay đổi khung hình V_Employee_Contact bằng cách viết thêm cột Birthdate 
Alter view V_Employee_Contact AS
Select p.FirstName, p.LastName, e.BusinessEntityID, e.Hiredate, e.Birthdate
From HumanResources.Employee e
Join Person.Person AS p ON e.BusinessEntityID=p.BusinessEntityID
Where p.FirstName like '%B%';
GO
Select * from V_Employee_Contact
GO

--Xóa 1 khung hình
Drop view V_Contact_Info
GO

--Xem định nghĩa khung hình V_Employee_Contact
Execute sp_helptext 'V_Employee_Contact'
GO

--Xem các thành phần mà khung nhìn phụ thuộc
Execute sp_depends 'V_Employee_Contact'
GO

--Tạo khung nhìn ẩn mà định nghĩa bị ẩn đi ( không xem được định nghĩa khung hình)
Create view OrderRejects
With Encryption
AS
Select PurchaseOrderID, ReceivedQty, RejectedQty, RejectedQty / ReceivedQty AS RejejectRatio, DueDate
From Purchasing.PurchaseOrderDetail
Where Rejectedqty / ReceivedQty > 0
And DueDate > Convert(DateTime, '20010630', 101);

-- Không xem được định nghĩa khung nhìn V_Contact_Info
sp_helptext 'OrderRejects'
GO

--Không xem được định nghĩa khung nhìn V_Contact_Info
sp_helptext 'OrderRejects'
GO

--Thay đổi khung nhìn thêm tùy chọn CHECK OPTIO
Alter view V_Employee_Contact AS
Select p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
From HumanResources.Employee e
Join Person.Person AS p ON e.BusinessEntityID=p.BusinessEntityID
where p.FirstName like 'A%'
With check option
GO
Select * from V_Employee_Contact
GO
--Cập nhật được khung nhìn khi FirstName bđ bằng kí tự 'A'
Update V_Employee_Contact SET FirstName='Atest' Where LastName='Amy'
--Khong cập nhật được khung nhìn FirstName khi bđ bằng kí tự khác 'A'
Update V_Employee_Contact SET FirstName='BCD' Where LastName='Atest'
GO

--Phải xóa khung nhìn trước
Drop view V_Employee_Info
GO

--Tạo Khung nhìn có giàn đồ
Create view V_Contact_Info With SCHEMABINDING AS
Select FirstName, MiddleName, LastName, EmailAddress
From Person.Contact
GO
--Tạo chỉ mục duy nhất trên cột EmailAddress trên khung nhìn V_Contact_Info 
Create unique Clustered Index IX_Contact_Email
ON V_Contact_Info(EmailAddress)
GO
-- Thực hiện đổi tên khung hình
exec sp_rename V_Contact_Info, V_Contact_Infomation
-- Truy vấn khung hình
Select * from V_Contact_Infomation
--Không thể thêm bản ghi vào khung hình vì có cột không cho phép NULL trong bảng Contact
Insert Into V_Contact_Infomation values ('ABC', 'DEF', 'GHI', 'abc@yahoo.com')
--Không thể xóa ghi của khung hình V_Contact_Infomation Vì bảng Person.Contact còn có các khóa ngoại
Delete from V_Contact_Infomation Where LastName='Gilbert' and FirstName='Guy'