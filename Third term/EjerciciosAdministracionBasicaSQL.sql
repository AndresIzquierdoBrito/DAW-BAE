--1. Crear la Base de datos en la carpeta SQLDatos con tamaño inicial 5M, tamaño mayor
--20 M e incrementos 4M.
IF Db_id('AdministracionSQL') IS NOT NULL
  DROP DATABASE administracionsql;
go

-- Recuerda darle permisos a la carpeta con chmod
CREATE DATABASE administracionsql ON ( NAME = administracionsql_dat, filename =
'/SQLDatos/AdministracionSQL.mdf', size = 5mb, maxsize = 20mb, filegrowth = 4mb)
log ON ( NAME = administracionsql_log, filename =
'/SQLDatos/AdministracionSQL_log.ldf', size = 5mb, maxsize = 25mb, filegrowth =
5mb);

USE administracionsql;

go

--2. Crear una tabla con la estructura siguiente:
CREATE TABLE empleados
  (
     dni             VARCHAR(8),
     nombre          VARCHAR(30),
     apellidos       VARCHAR(30),
     fechanacimiento DATETIME,
     cantidadhijos   TINYINT,
     seccion         VARCHAR(20),
     sueldo          DECIMAL(6, 2)
  );

EXEC Sp_helpconstraint
  empleados;

go

--3. Crear las sentencias para que valide lo siguiente:
-- a. Clave primara DNI
-- Pimera manera
CREATE TABLE empleados
  (
     dni VARCHAR(8) PRIMARY KEY
  );

-- Segunda manera
CREATE TABLE empleados
  (
     dni VARCHAR(8),
     CONSTRAINT pk_empleados PRIMARY KEY(dni)
  );

ALTER TABLE empleados
  ALTER COLUMN dni VARCHAR(10) NOT NULL;
go
ALTER TABLE empleados
  ADD CONSTRAINT pk_empleados PRIMARY KEY(dni);

go

-- b. no nulo appelidos
-- Primera manera
CREATE TABLE empleados
  (
     apellidos VARCHAR(30) NOT NULL
  );

-- Segunda manera
ALTER TABLE empleados
  ALTER COLUMN apellidos VARCHAR(30) NOT NULL;

go

-- c. no nulo nombre
-- Primera manera
CREATE TABLE empleados
  (
     nombre VARCHAR(30) NOT NULL
  );

-- Segunda manera
ALTER TABLE empleados
  ALTER COLUMN nombre VARCHAR(30) NOT NULL;

go

-- d. valor unico nombre y apellidos
-- Primera manera
CREATE TABLE empleados
  (
     nombre    VARCHAR(30) UNIQUE,
     apellidos VARCHAR(30) UNIQUE
  );

-- Segunda manera
CREATE TABLE empleados
  (
     nombre    VARCHAR(30),
     apellidos VARCHAR(30),
     CONSTRAINT uq_nombreapellidos UNIQUE (nombre, apellidos)
  );

-- Tercera manera
ALTER TABLE empleados
  ADD CONSTRAINT uq_nombreapellidos UNIQUE (nombre, apellidos);

--e. validar que fechanacimiento sea menor que la fecha actual
-- Primera manera
CREATE TABLE empleados
  (
     fechanacimiento DATETIME,
     CONSTRAINT ck_fechas CHECK(fechanacimiento < Getdate())
  );

-- Segunda manera
ALTER TABLE empleados
  ADD CONSTRAINT ck_fechas CHECK(fechanacimiento < Getdate());

--f. validar que cantidad de hijos no sea negativa ni mayor que 20
-- Primera manera
CREATE TABLE empleados
  (
     cantidadhijos   TINYINT,
     CONSTRAINT ck_canthijos CHECK(cantidadhijos < 20 AND cantidadhijos > 0)
  );

-- Segunda manera
ALTER TABLE empleados
  ADD CONSTRAINT ck_canthijos CHECK(cantidadhijos < 20 AND cantidadhijos > 0);

--g. validar que sección no esté vacío
-- Primera manera
CREATE TABLE empleados
  (
     seccion         VARCHAR(20),
     CONSTRAINT ck_seccionempty CHECK(Trim(seccion) != '')
  );

-- Segunda manera
ALTER TABLE empleados
  ADD CONSTRAINT ck_seccionempty CHECK(Trim(seccion) != '');

-- VALIDACIONES DE ESTAS RESTRICCIONES
INSERT INTO empleados
            (nombre,
             apellidos)
VALUES      ('Pepe',
             'Pepon');

go

INSERT INTO empleados
            (dni,
             nombre,
             apellidos)
VALUES      ('12345678',
             'Pepe',
             'Pepon');

go

--4. Ver los índices que tiene.
EXEC Sp_helpindex
  empleados;

go

--5. Añadir índice por fecha de nacimiento
CREATE NONCLUSTERED INDEX ix_fechanacimiento
  ON empleados(fechanacimiento);

go

--6. Añadir índice por sueldo
CREATE NONCLUSTERED INDEX ix_sueldo
  ON empleados(sueldo)

go

--7. Modificar lo siguiente en la tabla
--a. Añadir campo dirección varchar(100)
ALTER TABLE empleados
  ADD direccion VARCHAR(100);

go

--b. Cambiar a no nulo seccion
ALTER TABLE empleados
  ALTER COLUMN seccion VARCHAR(20) NOT NULL;

go

--c. Validar que sueldo sean >0 y <10000
ALTER TABLE empleados
  ADD CONSTRAINT ck_sueldobwt CHECK(seccion BETWEEN 0 AND 10000);

go 