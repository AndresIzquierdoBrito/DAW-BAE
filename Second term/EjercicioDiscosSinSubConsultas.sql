--EjerciciosDiscosSinSubconsultas 1/30/2023
USE Discos;

--1.- Cuáles son los dos clientes con más puntuaciones efectuadas (sacándolos todos).Ç

SELECT TOP 2 Cliente.Nombre, COUNT(*) AS NumPunt
from Cliente 
	INNER JOIN Puntuacion
	on Cliente.id = Puntuacion.Idcliente
GROUP BY Nombre
ORDER BY NumPunt DESC;
GO

--2.- Media de la puntuación de discos de los intérpretes que
--comiencen con A y efectuada en sábado


--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
--puntuado a los tipos que contengan 'rock'


--4.- Disco (dando su título) con mayor media de puntuacion que haya sido
--votado dos o más veces


--5.- Intérprete que más veces haya sido puntuado


--6.- Dos intérpretes con más discos


--7 títulos de los discos que hayan recibido
--alguna puntuación y el nombre del intérprete

