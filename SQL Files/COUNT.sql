USE parobasicas;

SELECT COUNT(Provincia)
FROM DatosCompletosTabla
WHERE Provincia = 'Santa Cruz de Tenerife';
GO

SELECT COUNT(DISTINCT ISLA)
FROM DatosCompletosTabla;
GO

SELECT COUNT(DISTINCT Municipio)
FROM DatosCompletosTabla
WHERE Provincia = 'Palmas, Las';
GO

SELECT COUNT(Fecha)
FROM DatosCompletosTabla
WHERE DATEPART(MONTH, Fecha) = 2;
GO

SELECT COUNT_BIG(Fecha)
FROM DatosCompletosTabla
WHERE DATEPART(MONTH, Fecha) = 2;
GO
 
SELECT COUNT(Padron)
FROM DatosCompletosTabla
WHERE Padron < 1000 AND ISLA IS NOT NULL;
GO

SELECT COUNT(DISTINCT CA)
FROM DatosCompletosTabla
WHERE CA LIKE '%e%';
GO
----------------------------------

SELECT SUM(Padron)
FROM DatosCompletosTabla
WHERE Fecha = '01-03-2013' AND Provincia = 'Santa Cruz de Tenerife';
GO

SELECT SUM(TotalParoRegistrado)
FROM DatosCompletosTabla
WHERE Fecha = '01-02-2013' AND Municipio = 'Madrid';
GO

SELECT SUM(Padron)
FROM DatosCompletosTabla
WHERE CA = 'Extremadura' OR CA = 'Andalucía' OR CA = 'Aragón' OR CA = 'Canarias';
GO

SELECT SUM(Padron)
FROM DatosCompletosTabla
WHERE CA IN('Extremadura' ,'Andalucía', 'Aragón', 'Canarias');
GO

------------------------

