use Northwind;
go
CREATE PROCEDURE ConsultarProductos
AS
     SELECT [ProductID], 
            [ProductName], 
            [UnitPrice], 
            [UnitsInStock]
     FROM Products;
go;
--Para ejecutar un procedimiento almacenado
execute 
 ConsultarProductos;

exec ConsultarProductos



--Crear un procedimiento almacenado
--Para obtener el precio máximo de productos
go

CREATE PROCEDURE PrecioMaximo
AS
     SELECT MAX([UnitPrice]) AS preciomaximo
     FROM products;
go

--Ejecutar el procedimiento almacenado
go

--Cambiar un procedimiento almacenado
--Cambiar del procedimento almacenado PrecioMaximo,
--añadir ahora el precio minimo.

ALTER PROCEDURE PrecioMaximo
AS
     SELECT MAX([UnitPrice]) AS preciomaximo, 
            MIN(unitprice) AS preciominimo
     FROM products;

--Borrar un procedimiento almacenado
drop procedure ConsultarProductos
go



--Crear un procedimiento almacenado que obtenga
--el numero de ordenes que ha vendido por empleado

CREATE PROCEDURE OrdenesEmpleado
AS
     SELECT [EmployeeID], 
            COUNT(1) as contador
     FROM Orders
     GROUP BY [EmployeeID];
go
--ejecutar
exec OrdenesEmpleado
go
----24/01/2020
use EmpresaEnero
go
--Creación de un procedimiento con Parametro de entrada
CREATE PROCEDURE ProcedimientoConParametro 
@Mensaje VARCHAR(50)
AS
     PRINT @Mensaje;


--Ejecutar el procedimiento almacenado con parámetro
exec ProcedimientoConParametro 'Hola mundo'


go
--PROCEDIMIENTO ALMACENADO CON PARAMETRO DE ENTRADA
--Crear un procedimiento almacenado para consultar
--los productos con una determinada categoria.
use Northwind
go
CREATE PROCEDURE ProductoCategoria @CategoriaId INT
AS
     SELECT [ProductID], 
            [ProductName], 
            [UnitPrice], 
            [UnitsInStock]
     FROM Products
     WHERE CategoryID = @CategoriaId;
go

--Ejecutar

exec ProductoCategoria 3
go

--Crear un procedimiento almacenado para 
--Obtener el numero de ordenes de un
--determinado cliente
CREATE PROCEDURE NumeroOrdenesCliente @cliente NCHAR(5)
AS
     SELECT [CustomerID], 
            COUNT([OrderID]) AS ORDENES
     FROM Orders
     WHERE customerId = @cliente
     GROUP BY [CustomerID];

GO
exec NumeroOrdenesCliente 'ALFKI'
GO
--Crear un procedimiento almacenado para
--Obtener las ordenes de dos empleados 
--determinados


CREATE PROCEDURE OrdenesEmpleados2 @empleado1 INT, 
                                   @empleado2 INT
AS
     SELECT [OrderID], 
            [CustomerID], 
            [EmployeeID], 
            [OrderDate]
     FROM Orders
     WHERE [EmployeeID] IN(@empleado1, @empleado2);
	 --Ejecutar
	 exec OrdenesEmpleados2 1, 4


--Crear un procedimiento almacenado para sumar
--las cantidades vendidas ([dbo].[Order Details])
--de un producto determinado
--verificando que el producto de entrada sea válido
go
create procedure CantidadVendidaProducto
@Producto int
as
select  [ProductID]
from Products
where ProductID = @Producto;
if @@ROWCOUNT > 0
   select [ProductID], sum([Quantity])
   from [dbo].[Order Details]
   where [ProductID] = @Producto
   group by [ProductID]
else
	print 'el Producto no es válido'
go

create procedure CantidadVendidaProducto2
@Producto int
as
declare @existe int;

select @existe=[ProductID]
from Products
where ProductID = @Producto;

if @existe is not null
   select [ProductID], sum([Quantity]) as cantidad
   from [dbo].[Order Details]
   where [ProductID] = @Producto
   group by [ProductID]
else
	print 'el Producto no es válido'
go

exec CantidadVendidaProducto2 3



--Crear un procedimiento almacenado para
--hacer una comparativa de ventas ([UnitPrice]*[Quantity])
--Obtenerlo de la tabla [dbo].[Order Details]
--entre dos empleados
--mostrar en un print
--Qué empleado ha vendido más
--Como parametros de entrada tenemos las claves
--de los dos empleados.


go
create procedure Comparativa
@Empleado1 int,
@Empleado2 int
as
declare @ventas1 money;
declare @ventas2 money;
Select @ventas1 = sum([UnitPrice]*[Quantity])
from [dbo].[Orders] o
inner join [dbo].[Order Details] od
on o.OrderID = od.OrderID
where [EmployeeID]=@Empleado1

select @ventas1
Select @ventas2 = sum([UnitPrice]*[Quantity])
from [dbo].[Orders] o
inner join [dbo].[Order Details] od
on o.OrderID = od.OrderID
where [EmployeeID]=@Empleado2

select @ventas2
if	@ventas1 > @ventas2
 Print 'El Primer empleado ha vendido más, su id es --> ' + Cast(@empleado1 as varchar)
else
	if @ventas1 = @ventas2
		Print 'Las ventas son iguales'
	else
		print 'El Segundo empleado ha vendido más, su id es --> ' + Cast(@empleado2 as varchar)

--Ejecutar el procedimiento almacenado
exec ComparativaVentas 1, 2

exec sp_rename '[dbo].[Comparativa]', 'ComparativaVentas';