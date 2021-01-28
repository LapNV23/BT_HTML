--1. Tạo csdl 
Create Database Lab10
GO
--2. Sao lưu dữ liệu
use AdventureWorks2019

Select * into Lab10.dbo.WorkOrder From Production.WorkOrder
--3. Sao lưu từ table WorkOrder của Lab10 sang WorkOrderIX của Lab10
use Lab10
Select * into WorkOrderIX from WorkOrder
GO
--4. Select dữ liệu 2 table
Select * From WorkOrder
GO
Select * from WorkOrderIX
GO
--6. Tạo 1 chỉ mục trên cột WorkOrderID của bảng WorkOrderID
Create Index IX_WorkOrderID ON WorkOrderIX(WorkOrderID)
--7.
Select * from WorkOrder Where WorkOrderID=72000
Select * from WorkOrderIX Where WorkOrderID=72000