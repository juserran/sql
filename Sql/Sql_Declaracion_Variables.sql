/*
LENGUAJE DE PROGRAMACIÓN DE SQL SERVER TRANSAQ - SQL
*/

--Declaración de variable
DECLARE @nombre VARCHAR(30);
--Asignación de variable
SET @nombre = 'Raul Rodriguez';
--mostrar el resultado
SELECT @nombre;


--Guardar el nombre del producto 1 en una variable
--Declarar la variable
DECLARE @NombreProducto NVARCHAR(40);
--Asignación de valor
SELECT @NombreProducto = [ProductName]
FROM Products
WHERE [ProductID] = 1;
--mostrar el valor de la variable
SELECT @NombreProducto;


--Guardar las [UnitsInStock] del producto 25 en una variable

--declarar variable
DECLARE @UnidadesExistencia SMALLINT;
--Asignar valor
SELECT @UnidadesExistencia = [UnitsInStock]
FROM products
WHERE ProductID = 25;
--mostrar el valor
SELECT @UnidadesExistencia;

--Obtener las 5 primeras letras del nombre del producto 
--con idproducto = 5
--declarar variable
DECLARE @Primeras5letras nvarchar(5); 
--Asignar valor
SELECT @Primeras5letras = Left(ProductName,5)
FROM products
WHERE ProductID = 5;
--mostrar el valor
SELECT @Primeras5letras;

--Obtener el nombre del producto en mayuscula del idproducto=55
--declarar variable
DECLARE @NombreMayuscula nvarchar(40); 
--Asignar valor
SELECT @NombreMayuscula = UPPER(ProductName)
FROM products
WHERE ProductID = 55;
--mostrar el valor
SELECT @NombreMayuscula;

--Obtener en una variable el mes de la fecha de hoy
--declarar variable
DECLARE @Mes int; 
--Asignar valor
set @Mes = MONTH(GETDATE());
--mostrar el valor
SELECT @Mes;

--Obtener en una variable el mes de la fecha 22/02/2020
--declarar variable
DECLARE @Mes int; 
--Asignar valor
set @Mes = MONTH(CAST('2020-02-22' AS DATE));
--mostrar el valor
SELECT @Mes;

--Obtener en una variable el mes de la fecha 22/08/2020
--declarar variable
DECLARE @Mes int; 
--Asignar valor
set @Mes = MONTH(CONVERT(DATE,'2020-08-22'));
--mostrar el valor
SELECT @Mes;

--Devolver en una variable el nombre del mes de la fecha de hoy
DECLARE @Mesletra varchar(40); 
--Asignar valor
set @Mesletra = Datename(month, GETDATE());
--mostrar el valor
SELECT @Mesletra;

--obtener los días que hay entre OrderDate y ShippedDate 
--de la orden 10250

DECLARE @dias INT;
SELECT @dias = DATEDIFF(DAY, OrderDate, ShippedDate)
FROM orders
WHERE OrderID = 10250;
SELECT @dias;

--Mostrar si la sentencia select * from Products hay error
--así como mostrar el numero de registros mostrados

select * from products;
select @@ROWCOUNT;
select @@ERROR;

