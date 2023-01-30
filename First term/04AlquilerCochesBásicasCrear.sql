--create database AlquilerCochesBasicas;
--go
use AlquilerCochesBasicas;
go
if object_id('ALQ_Alquiler') is not null
  drop table ALQ_Alquiler;
  go
if object_id('ALQ_Cliente') is not null
  drop table ALQ_Cliente;
  go
if object_id('ALQ_Coche') is not null
  drop table ALQ_Coche;
  go
if object_id('ALQ_tipoCoche') is not null
  drop table ALQ_tipoCoche;
  go




create table ALQ_tipoCoche
(CodTipo integer primary key,
 DescripcionTipo varchar(100),
 PrecioDia numeric(10,2)
);


create table ALQ_Coche
(Matricula  varchar(10) primary key,
 DescripcionEstado  varchar(100),
 codTipo integer
);



create table ALQ_Cliente
(DNICliente varchar(9)primary key,
 Apellidos varchar(50),
 Nombre varchar(100),
 DatosCliente varchar(100),
 FechaNacimiento datetime,
 FechaCarnet datetime)

Create table ALQ_Alquiler
(idAlquiler int identity primary key,
 DNICliente varchar(9),
 Matricula varchar(10),
 FechaInicio datetime,
 FechaFinal datetime,
 PrecioDiaEfectuado numeric(10,2)
);
   
go

insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 1,'Económico',25.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 2,'Ejecutivo',56.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 3,'Furgoneta',70.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 4,'Todo terreno',75.00 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 66,'Nuevo tipo de coche',22.50 )
insert ALQ_tipoCoche ( CodTipo,DescripcionTipo,PrecioDia )  values ( 67,'Nuevo tipo de coche',22.50 )
go

insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '2354-HBC','Ford KA 3 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '3216-BHF','Seat Ibita 3 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '3256-GDF','Opel Corsa 5 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '4589-HBD','Volkswagen Polo 3 puertas',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '5567 HGT','Pequeño golpe en aleta derecha',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '5568 HGT','Pequeño golpe en aleta derecha',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '5599 HGT','Pequeño golpe en aleta derecha',1 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '7863-FGG','Volvo S60 5 puertas',2 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '7865-BTG','Land Rover Discovery',4 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '8763-GLH','Opel Combo',3 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '8999-HBC','Volvo XC90',4 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9567-CCD','Land Rover Discovery',4 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9743-GLH','Opel Vectra 5 puertas',2 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9803-HBB','Renault Kangoo',3 )
insert ALQ_Coche ( Matricula,DescripcionEstado,codTipo )  values ( '9876-GGF','Opel Vectra 5 puertas',2 )
go

insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '05679340L','pérez','david','c/galicia nº 32','Ene 30 1985 12:00AM','Ene 30 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '07865988B','hernández','pedro','Rambla nº 7','Oct 10 1990 12:00AM','Oct 10 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '13455656N','ruiz','maría','c/fuerteventura nº 9','Mar 21 1980 12:00AM','Mar 21 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '23432988J','ramos','maría','c/lanzarote nº 99','Mar 22 1980 12:00AM','Mar 22 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '23446456A','gonzález','josé','c/cinco de mayo nº 7','Oct 14 1990 12:00AM','Oct 14 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '43005006C','rodríguez','juan','C/x nº 6','Ene  2 1960 12:00AM','Ene  2 1982 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '43554430C','gonzález','samuel','c/principal nº 54','Ene 30 1985 12:00AM','May 30 2008 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '43566789M','fernández','jesús','c/la mancha nº 8','Ene 28 1985 12:00AM','Ene 28 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '45567678D','rodríguez','juana','C/seis nº 8','Oct 12 1990 12:00AM','Oct 12 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '45667443T','gonzález','alberto','c/alborada nº 7','Mar 17 1980 12:00AM','Mar 17 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '45678901G','pérez','ana','C/una nº 5','Ene  1 1960 12:00AM','Ene  1 1982 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '54377890W','pérez','maría','Avenida Primera nº 6','Oct 11 1990 12:00AM','Oct 11 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '56008986F','pérez','juana','c/el hierro nº 6','Mar 18 1980 12:00AM','Mar 18 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '56321789X','fernández','pedro','c/la gomera nº 8','Mar 19 1980 12:00AM','Mar 19 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '56999678C','hernández','josefa','c/primero de junio nº 7','Oct 13 1990 12:00AM','Oct 13 2010 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '65783450T','ramos','carmen','c/madrid nº 75','Ene 27 1985 12:00AM','Ene 27 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '67544345S','rojas','ana','c/la palma nº 77','Ene 25 1985 12:00AM','Ene 25 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '67655432N','rojas','fernando','c/gran canaria nº 9','Mar 20 1980 12:00AM','Mar 20 2002 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '75655499N','pérez','fernando','c/ofra nº 3','Ene 29 1985 12:00AM','Ene 29 2007 12:00AM' )
insert ALQ_Cliente ( DNICliente,Apellidos,Nombre,DatosCliente,FechaNacimiento,FechaCarnet )  values ( '76523986L','ruiz','marta','c/la graciosa nº 66','Ene 26 1985 12:00AM','Ene 26 2007 12:00AM' )
go

insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '05679340L','8763-GLH','Feb  8 2011 12:00AM','Feb 11 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '07865988B','3216-BHF','Ene  3 2011 12:00AM','Ene  4 2011 12:00AM',23.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '13455656N','2354-HBC','Feb  1 2011 12:00AM','Feb  4 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '13455656N','3216-BHF','Feb 14 2011 12:00AM','Feb 17 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '23432988J','3256-GDF','Feb  2 2011 12:00AM','Feb  4 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '23432988J','4589-HBD','Feb 15 2011 12:00AM','Feb 18 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '23446456A','9743-GLH','Ene  7 2011 12:00AM','Ene 10 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '43005006C','3256-GDF','Ene  2 2011 12:00AM','Ene  5 2011 12:00AM',23.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '43566789M','9876-GGF','Feb  6 2011 12:00AM','Feb  9 2011 12:00AM',54.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45567678D','7863-FGG','Ene  5 2011 12:00AM','Ene  8 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45567678D','7865-BTG','Feb 10 2011 12:00AM','Feb 13 2011 12:00AM',78.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45567678D','9876-GGF','Feb 17 2011 12:00AM','Feb 20 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45667443T','8763-GLH','Ene  8 2011 12:00AM','Ene 11 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '45678901G','2354-HBC','Ene  1 2011 12:00AM','Ene  4 2011 12:00AM',23.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '54377890W','4589-HBD','Ene  4 2011 12:00AM','Ene  7 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '54377890W','7863-FGG','Feb 16 2011 12:00AM','Feb 25 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '54377890W','9803-HBB','Feb  9 2011 12:00AM','Feb 12 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56008986F','9803-HBB','Ene  9 2011 12:00AM','Ene 16 2011 12:00AM',70.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56321789X','2354-HBC','Feb 12 2011 12:00AM','Feb 15 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56321789X','7865-BTG','Ene 10 2011 12:00AM','Ene 13 2011 12:00AM',72.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56999678C','8999-HBC','Feb 11 2011 12:00AM','Feb 14 2011 12:00AM',75.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56999678C','9743-GLH','Feb 18 2011 12:00AM','Mar  3 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '56999678C','9876-GGF','Ene  6 2011 12:00AM','Ene  7 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '65783450T','7863-FGG','Feb  5 2011 12:00AM','Feb  8 2011 12:00AM',56.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '67544345S','3216-BHF','Feb  3 2011 12:00AM','Feb  6 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '67655432N','3256-GDF','Feb 13 2011 12:00AM','Feb 16 2011 12:00AM',25.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '67655432N','8999-HBC','Ene 11 2011 12:00AM','Ene 14 2011 12:00AM',75.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '75655499N','9743-GLH','Feb  7 2011 12:00AM','Feb 14 2011 12:00AM',54.00 )
insert ALQ_Alquiler ( DNICliente,Matricula,FechaInicio,FechaFinal,PrecioDiaEfectuado )  values ( '76523986L','4589-HBD','Feb  4 2011 12:00AM','Feb  7 2011 12:00AM',22.00 )
go