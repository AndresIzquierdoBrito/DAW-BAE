use Restaurante;
go
--1.- Contar cu�ntos platos se han servido por Tipo de Plato (la descripci�n
--del Tipo de plato).


--2.- Contar las comidas servidas en las mesas, sacando todas las mesas.


--3.- Dar la mesa y la fecha de la comida que m�s platos consumi� del tipo
--de plato carnes, sac�ndolas todas si hay m�s de una.


--4.- Comidas pagadas (dando mesa y fecha) que han consumido algo de bebidas.


--5.- Importe total de las comidas pagadas de las mesas que comienzan con A.


--6.- D�a de la semana con mayor facturaci�n.


--7.- Tipo de plato (dando la descripci�n del tipo de plato) que no sea bebida
--y que menos veces se ha pedido.


--8.- Para cada plato, dando su nombre y sac�ndolos todos, indicar el n� de
--comidas en las que ha aparecido.


--(*) 9.- Dar las comidas pendientes de pagar (dando mesa y fecha) con todos
--sus platos servidos.


--(*) 10.- Comidas (dando mesa y fecha) que s�lo han consumido bebidas.


--11.- Calcular el plato con mayor diferencia entre lo que se cobr� y el precio
--actual (de la tabla Plato).


--12.- Sacar la estad�stica por d�as, incluyendo n� platos (incluyendo
--bebidas), el n� de comidas realizadas y el importe de los platos (incluyendo
--bebidas). 

-- ********************************* ENTREGA *******************************

--1. Dar el plato m�s caro de cada comida.

SELECT c.IdComida,
       (SELECT TOP 1 p.Plato
        FROM   plato AS p
               INNER JOIN detallecomida AS detcom
                       ON p.codplato = detcom.codplato
        WHERE  detcom.idcomida = c.idcomida
        ORDER  BY precio DESC) AS PlatoMasCaro
FROM   comida AS c;
go

--2. Para cada comida dar el n�mero de platos servidos y el n�mero de platos no servidos.

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

--3. Dar el plato m�s caro de cada tipo de plato.

SELECT tp.TipoPlato, 
(SELECT TOP 1 Plato
FROM Plato AS p
WHERE p.CodPlato = tp.CodTipoPlato
ORDER BY Precio DESC) AS PlatoMasCaro
FROM TipoPlato AS tp;
go

--4. Dar el plato m�s caro del tipo de plato con m�s platos que no sean bebidas.

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

--5. Dar los platos servidos de la comida m�s barata.

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

--6. Dar los tipos de platos servidos de la comida m�s cara.


--7. Dar las comidas pendientes de pagar (dando mesa y fecha) con todos sus platos servidos.


--8. Comidas (dando mesa y fecha) que s�lo han consumido bebidas


--9. Mostrar los platos de las Comidas que han servido m�s de 5 bebidas.


--10. Comidas (dando mesa y fecha) que han servido m�s bebidas que platos.