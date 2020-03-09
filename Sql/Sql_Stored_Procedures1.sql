use Northwind
go
--Procedimiento almacenado sin parametros
CREATE PROCEDURE TotalEmpleado
AS
     SELECT COUNT(1)
     FROM Employees;

--como ejecutar el procedimiento almacenado
exec TotalEmpleado
go
--Procedimiento almacenado con parámetros
CREATE PROCEDURE ContarOrdenesEmpleado @Empleado INT
AS
     SELECT COUNT(1)
     FROM Orders
     WHERE EmployeeID = @Empleado;

exec ContarOrdenesEmpleado 8
go
--Procedimiento con parametro de salida
CREATE PROCEDURE ContarOrdenesEmpleadoParametroSalida
@Empleado INT,
@ContadorOrdenes int output
AS
     SELECT @ContadorOrdenes = COUNT(1)
     FROM Orders
     WHERE EmployeeID = @Empleado;
--Ejecutar el procedimiento almacenado con parametro salida
Declare @cont as int;
exec ContarOrdenesEmpleadoParametroSalida 8, @cont out;
select @cont
