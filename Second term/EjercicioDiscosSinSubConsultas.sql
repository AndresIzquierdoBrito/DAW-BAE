--EjerciciosDiscosSinSubconsultas 1/30/2023
USE discos;

-- PRIMERA PARTE
--1.- Cuáles son los dos clientes con más puntuaciones efectuadas (sacándolos todos).Ç
SELECT TOP 2 cliente.nombre,
             Count(puntuacion) AS NumPunt
FROM   cliente
       INNER JOIN puntuacion
               ON cliente.id = puntuacion.idcliente
GROUP  BY nombre
ORDER  BY numpunt DESC;

go

--2.- Media de la puntuación de discos de los intérpretes que
--comiencen con A y efectuada en sábado
SELECT d.titulo,
       i.interprete,
       Avg(p.puntuacion) AS PuntuacionMedia
FROM   disco AS d
       INNER JOIN interprete AS i
               ON i.idinterprete = d.idinterprete
       INNER JOIN puntuacion AS p
               ON p.iddisco = d.iddisco
WHERE  i.interprete LIKE 'A%'
       AND Datepart(dw, p.fecha) = 6
GROUP  BY d.titulo,
          i.interprete;

go

--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
--puntuado a los tipos que contengan 'rock'
SELECT DISTINCT( c.nombre )
FROM   cliente AS c
       INNER JOIN puntuacion AS p
               ON c.id = p.idcliente
       INNER JOIN disco AS d
               ON p.iddisco = d.iddisco
       INNER JOIN discotipo AS dp
               ON d.iddisco = dp.iddisco
       INNER JOIN tipo AS t
               ON dp.idtipo = t.idtipo
WHERE  Datepart(year, c.fechanacimiento) < 1975
       AND t.tipo LIKE '%rock%';

go

--4.- Disco (dando su título) con mayor media de puntuacion que haya sido
--votado dos o más veces
SELECT TOP 1 WITH ties d.titulo,
                       Avg(p.puntuacion)   AS PuntuacionMedia,
                       Count(p.puntuacion) AS CantidadVotos
FROM   disco AS d
       INNER JOIN puntuacion AS p
               ON d.iddisco = p.iddisco
GROUP  BY titulo
HAVING Count(p.puntuacion) >= 2
ORDER  BY puntuacionmedia DESC;

go

--5.- Intérprete que más veces haya sido puntuado
SELECT TOP 1 i.interprete,
             Count(*) AS NumVotaciones
FROM   interprete AS i
       INNER JOIN disco AS d
               ON i.idinterprete = d.idinterprete
       INNER JOIN puntuacion AS p
               ON d.iddisco = p.iddisco
GROUP  BY i.interprete
ORDER  BY numvotaciones DESC;

go

--6.- Dos intérpretes con más discos
SELECT TOP 2 WITH ties i.interprete,
                       Count(d.iddisco) AS CantDiscos
FROM   interprete AS i
       INNER JOIN disco AS d
               ON i.idinterprete = d.idinterprete
GROUP  BY interprete
ORDER  BY cantdiscos DESC;

go

--7.- títulos de los discos que hayan recibido
--alguna puntuación y el nombre del intérprete
SELECT d.titulo,
       i.interprete
FROM   disco AS d
       INNER JOIN puntuacion AS p
               ON d.iddisco = p.iddisco
       INNER JOIN interprete AS i
               ON d.idinterprete = i.idinterprete
GROUP  BY d.titulo,
          i.interprete;

go

-- SEGUNDA PARTE
--1.- Cuál es el disco (dando el título) que tiene más tipos
SELECT TOP 1 WITH ties d.titulo
FROM   disco AS d
       INNER JOIN discotipo AS dt
               ON d.iddisco = dt.iddisco
       INNER JOIN tipo AS t
               ON dt.idtipo = t.idtipo
GROUP  BY d.titulo
ORDER  BY Count(t.tipo) DESC;

go

--2.- Media de la puntuación de discos de los interpretes que
-- contengan 'Jackson'
SELECT d.titulo,
       Avg(p.puntuacion) AS PuntuacionMedia,
       i.interprete
FROM   disco AS d
       INNER JOIN puntuacion AS p
               ON d.iddisco = p.iddisco
       INNER JOIN interprete AS i
               ON d.idinterprete = i.idinterprete
WHERE  interprete LIKE '%jackson%'
GROUP  BY d.titulo,
          i.interprete;

go

--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
-- puntuado a los tipos que contengan 'rock'
SELECT c.Nombre, CONVERT(varchar, c.FechaNacimiento, 103) AS FechaNacimiento, t.Tipo
FROM Cliente AS c
	INNER JOIN Puntuacion AS p
	ON c.id = p.Idcliente
	INNER JOIN Disco AS d
	ON p.iddisco = d.IdDisco
	INNER JOIN DiscoTipo AS dt
	ON d.IdDisco = dt.IdDisco
	INNER JOIN Tipo AS t
	ON dt.IdTipo = t.IdTipo
WHERE t.tipo LIKE '%rock%'
ORDER BY c.FechaNacimiento DESC;
go

--4.- Disco (dando su título) con mayor media de puntuacion que haya
--sido votado dos o más veces
SELECT d.Titulo, AVG(p.Puntuacion) AS PuntuacionMedia, COUNT(p.Puntuacion) AS CantVotos
FROM Disco as d
	INNER JOIN Puntuacion as p
	ON d.IdDisco = p.iddisco
GROUP BY d.Titulo
HAVING COUNT(p.Puntuacion) >= 2;
go

--5.- Número de votos realizados por cada cliente (dando su nombre)
-- incluyéndolos todos los clientes. Ordenar por el nº de votos de
-- mayor a menor
SELECT c.Nombre, COUNT(*) AS NoVotos
FROM Cliente as c
	INNER JOIN Puntuacion AS p
	ON c.id = p.Idcliente
GROUP BY c.Nombre
ORDER BY NoVotos DESC;
go

--6.- Tipo (dando su denominación) con más discos
SELECT TOP 1 WITH TIES t.Tipo, COUNT(*) AS  NoDiscos
FROM Tipo AS t
	INNER JOIN DiscoTipo AS dt
	ON t.IdTipo = dt.IdTipo
	INNER JOIN Disco AS d
	ON  dt.IdDisco = d.IdDisco
GROUP BY t.tipo
ORDER BY NoDiscos DESC;
go

--7.- Cuántos discos tiene cada intérprete (por su nombre) dando
-- todos los intérpretes, ordenado por nº de discos de mayor a menor
SELECT i.Interprete, COUNT(*) AS NoDiscos
FROM Interprete as i
	INNER JOIN Disco as d
	ON i.IdInterprete = d.IdInterprete
GROUP BY i.Interprete
ORDER BY NoDiscos DESC;
go