USE AudienciasTV;
go

--1.- Cadena con mayor audiencia (en la tabla Audiencia) el 15/5/2013 en el Periodo 'Noche1 (20.30 a
--24.00)'

SELECT TOP 1 Cadena, a.Valor
FROM Cadena AS c
INNER JOIN AudienciaPrograma AS ap
ON c.idCadena = ap.IdCadena
INNER JOIN Audiencia AS a
ON c.idCadena = a.IdCadena
INNER JOIN Periodo AS p
ON a.idPeriodo = p.Id
WHERE a.Fecha = '15-5-2013' AND p.Periodo LIKE 'Noche1%'
ORDER BY a.Valor DESC;

--2.- Programa de TELECINCO con m�s espectadores los jueves (en audienciaprograma)

SELECT TOP 1 WITH TIES pro.Programa, ap.Espectadores
FROM AudienciaPrograma AS ap
	INNER JOIN Cadena AS c
	ON ap.IdCadena = c.idCadena
	INNER JOIN Programa AS pro
	ON ap.IdPrograma = pro.IdPrograma
	WHERE c.Cadena = 'Telecinco' AND DATEPART(WEEKDAY, ap.FechaHora) = 4
ORDER BY Espectadores DESC;
go


--(*) 3.- �Cu�ntos programas tiene telecinco entre los cinco primeros del d�a 8/5/2013 teniendo en
--cuenta el share (en audienciaprograma)?

SELECT c.Cadena
FROM Programa AS p
INNER JOIN AudienciaPrograma AS ap
ON p.IdPrograma = ap.IdPrograma
INNER JOIN Cadena AS c
ON ap.IdCadena = c.idCadena
WHERE CAST(ap.FechaHora AS DATE) = '8/5/2013'

SELECT TOP 5 WITH TIES Programa
FROM Programa AS pro
INNER JOIN  AudienciaPrograma AS ap
ON pro.IdPrograma = ap.IdPrograma
INNER JOIN Cadena AS c
ON ap.IdCadena = c.idCadena
ORDER BY ap.Share




--4.- �Qu� d�a de la semana tiene m�s espectadores considerando los datos de AudienciaPrograma?



--5.- Cinco programas con media m�s alta de espectadores (en audienciaprograma)que aparezcan dos o
--m�s veces.



--(*) 6.- Cu�l fue la audiencia (en la tabla audiencia) en el periodo que comienza por Noche2 de la
--cadena con el programa m�s visto en n�mero de espectadores (de la tabla audienciaPrograma) el d�a
--9/5/2013.



--7.- Total de espectadores acumulados seg�n la tabla audienciaprograma de cada Operador, dando
--todos los operadores e incluyendo titularidad.



--(*) 8.- �En qu� periodo, cadena y fecha est� el valor m�ximo de audiencia (tabla audiencia), de una
--cadena que tenga al menos tres programas en audienciaprograma en el mismo d�a.



--9.- �En qu� hora (sin minutos) hay mayor media de espectadores seg�n audienciaprograma?
--(*) 10.- Para cada fecha indicar qu� Empresa es la n� uno de audiencia en el periodo 'Total d�a' (tabla
--audiencia).



--11.- �Cu�ntos programas diferentes tiene cada empresa, d�ndolas todas, en AudienciaPrograma?



--12.- Para qu� d�a del mes hay m�s de 4 cadenas distintas en audienciaprograma