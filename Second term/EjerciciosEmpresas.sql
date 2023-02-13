USE EmpresasInformaticas;

--1.- Artículo que más unidades en total se ha vendido sin considerar los de tipos que contengan 'ALMACENAMIENTO' ni los de 'VARIOS'
SELECT TOP 1 fc.CodComponente, SUM(fc.Cantidad) AS CantVentas
FROM FacturaComponente AS fc
	INNER JOIN Componente AS c
	ON fc.CodComponente = c.clave
	INNER JOIN TipoComponente AS tc
	ON c.CodTipo = tc.CodTipo
WHERE Tipo != 'VARIOS' AND Tipo NOT LIKE '%ALMACENAMIENTO%'
GROUP BY CodComponente
ORDER BY CantVentas DESC;
go
--2.- Tienda con mayores ventas en importe
SELECT TOP 1 t.NombreTienda, SUM(fc.PrecioAplicado * fc.Cantidad) AS ImporteTotal
FROM Tienda AS t
	INNER JOIN Factura AS f
	ON t.IdTienda = f.idTienda
	INNER JOIN FacturaComponente AS fc
	ON f.NFactura = fc.NFactura
GROUP BY NombreTienda
ORDER BY ImporteTotal DESC;
go
--3.- Tienda con mayor número de facturas realizadas (sacar todas las que coincidan)
SELECT TOP 1 WITH TIES t.NombreTienda, COUNT(f.NFactura) AS NoFacturas
FROM Tienda AS t
	INNER JOIN Factura AS f
	ON t.IdTienda = f.idTienda
GROUP BY NombreTienda
ORDER BY NoFacturas DESC;
go
--4.- Artículos vendidos, dando su nombre, indicando el nº de veces que referencia esté a NULL
SELECT c.descripcion, COUNT(*) - COUNT(fc.Referencia) AS CantRefNull
FROM Componente AS c
	INNER JOIN FacturaComponente AS fc
	ON c.clave = fc.CodComponente
GROUP BY descripcion
ORDER BY CantRefNull DESC;
go
--5.- Importe de las facturas de las tiendas de Localidad 'La Laguna'
SELECT t.NombreTienda, SUM(fc.PrecioAplicado * fc.Cantidad) AS ImporteTotal
FROM Tienda AS t
	INNER JOIN Factura AS f
	ON t.IdTienda = f.idTienda
	INNER JOIN FacturaComponente AS fc
	ON f.NFactura = fc.NFactura
WHERE Localidad = 'La Laguna'
GROUP BY NombreTienda
go 
--6.- Nº de componentes vendidos por tipo de los tipos que contengan 'impresora'
SELECT SUM(fc.Cantidad) AS NoVendidos, tc.Tipo
FROM FacturaComponente AS fc
	INNER JOIN Componente AS c
	ON fc.CodComponente = c.clave
	INNER JOIN TipoComponente AS tc
	ON c.CodTipo = tc.CodTipo
WHERE Tipo LIKE '%impresora%'
GROUP BY tc.Tipo
ORDER BY NoVendidos DESC;
go
--7.- Nº de la Factura con más unidades vendidas (sacando todas las coincidentes) de las tiendas que contengan 'CRUZ' en la localidad.
SELECT TOP 1 WITH TIES fc.NFactura, SUM(fc.Cantidad) AS NoUnidadesVendidas, t.NombreTienda
FROM FacturaComponente AS fc
	INNER JOIN Factura AS f
	ON fc.NFactura = f.NFactura
	INNER JOIN Tienda AS t
	ON f.idTienda = t.IdTienda
WHERE Localidad LIKE '%cruz%'
GROUP BY fc.NFactura, t.NombreTienda
ORDER BY NoUnidadesVendidas DESC;
go 
--8.- Importe por Tipo de Componente, dando el nombre del tipo de componente y sacándolos todos.
SELECT t.Tipo, SUM(fc.PrecioAplicado * fc.Cantidad) AS ImporteTotal
FROM TipoComponente AS t
	INNER JOIN Componente AS c
	ON t.CodTipo = c.CodTipo
	INNER JOIN FacturaComponente AS fc
	ON c.clave = fc.CodComponente
GROUP BY t.Tipo;
go
--9.-Total de ventas (en importe) del mes de mayo
SELECT f.Fecha, SUM(fc.PrecioAplicado * fc.Cantidad) AS ImporteTotal
FROM Factura AS f
	INNER JOIN FacturaComponente AS fc
	ON f.NFactura = fc.NFactura
WHERE DATEPART(Month, Fecha) = '5'
GROUP BY f.Fecha;
go
--10.- Tienda con la factura en la que se vendieron más artículos.

--11.- Tipos de componente no vendidos

--12.- Especificar las facturas con más de 2 artículos, indicando el nombre de la tienda