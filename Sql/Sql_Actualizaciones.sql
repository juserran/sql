--CONSULTAS DE ACTUALIZACIÓN
--Son tres tipos de consulta de actualización
--1. Insertar
--2. Actualizar
--3. Borrar

--Insertar
INSERT INTO Categories
--La lista de los nombres de las columnas
--se puede evitar siempre y cuando se dé valor
--a todas las columnas
(CategoryName, 
 Description
)
VALUES
('Verduras eco', 
 'Verduras ecologicas de huertos especiales'
);

--comprobacion
select * from Categories
--Ejemplo 2
INSERT INTO Suppliers
(CompanyName, 
 ContactName, 
 ContactTitle, 
 Address
)
VALUES
('Granjas ecologicas', 
 'Rosa Ríos', 
 'Propietaria', 
 'Moralzarzal'
);
--comprobación
select * from Suppliers

--Ejemplo 3
INSERT INTO Products
(ProductName, 
 SupplierID, 
 CategoryID, 
 UnitPrice, 
 UnitsInStock
)
VALUES
('Zanahoria', 
 15, 
 5, 
 1.5, 
 20
);
--comprobación (producto 78)
select * from products

--Ejemplo 4
--Alta empleado
INSERT INTO Employees
(LastName, 
 FirstName, 
 Title, 
 BirthDate
)
VALUES
('Gomez', 
 'Tita', 
 'Gerente de Proyectos', 
 '1982-10-08'
);
--comprobación (empleado 10)
select * from Employees

--Ejemplo 5
--Dar de alta una orden 11085
INSERT INTO Orders
(CustomerID, 
 EmployeeID, 
 OrderDate, 
 ShipVia
)
VALUES
('ALFKI', 
 1, 
 '2020-01-01 00:00:00', 
 1
);

Select * from Orders

--Ejemplo 6
--Dar de alta en Order Details
--Como se dan los valores de todas las columnas
--se puede evitar poner la lista de columnas
INSERT INTO [Order Details]
VALUES
(11085, 
 78, 
 1.5, 
 20, 
 0.03
);

--Actualizar
update Categories
set CategoryName = 'Verdura Esp'
where CategoryID = 10;

--comprobar 
select * from Categories
where CategoryID = 10

--Ejemplo 2

update Suppliers
set CompanyName = 'Granjas Ecologicas Madrid'
where SupplierID = 30

select * from Suppliers
where SupplierID = 30

--Ejemplo 3

UPDATE Products
  SET 
      ProductName = 'Zanahoria morada'
WHERE ProductID = 78;

select * from Products
where ProductID=78

--Ejemplo 4

update Employees
set 
FirstName = 'Rosario'
where EmployeeID=10

select * from Employees
where EmployeeID=10;

--Ejemplo 5
UPDATE Orders
  SET 
      OrderDate = '2020-15-01 00:00:00'
WHERE OrderID = 11085;

select * from Orders 
where OrderID = 11085

--Ejemplo 6
update [Order Details]
set Quantity = 25
where OrderID = 11085 and ProductID=78

select * from [Order Details]
where OrderID = 11085 and ProductID=78

--Borrar
Delete [Order Details]
where OrderID = 11085 and ProductID=78

--Ejemplo 2
delete Orders
where OrderID = 11085

--Ejemplo 3
delete Employees
where EmployeeID=10;

select * from Employees
where EmployeeID=10;

--Ejemplo 4
delete Products
where ProductID = 78
--comprobación
select * from Products
where ProductID = 78

--Ejemplo 5
delete Suppliers
where SupplierID=30
--comprobacion
select * from Suppliers
where SupplierID=30

--Ejemplo 6
delete Categories
where CategoryID=10;
--comprobación
select * from Categories
where CategoryID=10;







