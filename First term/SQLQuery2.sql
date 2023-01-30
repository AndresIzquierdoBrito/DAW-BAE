USE MoviesBasicas

SELECT * FROM Peliculas 
	WHERE Director != 'Francis Ford Coppola';


SELECT Titulo, Director FROM Peliculas
	WHERE Agno < 1960;

SELECT * FROM Peliculas;
SET DATEFORMAT dmy;
DELETE FROM Peliculas
	WHERE FechaCompra < '31/12/2008';

SELECT * FROM Peliculas;


SELECT * FROM Peliculas;

UPDATE Peliculas 
	SET precio=precio*1.1
	WHERE Agno = '1980';

SELECT * FROM Peliculas;


SELECT * FROM Peliculas WHERE Titulo = 'La fiera de mi niña';
SET DATEFORMAT DMY;
UPDATE Peliculas
	SET FechaCompra = '15-02-2013'
	WHERE Titulo = 'La Fiera de mi Niña';
SELECT * FROM Peliculas WHERE Titulo = 'La fiera de mi niña';

SELECT * FROM Peliculas WHERE Director = 'Joseph L. Mankiewicz';
UPDATE Peliculas
	SET Director = 'Joseph Leo Mankiewicz'
	WHERE Director = 'Joseph L. Mankiewicz';
SELECT * FROM Peliculas WHERE Director = 'Joseph Leo Mankiewicz';

SELECT * FROM Peliculas;
UPDATE Peliculas
	SET precio = precio+1
	WHERE precio < 4;
SELECT * FROM Peliculas;

