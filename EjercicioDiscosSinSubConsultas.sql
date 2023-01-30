--EjerciciosDiscosSinSubconsultas 1/30/2023
USE Discos;

--1.- Cu�les son los dos clientes con m�s puntuaciones efectuadas (sac�ndolos todos).�

SELECT TOP 2 Cliente.Nombre, COUNT(*) AS NumPunt
from Cliente 
	INNER JOIN Puntuacion
	on Cliente.id = Puntuacion.Idcliente
GROUP BY Nombre
ORDER BY NumPunt DESC;
GO

--2.- Media de la puntuaci�n de discos de los int�rpretes que
--comiencen con A y efectuada en s�bado

SELECT d.Titulo, i.Interprete, AVG(p.Puntuacion) AS PuntuacionMedia
FROM Disco as d
	INNER JOIN Interprete AS i
	ON i.IdInterprete=d.IdInterprete
	INNER JOIN Puntuacion AS p
	ON p.iddisco=d.IdDisco
WHERE i.Interprete LIKE 'A%' AND DATEPART(DW, p.Fecha) = 6
GROUP BY d.Titulo, i.Interprete;
GO

--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
--puntuado a los tipos que contengan 'rock'

SELECT DISTINCT(c.Nombre)
FROM Cliente as c
	INNER JOIN Puntuacion as p
	ON c.id = p.Idcliente
	INNER JOIN Disco AS d
	ON p.IdDisco = d.IdDisco
	INNER JOIN DiscoTipo as dp
	ON d.IdDisco = dp.IdDisco
	INNER JOIN Tipo as t
	ON dp.IdTipo = t.IdTipo
WHERE DATEPART(YEAR, c.FechaNacimiento) < 1975 AND t.tipo LIKE '%rock%';
GO

--4.- Disco (dando su t�tulo) con mayor media de puntuacion que haya sido
--votado dos o m�s veces

SELECT TOP 1 WITH TIES d.Titulo, AVG(p.Puntuacion) AS PuntuacionMedia, COUNT(*) AS CantidadVotos
FROM DISCO AS d
	INNER JOIN Puntuacion AS p
	ON d.IdDisco = p.iddisco
GROUP BY Titulo
HAVING COUNT(*) >= 2
ORDER BY PuntuacionMedia DESC;
GO

--5.- Int�rprete que m�s veces haya sido puntuado

SELECT TOP 1 i.Interprete, COUNT(*) AS NumVotaciones
FROM Interprete AS i
	INNER JOIN Disco as d
	ON i.IdInterprete = d.IdInterprete
	INNER JOIN Puntuacion as p
	ON d.IdDisco = p.iddisco
GROUP BY i.Interprete
ORDER BY NumVotaciones DESC;
GO

--6.- Dos int�rpretes con m�s discos

SELECT TOP 2 WITH TIES i.Interprete, COUNT(*) AS CantDiscos
FROM Interprete as i
	INNER JOIN Disco as d
	ON i.IdInterprete = d.IdInterprete
GROUP BY Interprete
ORDER BY CantDiscos DESC;
GO

--7 t�tulos de los discos que hayan recibido
--alguna puntuaci�n y el nombre del int�rprete

SELECT d.Titulo, i.Interprete
FROM Disco as d
	INNER JOIN Puntuacion AS p
	ON d.IdDisco = p.iddisco
	INNER JOIN Interprete as i
	ON d.IdInterprete = i.IdInterprete
GROUP BY d.Titulo, i.Interprete;
GO