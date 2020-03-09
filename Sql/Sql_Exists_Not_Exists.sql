--OPERADORES EXISTS Y NOT EXISTS
--Se utilizan para verificar si los datos de una tabla contienen datos en la otra
--Ejemplo
--Mostrar los productos que se han vendido (Es decir que haya registros en orders Details)
SELECT p.ProductId, 
       ProductName, 
       QuantityPerUnit
FROM Products p
WHERE EXISTS
(
    SELECT *
    FROM [Order Details] o
    WHERE p.ProductID = o.ProductID
);

--Mostrar las categorias que no tengan productos asociados

SELECT c.categoryId, 
       CategoryName
FROM Categories c
WHERE NOT EXISTS
(
    SELECT *
    FROM Products p
    WHERE c.categoryid = p.CategoryID
);

--Mostrar los proveedores que no tengan producto asociado (Suppliers)
SELECT supplierId, companyName, ContactName 
FROM Suppliers s
WHERE NOT EXISTS
(
    SELECT 1
    FROM Products p
    WHERE p.SupplierID = s.SupplierID
);

--Mostrar los empleados (Employees) que no tengan una orden (orders) asociada
Select FirstName + ' ' + LastName as NombreCompleto, EmployeeId
from Employees E
where not exists
(
Select 1 
from Orders O
where E.EmployeeID = o.EmployeeID
)