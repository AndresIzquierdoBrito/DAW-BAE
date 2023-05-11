-- 15.07
use funciones
go

if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
 );


 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros values('El aleph','Borges','Emece',10.00);
 insert into libros values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros values('Uno','Richard Bach','Planeta',10.00);

--1.- Crear una función que devuelva cuántos libros hay de precio mayor que el que suministremos como parámetro.

IF OBJECT_ID('dbo.precioMayor') IS NOT NULL
	DROP function dbo.precioMayor;
GO
CREATE FUNCTION dbo.precioMayor(@limite decimal(4,2))
	RETURNS INT
AS
BEGIN
	DECLARE @CantLibros AS INT
	SET @CantLibros = (SELECT COUNT(*) FROM dbo.libros WHERE @limite < precio)
	RETURN @CantLibros
END
GO

PRINT dbo.precioMayor(3);
GO

--2.

create table personas
( nombre varchar(100),
  apellidos varchar(100),
  fechanacimiento datetime,
  dni char(8),
  letra char(1))

set dateformat dmy
insert into personas values
	('Juan','Pérez','01/01/1970','56789443','M'),
	('María','Hernández','05/06/1985','45678432','L'),
	('Ana','Rodríguez','25/10/1991','42001982','A')
go

--Crear una función escalar que tenga como parámetros el DNI y la letra del NIF y nos valide si es correcta o no. 
--Usar la función con los datos de una tabla que contenga nombre, apellidos, fechanacimiento, dni y la letra del nif.

IF OBJECT_ID('f_IsDataValid') IS NOT NULL
	DROP function f_IsDataValid;
GO
CREATE FUNCTION dbo.f_IsDataValid(@dni char(8), @letraNIF char)
	RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @output AS VARCHAR(10)
	IF (SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE', @dni % 23 + 1, 1) = @letraNIF)
		RETURN 'Valido'

	RETURN 'No valido'
END
GO

SELECT dbo.f_IsDataValid(dni, letra) AS Validez FROM personas;
go

--3.- Crear una función que nos devuelva los años de diferencia respecto al actual a partir de 
--la fecha pasada como parámetro. Usar la función con la tabla anterior.

IF OBJECT_ID('f_AniosDif') IS NOT NULL
	DROP function f_aniosDif;
GO
CREATE FUNCTION dbo.f_aniosDif(@fechaInput DATE, @fechaActual DATE)
	RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(year, @fechaInput, @fechaActual) +
		CASE
			WHEN ( MONTH(@fechaActual) < MONTH(@fechaInput)
			OR (MONTH(@fechaActual) = MONTH(@fechaInput)
			AND DAY(@fechaActual) < DAY(@fechaInput)))
			Then -1
			else 0
		END
END
GO
SELECT FechaNacimiento, GETDATE(), dbo.f_aniosDif(fechanacimiento, GETDATE()) AS DifAnios FROM personas

--4.- Crear función que dada fecha como cadena de caracteres devuelva que no es correcta o en caso contrario el nombre del mes.

IF OBJECT_ID('f_DateValid') IS NOT NULL
	DROP function f_DateValid;
GO
CREATE FUNCTION dbo.f_DateValid(@fechaInput VARCHAR(MAX))
	RETURNS VARCHAR(12)
AS
BEGIN
	DECLARE @output AS VARCHAR(12)
	SET @output = 'Not valid'
	IF ISDATE(@fechaInput) = 1
		SET @output = DATENAME(MONTH, @fechaInput)
	RETURN @output
END
GO

PRINT dbo.f_DateValid('12-03-2002')

--5.- Crear una función de tabla que devuelva los libros de precio mayor que el que suministremos como parámetro.

IF OBJECT_ID('dbo.f_librosPrecioMayor') IS NOT NULL
	DROP function dbo.f_librosPrecioMayor;
GO
CREATE FUNCTION dbo.f_librosPrecioMayor (@limite decimal(4,2))
	RETURNS TABLE
AS
RETURN
(
	SELECT titulo 
	FROM dbo.libros 
	WHERE @limite < precio
)
GO

SELECT * FROM dbo.f_librosPrecioMayor(5);
go

--6.- Función que devuelva el máximo precio de la tabla libros

IF OBJECT_ID('dbo.precioMax') IS NOT NULL
	DROP function dbo.precioMax;
GO
CREATE FUNCTION dbo.precioMax()
	RETURNS DECIMAL(6,2)
AS
BEGIN
	RETURN (SELECT MAX(precio) FROM libros)
END
GO

PRINT dbo.precioMax();
go

--7.- Función que devuelva una tabla con el nombre y dni de las personas de dos tablas (personal y alumnado), 
--pasando como parámetro: personal (saca sólo los de la tabla personal; alumnado (saca sólo los de la tabla alumnado; 
--ambos (saca los de ambas tablas).

if object_id ('personal') is not null
  drop table personal;
go
if object_id ('alumnado') is not null
  drop table alumnado;
go
create table personal
( nombre varchar(100),
  apellidos varchar(100))
go
create table alumnado
( nom varchar(50),
  apell varchar(50))


insert into personal values
	('Juan','Pérez'),
	('María','Hernández'),
	('Ana','Rodríguez');

insert into alumnado values
	('Juana','García'),
	('María','Fernández'),
	('Pedro','Rodríguez'),
	('Marta','García');

IF OBJECT_ID('dbo.tablasPersonalAlumnado') IS NOT NULL
	DROP function dbo.tablasPersonalAlumnado;
GO
CREATE FUNCTION dbo.tablasPersonalAlumnado(@input varchar(15))
	RETURNS @tablaSalida table(
		nombre varchar(max),
		apellidos varchar(max)
	)
AS
	BEGIN
		IF (LOWER(@input) = 'personal' OR LOWER(@input) = 'ambos')
		BEGIN
			INSERT @tablaSalida
			SELECT nombre, apellidos
			FROM personal
		END
		IF (LOWER(@input) = 'alumnado' OR LOWER(@input) = 'ambos')
		BEGIN
			INSERT @tablaSalida
			SELECT nom, apell
			FROM alumnado
		END
		RETURN
	END
GO

SELECT * FROM dbo.tablasPersonalAlumnado('alumnado')
SELECT * FROM dbo.tablasPersonalAlumnado('personal')
SELECT * FROM dbo.tablasPersonalAlumnado('ambos')

--8.- Función que devuelva el nº de días del mes de una fecha pasada como parámetro.

IF OBJECT_ID('dbo.DaysOfMonth') IS NOT NULL
	DROP function dbo.DaysOfMonth;
GO
CREATE FUNCTION dbo.DaysOfMonth(@fecha DATETIME)
	RETURNS int
AS
	BEGIN
		RETURN DAY(EOMONTH(@fecha))
	END
GO

PRINT dbo.DaysOfMonth(GETDATE())

--9.- Crear función que valide si una cadena de caracteres es un DNI correcto. 
--Que contenga 8 dígitos y una letra y la letra se corresponda con la correcta. Probarlo con la tabla personas.

IF OBJECT_ID('dbo.checkDNI') IS NOT NULL
	DROP function dbo.checkDNI;
GO
CREATE FUNCTION dbo.checkDNI(@dni varchar(9))
	RETURNS VARCHAR(MAX)
AS
	BEGIN
		IF (LEN(@dni) != 9)
			RETURN 'NO valido'
		IF (@dni NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')
			RETURN 'NO valido'
		
		DECLARE @numeros AS varchar(max)
		DECLARE @letra AS char
		SET @numeros = SUBSTRING(@dni, 1, 8)
		SET @letra = SUBSTRING(@dni, 9, 1)

		IF (SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE', @numeros % 23 + 1, 1) = @letra)
			RETURN 'Valido'
		ELSE
			RETURN 'NO valido'
		RETURN 'NO valido'
	END
GO

SELECT nombre, apellidos, dbo.checkDNI(dni+letra) as DNIValidez FROM personas
GO