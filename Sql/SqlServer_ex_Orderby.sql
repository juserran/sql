--Obtener los datos de productos ordenados descendentemente por nombre del producto
SELECT *
FROM Products
ORDER BY ProductName DESC;
--Obtener los datos de productos ordenados ascendentemente por precio unitario
SELECT *
FROM Products
ORDER BY UnitPrice;
--Obtener los datos de productos ordenados descendentemente por precio unitario
--de la categoría 1
SELECT *
FROM Products
where CategoryID=1
ORDER BY UnitPrice DESC;
--Obtener los datos de los clientes ordenados descendentemente por nombre que se 
--encuentren en la ciudad de barcelona, Lisboa
SELECT *
FROM Customers
WHERE city IN('Barcelona', 'Lisboa')
ORDER BY CompanyName DESC;

--Obtener los datos de las ordenes ordenados descendentemente por la fecha de la orden
--cuyo cliente sea ALFKI
SELECT *
FROM Orders
WHERE CustomerID = 'ALFKI'
ORDER BY OrderDate DESC;
--Obtener los datos del detalle de ordenes ordenados ascendentemente por precio
--cuyo producto sea 1, 5 o 20
SELECT *
FROM [Order Details]
WHERE ProductID IN(1, 5, 20)
ORDER BY UnitPrice;
--Obtener los datos de las ordenes ordenados ascendentemente por la fecha de la orden
--cuyo empleado sea 2 o 4
SELECT *
FROM Orders
WHERE EmployeeID IN(2, 4)
ORDER BY OrderDate;
--Obtener los productos cuyo precio están entre 30 y 60
--ordenado por nombre
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 30 AND 60
ORDER BY ProductName;
--funciones de agregado o resumen
--count - contar
--sum - suma
--max - maximo
--min - minimo
--avg - media
--Contar los registros de la tabla de productos
SELECT COUNT(*) AS totalProductos
FROM Products;
--Dan el mismo resultado pero es mejor para el rendimiento
SELECT COUNT(1) AS TOTALPRODUCTOS, 
       AVG(UnitPrice) AS PROMEDIO
FROM PRODUCTS;
--Obtener la suma del inventario (UnitInStock)
SELECT SUM(UnitsInStock) as [TOTAL UNIDADES]
FROM Products;
--Obtener el precio máximo de la tabla de detalle de ordenes
SELECT MAX(unitprice) AS [PRECIO MAYOR]
FROM [Order Details];
--Obtener la fecha más antigua
SELECT MIN(orderdate) AS [MAS ANTIGUA]
FROM Orders;
--COLUMNAS CALCULADAS
--USANDO UN ALIAS
--Calcular el importe (UnitPrice * Quantity) de los productos venidos 
SELECT [OrderID], 
       [ProductID], 
       [UnitPrice] * [Quantity] AS IMPORTE
FROM [Order Details];
--Calcular el precio del producto con un 10% de aumento
--las columnas a mostrar son: ProductID y nuevo precio
SELECT productid, 
       unitprice * 1.1 AS [Nuevo Precio]
FROM Products;
--Calcular el valor del Inventario (UnitsInStock * unitprice)
--las columnas a mostrar son: ProductID, categoryID, valor del inventario
--ordenado descendentemente por valor del inventario
--unicamente para la categoria 1,3 y 5
SELECT productid, 
       categoryid, 
       unitsinStock * unitprice AS [Valor Inventario]
FROM products
WHERE CategoryID IN(1, 3, 5)
ORDER BY [Valor Inventario] DESC;
--Calcular el importe de los productos vendidos (Quantity * UnitPrice)
--Mostar orderid, productid, importe
--unicamente de los productos del 1 al 10
--ordenados por importe
--tabla orders details
SELECT [OrderID], 
       [ProductID], 
       [UnitPrice] * [Quantity] AS IMPORTE
FROM [Order Details]
where ProductID between 1 and 10
order by IMPORTE
--Obtener el nombre completo de los empleados (FirstName , LastName)
--unicamente de los empleados que reportan al empleado 2
--ordenado ascendentemente por ciudad 
SELECT employeeid, 
       firstName + ' ' + lastName AS [Nombre Completo], 
       city
FROM Employees
WHERE reportsTo = 2
ORDER BY city;

