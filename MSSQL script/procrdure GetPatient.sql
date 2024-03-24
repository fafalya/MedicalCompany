USE MedicalDB;
GO
CREATE PROCEDURE GetPatient
	@q NVARCHAR(255)
AS
BEGIN
    SELECT * FROM Patients p, Doctors d
    WHERE p.doctorId=d.id AND
	p.surname=(PARSENAME(REPLACE(@q, ' ', '.'), 3)) AND
	p.name=(PARSENAME(REPLACE(@q, ' ', '.'), 2)) AND
	p.secondName=(PARSENAME(REPLACE(@q, ' ', '.'), 1))
END;

Exec GetPatient N'Воробьева Наталья Сергеевна'
