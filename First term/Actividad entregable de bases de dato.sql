CREATE DATABASE Facturas;
GO

USE Facturas;
GO

IF OBJECT_ID('FAC_T_Articulo') IS NOT NULL
	DROP TABLE FAC_T_Articulo;

CREATE TABLE FAC_T_Articulo(
	CodArticulo int PRIMARY KEY,
	NombreArticulo varchar(50) UNIQUE,
	TipoArticulo varchar(50),
	PrecioActual numeric(10,2));
GO

IF OBJECT_ID('FAC_T_Cliente') IS NOT NULL
	DROP TABLE FAC_T_Cliente;

CREATE TABLE FAC_T_Cliente(
	CodCliente int PRIMARY KEY,
	NombreCliente varchar(60) NOT NULL,
	DatosCliente varchar(60) DEFAULT 'Desconocida',
	Municipio varchar(50),
	FechaAlta datetime DEFAULT GETDATE(),
	FechaNacimiento datetime);
GO

INSERT FAC_T_Articulo (CodArticulo, NombreArticulo, TipoArticulo, PrecioActual)
	VALUES (205, 'Sierra Circula especial', 'Herramienta eléctrica', 158.80);
GO

INSERT FAC_T_Cliente (CodCliente, NombreCliente, DatosCliente, Municipio, FechaAlta, FechaNacimiento)
	VALUES (45, 'Laura González González', 'C/La Marina nº 3', 'S/C Tenerife', default, '25/09/1990');
GO


UPDATE FAC_T_Articulo
SET PrecioActual = PrecioActual*1.1
WHERE PrecioActual >= 5;
GO

SELECT NombreCliente, DatosCliente
FROM FAC_T_Cliente
WHERE NombreCliente LIKE 'Laura González%';
GO

UPDATE FAC_T_Cliente
SET DatosCliente = 'C/ Juan Pablo Segundo nº45'
WHERE NombreCliente LIKE 'Laura González%';
GO

SELECT CodCliente, NombreCliente, DatosCliente
FROM FAC_T_Cliente
WHERE NombreCliente LIKE 'Laura González%';
GO

--

SELECT NombreArticulo, PrecioActual 
FROM FAC_T_Articulo
WHERE PrecioActual < 1;

DELETE FROM FAC_T_Articulo WHERE PrecioActual < 1;

SELECT NombreArticulo, PrecioActual 
FROM FAC_T_Articulo
WHERE PrecioActual < 1;
GO

SELECT NombreArticulo, PrecioActual
FROM FAC_T_Articulo;
GO

SELECT	NombreCliente, 
		DatosCliente, 
		CONVERT(varchar, FechaNacimiento, 103) AS FechaNacimiento, 
		DATEDIFF(YEAR, FechaNacimiento, GETDATE()) AS Edad
FROM FAC_T_Cliente
WHERE DATEPART(MONTH, FechaNacimiento) =  6
ORDER BY FechaNacimiento ASC
GO

SELECT CodArticulo, NombreArticulo, PrecioActual
FROM FAC_T_Articulo
WHERE PrecioActual BETWEEN 10 AND 50;
GO

SELECT NombreCliente, FechaAlta
FROM FAC_T_Cliente
WHERE DATENAME(MONTH, FechaAlta) IN ('enero', 'marzo', 'abril' , 'junio');
GO

SELECT NombreArticulo
FROM FAC_T_Articulo
WHERE NombreArticulo LIKE '%[0-9]%'
GO

SELECT	CONVERT(VARCHAR, CodCliente) + ' -- ' + NombreCliente AS 'Datos Cliente',
		FechaAlta
FROM FAC_T_Cliente
GO

SELECT NombreCliente, FechaAlta
FROM FAC_T_Cliente
WHERE DATEPART(MONTH, FechaAlta) = 5 AND FechaNacimiento IS NOT NULL
GO

SELECT * 
FROM FAC_T_Articulo
WHERE NombreArticulo LIKE '%destornillador%' AND PrecioActual > 2;
GO

SELECT NombreCliente, FechaAlta
FROM FAC_T_Cliente
WHERE DATENAME(MONTH, FechaAlta) IN ('enero', 'marzo', 'mayo');
GO

SELECT	NombreCliente, 
		CodCliente, 
		DATEDIFF(MONTH, FechaAlta, GETDATE()) AS 'Meses de antigüedad'
FROM FAC_T_Cliente
ORDER BY NombreCliente ASC;
GO

SP_COLUMNS FAC_T_Cliente;
GO

SELECT COUNT(CodCliente) AS CantidadClientes
FROM FAC_T_Cliente; 
GO

SELECT COUNT(CodCliente) AS 'Clientes con fecha de nacimiento'
FROM FAC_T_Cliente
WHERE FechaNacimiento IS NOT NULL;
GO

SELECT AVG(PrecioActual) AS 'Precio medio (Herramientas)'
FROM FAC_T_Articulo
WHERE TipoArticulo = 'Herramienta';
GO

SELECT TipoArticulo
FROM FAC_T_Articulo
GROUP BY TipoArticulo;
GO

SELECT TipoArticulo, COUNT(TipoArticulo) AS CantidadArticulos
FROM FAC_T_Articulo
GROUP BY TipoArticulo
ORDER BY CantidadArticulos DESC;
GO

SELECT TipoArticulo, AVG(PrecioActual) AS PrecioMedio
FROM FAC_T_Articulo
GROUP BY TipoArticulo
HAVING COUNT(TipoArticulo) > 2
ORDER BY PrecioMedio DESC;
GO

SELECT TOP 2 Municipio, COUNT(CodCliente)
FROM FAC_T_Cliente
GROUP BY Municipio
ORDER BY COUNT(CodCliente) DESC;
GO

SELECT TipoArticulo, MAX(PrecioActual)
FROM FAC_T_Articulo
GROUP BY TipoArticulo
ORDER BY MAX(PrecioActual) DESC;
GO

SELECT	Municipio, 
		COUNT(FechaNacimiento) AS 'Con fecha de nacimiento', 
		COUNT(*) - COUNT(FechaNacimiento) AS 'Sin fecha de nacimiento'
FROM FAC_T_Cliente
GROUP BY Municipio;
GO

SELECT DATENAME(MONTH, FechaNacimiento) AS 'Mes de nacimiento', COUNT(CodCliente) AS 'Cantidad de clientes'
FROM FAC_T_Cliente
WHERE FechaNacimiento IS NOT NULL
GROUP BY DATENAME(MONTH, FechaNacimiento), MONTH(FechaNacimiento)
ORDER BY DATEPART(M, FechaNacimiento) ASC;
GO





