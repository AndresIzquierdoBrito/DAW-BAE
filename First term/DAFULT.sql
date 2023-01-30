CREATE TABLE TipoPlato2(
	CodTipoPlato int
	,TipoPlato varchar(100) default 'Bebidas básicas'
	,Agrupa varchar(10) default 'Bebida'
	);
	GO

INSERT TipoPlato2 (CodTipoPlato, TipoPlato, Agrupa)
	VALUES(1, default, default);
INSERT TipoPlato2 (CodTipoPlato)
	VALUES(2);
INSERT TipoPlato2 (CodTipoPlato, TipoPlato)
	VALUES(3, 'Delicia');
INSERT TipoPlato2 (CodTipoPlato, Agrupa)
	VALUES(3, default);
GO

SELECT * FROM TipoPlato2;
GO

SELECT Plato, cast(precio AS VARCHAR) + ' * 5 = ' +CAST((precio*5) AS VARCHAR) AS 'Precio de 5 platos'
FROM Plato;
GO

SELECT  Plato, precio*95/100 as 'Precio con 5% de descuento'
	FROM Plato;
GO

SELECT Plato, precio FROM Plato
	WHERE CodPlato=4;
GO

UPDATE Plato
	SET Precio=precio+3
	WHERE CodPlato=4;
GO

SELECT Plato, precio FROM Plato
	WHERE CodPlato=4;
GO

-- Primero realiza la suma (4+5) al estar en parentesis y conseguidamente lo multiplica por 6
SELECT (4+5)*6;
GO

-- Primero realiza el product al seguir el orden de operaciones (productos > sumas), 4*2 y despues le suma 3
SELECT 3+4*2;
GO

-- Realiza en primer lugar el product -4*5 para despues sumarle al numero negativo 2. 
SELECT -4*5+2;
GO

-- Realiza la división 22 entre 5 y te presenta el resto de la operacion.
SELECT 22%5;
GO

SELECT Agrupa+': '+ TipoPlato as 'Su plato'
FROM TipoPlato;
GO

