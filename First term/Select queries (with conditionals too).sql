USE MoviesBasicas

SELECT 
      Titulo
      ,Director
      ,Agno
      ,FechaCompra
      ,precio
  FROM Peliculas;
-- Same querie, * is everything
SELECT * FROM Peliculas;

SELECT 
	Titulo,
	Director
FROM Peliculas;

SELECT 
	Apellidos,
	Nombre
FROM Socios;

SELECT *
FROM Peliculas
WHERE Director = 'Francis Ford Coppola';

SELECT Nombre, Apellidos
FROM Socios
WHERE Nombre='Juan';

SELECT Titulo, Director
FROM Peliculas
WHERE Agno = '1960';
