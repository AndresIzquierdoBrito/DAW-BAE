USE RestauranteBasicas;
GO

SELECT Plato
FROM Plato
WHERE Plato LIKE '[A-F]%';
GO

SELECT TipoPlato
FROM TipoPlato
WHERE TipoPlato = 'Carnes';
GO

SELECT TipoPlato
FROM TipoPlato
WHERE TipoPlato LIKE '%Carnes%';
GO

SELECT Plato
FROM Plato
WHERE Plato LIKE '%ca%';
GO

SELECT IdComida 
FROM Comida
WHERE CodMesa LIKE'__[1-2]%'
GO

SELECT Plato
FROM Plato
WHERE Plato LIKE '%lenguado%' 
	OR
	Plato LIKE '%salmon%';
GO






SELECT 