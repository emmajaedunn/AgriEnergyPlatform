﻿-- Connect the Database
USE AgriEnergyConnect;
GO

-- Create Farmer table
CREATE TABLE Farmer (
    FarmerID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerName VARCHAR(100) NOT NULL,
    FarmerPNumber VARCHAR(100) NOT NULL
);
GO

-- Create Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    FarmerID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    ProductCategory VARCHAR(100) NOT NULL,
    ProductionDate DATE NOT NULL,
    FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID)
);
GO

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    EmployeePNumber VARCHAR(100) NOT NULL,
    EmployeeDepartment VARCHAR(100) NOT NULL
);
GO

-- Insert data into Farmer table
INSERT INTO Farmer (FarmerName, FarmerPNumber)
VALUES 
('James Johnson', '0726345567'),
('Charlie Cook', '0896378266'),
('Harry Holiday', '0762524398');
GO

SELECT * FROM Farmer;

-- Insert data into Products table
INSERT INTO Products (FarmerID, ProductName, ProductCategory, ProductionDate)
VALUES 
(1, 'Tomatoes', 'Vegetables', '2025-04-01'),
(2, 'Milk', 'Dairy', '2025-03-25'),
(3, 'Apples', 'Fruit', '2025-03-30');
GO

SELECT * FROM Products;

-- Insert data into Employees table
INSERT INTO Employees (EmployeeName, EmployeePNumber, EmployeeDepartment)
VALUES 
('Emma Edwards', '0976353267', 'Vegetables'),
('Larry Smith', '0845234990', 'Dairy'),
('Noah Adam', '0723489421', 'Fruit');
GO

SELECT * FROM Employees;

DROP TABLE Employees;

DROP TABLE Products;

DROP TABLE Farmer;

EXEC sp_help 'AspNetUsers';

SELECT COLUMN_NAME, IS_NULLABLE, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'AspNetUsers';

ALTER TABLE AspNetUsers DROP COLUMN Name;

SELECT FarmerName FROM AspNetUsers;

SELECT * FROM AspNetUsers;

ALTER TABLE AspNetUsers
ALTER COLUMN FarmerName VARCHAR(100) NULL;  -- Makes FarmerName nullable
ALTER TABLE AspNetUsers
ALTER COLUMN EmployeeName VARCHAR(100) NULL;  -- Makes EmployeeName nullable