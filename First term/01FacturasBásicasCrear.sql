--create database facturasbasicas
--go

use facturasbasicas
go

-- crear tabla FAC_T_Articulo
if object_id('FAC_T_Articulo') is not null
  drop table FAC_T_Articulo;
  go

create table FAC_T_Articulo
(		
	CodArticulo 	integer,
	NombreArticulo	varchar(50),
	PrecioActual	numeric(10,2)
);
go

-- crear tabla FAC_T_Cliente
if object_id('FAC_T_Cliente') is not null
  drop table FAC_T_Cliente;
  go

create table FAC_T_Cliente
(		
	CodCliente 		integer,
	NombreCliente	varchar(60),
	DatosCliente	varchar(60),
	FechaAlta		datetime ,
	FechaNacimiento	datetime 
);
go

--cargar datos
set dateformat  dmy
go
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 1,'Antonio','C/uno nº 3','01/03/2012','15/04/1970')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 2,'Juan','C/la hornera nº 7' ,'22/05/2012','29/06/1982' )
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 3,'María','C/el pino nº 7','22/05/2010','15/06/1960')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 7,'Ana','C/el monte nº 6','15/10/2012','26/12/1963')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 12,'Juana','C/la estaca nº 77','23/05/2009','15/12/1963')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 22,'Los Espacios S.L.','Rambla nº 17','15/04/2012',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 33,'La Reserva S.A.','Puerto nº 66','23/12/2011',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 66,'TITSA','Intercambiador','14/08/2012',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 99,'Contado','Sin datos','23/1/2010',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 80,'Juana María','C/La hoguera 23','23/10/2010','26/12/1963')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 81,'Fernando','Av Los Majuelos 7','15/1/2010','2/11/1968')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 82,'Isabel','Finca España','17/12/2011','14/5/1975')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 83,'Ana Luisa','C/la una nº 34','24/6/2012','26/05/1950')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 84,'Francisco Javier','','15/7/2010',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 85,'María Luisa','C/La laguna nº 77','18/6/2011',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 86,'Antonio Juan','','19/1/2010','12/12/1980')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 87,'José','','3/12/2011',null)
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 88,'Mauricio',null,'14/8/2012','15/06/1980')
insert FAC_T_Cliente ( CodCliente,NombreCliente,DatosCliente,FechaAlta,FechaNacimiento )  values ( 89,'Elena','Sin datos','23/1/2010',null)
go

insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 22,'llave ajustable 200mm',12.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 25,'llave allen 1.5',6.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 28,'llave combinada 6',5.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 36,'martillo bellota',10.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 37,'martillo ebanista',13.20 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 39,'destornillador plano',1.55 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 40,'destornillador philips',2.25 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 46,'tenaza',2.34 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 50,'mordaza bloqueable',10.25 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 60,'alicate pelacables',10.15 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 75,'alicate corte diagonal',13.20 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 80,'taladro sin cable especial',102.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 90,'taladro atornillador sin cable',145.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 98,'taladro con cable',76.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 105,'destornillador eléctrico sin cable',80.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 110,'sierra de calar',12.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 120,'sierra circular',112.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 150,'lijadora orbital',110.00 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 300,'tornillo 3mm',0.20 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 310,'tuerca 3mm',0.10 )
insert FAC_T_Articulo ( CodArticulo,NombreArticulo,PrecioActual )  values ( 888,'tornillo redondo',23.50 )
go