USE AlquilerCochesSinFK;
go

--2.- Crear las Foreign Key correspondientes al esquema siguiente:
alter table ALQ_Alquiler
add constraint FK_ClienteAlquiler
foreign key (DNICliente)
references ALQ_Cliente(DNICliente);

alter table ALQ_Alquiler
add constraint FK_CocheAlquiler
foreign key (Matricula)
references ALQ_Coche(Matricula);

alter table ALQ_Coche 
add constraint FK_tipoCocheCoche
foreign key (CodTipo)
references ALQ_tipoCoche(CodTipo);
go

--3.- Insertar un coche de un tipo diferente a los existentes en tipocoche. 
insert into ALQ_Coche (Matricula, DescripcionEstado, codTipo)
	values('1234567890', 'Bonito!', 69);
go

--4.- Insertar un coche con tipo NULL. 
insert into ALQ_Coche (Matricula, DescripcionEstado, codTipo)
	values('1234567891', 'Bonito!', null);
go

--5.- Alquilar un coche existente a un cliente no existente. 
INSERT INTO ALQ_Alquiler (DNICliente, Matricula, FechaInicio)
	values ('123456789','2354-HBC', GETDATE()); 

--6.- Realizar un alquiler correcto. 
INSERT INTO ALQ_Alquiler (DNICliente, Matricula, FechaInicio)
	values ('05679340L','2354-HBC', GETDATE()); 
SELECT * 
FROM ALQ_Alquiler
	WHERE DNICliente = '05679340L'

--8.- Intentar borrar un coche con alquileres 

delete from ALQ_Coche
	where Matricula = '2354-HBC'

--9.- Deshabilitar la FK de alquiler relacionada con coche.

alter table ALQ_Alquiler
	nocheck constraint FK_CocheAlquiler;

--10.- Insertar un alquiler a un cliente existente de un coche no existente. 

INSERT INTO ALQ_Alquiler (DNICliente, Matricula, FechaInicio)
	values ('05679340L','1111-AAA', GETDATE());  
--11.- Habilitar la restricción. 

alter table ALQ_Alquiler
	check constraint FK_CocheAlquiler;

--12.- Volver a intentar insertar un alquiler a un cliente existente de un coche no existente. 

INSERT INTO ALQ_Alquiler (DNICliente, Matricula, FechaInicio)
	values ('05679340L','2222-AAA', GETDATE());  

--13.- Borrar la restricción. 

alter table ALQ_Alquiler
	drop constraint FK_CocheAlquiler;

--14.- Crear de nuevo la restricción. 

alter table ALQ_Alquiler
add constraint FK_CocheAlquiler
foreign key (Matricula)
references ALQ_Coche(Matricula);

--15.- ¿Cómo podemos hacer para crear de nuevo la restricción? Borrar al final los datos descuadrados 

alter table ALQ_Alquiler
with nocheck
add constraint FK_CocheAlquiler
foreign key (Matricula)
references ALQ_Coche(Matricula);

select *
from ALQ_Alquiler
where Matricula = '1111-AAA';
select * 
from ALQ_Coche
where Matricula = '1111-AAA';

delete from ALQ_Alquiler
	where Matricula = '1111-AAA';

--16.- Crear la restricción activando borrados y actualizaciones en cascada. 

alter table ALQ_Alquiler
with nocheck
add constraint FK_CocheAlquiler
foreign key (Matricula)
references ALQ_Coche(Matricula)
on update cascade
on delete cascade;

--17.- Borrar un coche con alquileres y ver lo que ocurre con sus alquileres. 

delete from ALQ_Coche
	where Matricula = '2354-HBC';

select * 
	from ALQ_Alquiler 
	where Matricula = '2354-HBC';


--18.- Modificar la matrícula de un coche con alquileres y ver lo que pasa con sus alquileres. 

select * from ALQ_Alquiler
where Matricula = '3216-BHF';
update ALQ_Coche
set Matricula = '1234-ABC'
where Matricula = '3216-BHF'
select * from ALQ_Alquiler
where Matricula = '1234-ABC';

--19.- Cómo modificaríamos la creación de las tablas para colocarle las foreign key y evitar que puedan colocarse
-- valores null en los campos correspondientes a las mismas. Crear de nuevo la BD con ese cambio. 

--20.- Probar una inserción de un coche con tipocoche a null.
