--1 crear base de datos
--create database MoviesBasicas
--go

--
use MoviesBasicas;
go

--2  crear tabla peliculas
if object_id('Peliculas') is not null
  drop table Peliculas;
  go
  
create table Peliculas
(
	Id int,
	Titulo nvarchar(100),
	Director nvarchar(100),
	Agno int ,
	FechaCompra datetime,
	precio numeric(6,2) 
);
go

--3 crear tabla socios
if object_id('Socios') is not null
  drop table Socios;
  go
  
create table Socios
(
	NIFNIE char(9) ,
	Apellidos varchar(50),
	Nombre varchar(100) ,
	Direccion varchar(100),
	Telefono char(9) ,
	FechaDeAlta datetime 
);
go


--4 insertar registros para trabajar
use MoviesBasicas;
go

set dateformat dmy

 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (1, 'Rashomon','Akira Kurosawa',1951,'01/01/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (2, 'Forrest Gump','Robert Zemeckis',1994,'01/02/2012',20)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (3, 'La Fiera de mi Niña','Howard HawksI',1938,'01/03/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (4, 'L''atalante','Jean Vigo',1934,'04/05/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (5, 'Persona','Ingmar Bergman',1966,'06/01/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (6, 'Memorias de Africa','Sydney Pollack',1985,'01/06/2012',15)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (7, 'Gandhi','R. Attenborough',1982,'01/01/2011',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (8, 'Titanic','James Cameron',1997,'01/01/2010',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (9, 'El Golpe','George Roy Hill',1973,'05/07/2011',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (10, 'El Halcón Maltés','John Huston',1941,'01/04/2012',9)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (11, 'El Paciente Ingles','Anthony Minghella',1996,'01/02/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (12, 'La Parada de los Monstruos','Tod Browning',1936,'01/02/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (13, 'Pulp Fiction','Quentin Tarantino',1994,'05/01/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (14, 'Intolerancia','David W. Griffith',1916,'06/01/2012',9)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (15, 'La Ley del Silencio','Elia Kazan',1954,'07/01/2012',20)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (16, 'La Fuerza Del Cariño','James L. Brooks',1983,'01/01/2010',18)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (17, 'Los Cuentos de Tokyo','Yasujiro Ozu',1953,'05/06/2012',11)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (18, 'Con Faldas y a lo Loco','Billy Wilder',1959,'09/10/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (19, 'Shakespeare In Love','John Madden',1998,'01/01/2011',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (20, 'La Palabra','Carl Theodor Dreyer',1954,'01/01/2013',3)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (21, 'Amanecer','F. W. Murnau',1927,'01/05/2013',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (22, 'Los Intocables de Eliot Ness','Brian De Palma',1987,'04/06/2012',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (23, 'Love Story','Arthur Hiller',1970,'02/05/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (24, 'Roma, Ciudad Abierta','Roberto Rossellini',1945,'22/04/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (25, 'La Huelga','S. M. Eisenstein',1924,'31/01/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (26, 'Fellini 8 1/2','Federico Fellini',1963,'16/05/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (27, 'Vértigo / De entre los Muertos','Alfred Hitchcock',1958,'14/03/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (28, 'Sed de Mal','Orson Welles.',1958,'01/07/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (29, 'Espartaco','Stanley Kubrick',1960,'22/05/2010',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (30, 'El Gabinete Del Doctor Caligari','Robert Wiene',1919,'01/01/2000',9)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (31, 'Melodías de Broadway','Vincente Minnelli',1953,'05/12/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (32, 'Pasión de Los Fuertes','John Ford',1946,'01/12/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (33, 'Moby Dick','John Huston',1956,'01/06/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (34, 'El Padrino II','Francis Ford Coppola',1974,'05/01/2012',3)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (35, 'Cita en San Luis','Vincente Minelli.',1944,'01/05/2012',19.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (36, 'El Intendente Sansho','Kenji Mizoguchi',1954,'04/06/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (37, 'Andrei Rubliov','Andrei Tarkovski',1966,'01/01/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (38, 'En Busca Del Arca Perdida','Steven Spielberg',1980,'05/11/2012',9.99)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (39, 'La Vida es Bella','Roberto Benigni',1998,'31/01/2012',9.95)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (40, 'Grease','Randal Kleiser',1978,'18/05/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (41, 'Fresas Salvajes','Ingmar Bergman',1956,'27/04/2012',7.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (42, 'Carta de una Desconocida','Max Ophüls',1948,'30/05/2012',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (43, 'Monsieur Verdoux','Charles Chaplin',1946,'06/07/2012',17.25)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (44, 'Cuentos de la Luna Pálida','Kenji Mizoguchi',1953,'01/01/2009',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (45, 'La Pasión de Juana de Arco','Carl Theodor Dreyer',1928,'15/08/2012',15.8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (46, 'Murieron Con Las Botas Puestas','Raoul Walsh',1941,'01/06/2012',12.6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (47, 'El Año Pasado en Marienbad','Alain Resnais',1961,'01/09/2012',7.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (48, '1492, la Conquista del Paraiso','Ridley Scott',1992,'01/11/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (49, 'Los Diez Mandamientos','Cecil B. De Mille',1956,'16/07/2012',8.4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (50, 'Braveheart','Mel Gibson',1995,'01/01/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (51, 'El Cid','Anthony Mann',1961,'01/01/2012',9)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (52, 'Pickpocket','Robert Bresson',1959,'01/01/2012',13.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (53, 'Casablanca','Michael Curtiz',1942,'01/07/2012',13)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (54, 'Gladiator','Ridley Scott',2000,'01/08/2012',15.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (55, 'Jules y Jim','Francois Truffaut',1961,'16/01/2012',16.3)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (56, 'Tiburón','Steven Spielberg',1975,'25/01/2012',16.3)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (57, 'La Reina de África','',1951,'25/03/2012',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (58, 'Río Bravo','Howard Hawks',1959,'01/12/2012',3.4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (59, 'Avaricia','Erich Von Stroheim',1923,'15/01/2012',5.45)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (60, 'La Quimera del Oro','Charles Chaplin',1925,'19/01/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (61, 'Mujeres al Borde de un Ataque de Nervios','Pedro Almodóvar',1987,'23/01/2012',9.95)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (62, 'La Regla del Juego','Jean Renoir',1939,'01/01/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (63, 'Ha Nacido una Estrella','George Cukor',1954,'01/01/2012',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (64, 'La Lista de Schlinder','Steven Spielberg',1993,'01/01/2012',17.8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (65, 'El Acorazado Potemkin','S. M. Eisenstein',1925,'01/01/2012',14)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (66, 'La Strada','Federico Fellini',1954,'01/12/2012',4.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (67, 'Robin de Los Bosques','Michael Curtiz',1938,'06/11/2012',13)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (68, 'Mary Poppins','Robert Stevenson',1964,'05/12/2012',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (69, 'Breve Encuentro','David Lean',1945,'01/01/2012',9.95)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (70, 'El Padrino I','Francis Ford Coppola',1972,'09/01/2012',7.85)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (71, 'El Mago de Oz','',1939,'01/05/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (72, 'La Aventura','Michelangelo Antonioni',1960,'09/01/2012',4.45)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (73, 'Toro Salvaje','Martin Scorsese',1980,'01/06/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (74, 'Los Niños del Paraíso','Marcel Carné',1945,'12/01/2012',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (75, 'Doctor Zhivago','David Lean',1965,'23/05/2012',3.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (76, 'Lawrence de Arabia','David Lean',1962,'18/09/2012',19.99)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (77, 'Al Final de la Escapada','Jean Luc Godard',1959,'23/11/2012',20)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (78, 'Historias de Filadelfia','George Cukor',1940,'14/01/2012',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (79, 'Aleluya','King Vidor',1929,'19/05/2012',10.4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (80, 'Narciso Negro','Michael Powell, Emeric Pressburger',1946,'01/06/2013',11)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (81, 'Apocalypse Now','Francis Ford Coppola',1979,'01/04/2012',14)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (82, 'Con la Muerte en los Talones','Alfred Hitchcock',1959,'01/01/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (83, 'Centauros del Desierto','John Ford',1956,'12/01/2012',18)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (84, 'La Novia de Frankestein','James Whale',1935,'19/01/2012',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (85, 'El Maquinista de la General','Buster Keaton',1926,'21/01/2012',13)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (86, 'Chinatown','Roman Polanski',1974,'01/08/2012',6.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (87, 'El Cantor de Jazz','Alan Crosland',1927,'01/03/2012',7.70)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (88, 'La Guerra de Las Galaxias','George Lucas',1977,'01/08/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (89, 'Las Zapatillas Rojas',null,1948,'01/03/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (90, 'El Perro Andaluz','Luis Buñuel',1929,'01/02/2012',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (91, 'El Ladrón de Bicicletas','Vittorio de Sica',1948,'16/02/2012',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (92, 'Cenizas y Diamantes','Andrej Wajda',1958,'21/06/2012',6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (93, 'American Beauty','Sam Mendes',1999,'05/12/2012',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (94, 'Instinto Basico','Paul Verhoeven',1992,'19/07/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (95, 'Fuego en el Cuerpo','Lawrence Kasdan',1981,'12/05/2011',17)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (96, 'Ghost','Jerry Zucker',1990,'01/06/2012',19.99)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (97, 'Horizontes Perdidos','Frank Capra',1937,'09/01/2012',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (98, 'Matrix','Andy/Larry Wachowsky',1999,'01/12/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (99, 'El Señor de los Anillos I,II,III','Peter Jackson',2001,'01/11/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (100, 'Gilda','Charles Vidor',1946,'01/10/2012',9)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (101, 'El Vampiro de Düsseldorf','Fritz Lang',1931,'01/09/2012',6.7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (102 ,'A Vida o Muerte','E. Pressburger, Michael Powell',1946,'08/01/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (103 ,'¡Qué Bello Es Vivir!','Frank Capra',1946,'31/01/2012',3.99)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (104 ,'La Tierra','Alexander Dovzhenko',1930,'15/01/2010',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (105 ,'La Naranja Mecanica','Stanley Kubrick',1971,'01/01/2009',5.95)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (106 ,'El Séptimo Sello','Ingmar Bergman',1956,'01/01/2008',17)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (107 ,'Amarcord','Fedrico Fellini',1974,'01/01/2008',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (108 ,'La Gata sobre el Tejado de Zinc','Richard Brooks',1958,'01/01/2010',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (109 ,'Luces de la Ciudad','Charles Chaplin',1930,'01/01/2003',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (110 ,'Blade Runner','Ridley Scott',1982,'01/09/2012',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (111 ,'Ser o No Ser','Ernst Lubistch',1942,'06/01/2012',18.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (112 ,'La Gran Ilusión','Jean Renoir',1937,'08/01/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (113 ,'E. T. el Extraterrestre','Steven Spielberg',1982,'01/07/2012',9.98)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (114 ,'Grupo Salvaje','Sam Peckinpah',1969,'01/09/2012',4.15)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (115 ,'La Noche del Cazador','Charles Laughton',1955,'01/11/2012',12)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (116 ,'Cadena Perpetua','Frank Darabont',1994,'01/12/2012',13)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (117 ,'39 Escalones','Alfred Hitchcock',1935,'15/11/2010',16)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (118 ,'La Dolce Vita','Federico Fellini',1960,'01/05/2008',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (119 ,'Cadenas Rotas','David Lean',1946,'01/06/2011',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (120 ,'Te Querré Siempre','Roberto Rossellini',1953,'04/01/2012',4.75)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (121 ,'Doce Del Patibulo','Robert Aldrich',1967,'18/01/2012',9.99)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (122 ,'El Nombre de la Rosa','J. J. Annaud',1986,'11/01/2012',12.4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (123 ,'Viridiana','Luis Buñuel',1961,'06/07/2012',10.5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (124 ,'Psicosis','Alfred Hitchcok',1961,'01/06/2012',7.6)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (125 ,'Mi Querida Señorita',null,1971,'05/01/2009',20)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (126 ,'Los Siete Samuráis','Akira Kurosawa',1954,'06/01/2009',19)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (127 ,'La Diligencia','John Ford',1939,'01/06/2008',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (128 ,'2001 Odisea del Espacio','Stanley Kubrick',1969,'01/10/2012',6.75)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (129 ,'Tiempos Modernos','Charles Chaplin',1936,'19/01/2012',5)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (130 ,'Cantando Bajo la Lluvia',null,1952,'10/10/2012',14)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (131 ,'El Tercer Hombre','Carol Reed',1949,'11/10/2011',12.4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (132 ,'El Silencio de los Corderos','Jonathan Demme',1991,'05/06/2011',9.99)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (133 ,'El Ultimo Tango en Paris','Bernardo Bertolucci',1973,'04/06/2012',9.95)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (134 ,'El Crepúsculo de los Dioses','Billy Wilder',1950,'01/06/2012',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (135 ,'Lo que el Viento se Llevó','Víctor Fleming',1939,'09/01/2008',10.4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (136 ,'Ciudadano Kane','Orson Welles',1941,'01/01/2005',9)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (137 ,'El Espíritu de la Colmena','Victor Erice',1973,'04/10/2012',7)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (138 ,'Perdición','Billy Wilder',1944,'31/12/2012',4)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (139 ,'Sopa de Ganso','Leo McCarey',1933,'07/09/2011',10)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (140 ,'Eva Al Desnudo','Joseph L. Mankiewicz',1950,'05/06/2007',8)
 insert Peliculas ( Id, Titulo,Director,Agno,FechaCompra,precio)  values (141 ,'Sombrero de Copa','Mark Sandrich',1935,'01/01/2005',3.5)
 go
 
 
set dateformat dmy;
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('27194787R','Pérez Rodríguez','Antonio','C/La Luna nº 45','922654545','01/02/2002');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('43996453Y','Medina Martínez','Fernando','C/Los Pilares nº21','922620901','01/05/2008');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('67385963B','González Hernández','Juan','C/El Sol nº78','922342312','05/09/2010');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('69241320G','Fernández Armas','José','C/Del Islote nº43','822182813','06/08/2012');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('71197567D','García Santana','Claudia','C/Fernández nº12','922865295','14/05/2009');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('72794799Y','Hernández Delgado','Adrián','C/La ola','922683063','16/04/2012');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('77754689S','Pérez Pérez','María','C/Primera nº 7','922804567','16/04/2012');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('90085870E','Armas Santos','Rosa','Avda. Roma','922053496','15/03/2008');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('X5363526H','Pérez Rodríguez','Teresa','C/La Luna nº45','922654545','16/04/2007');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Y0662510D','Santos Martín','Sara','C/El Quijote nº65','822035853','23/05/2008');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Y2113806M','Martínez Abreu','Carlos','C/Las hogueras nº3','922729710','16/09/2010');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z1674471F','Delgado Campos','Pepe','C/El Rosal nº 8','922580181','23/12/2009');
insert Socios (NIFNIE,Apellidos, Nombre, Direccion,Telefono,FechaDeAlta)  values ('Z9874858C','Rodríguez Heredia','Celia','Plaza Francia','822601369','12/09/2010');
go
