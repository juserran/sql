--Procedimiento almacenado para Ingreso/Retiro
--De cuenta corriente
create PROCEDURE IRCuentaCorriente @tipoOperacion CHAR(1), 
                                   @id            INT, 
                                   @importe       MONEY
AS
     --preguntar que tipo de operación se quiere realizar
     IF @tipoOperacion <> 'I'
        AND @tipoOperacion <> 'R'
         RETURN 1;
     IF @tipoOperacion = 'I'
         UPDATE Cuenta
           SET 
               saldo = saldo + @importe
         WHERE Cuentaid = @id;
     IF @tipoOperacion = 'R'
         UPDATE Cuenta
           SET 
               saldo = saldo - @importe
         WHERE cuentaid = @id;
     return 0;
go
--probar procedimiento almacenado
select * from cuenta

declare @retorno int;
exec @retorno = IRCuentaCorriente 'R',4,500;
select @retorno
select * from cuenta where cuentaId=4
go
--Procedimiento almacenado para Ingreso/Retiro
--De cuenta Ahorro

CREATE PROCEDURE IRCuentaAhorro @tipoOperacion CHAR(1), 
                                @id            INT, 
                                @importe       MONEY
AS
     --preguntar que tipo de operación se quiere realizar
     IF @tipoOperacion <> 'I'
        AND @tipoOperacion <> 'R'
         RETURN 1;
     IF @tipoOperacion = 'I'
         UPDATE cuentaAhorros
           SET 
               saldo = saldo + @importe
         WHERE ahorroId = @id;
     IF @tipoOperacion = 'R'
         UPDATE cuentaAhorros
           SET 
               saldo = saldo - @importe
         WHERE ahorroId = @id;
     RETURN 0;
go
--probar procedimiento almacenado
select * from cuentaAhorros

declare @retorno int;
exec @retorno = IRCuentaAhorro 'R',1,500;
select @retorno
select * from cuentaAhorros where ahorroId=1
go


UPDATE cuentaAhorros
           SET 
               saldo = saldo + 500
         WHERE ahorroId = 9;
select @@ROWCOUNT
go
--Procedimiento almacenado para consultar Inversion
CREATE PROCEDURE consultaInversion @id INT
AS
     DECLARE @inversionid INT;
     SELECT @inversionid = inversionid
     FROM inversiones
     WHERE inversionid = @id;
     IF @inversionid IS NULL
         RETURN 1;
     SELECT valorInversion, 
            interesmensual, 
            mesapetura, 
            nif
     FROM inversiones
     WHERE inversionid = @id;

--Ejecutar el procedimiento almacenado 

declare @retorno int;
exec @retorno = consultaInversion 2;
select @retorno as valorRetorno
go

--procedimiento almacenado par dar de alta cuenta Corriente
create procedure altaCuentaCorriente
@nif varchar(9),
@saldo money
as
insert into cuenta
values
(@saldo, @nif)
if @@ERROR = 547
return 1
go

--probar procedimiento almacenado
DECLARE @retorno INT;
EXEC @retorno = dbo.altaCuentaCorriente 
     '12345678C',
500;
SELECT @retorno AS valorRetorno;
go
--procedimiento alta CuentaAhorros
create procedure altaCuentaAhorro
@saldo money,
@interesmensual money,
@nif varchar(9)
as
declare @nifBBDD varchar(9);
select @nifBBDD=nif from clientes 
where nif = @nif;
if @nifBBDD is null
return 1;
insert into cuentaAhorros
values
(
@saldo,
@interesmensual,
@nif
)
go
--probar procedimiento almacenado
DECLARE @retorno INT;
EXEC @retorno = dbo.altaCuentaAhorro 500, 0.01,
     '12345678A'
SELECT @retorno AS valorRetorno;


Create procedure altaciente
@nif varchar(9),
@nombre varchar(45),
@mes int,
@direccion



