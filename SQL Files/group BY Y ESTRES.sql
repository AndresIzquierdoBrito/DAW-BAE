--Para la BD parobasicas:
--•Total de habitantes y parados por isla para datos del 1/3/2013.
USE parobasicas;
GO

SELECT 
	ISLA,
	SUM(Padron),
	SUM(TotalParoRegistrado)
FROM DatosCompletosTabla
WHERE Fecha = '1/3/2013' AND ISLA IS NOT NULL
GROUP BY ISLA
ORDER BY SUM(TotalParoRegistrado) desc
GO

--•Mostrar los 3 municipios de Canarias con mayor media de parados.

SELECT TOP 3
	ISLA,
	Municipio,
	AVG(TotalParoRegistrado)
FROM DatosCompletosTabla
WHERE CA = 'Canarias'
GROUP BY Municipio, ISLA
ORDER BY AVG(TotalParoRegistrado) DESC;
GO

--•Cuántos municipios por provincia y CA tenen el paro por encima del 20% de la población para el dato de 1/1/2013.

SELECT 
	CA,
	Provincia,
	COUNT(Municipio) AS 'Municipios con paro mayor a 20% de poblacion'
FROM DatosCompletosTabla
WHERE TotalParoRegistrado > 0.2*Padron AND Fecha = '1/1/2013'
GROUP BY Provincia, CA
ORDER BY CA, COUNT(Municipio)  DESC
GO
--Para la BD audienciasbasicas:
--•Cuántos programas diferentes tene cada cadena con algún share >20
USE audienciasbasicas;
GO
SELECT 
	Cadena,
	COUNT(DISTINCT Programa)
FROM Datosprogramas
WHERE SHARE > 20
GROUP BY Cadena
ORDER BY COUNT(DISTINCT Programa) DESC
GO

--•Media de espectadores que han visto programas punteros en la sexta os lunes, por hora de comienzo.

SELECT 
	DATENAME(HOUR, FechaHora), 
	AVG(Espectadores) AS 'Media de espectadores'

FROM Datosprogramas
WHERE DATEPART(DW, FechaHora) = '1' AND Cadena = 'LA SEXTA'
GROUP BY DATENAME(HOUR, FechaHora)
ORDER BY DATENAME(HOUR, FechaHora) ASC
GO
SELECT 
	DATENAME(HOUR, FechaHora) + ':' + DATENAME(MINUTE, FechaHora), 
	AVG(Espectadores) AS 'Media de espectadores'

FROM Datosprogramas
WHERE DATEPART(DW, FechaHora) = '1' AND Cadena = 'LA SEXTA'
GROUP BY DATENAME(HOUR, FechaHora) + ':' + DATENAME(MINUTE, FechaHora)
ORDER BY DATENAME(HOUR, FechaHora) + ':' + DATENAME(MINUTE, FechaHora) ASC
GO
--Para la BD turismobasicas:
--•Contar cuántos datos hay por grupo de edad.
USE turismobasicas;
GO

SELECT 
	grupoedad,
	COUNT(*) AS 'Datos por grupo'
FROM DatosTuristas
GROUP BY grupoedad;
GO

--•Dar los 3 países con más turistas en el periodo de 2013.

SELECT TOP 3
	pais,
	SUM(turistas) as TotTuristas
FROM DatosTuristas
WHERE periodo = '2013'
GROUP BY pais
ORDER BY TotTuristas DESC
GO

