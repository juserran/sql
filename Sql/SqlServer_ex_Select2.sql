USE Northwind;
--Obtener todos los productos 
--Unicamente se usará para pruebas, ya que es más optimo para el
--motor de BBDD el poner el nombre de las columnas.
SELECT *
FROM Products;
--Obtener todos los clientes
SELECT *
FROM Customers;
--Obtener todas las categorias
SELECT *
FROM Categories;
--Obtener la información de una tabla especificando las columnas
SELECT [ProductID], 
       [ProductName], 
       [UnitPrice]
FROM Products;
SELECT [CustomerID], 
       [CompanyName], 
       [Country]
FROM Customers;
--Obtener la información de la tabla de categorias, unicamente id y nombre
SELECT [CategoryID], 
       [CategoryName]
FROM Categories;
--Con DISTINCT se obtiene un resumen de los datos sin repetirlos
--Ejemplo obtener las ciudades donde se tienen clientes
Select DISTINCT [City] from Customers;
--Ejemplo obtener los Clientes que tienen ordenes (sin repetición)
Select DISTINCT [CustomerID] from Orders;
--Filtros - para los filtros se usa la palabra reservada Where
--Ejemplo obtener todos los productos cuyo precio sea mayor a 35
SELECT *
FROM Products
WHERE UnitPrice > 35;
--Ejemplo obtener todos los productos cuyo invetario (UnitsInStock) sea menor a 45
SELECT *
FROM Products
WHERE UnitsInStock < 45;
--Ejemplo obtener todos los productos que estén descontinuados
SELECT *
FROM Products
WHERE Discontinued = 1;
--Ejemplo todos los productos cuyo nombre comience por B
SELECT *
FROM Products
WHERE ProductName LIKE 'b%';
--Ejemplo todos los productos cuyo nombre terminen con s
SELECT *
FROM Products
WHERE ProductName LIKE '%s';
--Ejemplo todos los clientes cuyo id cominencen con AN y su longitud sea 5 caracteres
SELECT *
FROM Customers
WHERE CustomerID LIKE 'AN___';
--Ejemplo todos los clientes que comiencen con A,B o C
SELECT *
FROM Customers
WHERE CustomerID LIKE '[A,B,C]%';
--Todos los clientes que no comiencen con A
SELECT *
FROM Customers
WHERE CustomerID LIKE '[^A]%';
--Todos los clientes que no comiencen con vocal
SELECT *
FROM Customers
WHERE CustomerID LIKE '[^A,E,I,O,U]%';
--Operador Between para rangos
--Obtener los productos cuyo precio esté entre 45 y 100
SELECT *
FROM Products
WHERE UnitPrice between 45 and 100;
--Obtener los clientes cuya ciudad sea Barcelona, Berlin, Lisboa
SELECT *
FROM Customers
WHERE city in ('Barcelona', 'Berlin', 'Lisboa');
--Obtener los productos cuya categoria sea 1 y su precio sea mayor a 10
SELECT *
FROM Products
WHERE CategoryID=1 and UnitPrice > 10;
--Obtener los productos cuyo proveedor (SupplierId) sea 16 y el inventario (UnitsInStock 
--sean mayor a 100
SELECT *
FROM Products
WHERE SupplierID=16 and UnitsInStock>100;
--obtener los 10 primeros productos
SELECT TOP 10 *
FROM Products;
--obtener los 20 primeros clientes
SELECT top 20 *
FROM Customers
--Obtener el 10% de los productos
SELECT top 10 percent *
FROM Products
--Obtener el 10% de los clientes
SELECT top 10 percent *
FROM Customers

