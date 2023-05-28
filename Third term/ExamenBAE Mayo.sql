USE operacionesquirurgicas;
go

--1.

IF OBJECT_ID('proc_MaterialIntervencion') IS NOT NULL
	DROP PROCEDURE proc_MaterialIntervencion;
GO
CREATE PROCEDURE proc_MaterialIntervencion 
	@nombreIntervencion VARCHAR(MAX),
	@cantMaterial INT OUTPUT
AS
	IF ((SELECT denominaciontipo FROM intervencion WHERE denominaciontipo = @nombreIntervencion) = @nombreIntervencion)
	BEGIN
		SET @cantMaterial = (
			SELECT SUM(cantidad)
			FROM intervencion AS i
			INNER JOIN materialintervencion AS mi
			ON i.idintervencion = mi.idintervencion
			WHERE denominaciontipo = @nombreIntervencion)
	END
	ELSE 
		SET @cantMaterial = -1
GO

DECLARE @cant AS INT
EXEC proc_MaterialIntervencion 'Cesárea', @cantMaterial = @cant OUTPUT;
PRINT @cant
EXEC proc_MaterialIntervencion 'Apendicectomía', @cantMaterial = @cant OUTPUT;
PRINT @cant
EXEC proc_MaterialIntervencion 'Error', @cantMaterial = @cant OUTPUT;
PRINT @cant
GO

--2.

IF OBJECT_ID('f_sustitucionCaracteres') IS NOT NULL
	DROP FUNCTION f_sustitucionCaracteres;
GO
CREATE FUNCTION f_sustitucionCaracteres
  (@inputText VARCHAR(MAX))
  RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @result VARCHAR(MAX) = ''
	DECLARE @letra AS CHAR
	DECLARE @index AS INT = 1

	WHILE @index <= LEN(@inputText)
	BEGIN
		SET @letra = SUBSTRING(@inputText, @index, 1)

		IF (@letra = 'e')
			SET @result = @result + '3'
		ELSE
		  IF (@letra = ' ')
			SET @result = @result + '?'
		  ELSE
			IF (@letra IN ('a','i','o','u','á','é','í','o','ú'))
			  SET @result = @result + UPPER(@letra)
			ELSE			
			  SET @result = @result + LOWER(@letra)
		SET @index = @index + 1
	END
	RETURN @result
END
GO

SELECT dbo.f_sustitucionCaracteres('holá que tal HOLA QUE TAL');
go
SELECT dbo.f_sustitucionCaracteres(Nombre)
FROM Paciente
go

--3.

IF object_id('TablasOperaciones') IS NOT NULL
DROP table [TablasOperaciones]
go
create table TablasOperaciones
( t varchar(100))
go
insert into TablasOperaciones
values ('Paciente'),('Operacion'),('Intervencion'),('material')
go

IF object_id('cur_tablas') IS NOT NULL 
DROP procedure cur_tablas
goCREATE PROCEDURE cur_tablas	AS	DECLARE @sentencia VARCHAR(100)	DECLARE @Tabla VARCHAR(100)	DECLARE CUR CURSOR FOR		SELECT t		FROM operacionesquirurgicas.dbo.TablasOperaciones;	OPEN CUR	FETCH NEXT FROM CUR		INTO @Tabla	WHILE @@FETCH_STATUS=0
		BEGIN
		SET @sentencia = 'SELECT COUNT(*) ' + ' AS ' + @Tabla + ' FROM ' + @Tabla
		EXEC(@sentencia)
		fetch next from CUR
			into @Tabla
		END
	CLOSE CUR
	DEALLOCATE CUR
	PRINT 'OK'
go

EXEC cur_tablas;
go
--4.
IF OBJECT_ID('f_IntervecionesUsenMaterial') IS NOT NULL
	DROP FUNCTION f_IntervecionesUsenMaterial;
GO
CREATE FUNCTION dbo.f_IntervecionesUsenMaterial 
 (@material VARCHAR(MAX))
RETURNS TABLE
AS
RETURN
(
	SELECT denominaciontipo
	FROM intervencion AS i
	INNER JOIN materialintervencion AS mi
	ON i.idintervencion = mi.idintervencion
	INNER JOIN material AS m
	ON mi.idmaterial = m.idmaterial
	WHERE m.nombrematerial = @material
)
GO

SELECT * FROM dbo.f_IntervecionesUsenMaterial('Forceps.');
go

--5.

IF OBJECT_ID('f_DevolverCampo') IS NOT NULL
	DROP FUNCTION f_DevolverCampo;
GO
CREATE FUNCTION dbo.f_DevolverCampo 
  (@valor1 int,
   @valor2 int)
RETURNS @OutputTable TABLE (txt varchar(100))
AS
BEGIN
	if(@valor1 = 1)
	  INSERT  @OutputTable
		SELECT nombrematerial
		FROM material
	if(@valor2 = 1)
	  INSERT  @OutputTable
		SELECT denominaciontipo
		FROM intervencion
	RETURN
END
GO

SELECT * FROM dbo.f_DevolverCampo(0,1);
SELECT * FROM dbo.f_DevolverCampo(1,1);
go
--6.

IF OBJECT_ID('trig_AltaMenoresEdad') IS NOT NULL
DROP TRIGGER trig_AltaMenoresEdad;
GO
CREATE TRIGGER trig_AltaMenoresEdad
ON Paciente
FOR INSERT
AS
	DECLARE @fechaNacimiento datetime
	SELECT @fechaNacimiento = FechaNacimiento FROM inserted	
	IF (DATEDIFF(YEAR,@fechanacimiento,GETDATE()) > 18)
		UPDATE Paciente SET FechaNacimiento = inserted.FechaNacimiento
			FROM Paciente
			INNER JOIN inserted
				ON inserted.DNIPaciente = Paciente.DNIPaciente
	ELSE
	BEGIN
		RAISERROR ('No se puede dar de alta a pacientes menores de edad', 16, 1)
		ROLLBACK TRANSACTION
	END
GO
INSERT INTO Paciente VALUES ('0523Y2F0L', 'david pérez', 'c/galicia nº 32', '1-1-2009', '922304050');

INSERT INTO Paciente VALUES ('0523d2T0L', 'david pérez', 'c/galicia nº 32', '1-1-1999', '922304050');

