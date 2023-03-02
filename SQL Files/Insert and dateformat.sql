SET DATEFORMAT DMY;

INSERT Peliculas 
	(Id,Titulo,Director,Agno,FechaChompra,Precio)
	VALUES (1, 'Rashomon','Akira Kurosawa',1951,'01/01/2012',20);

INSERT Peliculas 
	(Id,Titulo,Director,Agno,FechaChompra,Precio)
	VALUES (2, 'Forrest Gump','Robert Zemeckis',1994,'01/02/2012',10);

INSERT Peliculas 
	(Id,Titulo,Director,Agno,FechaChompra,Precio)
	VALUES (3, 'La Fiera de mi Niña','Howard HawksI',1938,'01/03/2012',4);

INSERT Peliculas 
	(Id,Agno,Titulo,Director)
	VALUES (33, 1956,'Moby Dick','John Huston');

DELETE FROM Peliculas
	WHERE ID IN ('1', '2', '3');