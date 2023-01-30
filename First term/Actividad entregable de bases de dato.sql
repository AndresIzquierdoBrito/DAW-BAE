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



