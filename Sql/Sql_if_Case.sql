--Transact SQL
--Estructura IF
--Estructura CASE

--Definir una variable
declare @PrimeraLetra char(1);
--Asignar valor a una variable
--1. usando la palabra reservada SET
set @PrimeraLetra = 'A';
--2. usando la palabra reservada SELECT
select @PrimeraLetra = 'B';
select @PrimeraLetra
--3. usando la palabra reservada Select
--   obteniendo un valor de los datos de la Base de datos
declare @PrimeraLetra2 char(1)
select @PrimeraLetra2 = left([ProductName],1) 
from products where ProductID = 1;
select @PrimeraLetra2 as Letra

--Declarar variable
declare @PrimeraLetra char(1);
--Asignar valor a una variable
set @PrimeraLetra = 'A';
select @PrimeraLetra as Letra

--Estructuras
--IF
declare @PrimeraLetra5 char(1);
--Asignar valor a una variable
--1. usando la palabra reservada SET
--set @PrimeraLetra5 = 'A';
--2. usando la palabra reservada SELECT
select @PrimeraLetra5 = 'B';
if @PrimeraLetra5 = 'A'
	print 'La primera letra es A'
else
	print 'La primera letra no es A';

--Mostrar en la ventana de mensaje si el mes 
--de la fecha de ordenes de la orden 10250
--es junio (06)
--1. Declarar una variable int
declare @FechaMes int;
--2. Asignar el valor del mes de la fecha [OrderDate]
select @FechaMes = Month(OrderDate) from
Orders where OrderID = 10250;
--3. Hacer la estructura IF
if @fechaMes = 6
	print 'El mes SI es Junio' 
else 
	print 'El mes NO es Junio, es '+ char(10) +char(13)  + cast(@Fechames as varchar);

Select @FechaMes as mes;

--Mostrar un mensaje referente a la cantidad de registros
--De la tabla de productos
--Si el numero de registros de los productos es mayor a 75
--Mostar mayor a 75
--En caso contrario Mostrar menor igual a 75
select 1 from Products;
--solución 1

IF @@ROWCOUNT > 75
    PRINT 'Mayor a 75';
    ELSE
    PRINT 'Menor igual a 75';
--solución 2
DECLARE @registros INT;

SELECT @registros = COUNT(ProductID)
FROM products;

IF @registros > 75
    PRINT 'Mayor a 75,  son --> ' + cast(@registros as varchar);
    ELSE
    PRINT 'Menor igual a 75, son --> ' + cast(@registros as varchar);

--Mostrar un mensaje referente a la longitud(numero de letras) 
--máxima del nombre del producto (ProductName)
--Si la longitud es mayor a 25 mostrar 'La longitud es mayor a 25'
--En caso contrario 'La longitud es menor igual a 25'
declare @LongitudMaxima int;
select @LongitudMaxima = max(len(ProductName))
from products;
select @LongitudMaxima as maxima;
if @LongitudMaxima > 25
	print 'La longitud es mayor a 25, es de ' + cast(@LongitudMaxima as varchar)
else
	print 'La longitud es menor igual a 25, es de' + cast(@LongitudMaxima as varchar)

--Mostrar un mensaje referente al contenido de Unidades en Existencia
--([UnitsInStock]). Si esta columna tiene datos menor a cero
--Mostrar 'Error en la BBDD ya que hay existencias menor a cero'
--en caso contario 'Las unidades en existencia tienen datos correctos'



declare @CantidadMinima int
select @CantidadMinima =  min([UnitsInStock])
from Products
--select @CantidadMinima as minimo
print 'Cantidad Mínima = ' + Cast(@CantidadMinima as varchar)
if @CantidadMinima < 0
	print 'Error en la BBDD ya que hay existencias menor a cero'
else
	print 'Las unidades en existencia tienen datos correctos'

--Estructura del Case
Select  Categoryid,
 case Categoryid
     when 1 then 'Lacteos'
	 When 2 then 'Carnes'
	 when 3 then 'Verduras'
	 When 4 then 'Frutas'
	 when 5 then 'Condimentos'
	 When 6 then 'Reposteria'
	 when 7 then 'Bebidas'
	 When 8 then 'Frutos secos'
	 else 'Otros'
	 end
	 as descripcion, [ProductID], [ProductName]
	 from Products
	 order by descripcion

--Mostrar el mensaje para ShipVia de la siguiente forma:
--Para el 1 Terrestre
--Para el 2 Aéreo
--Para el 3 Marítimo
--De la tabla de órdenes, obtener los datos OrderID, OrderDate, 
--Shipvia
--y su descripción tomando encuenta la codificación anterior.
Select [OrderID], 
[OrderDate],
[ShipVia], 
Case Shipvia
when 1 then 'Terrestre'
when 2 then 'Aereo'
when 3 then 'Marítimo'
else 'otro'
end as descripcion
from [dbo].[Orders]
	  


