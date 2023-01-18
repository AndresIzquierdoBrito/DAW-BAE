CREATE TABLE Personal
	(
	ID						INT IDENTITY PRIMARY KEY,
	DNI						CHAR(9),
	Nombre					VARCHAR(100),
	Puesto					CHAR(20),
	FechaDeNacimiento		DATE,
	NHijos					INT
	);
GO

CREATE TABLE prueba
	(
	Id		INT,
	Dato	CHAR(20)
	);
GO

INSERT INTO prueba(Id,Dato)
	VALUES (1,'elemento1');
INSERT INTO prueba(Id,Dato)
	VALUES (2,'elemento2');
GO

SELECT * FROM prueba;

DELETE FROM prueba
	WHERE Id = 2;

SELECT * FROM prueba;

DROP TABLE prueba;
GO

SELECT * FROM prueba;
GO

SET DATEFORMAT DMY;
SET IDENTITY_INSERT Personal ON;
INSERT INTO Personal(DNI, Nombre, Puesto, FechaDeNacimiento)
	VALUES ('32456789H', 'María','Jefa','27/3/1975');
INSERT INTO Personal(DNI, Nombre, Puesto, FechaDeNacimiento)
	VALUES ('23456789W','Juan','Técnico','23/4/1968');
INSERT INTO Personal(DNI, Nombre, Puesto, FechaDeNacimiento)
	VALUES ('45454545J','Ana','Jardinero','21/1/1980');	
INSERT INTO Personal(ID, DNI, Nombre, Puesto, FechaDeNacimiento)
	VALUES (33,'65656546G','Antonio','Jardinero','23/05/1978');
SET IDENTITY_INSERT Personal OFF;
GO



SELECT * FROM Personal;
DELETE FROM Personal
	WHERE DNI='65656546G';
SELECT * FROM Personal;
GO

SELECT DescripcionPlanta FROM Planta
	WHERE Precio > 20;
GO

SELECT CodFamilia FROM Familia
	WHERE Familia = 'Cyperaceae';
GO

SELECT DescripcionPlanta FROM Planta
	WHERE Precio = '12.30';
GO

SELECT * FROM Planta
	WHERE Precio < 5;
UPDATE Planta
	SET Precio=Precio+1
	WHERE Precio<5;
SELECT * FROM Planta
	WHERE Precio < 5;
GO

SELECT * FROM Planta;
UPDATE Familia
	SET Familia='Rosaceae officinalis'
	WHERE CodFamilia='5';
SELECT * FROM Planta;