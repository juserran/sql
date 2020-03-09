/*VISTAS ACTUALIZABLES
RESTRICCIONES
1. No utilizar funciones de agregación.
2. No utilizar cláusulas group by o having en la vista
3. Ausencia de subconsultas
4. No usar union, union all ni distinct
5. La clausula from incluirá al menos una table o vista actualizable
6. La cláusula from utiliza sólo inner joins si hay más de una tabla o vista
*/
--Ejemplo 1 : hacer una vista de la tabla de Categorias
CREATE VIEW CategoriasParaActualizar(CategoryId, 
                                     CategoyName, 
                                     Description)
AS
     SELECT CategoryId, 
            CategoryName, 
            description
     FROM Categories;

--Comprobación
SELECT *
FROM CategoriasParaActualizar;

--Actualizar CategoryName de la categoria 1 sobre la vista
UPDATE CategoriasParaActualizar
  SET 
      CategoyName = 'Condimentos'
WHERE CategoryId = 1;

Insert into CategoriasParaActualizar
values ('Infusiones ', 'Combinacion de hierbas...')

delete CategoriasParaActualizar
where CategoryId = 19

--Comprobación

select * from Categories

--Ejemplo 2
CREATE VIEW ProductosParaActualizar(Productid, 
                                    ProductName, 
                                    supplierId, 
                                    CategoryId, 
                                    UnitPrice, 
                                    Discontinued)
AS
     SELECT Productid, 
            ProductName, 
            supplierId, 
            CategoryId, 
            UnitPrice, 
            Discontinued
     FROM products;

--Comprobacion
select * from ProductosParaActualizar

--Actualizar el nombre de producto 1 con Infusión Chai
UPDATE ProductosParaActualizar
  SET 
      ProductName = 'Infusión Chai'
WHERE Productid = 1;

Select * from Products

--Ejemplo 3 : Crear una vista con los datos de CategoryId, CategoryName,
--ProductoId, ProductName, UnitPrice, Description

CREATE VIEW CategoriasProductosParaActualizar(CategoryId, 
                                              CategoryName, 
                                              ProductId, 
                                              ProductName, 
                                              UnitPrice, 
                                              Description)
AS
     SELECT c.CategoryId, 
            CategoryName, 
            ProductID, 
            ProductName, 
            UnitPrice, 
            Description
     FROM Categories C
          INNER JOIN Products P ON c.CategoryID = p.CategoryID;
--Comprobacion
Select * from CategoriasProductosParaActualizar
--Actualizar datos correspondientes a la tabla de Categorias desde
--la vista
update CategoriasProductosParaActualizar
set CategoryName = 'CONDIMENTOS', Description = 'Condimentos India'
where CategoryId=1

--Actualizar datos correspondientes a la tabla de Productos desde
--la vista
update CategoriasProductosParaActualizar
set ProductName = 'INFUSION', UnitPrice = 1
where ProductId=1

--Actualizar datos correspondientes a ambas tablas desde la vista
UPDATE CategoriasProductosParaActualizar
  SET 
      ProductName = 'INFUSION CHAI', 
      CategoryName = 'COND INDIA'
WHERE ProductId = 1
      AND CategoryId = 1;

--Conclusión desde una vista sólo se puede actualizar los datos
--de una sola tabla.