USE EmployeeDB
GO

SET IDENTITY_INSERT Department ON;
INSERT INTO Department(DepartID,DepartName,Decription) VALUES(100,'Marketing','Marketing')
INSERT INTO Department(DepartID,DepartName,Decription) VALUES(101,'Dau tu','Len ke hoach dau tu')
INSERT INTO Department(DepartID,DepartName,Decription) VALUES(102,'Phat trien san pham','Tao ra san pham moi')
SET IDENTITY_INSERT Department ON;

SET IDENTITY_INSERT Employee ON;
INSERT INTO Employee (EmpCode,FirstName,LastName,Birtday,Gender,Address,DepartID,Salary) VALUES('7079','Nguyen','Huu Cao','2000-12-1',1,'Ha Noi',100,1000)
INSERT INTO Employee (EmpCode,FirstName,LastName,Birtday,Gender,Address,DepartID,Salary) VALUES('7078','Nong','Duc Manh','2000-6-1',1,'Ha Noi',101,1008)
INSERT INTO Employee (EmpCode,FirstName,LastName,Birtday,Gender,Address,DepartID,Salary) VALUES('7077','Vu','Van Dai','2000-7-1',1,'Ha Noi',102,1009)
SET IDENTITY_INSERT Employee ON;



