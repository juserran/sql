/*
-Una VISTA es una tabla virtual derivada de otras
tablas (que pueden ser tablas base o también otras
vistas).
-Sus tuplas no se almacenan sino que se generan a
partir de las tablas de las que depende (no
necesariamente existen en forma física, por ello se las
considera tablas virtuales)
-Son útiles para usar, como si fueran tablas, consultas
que se efectúan frecuentemente, y también para
cuestiones de seguridad.
*/
CREATE VIEW Mejores (nombre, contadorOrdenes) as
SELECT E.FirstName ,
count(o.OrderID)
FROM Employees E
INNER JOIN Orders O
ON E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName 
having count(o.orderid) > 100;

--comprobación
select * from Mejores


--Obtener las ventas por Empleado (ventas = cantidad * precio unitario)

create view EmpleadosVentas (Nombre, Ventas) as
select FirstName + ' ' + LastName, sum(quantity * UnitPrice)
from Employees E
inner join Orders o
on e.employeeId = o.EmployeeID
inner join [Order Details] OD
on o.OrderID = od.OrderID
Group by FirstName + ' ' + LastName

--Comprobación
select * from EmpleadosVentas;


--Obtener el valor del inventario por categoria ( ValorInventario =
--UnitsinStock * precioUnitario )
CREATE VIEW ValorInventarioCategoria(CategoryId, 
                                     ValorInventario)
AS
     SELECT CategoryID, 
            SUM(unitsInStock * unitPrice)
     FROM Products
     GROUP BY CategoryID;

--Comprobación
select * from ValorInventarioCategoria

--Obtener las cantidades vendidas por proveedor.
CREATE VIEW ProveedorCantidad(Nombre, 
                              Cantidad)
AS
     SELECT CompanyName, 
            SUM(quantity)
     FROM Products P
          INNER JOIN Suppliers S ON p.SupplierID = s.SupplierID
          INNER JOIN [Order Details] OD ON p.ProductID = od.ProductID
     GROUP BY CompanyName;

--comprobación
select * from ProveedorCantidad

--Obtener las cantidades vendidas por clientes.
CREATE VIEW ClientesCantidades(Nombre, 
                               Cantidad)
AS
     SELECT CompanyName, 
            SUM(quantity)
     FROM Customers C
          INNER JOIN Orders o ON c.customerId = o.CustomerID
          INNER JOIN [Order Details] OD ON o.OrderID = od.OrderID
     GROUP BY CompanyName;

--comprobacion
select * from ClientesCantidades
