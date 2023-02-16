USE [Paro];
go
--1.- Municipios de la isla de Tenerife
SELECT m.Municipio
FROM Municipios AS m
	INNER JOIN MunicipiosIslas AS mi
	ON mi.CodMunicipio = m.CodMunicipio
	INNER JOIN Islas AS i
	ON mi.CISLA = i.CISLA
WHERE ISLA = 'tenerife';
go

--2.- Paro en la Industria en la Provincia de León en el mes de febrero de 2013
SELECT p.Provincia, SUM(pm.ParoIndustria) AS TotalParoIndustriaFebrero
FROM ParoMes AS pm
	INNER JOIN Municipios AS m
	ON pm.CodMunicipio = m.CodMunicipio
	INNER JOIN Provincias AS p
	ON m.CodProvincia = p.CodProvincia
WHERE Provincia = 'león' AND MONTH(pm.Fecha) = 2
GROUP BY Provincia
go
--3.- Mostrar las comunidades autónomas y el nº de habitantes (padrón), ordenándolas
--de mayor a menor población
SELECT ca.CA, SUM(pa.Padron) AS Padron
FROM ComunidadesAutonomas AS ca
	INNER JOIN Provincias AS p
	ON ca.CodCA = p.CodCA
	INNER JOIN Municipios AS m
	ON p.CodProvincia = m.CodProvincia
	INNER JOIN Padron AS pa
	ON m.CodMunicipio = pa.CodMunicipio
GROUP BY CA
ORDER BY Padron desc;
go
--4.- Qué Comunidad Autónoma tiene mayor diferencia entre el paro mujeres en la edad
--25-45 y la de mujeres menores de 25, en enero de 2013.
SELECT ca.CA, ParoHombreEdad25_45,ParoMujerEdadMenor25, ParoHombreEdad25_45 - ParoMujerEdadMenor25 AS DiffParo
FROM ComunidadesAutonomas AS ca
	INNER JOIN Provincias AS p
	ON ca.CodCA = p.CodCA
	INNER JOIN Municipios AS m
	ON p.CodProvincia = m.CodProvincia
	INNER JOIN ParoMes AS pm
	ON m.CodMunicipio = pm.CodMunicipio
ORDER BY DiffParo DESC;
go
--5.- Comunidades autónomas sin islas


--6.- Crear una vista que muestre el nombre de la comunidad autónoma, el de la
--provincia y el del municipio, junto al total de paro registrado a fecha 1/3/2013 y al
--padrón. Usar esta vista para mostrar la división entre paro registrado y padrón para
--todas las Comunidades autónomas.


--7.- (SUBCONSULTAS)Dar los nombres de los municipios de la Comunidad autónoma con mayor paro en
--agricultura (en febrero de 2013).


--8.- (SUBCONSULTAS)Número de municipios con más de 200000 habitantes por Comunidad Autónoma
--en el padrón, sacando todas las Comunidades Autónomas


--9.- (SUBCONSULTAS)Municipios con más parados en Servicios entre los habitantes del padrón en
--febrero de 2013 que la media nacional de la misma división


--10.- Indicar para cada Comunidad Autónoma el nº de habitantes por municipio
--(padrón dividido entre número de municipios), ordenándolas de menor a mayor


--11.- (SUBCONSULTAS)Diferencia por Comunidad Autónoma entre el nº de parados en marzo de 2013 y
--en enero de 2013


--12.- (SUBCONSULTAS)Municipio con más habitantes de cada Comunidad Autónoma.