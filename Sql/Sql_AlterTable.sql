/*
POSIBLES MODIFICACIONES A UNA TABLA
1) A�ADIR UNA COLUMNA
2) MODIFICAR UNA COLUMNA
3) ELIMINAR UNA COLUMNA
*/

--A�adir una columna para saber el total de volumenes de la colecci�n (int)
ALTER TABLE colecciones
ADD totalVolumenes INT;

--Modificar la columna bigint
ALTER TABLE colecciones 
ALTER COLUMN totalVolumenes bigint;

--Eliminar una columna
ALTER TABLE colecciones 
drop COLUMN totalVolumenes;

--A�adir una columna a la tabla de almacenes que represente los m2 
--que tiene el almac�n (float)
ALTER TABLE almacenes
ADD metros FLOAT;
--A�adir una columna a la tabla de libros para poner el tipo 
--de portada (varchar(15)) 
ALTER TABLE libros
ADD tipoPortada VARCHAR(15);

--A�adir una columna en poblaciones para el numero de habitantes
--mayores a 18.
alter table poblaciones
add poblacionMayor18 bigint;

--Modificar en la tabla de pedidos la fenvio para que sea varchar(10)
alter table pedidos
alter column fenvio varchar(10);


