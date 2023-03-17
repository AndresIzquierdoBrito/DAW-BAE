USE ciclismo;
go

--1.








SELECT e.nombre
FROM   equipo AS e
       INNER JOIN equipocampeonato AS ec
               ON e.idequipo = ec.idequipo
       INNER JOIN campeonato AS c
               ON ec.idcampeonato = c.id
WHERE  Datepart(month, c.inicio) = 5
GROUP  BY nombre
HAVING Count(c.Id) > 3;

--2.

SELECT DISTINCT federacion
FROM   federacion AS f
       INNER JOIN club AS cl
               ON f.id = cl.idfederacion
       INNER JOIN equipo AS e
               ON cl.idclub = e.idclub
       INNER JOIN equipocampeonato AS ec
               ON e.idequipo = ec.idequipo
       INNER JOIN campeonato AS c
               ON ec.idcampeonato = c.id
WHERE  Day(fin - inicio) > 10
GROUP  BY federacion;

SELECT id, Campeonato,  DAY(fin - inicio)
FROM Campeonato

--3.

SELECT c.campeonato,
       Sum(ec.nparticipantes) AS CantParticipantes
FROM   campeonato AS c
       INNER JOIN equipocampeonato AS ec
               ON c.id = ec.idcampeonato
GROUP  BY c.campeonato; 

--4.

SELECT f.federacion,
       Sum(e.nciclistas) AS NoCiclistas
FROM   federacion AS f
       INNER JOIN club AS cl
               ON f.id = cl.idfederacion
       INNER JOIN equipo AS e
               ON cl.idclub = e.idclub
GROUP  BY federacion
HAVING Sum(e.nciclistas) > 3000
ORDER  BY nociclistas DESC; 

--5.

SELECT o.Id, o.Organizador, COUNT(c.Id) AS CantCampeonatos , 
	(SELECT COUNT(*), SUM(Nparticipantes)
FROM EquipoCampeonato AS ecam
	INNER JOIN Campeonato AS c
	ON ec.idcampeonato = c.Id
	) AS a

FROM Organizador AS o
	INNER JOIN Campeonato AS c
	ON o.Id = c.IdOrganizador
	INNER JOIN EquipoCampeonato AS ec
	ON c.Id = ec.idcampeonato
GROUP BY o.Organizador, o.Id
	

SELECT COUNT(*), Nparticipantes
FROM EquipoCampeonato AS ec
	INNER JOIN Campeonato AS c
	ON ec.idcampeonato = c.Id

--6.

SELECT te.tipo
FROM   tipoequipo AS te
       INNER JOIN equipo AS e
               ON te.idtipo = e.idtipo
GROUP  BY te.tipo
HAVING Count(*) < 3;
go

--7.

SELECT cl.Club, COUNT(e.IdEquipo) 
FROM Club AS cl
	INNER JOIN Equipo AS e
	ON cl.idClub = e.IdClub
	INNER JOIN EquipoCampeonato AS ec
	ON e.IdEquipo = ec.idequipo
	INNER JOIN ( 
	SELECT EC.idequipo
	FROM Campeonato AS c
		INNER JOIN EquipoCampeonato AS ec
		ON C.Id = EC.idcampeonato
	GROUP BY ec.idequipo
	HAVING COUNT(*) > 6) AS sub
	ON ec.idequipo = sub.idequipo
GROUP BY  Club

SELECT cl.Club, COUNT(e.IdEquipo) 
FROM Club AS cl
	INNER JOIN Equipo AS e
	ON cl.idClub = e.IdClub
	INNER JOIN EquipoCampeonato AS ec
	ON e.IdEquipo = ec.idequipo
	group by club


SELECT cl.club,
       Count(e.idequipo)
FROM   equipocampeonato AS ec
       INNER JOIN equipo AS e
               ON ec.idequipo = e.idequipo
       INNER JOIN club AS cl
               ON e.idclub = cl.idclub
WHERE  e.idequipo IN (SELECT e.idequipo
                      FROM   equipocampeonato AS ec
					  INNER JOIN Equipo AS e
								ON ec.idequipo = e.IdEquipo
                      GROUP  BY e.idequipo
                      HAVING Count(ec.idcampeonato) > 6)
GROUP  BY cl.club

SELECT ec.idequipo
FROM EquipoCampeonato AS ec
GROUP BY ec.idequipo
HAVING COUNT(ec.idcampeonato) > 6


SELECT ec.idequipo, COUNT(ec.idcampeonato) AS cantCamp
FROM EquipoCampeonato AS ec
	INNER JOIN Equipo AS e
	ON ec.idequipo = e.IdEquipo 
	INNER JOIN Club AS cl
	ON e.IdClub = cl.idClub
GROUP BY ec.idequipo
HAVING COUNT(ec.idcampeonato) > 6
order by ec.idequipo
--8.

SELECT e.nombre
FROM   equipo AS e
       INNER JOIN equipocampeonato AS ec
               ON e.idequipo = ec.idequipo
       INNER JOIN campeonato AS c
               ON ec.idcampeonato = c.id
WHERE  c.id NOT IN (SELECT c.id
                    FROM   campeonato AS c
                    WHERE  premios BETWEEN 5000 AND 30000) 