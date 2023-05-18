-- 15.09
USE TriggersPractica;
go

--Actividad Trigger Delete: 
--Un comercio que vende artículos de informática almacena los datos de sus artículos en una tabla denominada "articulos".
--1- Elimine la tabla si existe:
 if object_id('articulos') is not null
  drop table articulos;

--2- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo int identity,
  tipo varchar(30),
  descripcion varchar(40),
  precio decimal(8,2),
  stock int,
  constraint PK_articulos primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into articulos values ('impresora','Epson Stylus C45',400,100);
 insert into articulos values ('impresora','Epson Stylus C85',500,200);
 insert into articulos values ('impresora','Epson Stylus Color 600',400,0);
 insert into articulos values ('monitor','Samsung 14',900,0);
 insert into articulos values ('monitor','Samsung 17',1200,0);
 insert into articulos values ('monitor','xxx 15',1500,0);
 insert into articulos values ('monitor','xxx 17',1600,0);
 insert into articulos values ('monitor','zzz 15',1300,0);

 select * from articulos

 alter table articulos
 enable trigger TRIG_BorrarRevisandoStock; 
 go
  alter table articulos
 disable trigger TRIG_BorrarRevisandoStock; 
 go

 alter table articulos
 enable trigger TRIG_RevisarCantBorrada; 
 go
  alter table articulos
 disable trigger TRIG_RevisarCantBorrada; 
 go

 delete from articulos
--4- Cree un disparador para controlar que no se elimine un artículo si hay stock. El disparador se  activará 
--cada vez que se ejecuta un "delete" sobre "articulos", controlando el stock, si se está  eliminando un artículo 
--cuyo stock sea mayor a 0, el disparador debe retornar un mensaje de error y  deshacer la transacción.

IF OBJECT_ID('TRIG_BorrarRevisandoStock') IS NOT NULL
	DROP TRIGGER TRIG_BorrarRevisandoStock;
GO

CREATE TRIGGER TRIG_BorrarRevisandoStock
ON articulos
FOR DELETE
AS
	IF (0 = ALL(SELECT stock FROM deleted))
	BEGIN
		SELECT 'Borrado realizado'
		SELECT * FROM deleted
	END
	ELSE
		BEGIN
			RAISERROR ('No se puede borrar un articulo con stock existente', 16,1)
			ROLLBACK TRANSACTION
		END
GO

--5- Solicite la eliminación de un artículo que no tenga stock. Se activa el disparador y permite la transacción.

select * from articulos
DELETE FROM articulos WHERE codigo = 11
GO


--6- Intente eliminar un							artículo para el cual haya stock. El trigger se dispara y deshace la transacción. 
--Puede verificar que el artículo no fue eliminado  consultando la tabla "articulos".

select * from articulos
DELETE FROM articulos WHERE codigo = 9
GO

--7- Solicite la eliminación de varios artículos que no tengan stock. Se activa el disparador y permite la transacción. 
--Puede verificar que se borraron 2 artículos  consultando la tabla "articulos".
	
select * from articulos
DELETE FROM articulos WHERE codigo IN (12,13)
GO

--8- Intente eliminar varios artículos, algunos con stock y otros sin stock. El trigger se dispara y deshace la transacción, es decir, 
--ningún artículo fue eliminado, tampoco los que tienen stock igual a 0.

select * from articulos
DELETE FROM articulos WHERE codigo IN (10,14)

--9- Cree un trigger para evitar que se elimine más de 1 artículo. Note que hay 2 disparadores para el mismo suceso (delete) sobre la misma tabla.

IF OBJECT_ID('TRIG_RevisarCantBorrada') IS NOT NULL
	DROP TRIGGER TRIG_RevisarCantBorrada;
GO

CREATE TRIGGER TRIG_RevisarCantBorrada
ON articulos
FOR DELETE
AS
	IF ((SELECT COUNT(*) FROM deleted) > 1)
		BEGIN
			RAISERROR ('Borrado no permitido: no se puede borrar mas de un articulo al mismo tiempo', 16,1)
			ROLLBACK TRANSACTION
		END
GO

--10- Solicite la eliminación de 1 artículo para el cual no haya stock. 
--Ambos disparadores "DIS_articulos_borrar" y "DIS_articulos_borrar2" se activan y permiten la transacción.

select * from articulos
DELETE FROM articulos WHERE codigo = 14

--11- Solicite la eliminación de 1 artículo que tenga stock. El disparadores  DIS_articulos_borrar" se activa y no permite la transacción. 
--El disparador "DIS_articulos_borrar2" no llega a activarse.

select * from articulos
DELETE FROM articulos WHERE codigo = 9

--12- Solicite la eliminación de 2 artículos para los cuales no haya stock. 
--El disparador "DIS_articulos_borrar" se activa y permite la transacción pero el disparador "DIS_articulos_borrar2" no permite la transacción.

select * from articulos
DELETE FROM articulos WHERE codigo in (11,12)

--13- Solicite la eliminación de 2 artículos para los que haya stock. 
--El disparador "DIS_articulos_borrar" se activa y no permite la transacción. El disparador DIS_articulos_borrar2" no llega a activarse.

select * from articulos
DELETE FROM articulos WHERE codigo in (1,2)
select * from articulos