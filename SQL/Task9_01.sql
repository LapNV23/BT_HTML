﻿USE AdventureWorks2019
GO
--Tạo 1 thủ tục lưu trữ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là 1 năm
Create procedure sp_DisplayEmployeesHireYear
@HireYear int
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO
--Để chạy thủ tục này cần phải truyền tham số vào là năm nhân viên vào là
Exec sp_DisplayEmployeesHireYear 2003
GO

--Tạo thủ tục lưu trữ đếm số người vào làm trong 1 năm xác định có tham số đầu là một năm,
--Tham số đầu ra là số người vào làm trong năm nay
Create procedure sp_EmployeesHireYearCount
@HireYear int,
@Count int OUPUT
AS
Select @Count=COUNT(*) From HumanResources.Employee
where Datepart(YY, HireDate)=@HireYear
GO
--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu vào và một tham số đầu ra
Declare @Number int
Exec sp_EmployeesHireYearCount 2003, @Number OUTPUT
Print @Number
GO

--Tạo thủ tục lưu trữ đếm số người vào làm trong 1 năm xác định có tham số đầu vào là một năm, hàm trả về số người vào làm năm đó
Create procedure sp_EmployeesHireYearCout2
@HireYear int
AS
DECLARE @Count int
Select @Count=COUNT(*) From HumanResources.Employee
where datepart(YY, HireDate)=@HireYear
Return @Count
Go
--Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu và lấy về số người làm trong năm đó 
Declare @Number int
Exec @Number = sp_EmployeesHireYearCount2 2003
Print @Number
GO

--Tạo bảng tạm #Students
Create table #Students
(
RollNo varchar(6) CONSTRAINT PK_Students Primary Key,
FullName nvarchar(100),
Birthday datetime constraint DF_StudentsBirthday Default 
Dateadd(YY, -18, GetDATE())
)
GO
--Tạo thủ tục lưu trữ tạm để chèn dữ liệu vào bảng tạm
Create procedure #spInsertStudents
@rollNo varchar(6),
@fullName nvarchar(100),
@birthday datetime
AS Begin
	IF(@birthday IS NULL)
		SET @birthday=DATEADD(YY, -18, GETDATE())
	Insert into #Students(RollNo, FullName, Birthday)
		Values(@rollNo, @fullName, @birthday)
END
GO
--Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
Exec #spStudents 'A12345', 'abc', NUll
Exec #spStudents 'A54321', 'abc', '12/24/2011'
SELECT * FROM #Students
--Tạo thủ tục lưu trữ tạm để xóa dữ liệu từ bảng tạm theo RollNo
CREATE PROCEDURE #spDeleteStudents
@rollNo varchar(6)
AS BEGIN
DELETE FROM #Students WHERE RollNo=@rollNo
END
--Xóa dữ liệu sử dụng thủ tục lưu trữ
EXECUTE #spDeleteStudents 'A12345'
GO

--Tạo một thủ tục lưu trữ sử dung lệnh RETURN để trả về một số nguyên
CREATE PROCEDURE Cal_Square @num int=0 AS
BEGIN
RETURN (@num * @num);
END
GO
--Chạy thủ tục lưu trữ
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square;
GO

--Xem định nghĩa thủ tục lưu trữ bằng hàm OBJECT_DEFINITION
SELECT
OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalI
nfo')) AS DEFINITION

--Xem định nghĩa thủ tục lưu trữ bằng
SELECT definition FROM sys.sql_modules
WHERE
object_id=OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')
GO

--Thủ tục lưu trữ hệ thống xem các thành phần mà thủ tục lưu trữ phụ
thuộc
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO

USE AdventureWorks
GO
--Tạo thủ tục lưu trữ sp_DisplayEmployees
CREATE PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
GO
--Thay đổi thủ tục lưu trữ sp_DisplayEmployees
ALTER PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
WHERE Gender='F'
GO
--Chạy thủ tục lưu trữ sp_DisplayEmployees
EXEC sp_DisplayEmployees
GO

--Xóa một thủ tục lưu trữ
DROP PROCEDURE sp_DisplayEmployees
GO

--
CREATE PROCEDURE sp_EmployeeHire
AS
BEGIN
--Hiển thị
EXECUTE sp_DisplayEmployeesHireYear 1999
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 1999, @Number OUTPUT
PRINT N'Số nhân viên vào làm năm 1999 là: ' +
CONVERT(varchar(3),@Number)
END
GO
--Chạy thủ tục lưu trữ
EXEC sp_EmployeeHire
GO

--Thay đổi thủ tục lưu trữ sp_EmployeeHire có khối TRY ... CATCH
ALTER PROCEDURE sp_EmployeeHire
@HireYear int
AS
BEGIN
BEGIN TRY
EXECUTE sp_DisplayEmployeesHireYear @HireYear
DECLARE @Number int
--Lỗi xảy ra ở đây có thủ tục sp_EmployeesHireYearCount chỉ

truyền 2 tham số mà ta truyền 3

EXECUTE sp_EmployeesHireYearCount @HireYear, @Number OUTPUT,

'123'

PRINT N'Số nhân viên vào làm năm là: ' +

CONVERT(varchar(3),@Number)
END TRY
BEGIN CATCH
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
END CATCH
PRINT N'Kết thúc thủ tục lưu trữ'
END
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_EmployeeHire 1999
--Xem thông báo lỗi bên Messages không phải bên Result
GO

--Thay đổi thủ tục lưu trữ sp_EmployeeHire sử dụng hàm @@ERROR
ALTER PROCEDURE sp_EmployeeHire
@HireYear int
AS
BEGIN
EXECUTE sp_DisplayEmployeesHireYear @HireYear
DECLARE @Number int
--Lỗi xảy ra ở đây có thủ tục sp_EmployeesHireYearCount chỉ truyền 2 tham số mà ta truyền 3
EXECUTE sp_EmployeesHireYearCount @HireYear, @Number OUTPUT,
'123'
IF @@ERROR <> 0
PRINT N'Có lỗi xảy ra trong khi thực hiện thủ tục lưu trữ'
PRINT N'Số nhân viên vào làm năm là: ' +
CONVERT(varchar(3),@Number)
END
GO
--Chạy thủ tục sp_EmployeeHire
EXEC sp_EmployeeHire 1999
--Xem thông báo lỗi bên Messages không phải bên Result