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