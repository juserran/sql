create database Banco;

use banco;

create table clientes (
nif varchar(9) not null,
nombre varchar(45) not null,
mes int not null,
direccion varchar(90),
constraint pk_cliente primary key (nif));
go
create table inversiones(
inversionid int identity not null,
mesapetura int not null,
interesmensual money,
valorInversion money,
nif varchar(9) not null,
constraint pk_inversion primary key (inversionid),
constraint fk_inversion_cliente foreign key (nif) references clientes (nif))

go
create table cuentaAhorros(
ahorroId int identity not null,
saldo money not null,
interesmensual money not null,
nif varchar(9) not null,
constraint pk_ahorro primary key (ahorroId),
constraint fk_ahorro_cliente foreign key (nif) references clientes (nif))
go
create table cuenta(
cuentaId int identity not null,
saldo money not null,
nif varchar(9) not null,
constraint pk_cuenta primary key (cuentaId),
constraint fk_cuenta_cliente foreign key (nif) references clientes (nif))
go

insert into clientes
values
('12345678A', 'Raul Ramírez', 1, 'Calle Real 33'),
('12345678B', 'Ana Flores', 1, 'Calle San Marín 35')

insert into cuenta
values
(
0,
'12345678A'
),
(
1000,
'12345678A'
),
(
2000,
'12345678A'
),
(
0,
'12345678B'
)

insert into cuentaAhorros
values
(0,
0,
'12345678A'
),
(10000,
0.01,
'12345678B'
)

insert into inversiones
values
(
1,
0.01,
15000,
'12345678A'
),
(
1,
0.01,
10000,
'12345678B'
)
go