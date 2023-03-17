use Restaurante;
go
--1.- Contar cuántos platos se han servido por Tipo de Plato (la descripción
--del Tipo de plato).


--2.- Contar las comidas servidas en las mesas, sacando todas las mesas.


--3.- Dar la mesa y la fecha de la comida que más platos consumió del tipo
--de plato carnes, sacándolas todas si hay más de una.


--4.- Comidas pagadas (dando mesa y fecha) que han consumido algo de bebidas.


--5.- Importe total de las comidas pagadas de las mesas que comienzan con A.


--6.- Día de la semana con mayor facturación.


--7.- Tipo de plato (dando la descripción del tipo de plato) que no sea bebida
--y que menos veces se ha pedido.


--8.- Para cada plato, dando su nombre y sacándolos todos, indicar el nº de
--comidas en las que ha aparecido.


--(*) 9.- Dar las comidas pendientes de pagar (dando mesa y fecha) con todos
--sus platos servidos.


--(*) 10.- Comidas (dando mesa y fecha) que sólo han consumido bebidas.


--11.- Calcular el plato con mayor diferencia entre lo que se cobró y el precio
--actual (de la tabla Plato).


--12.- Sacar la estadística por días, incluyendo nº platos (incluyendo
--bebidas), el nº de comidas realizadas y el importe de los platos (incluyendo
--bebidas). 

-- ********************************* ENTREGA *******************************

--1. Dar el plato más caro de cada comida.

SELECT c.IdComida,
       (SELECT TOP 1 p.Plato
        FROM   plato AS p
               INNER JOIN detallecomida AS detcom
                       ON p.codplato = detcom.codplato
        WHERE  detcom.idcomida = c.idcomida
        ORDER  BY precio DESC) AS PlatoMasCaro
FROM   comida AS c;
go

--2. Para cada comida dar el número de platos servidos y el número de platos no servidos.

SELECT c.idcomida,
       (SELECT Count(*)
        FROM   detallecomida AS dc
        WHERE  servido = 'S'
               AND dc.idcomida = c.idcomida) AS PlatosServidos,
       (SELECT Count(*)
        FROM   detallecomida AS dc
        WHERE  servido = 'N'
               AND dc.idcomida = c.idcomida) AS PlatosNoServidos
FROM   comida AS c;

--3. Dar el plato más caro de cada tipo de plato.

SELECT tp.TipoPlato, 
(SELECT TOP 1 Plato
FROM Plato AS p
WHERE p.CodPlato = tp.CodTipoPlato
ORDER BY Precio DESC) AS PlatoMasCaro
FROM TipoPlato AS tp;
go

--4. Dar el plato más caro del tipo de plato con más platos que no sean bebidas.

SELECT TOP 1 WITH TIES tp.tipoplato,
       (SELECT TOP 1 p.plato
        FROM   plato AS p
        WHERE  p.codtipoplato = tp.codtipoplato
        ORDER  BY precio DESC) AS PlatoMasCaro
FROM   tipoplato AS tp
       INNER JOIN plato AS p
               ON tp.codtipoplato = p.codtipoplato
WHERE tp.Agrupa != 'Bebida'
GROUP  BY tipoplato,
          tp.codtipoplato
ORDER BY Count(*) DESC;
go
-- eSTE ESTA BIEN 
SELECT TOP 1 WITH TIES p.plato
FROM   plato AS p
WHERE  p.codtipoplato IN (SELECT TOP 1 WITH TIES tp.CodTipoPlato
                         FROM   tipoplato AS tp
                                INNER JOIN plato AS p
                                        ON tp.codtipoplato = p.codtipoplato
                         WHERE  tp.agrupa != 'Bebida'
                         GROUP  BY tp.CodTipoPlato
                         ORDER  BY Count(*) DESC)
ORDER  BY precio DESC;
go

--5. Dar los platos servidos de la comida más barata.

SELECT plato
FROM   plato AS p
       INNER JOIN detallecomida AS detcom
               ON p.codplato = detcom.codplato
WHERE  detcom.idcomida = (SELECT TOP 1 c.idcomida
                          FROM   comida AS c
                                 INNER JOIN detallecomida AS dc
                                         ON c.idcomida = dc.idcomida
                          GROUP  BY c.idcomida
                          ORDER  BY Sum(dc.precioplato));

go 

--6. Dar los tipos de platos servidos de la comida más cara.

SELECT plato
FROM   plato AS p
       INNER JOIN detallecomida AS detcom
               ON p.codplato = detcom.codplato
WHERE  detcom.idcomida = (SELECT TOP 1 c.idcomida
                          FROM   comida AS c
                                 INNER JOIN detallecomida AS dc
                                         ON c.idcomida = dc.idcomida
                          GROUP  BY c.idcomida
                          ORDER  BY Sum(dc.precioplato) DESC);

go 

--7. Dar las comidas pendientes de pagar (dando mesa y fecha) con todos sus platos servidos.

SELECT c.Fecha, c.CodMesa, p.Plato
FROM Plato AS p
	INNER JOIN DetalleComida AS dc
	ON p.CodPlato = dc.CodPlato
	INNER JOIN Comida AS c
	ON dc.IdComida = c.IdComida
WHERE c.Pagado = 'N' AND Servido = 'S'

SELECT c.Pagado
FROM Comida AS c
--

SELECT comida.idcomida,
       mesa.codmesa,
       fecha,
       (SELECT Count(*)
        FROM   plato
               INNER JOIN detallecomida
                       ON detallecomida.codplato = plato.codplato
        WHERE  servido = 'S'
               AND detallecomida.idcomida = comida.idcomida) AS PlatosServidos
FROM   mesa
       INNER JOIN comida
               ON comida.codmesa = mesa.codmesa
WHERE  pagado = 'N'; 
--8. Comidas (dando mesa y fecha) que sólo han consumido bebidas

SELECT c.fecha,
       c.codmesa
FROM   comida AS c
WHERE  c.idcomida IN (SELECT c.idcomida
                      FROM   comida AS c
                             INNER JOIN detallecomida AS dc
                                     ON c.idcomida = dc.idcomida
                             INNER JOIN plato AS p
                                     ON dc.codplato = p.codplato
                             INNER JOIN tipoplato AS tp
                                     ON p.codtipoplato = tp.codtipoplato
                      WHERE  agrupa = 'Bebida'); 


--9. Mostrar los platos de las Comidas que han servido más de 5 bebidas.

SELECT DISTINCT p.plato
FROM   plato AS p
       INNER JOIN detallecomida AS dc
               ON p.codplato = dc.codplato
WHERE  dc.idcomida IN (SELECT dc.idcomida
                       FROM   detallecomida AS dc
                              INNER JOIN plato AS p
                                      ON dc.codplato = p.codplato
                              INNER JOIN tipoplato AS tp
                                      ON p.codtipoplato = tp.codtipoplato
                       WHERE  agrupa = 'Bebida'
                              AND servido = 'S'
                       GROUP  BY dc.idcomida
                       HAVING Count(*) > 5); 


--10. Comidas (dando mesa y fecha) que han servido más bebidas que platos.

SELECT c.fecha,
       c.codmesa
FROM   comida AS c
       INNER JOIN detallecomida AS dc
               ON c.idcomida = dc.idcomida
WHERE  (SELECT Count(*)
        FROM   plato AS p
               INNER JOIN tipoplato AS tp
                       ON p.codtipoplato = tp.codtipoplato
               INNER JOIN detallecomida AS dc
                       ON p.codplato = dc.codplato
        WHERE  agrupa = 'Bebida'
               AND dc.idcomida = c.idcomida) > 
		(SELECT Count(*)
         FROM   plato AS p
               INNER JOIN tipoplato AS tp
					   ON p.codtipoplato = tp.codtipoplato
			   INNER JOIN detallecomida AS dc
					   ON p.codplato = dc.codplato
		WHERE  agrupa = 'Plato' AND dc.idcomida = c.idcomida) 
	
