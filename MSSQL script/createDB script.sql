CREATE DATABASE MedicalDB;

USE MedicalDB;

CREATE TABLE Doctors 
(id INT IDENTITY PRIMARY KEY NOT NULL,
surname NVARCHAR(255) NOT NULL,
name NVARCHAR(255) NOT NULL,
secondName NVARCHAR(255) NOT NULL,
gender VARCHAR(1) CHECK (gender IN ('F', 'M')),
speciality NVARCHAR(255) NOT NULL,
room INT NOT NULL)

CREATE TABLE Patients 
(id INT IDENTITY PRIMARY KEY NOT NULL,
surname NVARCHAR(255) NOT NULL,
name NVARCHAR(255) NOT NULL,
secondName NVARCHAR(255) NOT NULL,
gender VARCHAR(1) CHECK (gender IN ('F', 'M')),
doctorId INT FOREIGN KEY REFERENCES Doctors (id) )

INSERT INTO Doctors (surname, name, secondName, gender, speciality, room) VALUES (N'������', N'����', N'��������',  'M', N'������������', 302) , (N'�������', N'�������', N'��������', 'F', N'������������', 402);


INSERT INTO Patients (surname, name, secondName, gender, doctorId) VALUES (N'���������', N'�������', N'���������', 'F', 1) , (N'��������', N'�����', N'���������','F', 2), (N'�������', N'�������', N'��������','M', 1);


declare @q nvarchar(255) =N'��������� ������� ���������'
SELECT * FROM Patients p, Doctors d
WHERE p.doctorId=d.id AND
p.surname=(PARSENAME(REPLACE(@q, ' ', '.'), 3)) and
p.name=(PARSENAME(REPLACE(@q, ' ', '.'), 2)) AND 
p.secondName=(PARSENAME(REPLACE(@q, ' ', '.'), 1))



