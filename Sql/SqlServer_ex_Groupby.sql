--Obtener los datos de las ordenes y calcular una columna para 
--mostrar los días entre la fecha de la orden y fecha requerida
--OrderId, Customer Id, las fechas y el campo calculado
use Northwind
SELECT orderId, 
       CustomerID, 
       [OrderDate], 
       [RequiredDate], 
       [ShippedDate], 
       DATEDIFF(day, [OrderDate], [RequiredDate]) AS dias
FROM Orders;
--Obtener los datos de las ordenes y calcular una columna para 
--mostrar la fecha de envío más 1 mes, mostrarla como fechaEstimada.
--OrderId, CustomerId, las fechas y el campo calculado
SELECT orderId, 
       CustomerID, 
       [OrderDate], 
       [RequiredDate], 
       [ShippedDate], 
       DATEADD(month, 1,[ShippedDate] ) AS fechaEstimada
FROM Orders;
--Obtener los datos de customer, calculando una columna para un nuevo
--codigo que obtiene los tres primeros caracteres de la clave y los dos primeros
--del nombre de la compañía
--Los datos a mostrar son: CustomerID, nuevaClave, CompanyName, City, Country
SELECT [CustomerID], 
       LEFT([CustomerID], 3) + Upper(LEFT([CompanyName], 2)) AS NuevaClave, 
       CompanyName, City, 
       Country
FROM Customers;
--Obtener los datos de producto, para aquellos productos cuyo ProductName tenga menos de 20 letras
--Los datos a mostrar son ProductID, ProductName, SupplierID, CategoryID
--Ordenados por ProductName
Select ProductId,
productName,
SupplierId,
CategoryId
from Products
where len(ProductName )<20
order by ProductName
--Obtener el número de productos por CategoryId
--De la tabla de productos (Products)
SELECT CategoryId, 
       COUNT(1) as CantidadProductos
FROM products
GROUP BY CategoryID;
--Comprobación
Select CategoryId, Productid
from products
order by CategoryID
--Obtener la suma de inventario (UnitsInStock) por SupplierID
--De la tabla de productos (Products)
SELECT SupplierID, 
       sum(UnitsInStock) as Inventario
FROM products
GROUP BY SupplierID;
--comprobación
Select SupplierID, UnitsInStock
from products
order by SupplierID
--Contar las ordenes por empleado
--De la tabla de ordenes
--Pero unicamente del empleado 1,3,5,6
Select EmployeeId, count(1) as TotalOrdenes
from Orders
where Employeeid in (1,3,5,6)
group by EmployeeID
--comprobacion
SELECT employeeid, 
       orderid
FROM Orders
ORDER BY EmployeeID;

--Obtener la suma del envío (freight) por cliente
--De la tabla de ordenes
--Pero únicamente de los registros cuya ShipCity sea 
--Madrid, Sevilla, Barcelona, Lisboa, London
--Ordenado por el campo de suma del envío
SELECT CustomerID, 
       SUM(freight) AS Importe
FROM Orders
WHERE ShipCity IN('Madrid', 'Sevilla', 'Barcelona', 'Lisboa', 'London')
GROUP BY CustomerID
ORDER BY importe;