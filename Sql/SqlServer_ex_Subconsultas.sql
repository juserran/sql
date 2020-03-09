--Obtener los productos agrupados por categoria
--Obteniendo el promedio de precio
--cuyo precio sea mayor a 15
SELECT Categoryid, 
       AVG(UnitPrice) AS preciopromedio
FROM Products
WHERE UnitPrice > 15
GROUP BY CategoryID;
--Obtener los productos agrupados por categoria
--Obteniendo el promedio de precio
--cuyo promedio sea mayor 35
SELECT Categoryid, 
       AVG(UnitPrice) AS preciopromedio
FROM Products
GROUP BY CategoryID
HAVING AVG(UnitPrice) > 35;

--Obtener una consulta de resumen
--para obtener la clave de los empleados
--que tengan más de 15 ordenes
--(Tabla de Orders)

SELECT EmployeeId, 
       COUNT(1) AS NumeroOrdenes
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(1) > 50;

--Obtener una consulta de resumen
--para obtener la clave de los productos
--que la sumatoria de la cantidad (Quantity) sea mayor a 450
--(Tabla de Orders Details)

SELECT ProductId, 
       SUM(Quantity) AS SumatorioCantidad
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) > 450;
--Obtener una consulta de resumen
--para obtener la clave de los empleados
--que la sumatoria del importe (Quantity*UnitPrice) sea menor a 100000
--(Tabla de Orders Details, Orders)
Select Employeeid, sum(Quantity*UnitPrice) as SumatorioVentas
from Orders o
inner join [Order Details] od
on o.OrderID=od.OrderID
group by EmployeeID
having sum(Quantity*UnitPrice) <  100000

--SUBCONSULTAS

--Obtener los productos cuyo precio sea mayor al promedio del precio de 
--la tabla de productos
SELECT *
FROM products
WHERE UnitPrice >
(
    SELECT AVG(UnitPrice)
    FROM Products
);
--Obtener los detalles de ordenes 
--cuya cantidad sea menor al promedio de la cantidad
SELECT *
FROM [Order Details]
WHERE Quantity <
(
    SELECT AVG(quantity)
    FROM [Order Details]
);

--Obtener los productos cuya cantidad en Inventario (UnitsInStock)
--sea menor a la cantidad mínima del detalle de ordenes (Order Details)
SELECT *
FROM products
WHERE UnitsInStock <
(
    SELECT MIN(quantity)
    FROM [Order Details]
);

--Obtener los datos del empleado IDEmpleado y nombre completo
--De aquellos que tengan mas de 50 ordenes
SELECT EmployeeId, 
       firstName + ' ' + LastName AS NombreCompleto
FROM employees
WHERE EmployeeID IN
(
    SELECT EmployeeId
    FROM Orders
    GROUP BY EmployeeID
    HAVING COUNT(1) > 50
);

--Obtener los datos de Producto
--ProductId, ProductName, UnitsinStock, UnitPrice (Tabla Products)
--de los productosId 
--que la sumatoria de la cantidad (Quantity) sea mayor a 450
--(Tabla de Orders Details)
SELECT ProductId, 
       ProductName, 
       UnitsinStock, 
       UnitPrice
FROM products
WHERE productid IN
(
    SELECT ProductId
    FROM [Order Details]
    GROUP BY ProductID
    HAVING SUM(Quantity) > 450
);