CREATE DATABASE NUEVA_2022;
GO
--ACCEDER A LA BASE DE DATOS PARA FUTURAS QUERIES
USE NUEVA_2022 
GO;

CREATE DATABASE facturasbasicas
GO;

USE facturasbasicas
GO;
--CREATE TABLE
CREATE TABLE FAC_T_Articulo
(
	CodArticulo		integer,
	NombreArticulo	varchar(50),
	PrecioActual	numeric(10,2)
);
GO

CREATE TABLE FAC_T_Cliente
(
	CodCliente		integer,
	NombreCliente	varchar(60),
	DatosCliente	varchar(60),
	FechaAlta		datetime,
	FechaNacimiento	datetime
);
GO

SP_COLUMNS FAC_T_Articulo;
GO

