
/*			
			SQL Project Name : Hospital Management Systems 
			    Trainee Name : Yasin Arafat  
		    	  Trainee ID : 1279076     
				    Batch ID : WADA/PNTL-A/56/01 

																											*/
--=====================   START OF DDL SCRIPT   ==========================--


USE MASTER
GO

DROP DATABASE IF EXISTS dbHospitalManagement
GO

--- CREATE DATABASE
/************************************************************************************************/
CREATE DATABASE dbHospitalManagement
ON
( 
	NAME = dbHospitalManagement_data, 
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbHospitalManagement_data.mdf', 
	SIZE = 50mb, 
	MAXSIZE = 100mb, 
	FILEGROWTH = 10mb 
)
LOG ON 
( 
	NAME = dbHospitalManagement_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbHospitalManagement_log.ldf', 
	SIZE = 15MB, 
	MAXSIZE = 30MB, 
	FILEGROWTH = 5% 
)
GO

USE dbHospitalManagement
GO
-- -----------------------------------------------------
-- 1. Table dbo.Doctors
-- -----------------------------------------------------
CREATE TABLE dbo.Doctors
(
	DoctorsID INT IDENTITY PRIMARY KEY NOT NULL ,
	DoctorName VARCHAR(50) NOT NULL,
	DoctorDepartment VARCHAR(30) NOT NULL,
	DoctorGender VARCHAR(10) NOT NULL,
	DoctorCharge MONEY NOT NULL,
	DoctorImage  VARCHAR(MAX) NOT NULL DEFAULT 'N/A',
	Phone VARCHAR(11) NOT NULL,
	Email VARCHAR(30) NULL
)
GO

-- -----------------------------------------------------
-- 2. Table dbo.Staff
-- -----------------------------------------------------
CREATE TABLE dbo.Staff
(
	StaffID INT IDENTITY NOT NULL,
	StaffName VARCHAR(30) NOT NULL,
	StaffAddress VARCHAR(100) NOT NULL,
	StaffCity VARCHAR(20) NOT NULL,
	StaffCountry VARCHAR(30) NULL,
	Birthdate DATE  NOT NULL,
	Hiredate DATE NOT NULL,
	NID CHAR(13) NOT NULL UNIQUE CHECK(NID LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	EmpImage  VARCHAR(MAX) NOT NULL DEFAULT 'N/A',
	Phone VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NULL,
	Salary MONEY
)
GO

-- -----------------------------------------------------
-- 3. Table dbo.PatientsInfo
-- -----------------------------------------------------
CREATE TABLE dbo.PatientsInfo
(
	PatientsID INT IDENTITY PRIMARY KEY NOT NULL,
	PatientName VARCHAR(50) NOT NULL,
	PatientAge	INT NOT NULL,
	PatientGender VARCHAR(10) NOT NULL,
	PatientAddress	VARCHAR(50) NOT NULL,
	City VARCHAR(20) NULL ,
	Country VARCHAR(20) NULL,
	PhoneNo VARCHAR(11) NULL,
	Email VARCHAR(30) NULL
)
GO

-- -----------------------------------------------------
-- 4. Table dbo.PatientAppointment
-- -----------------------------------------------------
CREATE TABLE dbo.PatientAppointment
(
	AppointmentID INT IDENTITY PRIMARY KEY NOT NULL,
	Appointmentdate DATE NOT NULL, 
	Pid INT REFERENCES dbo.PatientsInfo(PatientsID),
	DrID INT REFERENCES dbo.Doctors(DoctorsID)
)
GO

-- -----------------------------------------------------
-- 5. Table dbo.LabTest
-- -----------------------------------------------------
CREATE TABLE dbo.LabTest 
(
	TestID INT IDENTITY PRIMARY KEY NOT NULL,
	TestName VARCHAR(25) NOT NULL,
	MinValue VARCHAR(15) DEFAULT 'N/A',
	MaxValue VARCHAR(15) DEFAULT 'N/A',
	CalUnit VARCHAR(30) NULL,
	TestCharge MONEY NOT NULL
)
GO

-- -----------------------------------------------------
-- 6. Table dbo.PatientLabReport
-- -----------------------------------------------------
CREATE TABLE dbo.PatientLabReport 
(
	PatientLabReportID INT PRIMARY KEY IDENTITY NOT NULL,
	PatID INT REFERENCES dbo.PatientsInfo(PatientsID),
	LabTestName INT REFERENCES dbo.LabTest(TestID),
	testValue VARCHAR(15) NOT NULL,
	TestDate DATETIME,
	Comment VARCHAR(45) DEFAULT 'NULL'
)
GO

-- -----------------------------------------------------
-- 7. Table dbo.Disease
-- -----------------------------------------------------
CREATE TABLE dbo.Disease
(
	DiseaseID INT IDENTITY PRIMARY KEY NOT NULL,
	DiseaseName VARCHAR(30) NOT NULL
)
GO

-- -----------------------------------------------------
-- 8. Table dbo.PatientDetails
-- -----------------------------------------------------
CREATE TABLE dbo.PatientDetails
(
	Patientid INT IDENTITY NOT NULL,
	[name] INT REFERENCES dbo.PatientsInfo(PatientsID),
	ConsultantDoctorID INT REFERENCES dbo.Doctors(DoctorsID),
	testReprt INT REFERENCES dbo.PatientLabReport(PatientLabReportID),
	Comment INT REFERENCES dbo.Disease(DiseaseID) 
)
GO

-- -----------------------------------------------------
-- 9. Table dbo.Bill
-- -----------------------------------------------------
CREATE TABLE dbo.Bill
(
	BillNo UNIQUEIDENTIFIER DEFAULT NEWID(),
	BillingPatientID INT REFERENCES dbo.PatientsInfo(PatientsID),
	DoctorCharge MONEY,
	LabCharge MONEY,
	Discount DECIMAL(4,2)DEFAULT '0.10',
	BillingDate DATETIME
)
GO

--============     ALTER TABLE (ADD, DELETE COLUMN, DROP COLUMN)   ===============--

ALTER TABLE dbo.Staff
ADD [Shift] VARCHAR(10)
GO
--DELETE COLUMN FROM A EXISTING TABLE
ALTER TABLE dbo.Staff
DROP COLUMN [Shift]
GO

--DROP A TABLE
DROP TABLE dbo.Staff
GO

--CREATING INDEX, VIEW, STORED PROCEDURE, FUNCTIONS, TRIGGERS--

--INDEX
--CREATING A NON-CLUSTERED INDEX FOR CUSTOMER TABLE
CREATE UNIQUE NONCLUSTERED INDEX IX_Doctors
ON Doctors(DoctorsID)
GO

--VIEW 
--Create a view to update, insert and delete data from base table
CREATE VIEW V_LabTest 
AS
SELECT * FROM dbo.LabTest
GO

--STORED PROCEDURE
CREATE PROC sp_PatientsInfo
WITH ENCRYPTION
AS
SELECT * FROM PatientsInfo
WHERE City='Dhaka'
GO

--Inserting DATA useing Stored Procedure
CREATE PROC sp_InsertPatientsInfo
								@PatientsName VARCHAR(50),
								@PatientAge	INT,
								@PatientGender VARCHAR(10),
								@PatientAddress	VARCHAR(50),
								@City VARCHAR(20),
								@Country VARCHAR(20),
								@PhoneNo VARCHAR(11),
								@Email VARCHAR(30)
AS
BEGIN
	INSERT INTO PatientsInfo(PatientName,PatientAge,PatientGender,PatientAddress,City,Country,PhoneNo,Email)
	VALUES(@PatientsName,@PatientAge,@PatientGender,@PatientAddress,@City,@Country,@PhoneNo,@Email)
END
GO

--Stored Procedure With One Parameter
CREATE PROCEDURE sp_PatientsInfo @City nvarchar(30)
AS
SELECT * FROM PatientsInfo WHERE City = @City
GO

--Delete Procedure
drop proc sp_PatientsInfo
GO


--============UDF FUNCTIONS ==============

--1.Scalar valued function:
CREATE FUNCTION fn_Bill(@BillNo UNIQUEIDENTIFIER)
RETURNS MONEY
AS
	BEGIN
		DECLARE @total MONEY
		SELECT @total=(DoctorCharge+LabCharge) FROM Bill
		WHERE BillNo=@BillNo
		RETURN @total
	END	
GO

--2. SINGLE STATEMENT TABLE VALUED FUNCTION
CREATE FUNCTION fn_totalAppointmentOfDoctors(@month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	COUNT(Pid) 'Total Patient',DrID
	FROM PatientAppointment
	WHERE MONTH(AppointmentID)=@month
	GROUP BY DrID
)
GO

--====================   TRIGGERS   ==============================--
--AFTER TRIGGER FOR NOT DELETING ANY DATA FROM ORDERS DATA
CREATE TRIGGER tr_Disease
ON Disease
FOR DELETE
AS
	BEGIN
			PRINT'YOU CAN NOT DELETE DATA'
			ROLLBACK TRANSACTION
	END
GO

-- Create trigger on Doctors table 

CREATE TRIGGER trinsertDoctors
ON dbo.Doctors
INSTEAD OF INSERT
AS
BEGIN
		INSERT INTO Doctors(DoctorName,DoctorDepartment,DoctorGender,DoctorCharge,DoctorImage,Phone,Email)
		SELECT DoctorName,DoctorDepartment,DoctorGender,DoctorCharge,DoctorImage,Phone,Email FROM inserted
END
GO
