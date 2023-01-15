USE RestauranteBasicas;
SELECT * 
FROM Plato
ORDER BY Plato;
GO

SELECT * 
FROM Plato
ORDER BY Precio DESC;
GO

SELECT *
FROM Plato
ORDER BY CodPlato, Precio;
GO

SELECT * 
FROM Comida
WHERE Pagado = 'S'
ORDER BY DATENAME(MONTH, Fecha);
GO