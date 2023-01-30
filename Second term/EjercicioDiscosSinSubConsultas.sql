--EjerciciosDiscosSinSubconsultas 1/30/2023
USE Discos;

--1.- Cu�les son los dos clientes con m�s puntuaciones efectuadas (sac�ndolos todos).�

SELECT TOP 2 Cliente.Nombre, COUNT(*) AS NumPunt
from Cliente 
	INNER JOIN Puntuacion
	on Cliente.id = Puntuacion.Idcliente
GROUP BY Nombre
ORDER BY NumPunt DESC;
GO

--2.- Media de la puntuaci�n de discos de los int�rpretes que
--comiencen con A y efectuada en s�bado


--3.- Clientes (dando su nombre) nacidos antes de 1975 que hayan
--puntuado a los tipos que contengan 'rock'


--4.- Disco (dando su t�tulo) con mayor media de puntuacion que haya sido
--votado dos o m�s veces


--5.- Int�rprete que m�s veces haya sido puntuado


--6.- Dos int�rpretes con m�s discos


--7 t�tulos de los discos que hayan recibido
--alguna puntuaci�n y el nombre del int�rprete

