-------------------------EJERCICIOS VISTA ----------------------------
USE Paro;
go
--1. Probar una consulta que nos muestre el total de parados por provincia para el mes de
--enero. Sacar� tambi�n el nombre de la Comunidad aut�noma.

SELECT p.Provincia, ca.CA, SUM(pm.TotalParoRegistrado) AS ParoTotalEnero
FROM Provincias AS p
	INNER JOIN Municipios AS m
	ON p.CodProvincia = m.CodProvincia
	INNER JOIN ParoMes AS pm
	ON m.CodMunicipio = pm.CodMunicipio
	INNER JOIN ComunidadesAutonomas AS ca
	ON p.CodCA = ca.CodCA
WHERE DATEPART(MONTH, pm.Fecha) = 1
GROUP BY p.Provincia, ca.CA;
go

--2. Crear una vista basada en esa consulta. (ver_paro_provincia)

CREATE VIEW ver_paro_provincia
AS
SELECT p.Provincia, ca.CA, SUM(pm.TotalParoRegistrado) AS ParoTotalEnero
FROM Provincias AS p
	INNER JOIN Municipios AS m
	ON p.CodProvincia = m.CodProvincia
	INNER JOIN ParoMes AS pm
	ON m.CodMunicipio = pm.CodMunicipio
	INNER JOIN ComunidadesAutonomas AS ca
	ON p.CodCA = ca.CodCA
WHERE DATEPART(MONTH, pm.Fecha) = 1
GROUP BY p.Provincia, ca.CA;
go

--3. Usar la vista sacando todos sus datos.

select * from ver_paro_provincia;
go

--4. Usar la vista para sacar la suma de parados por Comunidad Aut�noma.

SELECT CA, SUM(ParoTotalEnero) AS SumaParados
FROM ver_paro_provincia
GROUP BY CA;
go

--5. Crear una vista sobre la tabla ComunidadesAutonomas

CREATE VIEW ver_CA
AS
SELECT CodCa, CA
FROM ComunidadesAutonomas;
go

--6. Ver los datos que contiene

SELECT * FROM ver_CA;

--7. Borrar la vista anterior comprobando que existe

IF OBJECT_ID('ver_CA', 'V') IS NOT NULL
	DROP VIEW ver_CA;
go

--8. Mostrar la estructura de la vista ver_paro_provincia

exec sp_helptext ver_paro_provincia;
go

--9. Crear de nuevo la vista pero encriptada

CREATE VIEW ver_CA
WITH ENCRYPTION
AS
SELECT CodCa, CA
FROM ComunidadesAutonomas;
go

--10. Comprobar que no se puede ver su estructura

exec sp_helptext ver_CA;
go

--11. Actualizar el nombre de una Comunidad Aut�noma a trav�s de la vista

UPDATE ver_CA
SET CA = 'Pepeeeeeeeee'
WHERE CodCA = 1;
go

--12. Intentar una inserci�n

--13. Crear una vista que acceda a las Comunidades aut�nomas solamente

--14. Hacer una inserci�n correcta sobre esa vista

--15. Borrar el registro creado anteriormente, usando tambi�n la vista

--16. Crear una vista que muestre s�lo las Comunidades aut�nomas que comiencen con C y
--con la opci�n with check option

--17. Probar inserciones y modificaciones que validen el funcionamiento de la opci�n
--aplicada

--18. Modificar la vista anterior filtrando a comunidades aut�nomas que comiencen por A
