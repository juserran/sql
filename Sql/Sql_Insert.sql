-- Insertar registros de la consulta  
-- de categorías con los campos [CategoryID], 
-- [CategoryName] en una tabla nueva
--solución 1
--Se suele usar para añadir registros a una tabla ya creada.
CREATE TABLE [dbo].[CategoriesN](
	[CategoryID] [int]  NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL
	)

SELECT * FROM CategoriesN

INSERT INTO CategoriesN
       SELECT [CategoryID], 
              [CategoryName]
       FROM Categories;
--Solución 2
--No es necesario crear la tabla
--Se suele usar para hacer una copia de datos 
--en una tabla
SELECT [CategoryID], 
       [CategoryName]
INTO CategoriesN2
FROM Categories;
	
SELECT * FROM CategoriesN2	

-- Insertar registros de la consulta  
-- de categorías con los campos [CategoryID], 
-- [CategoryName] en una tabla nueva
--solución 1
--Se suele usar para añadir registros a una tabla ya creada.
CREATE TABLE [dbo].[ProductsN](
	[ProductID] [int]  NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL
	)

SELECT * FROM ProductsN

INSERT INTO ProductsN
       SELECT [ProductID], 
              [ProductName]
       FROM Products;
--Solución 2
--No es necesario crear la tabla
--Se suele usar para hacer una copia de datos 
--en una tabla
SELECT [ProductID], 
       [ProductName]
INTO ProductsN2
FROM Products;
	
SELECT * FROM ProductsN2 order by ProductID