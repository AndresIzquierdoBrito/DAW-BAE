

IF OBJECT_ID('INSTITUTO.DBO') is not null
	DROP DATABASE INSTITUTO
	GO
CREATE DATABASE INSTITUTO;
GO

USE INSTITUTO;

--1. Actualiza la tabla disminuyendo un 10% la beca de los alumnos que tienen más de 15
--faltas. Mostrar el antes y el después.
SELECT nombre, faltas,beca
FROM alumnos
WHERE faltas > 15

UPDATE alumnos
SET beca *= 0.9

SELECT nombre, faltas, beca
FROM alumnos
WHERE faltas > 15;
GO

--2. Listar los alumnos dando nombre, localidad curso y nivel, que contengan una ‘ez’ en su
--nombre y la localidad termine en ‘cia’. Ordenar por nivel de menor a mayor y por
--curso de menor a mayor.

SELECT nombre, localidad, curso, nivel
FROM alumnos
WHERE nombre LIKE '%ez%' AND localidad LIKE	'%cia'
ORDER BY nivel DESC, CURSO;
GO

--3. Listar los alumnos hasta 3º de la ESO, dando el nombre en mayúsculas y en una sola
--columna el curso y nivel (pe: “3º de la ESO”). Darle nombre a la columna calculada.

SELECT	UPPER(nombre) AS NombreAlumno,
		CONCAT(curso, 'º de la ', nivel) AS 'Curso y nivel'
FROM alumnos
WHERE nivel = 'ESO' AND curso <= 3;

--4. Cuántos alumnos hay matriculados.

SELECT COUNT(*)  AS CantidadDeAlumnos FROM alumnos;

--5. Cuántos alumnos hay por curso y nivel y cuántos tienen beca. Ordenados por curso y
--nivel de menor a mayor.

SELECT	curso, 
		nivel, 
		COUNT(*) AS CantidadAlumnos, 
		COUNT(beca) AS AlumnosConBeca
FROM alumnos
GROUP BY curso, nivel
ORDER BY nivel desc, curso;
GO

--6. Mostrar curso y nivel con una media de beca mayor que 200, mostrando el total de
--beca en cada curso y nivel.

SELECT	curso, 
		nivel,
		SUM(beca) AS BecaTotalPorCurso,
		AVG(beca) AS BecaPromediaDelCurso
FROM alumnos
GROUP BY curso, nivel
HAVING AVG(beca) > 200;
GO


--7. Mostrar los dos meses con más cumpleaños.

SELECT TOP 2 DATENAME(MONTH, fecha_nac) AS Mes, COUNT(DATEPART(MONTH, fecha_nac)) AS CantidadDeCumpleanios
FROM alumnos
GROUP BY DATENAME(MONTH, fecha_nac)
ORDER BY CantidadDeCumpleanios DESC;
GO


--8. Sacar un listado con los alumnos que no tienen beca mostrando nombre, edad y el día
--de la semana en que nacieron.

SELECT	nombre, 
		DATEDIFF(YEAR, fecha_nac,GETDATE()) - 1 AS Edad,
		DATENAME(WEEKDAY, fecha_nac) AS DiaDeNacimiento
FROM alumnos
WHERE beca IS null;
GO

--9. Alumnos entre 15 y 17 años, mostrar nombre y curso.

SELECT	nombre, 
		curso, 		
		DATEDIFF(YEAR, fecha_nac,GETDATE()) - 1 AS Edad
FROM alumnos
WHERE DATEDIFF(YEAR, fecha_nac,GETDATE()) - 1 BETWEEN 15 AND 17;
GO


--10. Curso con mayor número de matriculados.

SELECT TOP 1 curso, nivel
FROM alumnos
GROUP BY curso, nivel
ORDER BY COUNT(*) DESC;
GO