--1. Crear la Base de datos en la carpeta SQLDatos con tamaño inicial 5M, tamaño mayor
--20 M e incrementos 4M.
IF db_id('AdministracionSQL') IS NOT NULL
	DROP DATABASE AdministracionSQL;
go
-- Recuerda darle permisos a la carpeta con chmod
CREATE DATABASE AdministracionSQL
ON 
( NAME = AdministracionSQL_dat,
  FILENAME = '/SQLDatos/AdministracionSQL.mdf',
  SIZE = 5MB,
  MAXSIZE = 20MB,
  FILEGROWTH = 4MB)
LOG ON
( NAME = AdministracionSQL_LOG,
  FILENAME = '/SQLDatos/AdministracionSQL_log.ldf',
  SIZE = 5MB,
  MAXSIZE = 25MB,
  FILEGROWTH = 5MB);

use AdministracionSQL;
go
--2. Crear una tabla con la estructura siguiente:
create table empleados (
DNI varchar(8),
nombre varchar(30),
apellidos varchar(30),
fechanacimiento datetime,
cantidadhijos tinyint,
seccion varchar(20),
sueldo decimal(6,2)
);

exec sp_helpconstraint empleados;
go
--3. Crear las sentencias para que valide lo siguiente:
-- a. Clave primara DNI
-- Pimera manera
create table empleados (
DNI varchar(8) primary key
);

-- Segunda manera
create table empleados (
DNI varchar(8),
constraint pk_empleados primary key(dni)
);

alter table empleados
add constraint pk_empleados
primary key(DNI);
go

-- b. no nulo appelidos
-- Primera manera
create table empleados (
apellidos varchar(30) NOT NULL
);

-- Segunda manera

alter table empleados
alter column apellidos varchar(30) NOT NULL;
go

-- c. no nulo nombre
-- Primera manera
create table empleados (
nombre varchar(30) NOT NULL
);

-- Segunda manera

alter table empleados
alter column nombre varchar(30) NOT NULL;
go

-- d. valor unico nombre y apellidos
-- Primera manera

create table empleados (
nombre varchar(30) UNIQUE,
apellidos varchar(30) UNIQUE
);

-- Segunda manera

create table empleados (
nombre varchar(30),
apellidos varchar(30),
constraint uq_nombreapellidos 
	unique (nombre, apellidos)
);

-- Tercera manera

alter table empleados
add constraint uq_nombreapellidos
	unique (nombre, apellidos);

--e. validar que fechanacimiento sea menor que la fecha actual
-- Primera manera

create table empleados (
DNI varchar(8),
nombre varchar(30),
apellidos varchar(30),
fechanacimiento datetime,
cantidadhijos tinyint,
seccion varchar(20),
sueldo decimal(6,2),
constraint ck_fechas
	check(fechanacimiento < getdate())
);

-- Segunda manera

alter table empleados
add constraint ck_fechas
	check(fechanacimiento < getdate());

--f. validar que cantidad de hijos no sea negativa ni mayor que 20
-- Primera manera

create table empleados (
DNI varchar(8),
nombre varchar(30),
apellidos varchar(30),
fechanacimiento datetime,
cantidadhijos tinyint,
seccion varchar(20),
sueldo decimal(6,2),
constraint ck_canthijos
	check(cantidadhijos < 20 AND cantidadhijos > 0)
);

-- Segunda manera

alter table empleados
add constraint ck_canthijos
	check(cantidadhijos < 20 AND cantidadhijos > 0);

--g. validar que sección no esté vacío
-- Primera manera

create table empleados (
DNI varchar(8),
nombre varchar(30),
apellidos varchar(30),
fechanacimiento datetime,
cantidadhijos tinyint,
seccion varchar(20),
sueldo decimal(6,2),
constraint ck_seccionempty
	check(trim(seccion) != '')
);

-- Segunda manera

alter table empleados
add constraint ck_seccionempty
	check(trim(seccion) != '');


-- VALIDACIONES DE ESTAS RESTRICCIONES

insert into empleados(nombre, apellidos)
values ('Pepe', 'Pepon');
go

insert into empleados(DNI, nombre, apellidos)
values ('12345678', 'Pepe', 'Pepon');
go

--4. Ver los índices que tiene.

exec sp_helpindex empleados;
go

--5. Añadir índice por fecha de nacimiento
create nonclustered index ix_fechanacimiento
on empleados(fechanacimiento);
go

--6. Añadir índice por sueldo
create nonclustered index ix_sueldo
on empleados(sueldo)
go

--7. Modificar lo siguiente en la tabla
--a. Añadir campo dirección varchar(100)
alter table empleados
add direccion varchar(100);
go

--b. Cambiar a no nulo seccion
alter table empleados
alter column seccion varchar(20) NOT NULL;
go

--c. Validar que sueldo sean >0 y <10000
alter table empleados
add constraint CK_Sueldobwt
	check(seccion BETWEEN 0 AND 10000);
go
