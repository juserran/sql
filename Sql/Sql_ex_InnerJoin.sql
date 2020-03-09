--Northwind
--1.Consulta para obtener los 10 primeros registros de la tabla de ordenes
SELECT TOP 10 *
FROM dbo.Orders;
--2.Consulta para obtener los 5 primeros registros con las columnas ProductID y ProductName.
SELECT TOP 5 Products.ProductID, 
             Products.ProductName
FROM [dbo].[Products]
ORDER BY Products.ProductID;
--3.Consulta para obtener el 10% de los primeros registros Detalle de ordenes
SELECT TOP 10 PERCENT *
FROM [Order Details];
--Consulta con un filtro - condicion
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
--6.Crear una consulta para obtener el IdOrden, IdCustomer, Fecha de la orden de la tabla de ordenes.
SELECT [OrderID], 
       [CustomerID], 
       [OrderDate]
FROM Orders;
--7.Crear una consulta para obtener el OrderId, CustomerId, Fecha de la orden, cuyos empleados sean 1, 2, 3
SELECT [OrderID], 
       [CustomerID], 
       [OrderDate]
FROM Orders
WHERE [EmployeeID] IN(1, 2, 3);
--8.Crear una consulta para obtener el OrderId, EmployeeId, Apellido del Empleado, Fecha de la orden.
select [OrderID],
e.[EmployeeID],[LastName],[OrderDate]
from Employees E
inner join orders O
on e.EmployeeID = o.EmployeeID
--x9.Crear una consulta para contar las ordenes por Cliente.
SELECT [CustomerID], 
       COUNT(1) AS NumeroOrdenes
FROM orders
GROUP BY [CustomerID];
--10.Crear una consulta para contar las ordenes por cliente cuya fecha sea menor al 30/06/1996
--cuya fecha sea mayor al 30/06/1996
SELECT [CustomerID], 
       COUNT(1) AS NumeroOrdenes
FROM orders
where [OrderDate] > cast('1996-06-30' as date)
GROUP BY [CustomerID];
--11.Crear una consulta para contar las ordenes por Cliente cuyo contador de ordenes sea mayor a 1.
SELECT [CustomerID], 
       COUNT(1) AS NumeroOrdenes
FROM orders
GROUP BY [CustomerID]
HAVING COUNT(1) > 1;
--12.Crear una Consulta con el nombre del empleado y el contador de ordenes realizadas cuyos empleados 
--      tengan más de  100 ordenes
--Solución 1
SELECT E.FirstName ,
count(o.OrderID)
FROM Employees E
INNER JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName 
having count(o.orderid) > 100;

--13.Obtener el producto, categoria y proveedor con clave y nombre
SELECT P.ProductID,
P.ProductName,
C.CategoryID,
C.CategoryName,
S.SupplierID,
S.CompanyName
FROM Categories C
INNER JOIN Products P
ON C.CategoryID = P.CategoryID
INNER JOIN Suppliers S
ON P.SupplierID = S.SupplierID
--14.Obtener el employeeid, firstname, [TerritoryID] y [TerritoryDescription]
SELECT E.EmployeeID, E.FirstName, T.TerritoryID, T.TerritoryDescription
FROM [dbo].[Employees] AS E
INNER JOIN [dbo].[EmployeeTerritories] AS ET
ON E.EmployeeID = ET.EmployeeID
INNER JOIN [dbo].[Territories] AS T
ON ET.TerritoryID = T.TerritoryID
--x15. Obtener una consulta 
--De la suma de las cantidades vendidas por categoria
SELECT P.CategoryID, 
SUM(OD.Quantity) AS TOTAL
FROM Products P
INNER JOIN [Order Details] OD
ON P.ProductID = OD.ProductID
GROUP BY P.CategoryID
--16. Obtener la categoria con su clave, el producto con su clave
--y la cantidad vendida (Order Deails)
SELECT C.CategoryID,
C.CategoryName,
P.ProductID,
P.ProductName,
O.Quantity
FROM Categories C
INNER JOIN Products p
ON C.CategoryID = P.CategoryID
INNER JOIN [Order Details] O
ON P.ProductID = O.ProductID
--17.Obtener el EmployeeId, FirstName, OrderId, OrderDate
SELECT E.EmployeeID, 
FirstName,
OrderID,
OrderDate
FROM Employees AS E
INNER JOIN Orders AS O
ON E.EmployeeID=O.EmployeeID
--18.Obtener una consulta con Nombre de la compañía de clientes
--y contar las ordenes únicamente las que shipCountry sea Spain
SELECT c.CompanyName,
count(O.OrderID) as NumeroOrdenes
FROM Customers  as C
INNER JOIN ORDERS O
ON C.CustomerID = O.CustomerID
WHERE O.ShipCountry='Spain'
GROUP BY C.CompanyName;
--19.Inserta un solo registro en la tabla de Categorias
insert into [dbo].[Categories] 
([CategoryName],[Description])
values
('Tex-Mex','Comida Text-Mex')
--20. Insertar registros de la consulta  
-- de categorías con los campos [CategoryID], 
-- [CategoryName] en una tabla nueva
--21. Actualizar el nombre de la categoria que se ha dado de alta
--en el punto 20.
update [dbo].[Categories]
set [CategoryName] = 'Nueva Desc'
where CategoryID = 14
--22. Incrementar en 10% el precio unitario de los productos
UPDATE products
  SET 
      UnitPrice = UnitPrice * 1.1;
--23. Borrar registros de la tabla de categorias con las categorías
--   nuevas
delete Categories 
where [CategoryID]= 14
--24. borrar definitiva la tabla creada en el punto 22
--25. Hacer una vista del importe de las ventas por producto, incluyendo el nombre
--del producto
--26. Obtener los productos cuya cantidad sea mayor al promedio de cantidad 
--de la tabla de Orde Details
SELECT ProductID
FROM [Order Details]
WHERE Quantity >
(
    SELECT AVG(Quantity)
    FROM [Order Details]
)
GROUP BY ProductID;
--27. Obtener los productos cuyas cantidades vendidas 
--sean mayores al promedio del precio
SELECT ProductID
FROM [Order Details]
WHERE Quantity*UnitPrice >
(
    SELECT AVG(Quantity*UnitPrice)
    FROM [Order Details]
)
GROUP BY ProductID;
--28. Obtener los productos cuyas categorias comiencen con B
Select [ProductID], [ProductName] from
products 
where
CategoryID in 
(Select CategoryID from categories where CategoryName like 'B%')