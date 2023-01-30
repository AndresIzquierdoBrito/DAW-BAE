USE cinebasicas;

--1.

SELECT CONCAT(Titulo, ' es una película del año ', agno, ' y del estudio: ', Estudio) AS Peliculas
FROM RecaudacionPeliculas
WHERE Estudio LIKE '[^aeiou]___' AND agno BETWEEN 1980 AND 1989;
GO

--2.

SELECT CA, COUNT(*) AS PeliculasVistas
FROM CineexhibidoCA
WHERE agno IN (2005, 2008, 2010, 2014)
GROUP BY CA
HAVING CA = 'Canarias'
GO


--3.

SELECT TOP 3 Titulo, RecUSA
FROM RecaudacionPeliculas
WHERE agno BETWEEN 2010 AND 2014
ORDER BY RecUSA DESC;
GO

--4.

SELECT	SUM(LargometrajesNacional) + SUM(LargometrajesExtranjeros) AS TotalRecaudacion, 
		DATENAME(MONTH, fecha) AS Mes
FROM DatosRecaudacionSpain
GROUP BY DATENAME(MONTH, fecha)
ORDER BY TotalRecaudacion DESC;
GO

--5.

SELECT	Titulo, 
		SUM(RecUSA) + SUM(RecResto) AS RecaudacionTotal
FROM RecaudacionPeliculas
WHERE Titulo LIKE '%war%' AND agno > 1980
GROUP BY Titulo, agno
HAVING SUM(RecUSA) + SUM(RecResto) > 100
ORDER BY RecaudacionTotal DESC;
GO


--6.

IF OBJECT_ID('datoscine') IS NOT NULL
	DROP TABLE datoscine;
	GO
CREATE TABLE datoscine(
	Id int PRIMARY KEY IDENTITY,
	Titulo varchar(100) NOT NULL,
	FechaExtreno datetime NULL,
	Recaudacion numeric(14,2) NULL,
	Clasificacion int DEFAULT 5 NULL
);
GO

--7. A)
SET DATEFORMAT DMY;
INSERT INTO datoscine(Titulo, FechaExtreno, Recaudacion, Clasificacion)
VALUES('Star Wars: Episode I - The Phantom Menace', '19/5/1999',  1027.01, default);

SELECT * FROM datoscine;
GO

--7. B)
SET DATEFORMAT DMY;
SET IDENTITY_INSERT datoscine ON;
INSERT INTO datoscine(Id, Titulo, FechaExtreno, Recaudacion, Clasificacion)
	VALUES(987, 'Star Wars: Episode II - Attack of the Clones', ' 16/5/2002', 649.40, NULL)
SET IDENTITY_INSERT datoscine OFF;
GO

SELECT * FROM datoscine;
GO


--8. A) 
SELECT * FROM datoscine;
SET IDENTITY_INSERT datoscine ON;
UPDATE datoscine
SET Id = 8
WHERE ID = 987;
SET IDENTITY_INSERT datoscine OFF;
SELECT * FROM datoscine;
GO
-- NO SE PUEDE 

--8. b)

SELECT * FROM datoscine;

DELETE FROM datoscine
	WHERE Id = 987;

SELECT * FROM datoscine;
GO


--9. 

SELECT	Estudio,
		agno,
		COUNT(*) AS NoPeliculas, 
		SUM(RecUSA) + SUM(RecResto) AS RecaduacionTotal		
FROM RecaudacionPeliculas
GROUP BY Estudio, agno
HAVING COUNT(*) > 6
ORDER BY Estudio, agno;
GO

--10.

SELECT	DATENAME(MONTH, fecha) AS Mes,
		SUM(LargometrajesNacional) + SUM(LargometrajesExtranjeros) AS TotalLargometrajes
FROM DatosRecaudacionSpain
GROUP BY DATENAME(MONTH, fecha), DATEPART(MONTH, fecha) 
HAVING DATENAME(MONTH, fecha) LIKE '%r%'
ORDER BY DATEPART(MONTH, fecha);
GO

--11.
	
SELECT agno, Npantallas, Nlargometrajes, EspectPeliculasExtranjeras
FROM ActividadesCineSpain
GROUP BY  agno, Npantallas, Nlargometrajes, EspectPeliculasExtranjeras
HAVING SUM(RecPeliculasNacional) + SUM(RecPeliculasExtranjeras) > 300
ORDER BY agno;
GO

--12

SELECT TOP 1
	Estudio, COUNT(*) AS CantidadPeliculas
FROM RecaudacionPeliculas
WHERE Estudio LIKE '___'
GROUP BY Estudio
HAVING COUNT(*) < 10
ORDER BY CantidadPeliculas DESC;
GO