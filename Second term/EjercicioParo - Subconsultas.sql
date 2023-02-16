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

--2.- Paro en la Industria en la Provincia de Le�n en el mes de febrero de 2013
SELECT p.Provincia, SUM(pm.ParoIndustria) AS TotalParoIndustriaFebrero
FROM ParoMes AS pm
	INNER JOIN Municipios AS m
	ON pm.CodMunicipio = m.CodMunicipio
	INNER JOIN Provincias AS p
	ON m.CodProvincia = p.CodProvincia
WHERE Provincia = 'le�n' AND MONTH(pm.Fecha) = 2
GROUP BY Provincia
go
--3.- Mostrar las comunidades aut�nomas y el n� de habitantes (padr�n), orden�ndolas
--de mayor a menor poblaci�n
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
--4.- Qu� Comunidad Aut�noma tiene mayor diferencia entre el paro mujeres en la edad
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
--5.- Comunidades aut�nomas sin islas


--6.- Crear una vista que muestre el nombre de la comunidad aut�noma, el de la
--provincia y el del municipio, junto al total de paro registrado a fecha 1/3/2013 y al
--padr�n. Usar esta vista para mostrar la divisi�n entre paro registrado y padr�n para
--todas las Comunidades aut�nomas.


--7.- (SUBCONSULTAS)Dar los nombres de los municipios de la Comunidad aut�noma con mayor paro en
--agricultura (en febrero de 2013).


--8.- (SUBCONSULTAS)N�mero de municipios con m�s de 200000 habitantes por Comunidad Aut�noma
--en el padr�n, sacando todas las Comunidades Aut�nomas


--9.- (SUBCONSULTAS)Municipios con m�s parados en Servicios entre los habitantes del padr�n en
--febrero de 2013 que la media nacional de la misma divisi�n


--10.- Indicar para cada Comunidad Aut�noma el n� de habitantes por municipio
--(padr�n dividido entre n�mero de municipios), orden�ndolas de menor a mayor


--11.- (SUBCONSULTAS)Diferencia por Comunidad Aut�noma entre el n� de parados en marzo de 2013 y
--en enero de 2013


--12.- (SUBCONSULTAS)Municipio con m�s habitantes de cada Comunidad Aut�noma.