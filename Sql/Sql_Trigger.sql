/*
Disparador (trigger) = procedimiento invocado
automáticamente por el SGBD como respuesta a
ciertos cambios en la BD (≈ demonio que
monitoriza la BD)
*/

--Ejemplo 1
create TRIGGER [dbo].[AfterCategorias] ON Categories
AFTER INSERT
--Desencadenador en la tabla de productos
--que se ejecuta después de hacer un
--insert en la tabla.
AS
 print 'Se ha dado de alta en la tabla de categorias'

--Como lanzar el trigger - caso 1

 insert into Categories
 (CategoryName,
 Description)
 values
 ('Lanza trigger',
 'Este insert lanzará la ejecución del trigger')

--como lanzar el trigger - Caso 2
 INSERT INTO Categories
(CategoryName, 
 Description
)
VALUES
('Caso 2A', 
 'Este insert lanzará la ejecución del trigger'
),
('Caso 2B', 
 'Este insert lanzará la ejecución del trigger'
);
go

create TRIGGER [dbo].[AfterProductos] ON Products
AFTER update
--Desencadenador en la tabla de productos
--que se ejecuta después de hacer un
--insert en la tabla.
AS
     INSERT INTO [dbo].[PistaAuditoria]
     VALUES
     ('Products', 
      'Nueva modificacion de producto'
     );

--Forma de lanzar el trigger (forma de ejecutarlo)
update products 
set ProductName = 'Prueba Trigger'
where ProductID = 84

--Comprobar los resultados
SELECT *
FROM products
WHERE ProductID = 84;
SELECT *
FROM pistaAuditoria;

--Comprobar que no se lanza el trigger con un delete
delete products
where ProductID= 83
go

--Ejemplo de Trigger con el Instead of
alter TRIGGER EnLugarEmpleado ON Employees
INSTEAD OF UPDATE
AS
     INSERT INTO PistaAuditoria
     VALUES
     ('Employees', 
      'trigger instead of'
     );


go

--Lanzar el trigger (equivalente en procedimientos almacenados 
--para ejecutarlo)
update Employees
set LastName = 'Lopez'
where EmployeeID=1
--forma de comprobarlo
select * from Employees  where EmployeeID=1
select * from PistaAuditoria
go
--Ejercicio 1
--Cuando se inerte un order Details restar la cantidad en
--la tabla de productos del campo UnitsInStock.
--ojo: para dar de alta en order Details debe haber un numero de orden
--en la tabla de ordenes
go
alter TRIGGER ActualizaUnitsInStock ON [dbo].[Order Details]
AFTER INSERT
AS
     DECLARE @cantidad INT;
     DECLARE @productId INT;
     SELECT @cantidad = quantity, 
            @productId = productid
     FROM inserted;
     UPDATE products
       SET 
           UnitsInStock = UnitsInStock - @cantidad
		   where ProductID=@productId;

select * from Orders order by OrderID desc
select * from products where ProductID = 50
insert [Order Details]
values
(11077,
50,
5,
1,
0
)

select * from [Order Details] where OrderID=11077
	 











--Ejemplo 2
ALTER TRIGGER [dbo].[AfterProductosB] ON [dbo].[Products]
AFTER delete
AS
     INSERT INTO [dbo].[PistaAuditoria]
     VALUES
     ('Productos', 
      'Se ha borrado un producto'
     );
	 go
--Ejemplo 3
ALTER TRIGGER [dbo].[AfterProductosC] ON [dbo].[Products]
AFTER UPDATE
AS
     INSERT INTO [dbo].[PistaAuditoria]
     VALUES
     ('Productos', 
      'Cambio en producto'
     );
	 go
	 --Ejemplo 4
	 ALTER TRIGGER [dbo].[CategoriaAA] ON [dbo].[Categories]
AFTER INSERT
AS   --Declarar variables para guardar los datos que
	 --se insertaron en la tabla
     declare @Categoria as int;
	 declare @CategoryName as nvarchar(15);
	 --Se le asigna valor de la tabla temporal Inserted
	 --La tabla Inserted 
     --Es una tabla temporal
     --Que maneja el gestor de base de datos
     --para guardar temporalmente los datos
     --que se hicieron en la acción alta
	 select @Categoria=inserted.[CategoryID],
	        @CategoryName = inserted.[CategoryName]
     from inserted
     INSERT INTO [dbo].[PistaAuditoria]
     VALUES
     ('Categories', 
      'Nueva Categoria ' + @CategoryName + ' ' + cast(@Categoria as varchar)
     );
	 go
	 --ejemplo 5
	 ALTER TRIGGER [dbo].[CategoriaAB] ON [dbo].[Categories]
AFTER delete
AS
	--Declarar variables
	declare @Categoria int;
	declare @Nombre nvarchar(15);
	--Asignar valor a las variables
	--De la tabla DELETED
	--La cual se genera por el gestor de BBDD
	--En el momento que se realiza una baja
	--Es una tabla temporal
	select @Categoria=deleted.[CategoryID],
	@Nombre = deleted.[CategoryName]
	from deleted
     INSERT INTO [dbo].[PistaAuditoria]
     VALUES
     ('Categories', 
      'Se ha dado de baja la Categoria ' + cast(@Categoria as varchar)
	  + ' ' + @Nombre
     );
	 go
	 --ejemplo 6
	 ALTER TRIGGER [dbo].[CategoriaAC] ON [dbo].[Categories]
AFTER UPDATE
AS
   --Declarar variables
	declare @Categoria int;
	declare @Nombre nvarchar(15);
	--Asignar valor a las variables
	--De la tabla DELETED
	--Para obtener los datos antes de realizar el cambio
	--La cual se genera por el gestor de BBDD
	--En el momento que se realiza una baja
	--Es una tabla temporal
	select @Categoria=deleted.[CategoryID],
	@Nombre = deleted.[CategoryName]
	from deleted

	--Declarar variables para guardar los datos que
	 --se insertaron en la tabla
	 declare @CategoryName as nvarchar(15);
	 --Se le asigna valor de la tabla temporal Inserted
	 --La tabla Inserted 
     --Es una tabla temporal
     --Que maneja el gestor de base de datos
     --para guardar temporalmente los datos
     --que se hicieron en la acción alta
	 select 
	        @CategoryName = inserted.[CategoryName]
     from inserted

     INSERT INTO [dbo].[PistaAuditoria]
     VALUES
     ('Categories', 
      'Se ha modificado la Categoria ' + cast(@categoria as varchar) +
	  ' el valor anterior era ' + @Nombre +
	  ' el valor nuevo es ' + @CategoryName
     );