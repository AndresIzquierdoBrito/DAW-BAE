-- Procedures

--if Db_id('Procedimientos_1') IS NOT NULL
--drop database Procedimientos_1;
--go
--create database Procedimientos_1;
--go
--if object_id('libros','U') is not null
--drop table libros;
--go
--create table libros(
-- titulo varchar(40),
-- autor varchar(30),
-- editorial varchar(15),
-- precio float,
-- cantidad integer
--);
--go
--insert into libros (titulo,autor,editorial,precio,cantidad)
-- values
-- ('El aleph','Borges','Emece',25.50,100),
-- ('Alicia en el pais de las maravillas',
--'Lewis Carroll','Atlantida',10,200),
-- ('Crimen y castigo','Fiódor Dostoievski','Ed. uno',10.25,2),
-- ('Diez negritos','Agatha Christie','E. uno', 6.50,3),
-- ('Cien años de soledad','Gabriel García Márquez',
--'Ed. siempre',10.20,7),
-- ('Los Pilares de la Tierra','Ken Follett',
--'Ed. siempre',16.40,2),
-- ('El viejo y el mar','Ernest Hemingway',
--'Ed. Santillana',6.50,4);
--go

USE Procedimientos_1;
go

--1.- Vamos a crear un procedimiento almacenado que contenga las siguientes instrucciones:
--- eliminación de la tabla "libros" si existe;
--- creación de la tabla "libros" con: codigo, titulo, autor, editorial, precio, cantidad;
--- ingreso de algunos registros.
--En primer lugar, debemos eliminarlo, si existe (mediante la sentencia drop procedure):
--Después crearemos el procedimiento.
IF OBJECT_ID('TableCreation', 'P') IS NOT NULL
	DROP PROCEDURE TableCreation;
go
CREATE PROCEDURE TableCreation
AS 
	IF OBJECT_ID('libros', 'U') IS NOT NULL
	DROP TABLE libros;
	CREATE TABLE libros(
		 titulo varchar(40),
		 autor varchar(30),
		 editorial varchar(15),
		 precio float,
		 cantidad integer
	);
	insert into libros (titulo,autor,editorial,precio,cantidad)
	 values
	 ('El aleph','Borges','Emece',25.50,100),
	 ('Alicia en el pais de las maravillas',
	'Lewis Carroll','Atlantida',10,200),
	 ('Crimen y castigo','Fiódor Dostoievski','Ed. uno',10.25,2),
	 ('Diez negritos','Agatha Christie','E. uno', 6.50,3),
	 ('Cien años de soledad','Gabriel García Márquez',
	'Ed. siempre',10.20,7),
	 ('Los Pilares de la Tierra','Ken Follett',
	'Ed. siempre',16.40,2),
	 ('El viejo y el mar','Ernest Hemingway',
	'Ed. Santillana',6.50,4);
go

EXEC TableCreation;
go

select * from libros;
go

sp_help TableCreation;
go

--2.- Necesitamos un procedimiento almacenado que muestre los libros de los cuales hay menos de 10. 
--En primer lugar, lo eliminamos si existe.
--Creamos el procedimiento.
--Ejecutamos el procedimiento almacenado del sistema "sp_help" junto al nombre del procedimiento creado recientemente para verificar que existe.
--Lo ejecutamos comprobando que da los registros que solicitamos.
--Modificamos algún registro y volvemos a ejecutar el procedimiento.
--Note que el resultado del procedimiento ha cambiado porque los datos han cambiado.

IF OBJECT_ID('TableCreation', 'P') IS NOT NULL
	DROP PROCEDURE BooksLessThanTen;
go
CREATE PROCEDURE BooksLessThanTen
AS
	select titulo, cantidad from libros
	where cantidad < 10
GO

sp_help BooksLessThanTen;
go

EXEC BooksLessThanTen;
go

INSERT INTO libros
VALUES('Robison Crusoe', 'Tu padre', 'Yo', 2, 3);
go
EXEC BooksLessThanTen;
go

--3.- Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

 --if object_id('empleados') is not null
 -- drop table empleados;

 --create table empleados(
 -- documento char(8),
 -- nombre varchar(20),
 -- apellido varchar(20),
 -- sueldo decimal(6,2),
 -- cantidadhijos tinyint,
 -- seccion varchar(20),
 -- primary key(documento)
 --);

 --insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 --insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 --insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 --insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 --insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

 select * from empleados;
 go
 --Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
--apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como parámetro.


 if object_id('pa_empleados_sueldo') is not null
  drop procedure pa_empleados_sueldo;
  go
CREATE PROCEDURE pa_empleados_sueldo 
	@inputSueldo decimal(6,2)
	AS
		SELECT documento, nombre, apellido, sueldo FROM empleados
		WHERE sueldo >= @inputSueldo
	GO

EXEC pa_empleados_sueldo;
go
EXEC pa_empleados_sueldo 500;
go
EXEC pa_empleados_sueldo 400;
go


 if object_id('pa_empleados_actualizar_sueldo') is not null
  drop procedure pa_empleados_actualizar_sueldo;
 go

CREATE PROCEDURE pa_empleados_actualizar_sueldo 
	@SueldoCambiar decimal(6,2),
	@SueldoFinal decimal(6,2)
AS
	UPDATE empleados
	SET sueldo = @SueldoFinal
	WHERE sueldo = @SueldoCambiar
GO

EXEC pa_empleados_actualizar_sueldo 300, 120;
select * from empleados;
EXEC pa_empleados_actualizar_sueldo 120, 300;
select * from empleados;
go


select * from empleados;
 if object_id('pa_sueldototal') is not null
  drop procedure pa_sueldototal;
 go

 CREATE PROCEDURE pa_sueldototal
 @documento varchar(8) = '%'
 AS
 SELECT @documento AS Documento, 
 CASE
	WHEN sueldo < 500 THEN sueldo + 200*cantidadhijos
	WHEN sueldo >= 500 THEN sueldo + 200*cantidadhijos
 END AS SueldoFinal
 FROM empleados
 WHERE documento LIKE @documento;
go

exec pa_sueldototal;
exec pa_sueldototal 22222222;