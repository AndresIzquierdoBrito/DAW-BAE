-- Ejercicio entregable videojuegos
-- Tablas de la base de datos
USE videojuegosbasicas;

CREATE TABLE [Cliente] (
 [id] INT identity primary key,
 [Nombre] VARCHAR(255),
 [Email] VARCHAR(255),
 [FechaNacimiento] DATETIME,
 [FechaRegistro] DATETIME
)
CREATE TABLE [Juegos] (
 [Id] INT primary key identity,
 [Juego] VARCHAR(255),
 [Plataforma] VARCHAR(255),
 [Tipo] VARCHAR(255),
 [Distribuidor] VARCHAR(255),
 [Desarrollador] VARCHAR(255)
)
CREATE TABLE [PuntuacionBasicas] (
 [Id] INT primary key identity,
 [Juego] VARCHAR(255),
 [Plataforma] VARCHAR(255),
 [NombreCliente] VARCHAR(255),
 [Puntuacion] INT,
 [Fecha] DATETIME
)

-- 1.

CREATE TABLE Paises(
	idPais int PRIMARY KEY IDENTITY,
	pais varchar(50) NOT NULL,
	codPais char(3) NOT NULL
);
GO

-- 2. A.
SET IDENTITY_INSERT Paises ON
INSERT INTO Paises(idPais, pais, codPais)
VALUES(17, 'Indonesia', 7);
GO
SET IDENTITY_INSERT Paises OFF
GO

SELECT * FROM Paises;
GO

-- 2.B.

INSERT INTO Paises(pais, codPais)
VALUES ('Singapur', 55);
GO
SELECT * FROM Paises;

-- 2.C.

INSERT INTO Paises(pais, codPais)
VALUES (NULL, 2222);


-- 4.
SELECT Juego, Plataforma, Fecha
FROM PuntuacionBasicas
WHERE Plataforma = 'PC';

UPDATE PuntuacionBasicas
SET Fecha = DATEADD(MONTH, 1, Fecha)
WHERE Plataforma = 'PC';
GO

SELECT Juego, Plataforma, Fecha
FROM PuntuacionBasicas
WHERE Plataforma = 'PC';
GO
-- 4.

DELETE FROM Paises
WHERE idPais > 1;
GO

SELECT * FROM Paises

-- 5.

SELECT COUNT(Juego) AS 'Cantidad de juegos PS3 de Acción'
FROM Juegos
WHERE Plataforma = 'PS3' AND Tipo = 'Acción';
GO

-- 6.
SELECT TOP 2 Nombre, FechaNacimiento, Email
FROM Cliente
WHERE Email LIKE '%.ca' AND DATEPART(MONTH, FechaNacimiento) = 5
ORDER BY FechaNacimiento DESC;
GO

-- 7.

SELECT TOP 3 Desarrollador, COUNT(DISTINCT Juego) AS CantidadDeJuegos
FROM Juegos
WHERE Tipo = 'Acción'
GROUP BY Desarrollador
HAVING Desarrollador LIKE 'B%'
ORDER BY CantidadDeJuegos DESC
GO

-- 8.

SELECT COUNT(*) AS CantidadDeClienteRegistrados, DATENAME(DW, FechaRegistro) AS DiaDeLaSemana
FROM Cliente
GROUP BY DATEPART(DW, FechaRegistro), DATENAME(DW, FechaRegistro)
ORDER BY DATEPART(DW, FechaRegistro);
GO

-- 9.

SELECT	Plataforma,
		COUNT(*) AS CantidadDePuntuaciones, 
		SUM(Puntuacion) AS TotalSumaDePuntuaciones, 
		COUNT(DISTINCT Juego) AS CantidadDeJuegosDistintos
FROM PuntuacionBasicas
GROUP BY Plataforma
HAVING COUNT(Puntuacion) > 6
ORDER BY TotalSumaDePuntuaciones DESC;
GO

-- 10.

SELECT COUNT(*) AS NumeroDePuntuaciones, AVG(Puntuacion) AS PuntuacionMedia, UPPER(NombreCliente) AS Clientes
FROM PuntuacionBasicas
GROUP BY NombreCliente
HAVING AVG(Puntuacion) > 5 AND COUNT(Puntuacion) > 1
ORDER BY PuntuacionMedia DESC;
GO
