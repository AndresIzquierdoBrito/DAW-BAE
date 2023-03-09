USE audienciastv;

go

--1.- Cadena con mayor audiencia (en la tabla Audiencia) el 15/5/2013 en el Periodo 'Noche1 (20.30 a
--24.00)'
SELECT TOP 1 cadena,
             a.valor
FROM   cadena AS c
       INNER JOIN audienciaprograma AS ap
               ON c.idcadena = ap.idcadena
       INNER JOIN audiencia AS a
               ON c.idcadena = a.idcadena
       INNER JOIN periodo AS p
               ON a.idperiodo = p.id
WHERE  a.fecha = '15-5-2013'
       AND p.periodo LIKE 'Noche1%'
ORDER  BY a.valor DESC;

--2.- Programa de TELECINCO con m�s espectadores los jueves (en audienciaprograma)
SELECT TOP 1 WITH ties pro.programa,
                       ap.espectadores
FROM   audienciaprograma AS ap
       INNER JOIN cadena AS c
               ON ap.idcadena = c.idcadena
       INNER JOIN programa AS pro
               ON ap.idprograma = pro.idprograma
WHERE  c.cadena = 'Telecinco'
       AND Datepart(weekday, ap.fechahora) = 4
ORDER  BY espectadores DESC;

go

--(*) 3.- �Cu�ntos programas tiene telecinco entre los cinco primeros del d�a 8/5/2013 teniendo en
--cuenta el share (en audienciaprograma)?
SELECT Cast(Count(*) AS VARCHAR)
       + ' programas de Telecinco entre los cinco primeros 8/5/2013'
FROM   cadena AS c
       INNER JOIN (SELECT TOP 5 WITH ties ap.idcadena
                   FROM   programa AS pro
                          INNER JOIN audienciaprograma AS ap
                                  ON pro.idprograma = ap.idprograma
                   WHERE  Cast(ap.fechahora AS DATE) = '8/5/2013'
                   ORDER  BY ap.share DESC) AS tl5
               ON c.idcadena = tl5.idcadena
WHERE  c.cadena = 'TELECINCO';

go

--4.- �Qu� d�a de la semana tiene m�s espectadores considerando los datos de AudienciaPrograma?
SELECT TOP 1 Datename(dw, fechahora) AS DiaDeSemana
FROM   audienciaprograma AS ap
GROUP  BY Datename(dw, fechahora)
ORDER  BY Sum(espectadores) DESC;

--5.- Cinco programas con media m�s alta de espectadores (en audienciaprograma)que aparezcan dos o
--m�s veces.
SELECT TOP 5 WITH ties p.programa,
                       Avg(ap.espectadores)
FROM   programa AS p
       INNER JOIN audienciaprograma AS ap
               ON p.idprograma = ap.idprograma
GROUP  BY p.programa
HAVING Count(*) > 1
ORDER  BY Avg(ap.espectadores) DESC;

go

--(*) 6.- Cu�l fue la audiencia (en la tabla audiencia) en el periodo que comienza por Noche2 de la
--cadena con el programa m�s visto en n�mero de espectadores (de la tabla audienciaPrograma) el d�a
--9/5/2013.
SELECT C.cadena,
       a.valor
FROM   audiencia AS a
       INNER JOIN periodo AS per
               ON a.idperiodo = per.id
       INNER JOIN cadena AS c
               ON a.idcadena = c.idcadena
WHERE  per.periodo LIKE 'Noche2%'
       AND a.fecha = '9/5/2013'
       AND c.idcadena = (SELECT TOP 1 idcadena
                         FROM   audienciaprograma
                         WHERE  Cast(fechahora AS DATE) = '9/5/2013'
                         ORDER  BY espectadores DESC);

go

--7.- Total de espectadores acumulados seg�n la tabla audienciaprograma de cada Operador, dando
--todos los operadores e incluyendo titularidad.
SELECT t.titularidad,
       o.operador,
       Sum(ap.espectadores)
FROM   operador AS o
       INNER JOIN cadena AS c
               ON o.id = c.idoperador
       INNER JOIN audienciaprograma AS ap
               ON c.idcadena = ap.idcadena
       INNER JOIN titularidad AS t
               ON o.idtitularidad = t.id
GROUP  BY titularidad,
          operador;

go

--(*) 8.- �En qu� periodo, cadena y fecha est� el valor m�ximo de audiencia (tabla audiencia), de una
--cadena que tenga al menos tres programas en audienciaprograma en el mismo d�a.
SELECT TOP 1 WITH ties a.valor,
                       per.periodo,
                       c.cadena,
                       a.fecha
FROM   audiencia AS a
       INNER JOIN periodo AS per
               ON a.idperiodo = per.id
       INNER JOIN cadena AS c
               ON a.idcadena = c.idcadena
WHERE  c.idcadena IN (SELECT idcadena
                      FROM   audienciaprograma
                      WHERE  Day(fechahora) = Day(a.fecha)
                      GROUP  BY idcadena
                      HAVING Count(idprograma) > 2)
ORDER  BY valor DESC;
--9.- �En qu� hora (sin minutos) hay mayor media de espectadores seg�n audienciaprograma?
--(*) 10.- Para cada fecha indicar qu� Empresa es la n� uno de audiencia en el periodo 'Total d�a' (tabla
--audiencia).
--11.- �Cu�ntos programas diferentes tiene cada empresa, d�ndolas todas, en AudienciaPrograma?
--12.- Para qu� d�a del mes hay m�s de 4 cadenas distintas en audienciaprograma