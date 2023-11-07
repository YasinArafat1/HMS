/*			
			SQL Project Name : Hospital Management Systems 
			    Trainee Name : Yasin Arafat  
		    	  Trainee ID : 1279076     
				    Batch ID : WADA/PNTL-A/56/01 								*/

--===============     START OF DML SCRIPT     ==================--
USE dbHospitalManagement
GO


/*INSERTING DATA INTO TABLE (Normal Insert Into)*/

-- INSERT DATA INTO TABLE dbo.Doctors
INSERT INTO dbo.Doctors 
VALUES
('Dr. Mir Habibur Rahman','Dental Surgeon','MALE',1500,'N/A','01711825787','habibur@gmail.com'),
('Dr. Khandaker ABM Abdullah Al Hasan','Cancer ','MALE',1500,'N/A','01980346737','hasan@gmail.com'),
('Dr. Mir Mosarraf Hossain','Endocrinology ','MALE',1000,'N/A','01365421156','mosarraf@gmail.com'),
('Dr. Joysree Saha','Medicine','FEMALE',1000,'N/A','01457532897','joysree@gmail.com'),
('Dr. Farzana Sharmin Shuvra','Gynecology','FEMALE',1500,'N/A','01876904586','farzana@gmail.com'),
('Dr. Sohely Rahman','Neuromedicine ','FEMALE',1500,'N/A','01678549009','sohely@gmail.com'),
('Dr. Ahmed Tanjimul Islam','Orthopedics','MALE',1000,'N/A','01768432898','tanjimul@gmail.com'),
('Dr. Rezwanur Rahman','Chronic Kidney Disease','MALE',1000,'N/A','01678543976','rezwanur@gmail.com'),
('Dr. Md. Robed Amin','Orthopedics','MALE',1000,'N/A','01776525096','robed@gmail.com'),
('Dr. Anjuman Ara Begum','Gynecology','FEMALE',1200,'N/A','01711825787','anjum@gmail.com'),
('Dr. Farzana Sharmin Shuvra','Arthritis','FEMALE',1000,'N/A','01725976547','farjana@gmail.com'),
('Dr. Abdullah Al Jamil','Cardiology','MALE',1200,'N/A','01784562142','jamil@gmail.com'),
('Dr. Abu Reza Mohammad','Internal Medicine','MALE',1000,'N/A','01712589314','reja@gmail.com'),
('Dr. Ahmed Zahid Hossain','Pediatric Surgeon','MALE',1200,'N/A','01415689412','zahid@gmail.com'),
('Dr. ATM Samdani','Urology','MALE',1200,'N/A','01713377773','samdani@gmail.com'),
('Dr. Hiramoni Sarma','Eye ','FEMALE',1200,'N/A','01713377775','hiramoni@gmail.com'),
('Dr. Kazi Ali Hassan','Diabetes & Endocrine','MALE',1200,'N/A','01713141447','kazi@gmail.com')
GO

SELECT * FROM dbo.Doctors
GO

-- INSERT DATA INTO TABLE dbo.PatientsInfo
INSERT INTO dbo.PatientsInfo
VALUES
('Arman Hossain',34,'MALE','Sadarghat','Dhaka','Bangladesh','01755819004','arman@gmil.com'),
('Saddam Hossain',28,'MALE','Rampura','Barisal','Bangladesh','01773927407','hossain@gmil.com'),
('Imam Masum',38,'MALE','Badda','Shylet','Bangladesh','01755819005','imam@gmil.com'),
('Shihab Hossain',43,'MALE','Greenroad','Bangladesh','Bangladesh','01755819007','shihab@gmil.com'),
('Arafat Rimon',52,'MALE','Framgate','Rangpur','Bangladesh','01659827504','arafat@gmil.com'),
('Tanzil Islam',45,'FEMALE','Mirpur','Rajshahi','Bangladesh','01773929803','tanzil@gmil.com'),
('Sifat-e Islam',48,'MALE','Mohammadpur','Jossore','Bangladesh','01357549075','sifat@gmil.com'),
('Sohel Mia',43,'MALE','Gulshan','Faridpur','Bangladesh','01759581900','sohel@gmil.com'),
('Jannanul Islam',40,'FEMALE','Jatrabari','Cumilla','Bangladesh','01754295636','jannatul@gmil.com'),
('Mainul Islam',29,'MALE','Wari','Dhaka','Bangladesh','01753859217','mainul@gmil.com'),
('Al-Amin Hoq',41,'MALE','Greenroad','Dhaka','Bangladesh','01555532236','amin@gmil.com'),
('Musharraf Ariful',45,'MALE','Mohammadpur','Dhaka','Bangladesh','01711464671','ariful@gmil.com'),
('Tahsin Islam',42,'MALE','Mirpur','Dhaka','Bangladesh','01711464671','tahsin@gmil.com')
GO

SELECT * FROM dbo.PatientsInfo
GO
SELECT * FROM dbo.Doctors
GO
-- INSERT DATA INTO TABLE dbo.PatientAppointment
INSERT INTO dbo.PatientAppointment
VALUES
('02/03/2022',3,2),
('05/13/2022',3,6),
('02/12/2022',2,3),
('02/09/2022',1,5),
('02/17/2022',3,6),
('02/03/2022',2,3),
('02/11/2022',6,3),
('02/07/2022',8,7),
('02/03/2022',4,8),
('02/05/2022',9,4),
('02/03/2022',7,8),
('02/06/2022',3,6)
GO

SELECT * FROM dbo.PatientAppointment
GO

-- INSERT DATA INTO TABLE dbo.LabTest
INSERT INTO dbo.LabTest
VALUES
('Insulin','75' , '95' , 'mg/dL',450),
('Immunoglobulin M', '231' ,'1411', 'mg/dL',1200),
('AFB Blood Culture', '1000', '9000','Count',1800),
('Blood Pressure','85','120','mm HG',200),
('Hepatitis A IgG','200','500','mg/dL',600),
('GALA Gene Test', '150' , '300' , 'Count',500),
('EJ antibodies','30','60','%',2000),
('Cancer Gene 1','10','30','%',2500),
('Zika virus PCR','5','10','count',1500),
('R0-52 antibodies','40','50','%',2200),
('Hemoglobin','13.0','17.0','g/dL',250),
('Bilirubin','0 ','0.3','mcmol/L',540),
('Creatinine','0.7 ','1.2',' mg/dL',640),
('Gastrin','0','180','pg/mL',1200)
GO

SELECT * FROM dbo.LabTest
GO

-- INSERT DATA INTO TABLE dbo.PatientLabReport
INSERT INTO dbo.PatientLabReport
VALUES 
(2,1,'78 mg/dl','02-12-2022','Not Affected'),
(5,3,'1245 mg/dl','02-15-2022','Not Affected'),
(6,1,'105 mg/dl','02-12-2022','Affected'),
(7,4,'80/120 mm Hg','02-12-2022','Not Affected'),
(1,5,'450 mg/dl','02-12-2022','Not Affected'),
(9,6,'140','03-05-2022','Not Affected'),
(5,1,'120 mg/dl','02-16-2022','Affected'),
(8,2,'851 mg/dl','04-17-2022','Not Affected'),
(10,4,'100/150 mg/dl','02-22-2022','High Pressure'),
(8,5,'780 mg/dl','02-17-2022','Affected'),
(1,12,'0.5 mcmol/L','04-05-2022','Affected'),
(2,12,'0.5 mcmol/L','02-02-2022','NULL'),
(5,6,'210','02-02-2022','NULL')
GO

SELECT * FROM dbo.PatientLabReport
GO

-- INSERT DATA INTO TABLE dbo.Disease
INSERT INTO dbo.Disease
VALUES
('Allergy'),
('Arthritis'),
('Common cold'),
('Ear infection'),
('Erectile dysfunction'),
('Heart disease'),
('Hepatitis'),
('Kidney stone disease'),
('Lung  Disease'),
('Lupus erythematous'),
('Migraine'),
('Otitis'),
('Rabies'),
('Repetitive strain injury'),
('Rheumatic fever'),
('Stomach Disease'),
('Tooth  Disease'),
('Tumor'),
('Ulcers'),
('Viral fever')
GO

SELECT * FROM dbo.Disease
GO

-- INSERT DATA INTO TABLE dbo.PatientDetails
INSERT INTO dbo.PatientDetails
VALUES
(5,4,2,20),
(2,3,1,16),
(6,4,1,11)
GO

SELECT * FROM DBO.PatientDetails
GO

-- INSERT DATA INTO TABLE dbo.Bill
INSERT INTO dbo.Bill
VALUES
(NEWID(),2,1000,450,DEFAULT,'02-12-2022'),
(NEWID(),5,1000,1800,DEFAULT,'03-15-2022'),
(NEWID(),6,1000,200,DEFAULT,'02-16-2022'),
(NEWID(),8,1500,1200,DEFAULT,'03-11-2022')
GO

SELECT * FROM dbo.Bill
GO

--INSERTING DATA via Store Procedure
EXEC sp_InsertPatientsInfo 'Mizanur Rahman',25,'MALE','Mirpur','Dhaka','Bangladesh','01987564721','mizan@gmail.com'
EXEC sp_InsertPatientsInfo 'Omar Farukh',35,'MALE','Gulshan','Dhaka','Bangladesh','01956816589','farukh@gmail.com'
EXEC sp_InsertPatientsInfo 'Nur Alam',35,'MALE','Saidpur','Nilphamary','Bangladesh','01948621691','nur@gmail.com'
EXEC sp_InsertPatientsInfo 'Rehana Begum',39,'FEMALE','Badda','Dhaka','Bangladesh','01685712398','rehana.com'
EXEC sp_InsertPatientsInfo 'Jaima Islam',45,'FEMALE','Mohammadpur','Dhaka','Bangladesh','01986712594','jaima@gmail.com'
EXEC sp_InsertPatientsInfo 'Niloy Khandakar',32,'MALE','Azimpur','Dhaka','Bangladesh','01941789325','niloy@gmail.com'

select * from PatientsInfo
go

--JOIN QUARY TO FIND OUT PATIENTS DOCTOR NAME
SELECT p.Patientid,p2.PatientName,d.DoctorName,d.DoctorDepartment FROM PatientDetails p
INNER JOIN PatientsInfo p2 ON p2.PatientsID =p.Patientid
INNER JOIN Doctors d ON d.DoctorsID=p.PatientID
GO

SELECT pf.PatientName,d.DoctorName,pd.Comment FROM PatientDetails pd
INNER JOIN PatientsInfo pf on pf.PatientsID=pd.Patientid
INNER JOIN Doctors d on d.DoctorsID=pd.ConsultantDoctorID
GO

--SUBQUERY TO FIND OUT Appointment OF A SPECIFIC Patient
SELECT * 
FROM Doctors
WHERE DoctorsID IN (SELECT DoctorsID FROM PatientDetails)
GO

--CASE
SELECT  
CASE
	WHEN (DoctorCharge+LabCharge)>= 2500
		THEN '25% DISCOUNT'
	WHEN (DoctorCharge+LabCharge)>= 2000
		THEN '20% DISCOUNT'
	ELSE 'DEFAULT DISCOUNT'
END AS Discount
FROM dbo.Bill
GO


--CTE
WITH cte1
AS
(
	SELECT * FROM PatientsInfo
	WHERE City='Dhaka'
),
cte2
AS
(
	SELECT * FROM PatientsInfo
	WHERE City='Shylet'
)
SELECT * FROM cte1
UNION
SELECT * FROM cte2
GO

-- SQL Server GROUP BY clause and aggregate functions
SELECT
    COUNT(LabTestName) AS 'Test',
    TestDate AS 'Date'
FROM PatientLabReport
WHERE PatID IN (1, 2)
GROUP BY TestDate, Comment, PatID
ORDER BY TestDate
GO

--EXISTS
SELECT * FROM PatientsInfo
WHERE NOT EXISTS
(SELECT * FROM PatientAppointment WHERE PatientsInfo.PatientsID=PatientAppointment.Pid)
GO


--TEST (View, Trigger, Function, Transaction)
--Check for view
select * from V_LabTest
GO

--Check for stored procedure
EXEC sp_PatientsInfo
GO 

--Inserting data useing view
INSERT INTO V_LabTest VALUES
('Cancer Gene','10','30','%',2500)
GO

--Deleting data useing view
DELETE FROM V_LabTest
WHERE TestID=1
GO
--Because of TestID reffar in another table, this can not be deleted.


