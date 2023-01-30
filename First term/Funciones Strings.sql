CREATE DATABASE PrestamoLibros;
USE PrestamoLibros;
GO
if object_id ('libros') is not null
 drop table libros;
 create table libros(
 codigo int identity,
 ttulo varchar(40) not null,
 autor varchar(20) default 'Desconocido',
 editorial varchar(20),
 precio decimal(6,2),
 cantdad tinyint default 0,
 primary key (codigo)
);

insert into libros (ttulo,autor,editorial,precio)
 values('El aleph','Borges','Emece',25);
insert into libros
 values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (ttulo,autor,editorial,precio,cantdad)
 values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
 GO

 SELECT LEFT(ttulo,3)
 FROM libros;
 GO

 SELECT STR(precio,4,2) + ' euros'
 FROM libros;
 GO

 SELECT ttulo + ' - ' + autor + ' - ' + STR(precio, 4,2)
 FROM libros;
 GO

 SELECT RIGHT(ttulo, 6), RIGHT(autor, 6)
 FROM libros;
 GO

 SELECT UPPER(autor)
 FROM libros;
 GO

 SELECT autor,LEN(autor), ttulo, LEN(ttulo)
 FROM libros;
 GO

 SELECT SUBSTRING(autor, 4, 10)
 FROM libros;
 GO

 SELECT REPLACE('correoarrobahotmailpuntocom', 'arroba', '@')
 SELECT REPLACE('correoarrobahotmailpuntocom', 'punto', '.')
 GO