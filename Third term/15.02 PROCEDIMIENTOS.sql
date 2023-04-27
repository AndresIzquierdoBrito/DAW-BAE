USE Procedimientos_1;
go

-- 1.- Eliminamos la tabla, si existe y la creamos:
if object_id('empleados') is not null
drop table empleados;

create table empleados(
	documento char(8),
	nombre varchar(20),
	apellido varchar(20),
	sueldo decimal(6,2),
	cantidadhijos tinyint,
	seccion varchar(20),
	primary key(documento)
);

-- 2.
insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',350,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',null,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',460,3,'Secretaria');
insert into empleados values('22777777','Andres','Perez',580,3,'Sistemas');
insert into empleados values('22888888','Laura','Garcia',400,3,'Secretaria');

SELECT * FROM empleados;
go

-- 3. 

if object_id('pa_seccion') is not null
drop procedure pa_seccion;
go
-- 4.

CREATE PROCEDURE pa_seccion 
	@seccionSelecioanada varchar(20)
AS
	SELECT seccion, AVG(sueldo) AS SueldoPromedio, MAX(sueldo) AS SueldoMaximo
	FROM empleados
	WHERE seccion = @seccionSelecioanada
	GROUP BY seccion;
go

-- 5.

EXEC pa_seccion 'Sistemas';
EXEC pa_seccion 'Contaduria';

-- 6.

if object_id('pa_seccion') is not null
drop procedure pa_seccion;
go
CREATE PROCEDURE pa_seccion 
	@seccionSelecioanada varchar = '%'
AS
	SELECT AVG(sueldo) AS SueldoPromedio, MAX(sueldo) AS SueldoMaximo
	FROM empleados
	WHERE seccion LIKE @seccionSelecioanada
go

EXEC pa_seccion;

-- 7.

 if object_id('pa_sueldototal') is not null
  drop procedure pa_sueldototal;
 go
 CREATE PROCEDURE pa_sueldototal
 @documento varchar(8) = '%',
 @resultado decimal(6,2) output
 AS
 SELECT @resultado = 
 CASE
	WHEN sueldo < 500 THEN sueldo + 200*cantidadhijos
	WHEN sueldo >= 500 THEN sueldo + 100*cantidadhijos
 END
 FROM empleados
 WHERE documento LIKE @documento;
go

-- 8. 

DECLARE @resultado AS decimal
EXEC pa_sueldototal 22222222, @resultado output;
PRINT @resultado;
go

-- 9. 

DECLARE @resultado AS decimal
EXEC pa_sueldototal 234, @resultado output;
SELECT @resultado;
go

-- 10. 

DECLARE @resultado AS decimal
EXEC pa_sueldototal 22555555, @resultado output;
SELECT @resultado;
go

-- 11.

DECLARE @resultado AS decimal
EXEC pa_sueldototal @resultado = @resultado output;
SELECT @resultado;
go
