USE Master
GO
IF EXISTS (SELECT * FROM sys.databases WHERE Name='EmployeeDB')
DROP DATABASE EmployeeDB
GO
CREATE DATABASE EmployeeDB
GO
USE EmployeeDB
GO
CREATE TABLE Department(
	DepartID INT IDENTITY (1, 1) PRIMARY KEY,
	DepartName VARCHAR(50) NOT NULL,
	Decription VARCHAR(100) NOT NULL,
)
CREATE TABLE Employee(
	EmpCode CHAR(6) PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Birtday SMALLDATETIME NOT NULL,
	Gender BIT DEFAULT 1,
	Address VARCHAR(100),
	DepartID INT,
	Salary MONEY,
	FOREIGN KEY (DepartID) REFERENCES Department(DepartID)
)

--cau 2
UPDATE Employee
SET Salary = Salary * 1.1;
--cau3
ALTER TABLE Employee
ADD CONSTRAINT CK_Salary CHECK (Salary > 0);
--cau4
create trigger TG_CheckBirthday
on Employee
after update, insert
as
begin
    declare @dayOfBirthDay date;
	select @dayOfBirthDay  = inserted.Birthday from inserted;

	if(Day(@dayOfBirthDay) <= 23 ) 
	begin
	    print 'Day of birthday must be greater than 23!';
		rollback transaction;
	end
end
go
--cau5
 create nonclustered index IX_DepartmentName
 on Department(DepartName)
 go
 --cau8
 create procedure sp_delDept(@empCode char(6))
 as 
 begin
   if (select count (*) from Employee where Employee.Empcode = @empCode) > 0
   begin
      delete from Employee
	  where EmpCode = @empCode
   end
   else
   begin
      print 'Dont find employee!';
	  rollback transaction;
   end
 end
 exec sp_delDept @empCode = 'E001'
 go