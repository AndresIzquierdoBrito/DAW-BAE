CREATE PROCEDURE sp_NonVowels
    @inputText NVARCHAR(MAX),
    @outputText NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @outputText = ''
    DECLARE @index INT = 1
    WHILE @index <= LEN(@inputText)
    BEGIN
        DECLARE @char NCHAR(1) = SUBSTRING(@inputText, @index, 1)
        IF @char NOT LIKE '[aeiouAEIOUáéíóúÁÉÍÓÚ]'
            SET @outputText = @outputText + @char
        SET @index = @index + 1
    END
END

DECLARE @result NVARCHAR(MAX)
EXEC sp_NonVowels 'atexto', @result OUTPUT
SELECT @result

--1.- Crear un procedimiento que pase como parámetro el nombre de la tabla a crear, y que valide si existe, 
--dando error si es así; en caso contrario la cree con la siguiente estructura:
-- (DNI varchar(9), Nombre varchar(40));

if object_id('proc_createTabla','P') is not null
drop procedure proc_createTabla;
go

create procedure proc_createTabla
@tabla nvarchar(100)
AS SET NOCOUNT ON
IF OBJECT_ID(@tabla) IS NULL
	BEGIN
		DECLARE @sentencia nvarchar(100)
		SET @sentencia = 'CREATE TABLE ' + @tabla + '(DNI varchar(9), Nombre varchar(40));' 
		EXEC sp_executesql @sentencia
	END
ELSE
	BEGIN
		PRINT 'ERROR: La tabla ' + @tabla + ' ya existe.'
	END
go

exec proc_createTabla 'Test1'
go

--2.- Crear un procedimiento que pase como parámetro el nombre de una tabla, que valide si existe,
--en ese caso hacer un select de la misma, y en caso contrario nos indique que no existe mediante un mensaje de error.

if object_id('proc_selectTabla','P') is not null
drop procedure proc_selectTabla;
go

create procedure proc_selectTabla
@tabla nvarchar(100)
AS SET NOCOUNT ON
IF OBJECT_ID(@tabla) IS NULL
	BEGIN
		PRINT 'ERROR: La tabla ' + @tabla + ' no existe.'
	END
ELSE
	BEGIN
		DECLARE @sentencia nvarchar(100)
		SET @sentencia = 'SELECT * FROM ' + @tabla + ';' 
		EXEC sp_executesql @sentencia
	END
go

exec proc_selectTabla 'TestTest'
go
exec proc_selectTabla 'ALQ_Alquiler'
go
