use transacciones;

CREATE TABLE prueba_t (campo INT NOT NULL PRIMARY KEY);

show table status like 'prueba_t';

INSERT INTO prueba_t VALUES(1);
INSERT INTO prueba_t VALUES(2);
INSERT INTO prueba_t VALUES(3);
SELECT * FROM prueba_t;

BEGIN;
INSERT INTO prueba_t VALUES(5);
SELECT * FROM prueba_t;
rollback;

SELECT * FROM prueba_t;

BEGIN;
INSERT INTO prueba_t VALUES(5);
SELECT * FROM prueba_t;
commit;

select * from prueba_t;

set autocommit=0;

select @@autocommit;

/*comprobar que automaticamente se inicia una transacción */

INSERT INTO prueba_t VALUES(10);
select * from prueba_t;
rollback;

INSERT INTO prueba_t VALUES(11);
INSERT INTO prueba_t VALUES(12);
select * from prueba_t;
rollback;

/*comprobacion 

/*Puntos de autoguardado para no deshacer todo sino hasta el punto de 
autoguardado definido*/

INSERT INTO prueba_t VALUES(6);
savepoint mi_punto_guardado;
INSERT INTO prueba_t VALUES(7);
rollback to savepoint mi_punto_guardado;
commit;

-- Ejemplo

Create table cuentas (
   idcuenta varchar(20) not null primary key,
   saldo double not null);
   
Create table transacciones_b (
   idtransaccion int auto_increment  primary key,
   tipo char(1),
   importe double);
   
   insert into cuentas values ('12345678901234567890',100);
   insert into cuentas values ('12345678901234567891',0);
   select * from cuentas;
-- retiro e ingreso de 50 Euros 

select * from cuentas;
select * from transacciones_b
