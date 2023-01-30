SELECT CA, Provincia, Padron
FROM DatosCompletosTabla
GROUP BY CA, Provincia;
GO

SELECT CA, Provincia
FROM DatosCompletosTabla
WHERE CA IN( 'Canarias', 'Galicia', 'Cantabri')
GROUP BY CA, Provincia;
GO

SELECT Municipio, ISLA
FROM DatosCompletosTabla
WHERE ISLA is not NULL
GROUP BY ISLA, Municipio;
GO

USE turismobasicas
SELECT pais
FROM DatosTuristas
GROUP BY pais;
GO

SELECT pais
FROM DatosTuristas
WHERE sexo = 'Mujeres' AND grupoedad = 'De 25 a 44 años' AND turistas > 30000
GROUP BY pais;
GO

