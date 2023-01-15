SELECT Plato 
FROM Plato
WHERE 
	((SUBSTRING(Plato, 1,1) = 'A'))
	OR 
	((SUBSTRING(Plato,1,1) = 'C'))
ORDER BY Plato;
GO

SELECT Plato 
FROM Plato
WHERE 
	NOT ((SUBSTRING(Plato, 1,1) = 'A'))
	AND 
	NOT ((SUBSTRING(Plato,1,1) = 'C'))
ORDER BY Plato;
GO


SELECT *
FROM Plato 
WHERE
	Precio > 10 
	AND 
	Precio < 20
ORDER BY Precio; 
GO

SELECT Plato
FROM Plato
WHERE LEFT(Plato,1) BETWEEN 'A' AND 'C'
ORDER BY Plato;
GO

SELECT *
FROM Plato
WHERE Precio BETWEEN 10 AND 20
ORDER BY Precio;
GO

SELECT  Plato
FROM Plato
WHERE LEFT(Plato,1) IN ('A','E','I','O','U');
GO

SELECT Plato, Precio
FROM Plato
WHERE Precio IN (6, 9, 11,16)
ORDER BY Precio;
GO

SELECT  Plato
FROM Plato
WHERE LEFT(Plato,1) IN ('A','B','C')
ORDER BY Plato;
GO

SELECT *
FROM Comida
WHERE DATENAME(dw, Fecha) IN ('Lunes', 'Jueves', 'Sabado');
GO

