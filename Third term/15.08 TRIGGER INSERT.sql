--15.08 Trigger Insert

CREATE DATABASE TriggersPractica;
USE TriggersPractica;
------------------------------------------

--Actividad con Trigger - Insert: 
--Una empresa almacena los datos de sus empleados en una tabla denominada "empleados" y en otra tabla llamada "secciones", 
--el código de la sección y el sueldo máximo de cada una de ellas.
--1- Elimine las tablas si existen:
 if object_id('empleados') is not null
  drop table empleados;
 if object_id('secciones') is not null
  drop table secciones;

--2- Cree las tablas, con las siguientes estructuras:
 create table secciones(
  codigo int identity,
  nombre varchar(30),
  sueldomaximo decimal(8,2), 
  constraint PK_secciones primary key(codigo)
 );

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  codigoseccion int not null,
  sueldo decimal(8,2),
  constraint PK_empleados primary key(documento),
  constraint FK_empelados_seccion
   foreign key (codigoseccion) references secciones(codigo)
 );

--3- Ingrese algunos registros en ambas tablas:
 insert into secciones values('Administracion',1500);
 insert into secciones values('Sistemas',2000);
 insert into secciones values('Secretaria',1000);

 insert into empleados values('22222222','Ana Acosta','Avellaneda 88',1,1100);
 insert into empleados values('23333333','Bernardo Bustos','Bulnes 345',1,1200);
 insert into empleados values('24444444','Carlos Caseres','Colon 674',2,1800);
 insert into empleados values('25555555','Diana Duarte','Colon 873',3,1000);

--4- Cree un disparador para que se ejecute cada vez que una instrucción "insert" ingrese datos en "empleados";
--el mismo debe verificar que el sueldo del empleado no sea mayor al sueldo máximo establecido para la sección, si lo es, 
--debe mostrar un mensaje indicando tal situación y deshacer la transacción.

IF OBJECT_ID('TRIG_InsertValidSueldo') IS NOT NULL
	DROP TRIGGER TRIG_InsertValidSueldo;
GO

CREATE TRIGGER TRIG_InsertValidSueldo
ON empleados
FOR INSERT
AS
	DECLARE @seccionSueldo int
	SELECT @seccionSueldo = sueldomaximo FROM secciones
		INNER JOIN inserted
			ON inserted.codigoseccion = secciones.codigo
		INNER JOIN empleados
			ON inserted.codigoseccion = empleados.codigoseccion
		WHERE inserted.codigoseccion = empleados.codigoseccion
	IF (@seccionSueldo >= (SELECT sueldo FROM inserted))
		UPDATE empleados SET sueldo = inserted.sueldo
			FROM empleados
			INNER JOIN inserted
				ON inserted.documento = empleados.documento
	ELSE 
		BEGIN
		RAISERROR ('No se puede introducir un salario superior al maximo de su seccion', 16, 1)
		ROLLBACK TRANSACTION
		END
GO


--5- Ingrese un nuevo registro en "empleados" cuyo sueldo sea menor o igual al establecido para la sección.

INSERT INTO empleados VALUES(12345639, 'Andres Izq', 'Su casa', 1, 1000);
go

--6- Verifique que el disparador se ejecutó consultando la tabla "empleados":

select *from empleados;

--7- Intente ingresar un nuevo registro en "empleados" cuyo sueldo sea mayor al establecido para la sección.
--El disparador se ejecutó mostrando un mensaje y la transacción se deshizo.

INSERT INTO empleados VALUES(12345659, 'Andres Izq', 'Su casa', 1, 3000);
go

--8- Verifique que el registro no se agregó en "empleados":
 
 select *from empleados;

--9- Intente ingresar un empleado con código de sección inexistente.
--Aparece un mensaje de error porque se viola la restricción "foreign key"; el trigger no llegó a ejecutarse.

INSERT INTO empleados VALUES(12345639, 'Andres Izq', 'Su casa', 9, 3000);
go