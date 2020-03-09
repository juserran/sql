Create database GestionPedidos

use GestionPedidos

create table colecciones(
coleccionid int identity,
volumen int,
constraint pk_coleccion primary key (coleccionid)
);

create table libros
(
isbn char(20),
titulo varchar(50),
autor varchar(50),
editorial varchar(45),
coleccionid int,
constraint pk_libros primary key (isbn),
constraint fk_libros_colecciones foreign key  (coleccionid) references colecciones (coleccionid)
);

create table poblaciones
(
poblacionesid int identity,
nombre varchar(45),
numhabitantes int,
provinciaid int,
constraint pk_poblaciones primary key (poblacionesid)
);

create table provincias
(
provinciaid int identity,
nombre varchar(45),
extension float,
almacenid int,
constraint pk_provincias primary key (provinciaid)
);

alter table poblaciones
add constraint fk_poblaciones_provincia foreign key (provinciaid)
references provincias (provinciaid);

create table almacenes(
almacenid int identity,
fapertura date,
direccion varchar(45),
provinciaid int,
constraint pk_almacenes primary key (almacenid),
);

alter table provincias
add constraint fk_provincias_almacen foreign key (almacenid)
references almacenes (almacenid);

create table stock
(
almacenid int,
isbn char(20),
cantidad int,
constraint pk_stock primary key (almacenid, isbn),
constraint fk_stok_almacen foreign key (almacenid)
references almacenes (almacenid),
constraint fk_stok_libro foreign key (isbn) references libros (isbn)
);

create table socios
(
socioid int,
socioaval int,
dni char(9),
nombre varchar(45),
aprellidos varchar(90),
telefono varchar(11),
poblacionid int,
constraint pk_socio primary key (socioid),
constraint fk_socio_poblacion foreign key (poblacionid)
references poblaciones(poblacionesid)
);

alter table socios
add constraint pk_socio_socio foreign key (socioaval) 
references socios (socioid)

create table pedidos
(
pedidoid int,
socioid int,
fenvio char,
fpago char,
constraint pk_pedido_socio primary key (socioid, pedidoid)
);

alter table pedidos
add constraint fk_peidos_socio foreign key (socioid )
references socios(socioid)

create table detallepedidos(
pedidoid int,
socioid int,
isbn char(20),
cantidad int,
constraint pk_pedido primary key (pedidoid, socioid, isbn),
constraint fk_detallepedidos_libros foreign key (isbn)
references libros (isbn)
);

alter table detallepedidos
add constraint fk_detalle_pedidos foreign key (socioid,pedidoid)
references pedidos (socioid,pedidoid)