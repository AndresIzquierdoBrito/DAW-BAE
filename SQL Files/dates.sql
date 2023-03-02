set language English;
go

insert into Comida(IdComida, Fecha)	values(22,'03-13-2018');
insert into Comida(IdComida, Fecha)	values(23,'12-26-2013');
go

select * from Comida;
go

set language Español;
go

insert into Comida(IdComida, Fecha)	values(24,'18-03-2013');
insert into Comida(IdComida, Fecha)	values(25,'25-07-2013');
go

select IdComida, convert(varchar,Fecha,103)
from Comida
go

