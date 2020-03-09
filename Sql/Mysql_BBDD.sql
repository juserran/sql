create database AutobusesCodigo

use autobusesCodigo

create table autobuses
(
matricula char(7),
marca varchar(40),
tipoMotor varchar(40),
constraint pk_autobuses primary key (matricula)
);

create table conductores
(
dni char(9),
nombre varchar(45),
direccion varchar(90),
fnacimiento date,
constraint pk_conductores primary key (dni)
);

create table lugares(
lugarid int,
nombre varchar(45),
provincia varchar(45),
pais varchar(45),
constraint pk_lugares primary key (lugarid)
);

create table visitas(
visitaid int,
matricula char(7),
lugarid int,
dni char(9),
fvisita datetime,
km int,
constraint pk_visitas primary key (visitaid),
constraint fk_autobus_visitas foreign key (matricula) references autobuses (matricula),
constraint fk_lugares_visitas foreign key (lugarid) references lugares(lugarid),
constraint fk_conductores_visitas foreign key (dni) references conductores(dni)
)

--Creación de base de datos 
create database AbogadosCodigo;
use AbogadosCodigo

Create table clientes
(
dni char(9),
nombre varchar(45),
direccion varchar (90),
constraint pk_cliente primary key (dni)
);

Create table procuradores
(
dni char(9),
nombre varchar(45),
direccion varchar(90),
constraint pk_procurador primary key (dni)
);
create table asuntos
(
expedienteid int identity (2020000,1),
finicio date not null,
ffinal date not null,
estado char,
dniCliente char(9),
constraint pk_asunto primary key (expedienteid),
constraint fk_asuntos_cliente foreign key (dniCliente) references clientes (dni),
)

create table AsuntosProcuradores
(
expedienteid int,
dniProcurador char(9),
constraint pk_asuntosprocuradores primary key (expedienteid,dniprocurador),
constraint fk_asuntosprocuradores foreign key (dniProcurador) references procuradores (dni),
constraint fk_asuntos_asuntosprocuradores foreign key (expedienteid)
references asuntos (expedienteid)
)




