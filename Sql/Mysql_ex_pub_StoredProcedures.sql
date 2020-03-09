--1.	Obtener un procedimiento almacenado que calcule 
--      las ventas por tienda, tendrá un parámetro de 
--      entra que es la tienda y un parámetro de salida 
--      que son las ventas.
Create procedure VentasTienda
@storeid char(4),
@ventas money out
as
declare @ventascalculo money;
select @ventascalculo = sum([qty]*[price]) from
sales S inner join
titles T
on 
s.title_id = t.title_id
where s.stor_id = @storeid
set @ventas = @ventascalculo
go
--La forma de ejecutar el procedimiento almacenado
declare @ventas money;
execute [dbo].[VentasTienda] '6380', @ventas out
select @ventas



--2.Obtener un procedimiento almacenado 
--que calcule las ventas por título, 
--tiene un parámetro de entra que es el título 
--y un parámetro de salida que son las ventas.
go
alter procedure VentasTitulo
@titulo varchar(6),
@ventas money out
as
select @ventas = sum([qty]*[price]) from
titles T inner join
sales S
on 
T.title_id = S.title_id
where s.title_id = @titulo
--La forma de ejecutar el procedimiento almacenado
declare @ventas1 money;
execute [dbo].[VentasTitulo] 'BU1032', @ventas1 out
select @ventas1

--3.Obtener un procedimiento almacenado 
--que calcule las ventas por tienda en un periodo de tiempo, 
--tiene los parámetros de entrada que son la tienda, 
--fecha inicio del periodo, fecha fin de periodo 
--y un parámetro de salida que son las ventas.
go
Create procedure VentasTiendaFechas
@storeid char(4),
@finicio date,
@ffin date,
@ventas money out
as
select @ventas = sum([qty]*[price]) from
sales S inner join
titles T
on 
s.title_id = t.title_id
where s.stor_id = @storeid and
ord_date between	@finicio and @ffin

--probar el procedimiento almacenado
declare @ventas1 money;
execute [dbo].[VentasTiendaFechas] '6380','19940101', '19941231', @ventas1 out
select @ventas1



