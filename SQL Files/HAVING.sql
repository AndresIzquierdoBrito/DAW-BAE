--	Para la BD parobasicas:
USE parobasicas;
GO
--• Sumar el padron de las ca con más de 5 provincias para datos del 1/3/2013
SELECT -- :)
	CA,
	SUM(Padron) AS SumaDePadron,
	COUNT(DISTINCT Provincia)
FROM  DatosCompletosTabla
WHERE Fecha = '1-03-2013'
GROUP BY CA
HAVING COUNT(DISTINCT Provincia) > 5
ORDER BY SumaDePadron DESC
GO

--• Sumar el paro de las provincias con 4 islas (usando having) para datos 1/1/2013.

SELECT
	Provincia,
	SUM(TotalParoRegistrado) AS ParoRegistradoTotal
FROM DatosCompletosTabla
WHERE Fecha = '01-01-2013'
GROUP BY Provincia
HAVING COUNT(DISTINCT ISLA) = 4
ORDER BY ParoRegistradoTotal
GO

--Para la BD audienciasbasicas:
USE audienciasbasicas;
GO
--• Suma de audiencia de programas para cada cadena en martes y para las cadenas con tres o -menos programas.
SELECT 
	Cadena,
	COUNT(DISTINCT Programa) AS NoProgramas,
	SUM(Espectadores) AS TotalEspectadores
FROM Datosprogramas
WHERE DATEPART(DW, FechaHora) = 2
GROUP BY Cadena
HAVING COUNT(DISTINCT Programa) <= 3
ORDER BY TotalEspectadores DESC;
GO

--• Mostrar las cadenas con media de share mayor que 10 en el horario de las 10, 11 y 12 de la mañana.
SELECT
	Cadena,
	AVG(Share)
FROM Datosprogramas
WHERE DATEPART(HOUR, FechaHora) IN (10, 11, 12)
GROUP BY Cadena
HAVING AVG(Share) > 10
GO

--Para la BD turismobasicas:
USE turismobasicas;
GO
--• Mostrar la media de turistas por pais para aquellos países con media mayor de 250000 en 2012

SELECT
	pais,
	AVG(turistas) AS MediaTuristas
FROM DatosTuristas
WHERE periodo = 2012
GROUP BY pais
HAVING AVG(turistas) > 25000
ORDER BY MediaTuristas DESC;
GO


--• Mostrar los dos paises con mayor suma de turistas en 2013, que tengan todos sus datos >23000.

SELECT TOP 2
	pais,
	SUM(turistas) AS TotalTuristas
FROM DatosTuristas
WHERE periodo = 2013
GROUP BY pais
HAVING SUM(turistas) > 23000
ORDER BY TotalTuristas DESC