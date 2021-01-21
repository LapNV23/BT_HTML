create table BookLibary(
BookCode int primary key,
BookTitle varchar(100),
Author varchar(50),
Edition int,
BookPrice money,
Copies int,
)
go
select * from BookLibary
go
--tạo insert
insert into BookLibary values(101,'Hello My Friend','Meis',2020,$1200,5)
insert into BookLibary values(302,'Hello', 'Mei',2020,$120,5)
insert into BookLibary values(401,'My','Mes',2019,$2000,8)
go
--Tạo bảng Member
create table Member(
	MemberCode int primary key,
	Name varchar(50),
	Address varchar(100),
	PhoneNumber int,
)
GO
--Tạo insert 
insert into Member values(011,'Nguyen','Mieu Dam',0398408820)
insert into Member values(022,'Van','My Dinh',1234567890)
insert into Member values(033,'Lap','Me Tri',0987654321)
GO
SELECT * from Member
GO

--Tạo bảng danh sách mượn
create table IssueDetails(
	BookCode int,
	MemberCode int,
	IssueDate datetime,
	ReturnDate datetime,
	constraint ml foreign key (BookCode) references BookLibary(BookCode),
	constraint mk foreign key (MemBerCode) references Member(MemBerCode),
)
GO


--tao insert 
insert into IssueDetails values (2012/12/12,2012/12/12,101,202)
insert into IssueDetails values (2012/12/12,2012/12/12,302,451)
insert into IssueDetails values (2012/12/12,2012/12/12,150,102)
GO
select * from IssueDetails
GO
