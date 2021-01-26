--Bài 1:
CREATE TABLE Or_ID(
Name varchar(100),
Card_ID int,
description varchar(50),
Subscription_type varchar(77),
Tel int,
Date_ID datetime
)
GO
DROP TABLE Or_ID
GO

INSERT INTO Or_ID(Name,Card_ID,Description,Subscription_type,Tel,Date_ID) VALUES ('NGUYEN NGUYET NGA',123456789,'HA NOI','TRA TRUOC',123456789,12/12/02)
GO

SELECT * FROM Or_ID
GO
--Bài 2:
CREATE TABLE OR_ID
INSERT INTO OR_ID () VALUES ()
SELECT * FROM OR_ID
--Bài 3:
INSERT INTO OR_ID(Name) VALUES ('Nguyen Van Lap')
GO
SELECT * FROM OR_ID
GO
--Bài 4:
  
-----A------

SELECT * FROM OR_ID
GO

-----B------

SELECT Tel FROM OR_ID
GO
--Bài 5:
------A-----

SELECT * FROM OR_ID 
WHERE Tel like 0123456789
GO

-----B-----

SELECT * FROM OR_ID
WHERE Card_ID LIKE 123456789E
GO

-----C------

SELECT * FROM OR_ID
WHERE Tel like 0123456789
GO

-----D-----
SELECT * FROM OR_ID
WHERE Date_ID like 12/12/12
GO

-----D-----
SELECT * FROM OR_ID
WHERE description LIKE 'HA NOI'
GO
--Bài 6:
  
-----A-----

SELECT Name FROM OR_ID
GO

-----B-----

SELECT Tel FROM OR_ID
GO


-----C------

SELECT Date_ID FROM OR_ID
GO

-----D-----

SELECT * FROM OR_ID
GO