--Ejemplo 1
--Crear el cursor
use Northwind

DECLARE cursorSimple CURSOR LOCAL
FOR SELECT [ProductName]
    FROM Products;

--Crea el conjunto de datos
OPEN cursorSimple;

--recupera la primera fila
FETCH cursorSimple;

--Cierra el conjunto de cursor
CLOSE cursorSimple;

--libera el cursor
DEALLOCATE cursorsimple;





--Ejemplo 2
--Crear el cursor y leer en variables
DECLARE cursorSimple CURSOR LOCAL
FOR SELECT [ProductID],[ProductName]
    FROM Products;
Declare @id int, @nombre nvarchar(40);

--Crea el conjunto de datos
OPEN cursorSimple;

--recupera la primera fila
FETCH cursorSimple into @id, @nombre;

print 'ProductoId ' + cast(@id as varchar);
print 'Nombre ' + @nombre;

--Cierra el conjunto de cursor
CLOSE cursorSimple;

--libera el cursor
DEALLOCATE cursorsimple;

--Ejemplo para posición absoluta
Declare cursorSimple Cursor
local
keyset
for SELECT [ProductID],[ProductName]
    FROM Products;
Declare @id int, @nombre nvarchar(40);
open cursorSimple
--Recupera la primera fila en las variables
fetch first from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es el primer numero de producto';
print @nombre + 'Es el primer nombre de producto';
--Recupera la quinta fila
fetch absolute 5 from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es el quinto numero de producto';
print @nombre + 'Es el quinto nombre de producto';
--Cierra el conjunto de cursor
CLOSE cursorSimple;
--libera el cursor
DEALLOCATE cursorsimple;

--Ejemplo para posición relativa
Declare cursorSimple Cursor
local
keyset
for SELECT [ProductID],[ProductName]
    FROM Products;
Declare @id int, @nombre nvarchar(40);
open cursorSimple
--Recupera la primera fila en las variables
fetch first from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es el primer numero de producto';
print @nombre + 'Es el primer nombre de producto';
--Recupera la segunda
fetch relative 1 from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es el 1 + 1 numero de producto';
print @nombre + 'Es el 1 + 1 nombre de producto';
--Cierra el conjunto de cursor
CLOSE cursorSimple;
--libera el cursor
DEALLOCATE cursorsimple;

--Posición siguiente

Declare cursorSimple Cursor
local
for SELECT [ProductID],[ProductName]
    FROM Products;
Declare @id int, @nombre nvarchar(40);
open cursorSimple
--Recupera la primera fila en las variables
fetch next from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es el primer numero de producto';
print @nombre + 'Es el primer nombre de producto';
--recupera la siguiente fila
fetch next from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es siguiente numero de producto';
print @nombre + 'Es el siguiente nombre de producto';
fetch next from CursorSimple into @id, @nombre;
print cast(@id as nvarchar) + 'Es el siguiente numero de producto';
print @nombre + 'Es el siguiente nombre de producto';
--Cierra el conjunto de cursor
CLOSE cursorSimple;
--libera el cursor
DEALLOCATE cursorsimple;

--Estructura bucle en transact sql
declare @i int = 1;
while @i <=5
begin
  print 'El valor de i es --> ' + cast(@i as varchar) ;
  set @i = @i + 1;
end

--Recorrer todo el cursor
DECLARE cursorSimple CURSOR LOCAL
FOR SELECT [ProductID],[ProductName]
    FROM Products;
Declare @id int, @nombre nvarchar(40);
--Crea el conjunto de datos
OPEN cursorSimple;
--recupera la primera fila
FETCH next from cursorSimple into @id, @nombre;
--Se realiza el bucle
while @@FETCH_STATUS = 0
begin
	print 'ProductoId ' + cast(@id as varchar);
	print 'Nombre ' + @nombre;
	FETCH next from cursorSimple into @id, @nombre;
end
--Cierra el conjunto de cursor
CLOSE cursorSimple;
--libera el cursor
DEALLOCATE cursorsimple;



--Ejercicio de Calculo de Valor de Inventario
--Declaración de cursor
DECLARE cursorValorInventario CURSOR LOCAL
FOR SELECT [ProductID], 
           [ProductName], 
           [UnitPrice] * 
           [UnitsInStock]
    FROM Products;
--Declaración de variables
DECLARE @id INT, @nombre NVARCHAR(40), @Valor money, @Total MONEY;
SET @total = 0;
--Crea el conjunto de datos
OPEN cursorValorInventario;
--recupera la primera fila
FETCH NEXT FROM cursorValorInventario INTO @id, @nombre, 
@Valor;
--Se realiza el bucle
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'ProductoId ' + CAST(@id AS VARCHAR) + 
		' Nombre ' + @nombre + ' Valor Inventario ' + 
		CAST(@Valor AS VARCHAR);
        SET @total = @total + @Valor;
        FETCH NEXT FROM cursorValorInventario INTO 
		@id, @nombre, @Valor;
    END;
PRINT '-------------------------------';
PRINT 'Total ' + CAST(@total AS NVARCHAR);
--Cierra el conjunto de cursor
CLOSE cursorValorInventario;
--libera el cursor
DEALLOCATE cursorValorInventario;


SELECT SUM([UnitPrice] * [UnitsInStock])
FROM [dbo].[Products];