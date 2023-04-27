-- 15.04

USE EmpresasInformaticas;
go

--1.- Crear Procedimiento almacenado al que le pasemos como parámetro el nombre del Mes, 
--que valide si es correcto y que devuelva en un parámetro de salida el nº de facturas del mes indicado 
--y un -1 si el nombre del mes es incorrecto. Dar tres ejemplos de prueba.

IF object_id('proc_validarMes','P') is not null
	DROP PROCEDURE proc_validarMes;
GO

CREATE PROCEDURE proc_validarMes
	@mesInput varchar(20),
	@outputParameter int output
AS
	IF (@mesInput IN ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'))
		BEGIN
			SET @outputParameter = (SELECT COUNT(*) FROM Factura WHERE DATENAME(MONTH, Fecha) = @mesInput) 
		END
	ELSE
		BEGIN
			SET @outputParameter = -1
		END
GO

DECLARE @output AS INT
EXEC proc_validarMes 'April', @outputParameter = @output output
PRINT @output
EXEC proc_validarMes 'May', @outputParameter = @output output
PRINT @output
EXEC proc_validarMes 'Lunes', @outputParameter = @output output
PRINT @output
GO
--2.- Hacer un procedimiento almacenado que muestre el día de los N próximos meses a partir de la fecha de hoy, 
--con N entrado como parámetro, con valor por defecto 10. Si hoy es 8/6/2013, para N=8 deberá salir en formato fecha:

if object_id('sp_NMeses','P') is not null
drop procedure sp_NMeses;
go

CREATE PROCEDURE sp_NMeses
	@n int
AS
	DECLARE @i AS int
	SET @i = 0
	WHILE (@i < @n)
		BEGIN
			PRINT DATEADD(MONTH, @i, GETDATE())
			SET @i = @i + 1
		END
GO

EXEC sp_NMeses 6;
go

--3.- Crear Procedimiento almacenado que actualice la tabla componente, aplicándole un 5% de incremento a los precios
--de los componentes de un CodTipo pasado como parámetro. Validará que hay componentes del tipo pasado,
--mostrando un mensaje en el caso de que no existan y el número de componentes modificados en el caso de que sí existan.

IF OBJECT_ID('sp_ModifyComponent','P') IS NOT NULL
	DROP PROCEDURE sp_ModifyComponent;
GO

CREATE PROCEDURE sp_ModifyComponent
	@inputCode int
AS
SET NOCOUNT ON;
BEGIN
	IF ((SELECT COUNT(CodTipo) FROM Componente WHERE CodTipo = @inputCode) = 0 )
		BEGIN
			PRINT 'Error, no existe productos con el codigo: ' + @inputCode;
		END
	ELSE
		BEGIN
			UPDATE Componente
			SET precio = precio*1.05
			WHERE CodTipo = @inputCode;
		
			PRINT CAST(@@rowcount as varchar) + ' componentes modificados'
		END
END
go

EXEC sp_ModifyComponent 55;
go
SELECT * FROM Componente WHERE CodTipo = 55;
--4.- Crear un procedimiento almacenado que le pasemos como parámetro un texto y que devuelva en un parámetro de salida 
--los símbolos que no sean las vocales (con o sin acento). Hacer un ejemplo de ejecución.

IF OBJECT_ID('sp_NonVowels','P') IS NOT NULL
	DROP PROCEDURE sp_NonVowels;
GO

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
EXEC sp_NonVowels 'aaaaatexto', @result OUTPUT
SELECT @result


--5.- Crear procedimiento almacenado que le pasemos un texto como parámetro y devuelva en un parámetro de salida el nº de componentes 
--cuya descripción contenga el texto suministrado. Hacer un ejemplo de ejecución.

IF OBJECT_ID('sp_textDesc','P') IS NOT NULL
	DROP PROCEDURE sp_textDesc;
GO

CREATE PROCEDURE sp_textDesc
	@inputText varchar(30),
	@outputComponents int output
AS
	SET @outputComponents = (SELECT COUNT(*) FROM Componente WHERE descripcion LIKE '%' + @inputText + '%')
GO

DECLARE @num AS int
EXEC sp_textDesc 'ACER', @outputComponents = @num output
PRINT @num
go