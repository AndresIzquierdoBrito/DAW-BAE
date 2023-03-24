create database AdministracionSQL;
go

use AdministracionSQL;
go

-- ///////////////////////////////

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

-- Tercera manera
alter table empleados
alter column DNI varchar(8) NOT NULL;
go

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
	check(cantidadhijos < 20 AND cantidadhijos > 0;

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

