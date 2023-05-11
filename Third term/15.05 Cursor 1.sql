-- CURSOR 1

CREATE TABLE colores (
	nombre varchar(10)
	)
	
INSERT INTO colores VALUES ('Rojo'),
				('Amarillo'),
				 ('Verde'),
				 ('Azul')


IF OBJECT_ID('sp_colors','P') IS NOT NULL
	DROP PROCEDURE sp_colors;
GO

CREATE PROCEDURE sp_colors
AS
	DECLARE @contents varchar(max)
	DECLARE @nextcolor varchar(max)
	DECLARE cur CURSOR	FOR
		SELECT nombre 
		FROM master.dbo.colores
	OPEN cur
	SET @contents = ''
	FETCH NEXT FROM cur
		INTO @nextcolor
	WHILE @@FETCH_STATUS=0
		BEGIN 
		SET @contents = @contents + @nextcolor + ', '
		FETCH NEXT FROM cur
			INTO @nextcolor
		END
	CLOSE cur
	DEALLOCATE cur
	SELECT @contents AS Todos
GO

EXEC sp_colors;
GO


-- 15.06 Cursor 2

Create table Ventas (
	id int identity,
	cod char(5),
	mes char(2),
	importe decimal(8,2)
	)
	
create table meses(
	cod char(2) PRIMARY KEY,
	nombre varchar(10)
	)	
INSERT INTO VENTAS VALUES ('00001', '01',100), 
('00001', '02',200),
('00001', '03',250),
('00001', '04',100),
('00001', '05',150),
('00001', '06',100),
('00002', '01',150), 
('00002', '02',150),
('00002', '03',150),
('00002', '04',100),
('00002', '05',100),
('00002', '06',100)

INSERT INTO MESES VALUES ('01', 'Enero'),
('02', 'Febrero'),
('03', 'Marzo'),
('04', 'Abril'),
('05', 'Mayo'),
('06', 'Junio')

--Se pide realizar un procedimiento almacenado que contenga un cursor y que muestre las ventas 
--acumuladas de un determinado vendedor, algo parecido a lo que se muestra a continuación: 
--(en este caso para el vendedor de cod = 2)

IF OBJECT_ID('sp_ventas','P') IS NOT NULL
	DROP PROCEDURE sp_ventas;
GO

CREATE PROCEDURE sp_ventas
	@vendedor int
AS
	DECLARE @total DECIMAL(6,2)
	DECLARE @nextAmount DECIMAL(6,2)
	DECLARE @month VARCHAR(10)
	DECLARE cur CURSOR FOR
		SELECT importe, meses.nombre
		FROM master.dbo.Ventas
			INNER JOIN master.dbo.meses ON Ventas.mes = meses.cod
		WHERE @vendedor = ventas.cod
	OPEN cur
	SET @total = 0
	FETCH NEXT FROM cur INTO @nextAmount, @month
	WHILE @@FETCH_STATUS=0
	BEGIN
		SET @total += @nextAmount
		PRINT @month + ' Importe ' +  CAST(@nextAmount AS VARCHAR(MAX)) + ' Acumulado ' + CAST(@total AS VARCHAR(MAX))
		FETCH NEXT FROM cur INTO @nextAmount, @month
	END
	CLOSE cur
	DEALLOCATE cur
GO

EXEC sp_ventas 2;
GO