--Northwind
use Northwind
--1.Consulta para obtener los n 
--primeros registros de la tabla de ordenes
SELECT TOP 10 *
FROM dbo.Orders;
--2.Consulta para obtener los 5 primeros registros 
--con las columnas ProductID y ProductName.
SELECT TOP 5 Products.ProductID, 
             Products.ProductName
FROM [dbo].[Products]
--3.Consulta para obtener el 10% de 
--los primeros registros detalle ordenes
SELECT TOP 10 PERCENT *
FROM [Order Details];
--4.Obtener todos los productos cuyo nombre comience por g
SELECT *
FROM Products
WHERE ProductName LIKE 'g%';
--5.Obtener todos los productos cuyo nombre termine en n
SELECT ProductID, 
       ProductName, 
       UnitsInStock
FROM [dbo].[Products]
WHERE ProductName LIKE '%n';
--6.Crear una consulta para obtener el IdOrden, IdCustomer, 
--Fecha de la orden de la tabla de ordenes.
SELECT [OrderID], 
       [CustomerID], 
       [OrderDate]
FROM Orders;
--7.Crear una consulta para obtener el OrderId, CustomerId, 
--Fecha de la orden, cuyos empleados sean 1, 2, 3
SELECT [OrderID], 
       [CustomerID], 
       [OrderDate]
FROM Orders
WHERE [EmployeeID] IN(1, 2, 3);

--8.Crear una consulta para obtener el OrderId, EmployeeId, 
--Fecha de la orden.
select [OrderID],
[EmployeeID],[OrderDate]
from Orders


