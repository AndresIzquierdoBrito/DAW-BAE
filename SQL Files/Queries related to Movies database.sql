CREATE DATABASE MoviesBasicas;
GO

USE MoviesBasicas;
GO

CREATE TABLE Peliculas
(
	Id				INTEGER,
	Titulo			VARCHAR(100),
	Director		VARCHAR(100),
	Agno			INTEGER,
	FechaChompra	DATETIME,
	Precio			DECIMAL(6,2)
);
GO

CREATE TABLE Socios
(
	NIFNIE			CHAR(9),
	Apellidos		VARCHAR(50),
	Nombre			VARCHAR(100),
	Direccion		VARCHAR(100),
	Telefono		CHAR(9),
	FechaDeAlta		DATETIME
);
GO

SP_TABLES @TABLE_OWNER='DBO';

