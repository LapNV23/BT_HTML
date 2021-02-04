--Bài 1: Tạo CSDL--
Create database Selling_Point
GO
USE Selling_Point
GO
--Bài 2: Tạo Bảng:
Create table Categories
(
CateID char(6) primary key,
CateName nvarchar(100),
Description nvarchar(200)
)
GO
Drop table Categories
Create table Parts
(
PartID int identity primary key,
PartName nvarchar(100),
CateID char(6),
Description nvarchar(1000),
Price money,
Quantity int default'0',
Warranty int default'1',
Photo nvarchar(200) default'photo/nophoto.png',
CONSTRAINT kk FOREIGN KEY (CateID) REFERENCES Categories(CateID)
)
GO
Drop table Parts
--Bài 3: Insert 
INSERT INTO Categories (CateID,CateName,Description)
	Values (101,'RAM',N'Bộ nhớ chính của máy tính'),
		   (102,'CPU',N'Bộ xử lí lý trung tâm'),
		   (103,'Monitor','Màn hình máy tính')
GO
Select * from Categories
INSERT INTO Parts (PartName,CateID,Description,Price)
	Values (N'Bộ nhớ chính',101,N'thành phần quan trọng của máy tính, được sử dụng để lưu trữ chương trình, phục vụ quá trình xử lí của CPU',110),
		   (N'Bộ nhớ ngoài',102,N'Thiết bị lưu trữ giúp dữ liệu không bị mất khi tắt máy',90),
		   (N'Màn hình máy tính',103,N'Thiết bị điện tử gắn liền với máy tính với mục đích chính là hiển thị và giao tiếp giữa người sử dụng với máy tính',200)
GO
Select * from Parts
--Bài 4:

Select * from Parts
Where Price > 100
GO
--Bài 5:

SELECT c.CateName,p.PartName
FROM Categories c
JOIN Parts p ON p.CateID=c.CateID
WHERE c.CateName='CPU'
GO
--Bài 6:

CREATE VIEW V_Parts AS
SELECT P.PartID, P.PartName, C.CateName, P.Price, P.Quantity
FROM Parts P
JOIN Categories C ON C.CateID=P.CateID
GO
Select * from V_Parts

--Bài 7:
INSERT INTO Categories (CateID,CateName,Description)
	Values (104,'Mouse',N'Chuột máy tính'),
		   (105,'Compact Disc',N'Đĩa CD'),
		   (106,'USB',N'Một chuẩn kết nối tuần tự đa dụng trong máy tính')
GO
Select * from Categories
INSERT INTO Parts (PartName,CateID,Description,Price)
	Values (N'Chuột máy tính',104,N'Một thiết bị ngoại vi của máy tính dùng để điều khiển và làm việc với máy tính',80),
		   (N'Đĩa CD',105,N'Một trong các loại đĩa quang, chúng thường chế tạo bằng chất dẻo, đường kính 4,75 inch, dùng phương pháp ghi quang học để lưu trữ khoảng 80 phút âm thanh hoặc 700 MB dữ liệu máy tính đã được mã hóa theo kỹ thuật số',70),
		   (N'Thiết bị USB',106,N'USB được thiết kế để chuẩn hóa kết nối của thiết bị ngoại vi với máy tính cá nhân để giao tiếp và cung cấp năng lượng điện',50)
GO
Select * from Parts
