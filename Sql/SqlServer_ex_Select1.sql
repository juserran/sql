
--Consulta para obtener los n primeros registros
SELECT TOP 10 *
FROM dbo.Products;

--Consulta para obtener los 5 primeros registros con las columnas ProductID y ProductName.

SELECT TOP 5 Products.ProductID, 
             Products.ProductName
FROM [dbo].[Products]
ORDER BY Products.ProductID;

--Consulta para obtener el 10% de los primeros registros
SELECT TOP 10 PERCENT *
FROM Products;
SELECT TOP 100 PERCENT *
FROM Products;

--Consulta con un filtro - condicion

SELECT *
FROM [dbo].[Products]
WHERE ProductID > 10;

--

SELECT [ProductID], 
       [ProductName], 
       CategoryID
FROM [dbo].[Products]
WHERE CategoryID = 4;

--Obtener todos los productos cuyo nombre comience por g
SELECT *
FROM Products
WHERE ProductName LIKE 'g%';

--Obtener todos los productos cuyo nombre termine en n

SELECT ProductID, 
       ProductName, 
       UnitsInStock
FROM [dbo].[Products]
WHERE ProductName LIKE '%n';