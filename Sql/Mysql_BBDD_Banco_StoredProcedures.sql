--consulta a la cuenta corriente por Id
create procedure [dbo].[consultaCuentaPorId]
@cuentaId int,
@saldo money out
as
select @saldo = saldo from
cuenta where cuentaId = @cuentaId
go
--ejecutarlo
declare @saldo money;
exec consultaCuentaAPorId 1, @saldo out
select @saldo
go
--Consulta del saldo de la Cuenta Corriente por NIF
Create procedure [dbo].[consultaCuentaPorNif]
@nif varchar(9),
@saldo money out
as
declare @nifCliente varchar(9);
select @nifCliente= nif from cuenta where nif=@nif;
if @nifCliente is null
return 1
select @saldo = sum(saldo) from
cuenta where nif=@nif
--Probar la consulta de la cuenta corriente por NIF
declare @saldo money;
exec consultaCuentaAPorNif '12345678B', @saldo out
select @saldo
go

--Consultar el saldo de Cuenta de Ahorro por Id
alter procedure [dbo].[consultaCuentaAPorId]
@cuentaAId int,
@saldo money out
as
select @saldo = saldo from
cuentaAhorros where ahorroId = @cuentaAId
--Ejecutar el procedimiento almacenado
declare @saldo money;
exec consultaCuentaAPorId 2, @saldo out
select @saldo
go
--Consultar el saldo de Cuenta de Ahorro por NIF
create procedure [dbo].[consultaCuentaAPorNif]
@nif varchar(9),
@saldo money out
as
declare @nifCliente varchar(9);
select @nifCliente= nif from cuenta where nif=@nif;
if @nifCliente is null
return 1
select @saldo = sum(saldo) from
cuentaAhorros where nif=@nif
go
--ejecutar el procedimiento almacenado
declare @saldo money;
declare @retorno int;
exec @retorno = consultaCuentaAPorNif '12345678B', @saldo out
select @saldo
select @retorno

select * from cuentaAhorros
go
--Procedimiento almacenado para saldo de Inversion (CDT)
create procedure [dbo].[consultaInversionesPorId]
@cuentaInversion int,
@saldo money out
as
select @saldo = valorInversion from
inversiones where inversionid = @cuentaInversion
go
--Ejecutar el procedimiento almacenado
declare @saldo money;
exec consultaInversionesPorId 2, @saldo out
select @saldo
go

--Consultar el saldo de Inversiones CDT por NIF
create procedure [dbo].[consultaInversionesPorNif]
@nif varchar(9),
@saldo money out
as
declare @nifCliente varchar(9);
select @nifCliente= nif from clientes where nif=@nif;
if @nifCliente is null
return 1
select @saldo = sum(valorInversion) from
inversiones where nif=@nif
go
--ejecutar el procedimiento almacenado
declare @saldo money;
declare @retorno int;
exec @retorno = consultaInversionesPorNif '12345678B', @saldo out
select @saldo
select @retorno


--procedimiento almacenado para consultar el saldo por nif
create procedure saldoNif
@nif varchar(9),
@saldoTotal money out
as
--Declaracion de variables
declare @saldoCC money;
declare @saldoCA money;
declare @inversiones money;
declare @nifExiste varchar(9);

--Verifica si existe la cuenta
select @nifExiste = nif from clientes
where nif = @nif;
if @nifExiste is null
return 1;

--Realiza estos comandos únicamente si el nif es válido
select @saldoCC = sum(saldo) from cuenta
where nif =@nif;


select @saldoCA = sum(saldo) from cuentaAhorros
where nif=@nif;


select @inversiones = sum(valorInversion) from inversiones
where nif=@nif;


set @saldoTotal = @saldoCC + @saldoCA + @inversiones

go
--Probar el procedimiento almacenado
declare @retorno int;
declare @total money;
exec @retorno = saldoNif '12345678A', @total out;
select @retorno as retorno;
select @total as SaldoTotal
go
--Procedimiento almacenado de alta de inversion
CREATE PROCEDURE altaInversion @nif            VARCHAR(9), 
                               @valorInversion MONEY, 
                               @interesmensual MONEY, 
                               @mes            INT
AS
     --Validar el nif
     DECLARE @nifBBDD VARCHAR(9);
     SELECT @nifBBDD = nif
     FROM clientes
     WHERE nif = @nif;
     IF @nifBBDD IS NULL
         RETURN 1;
     --Las siguientes instrucciones sólo lo va hacer cuando el NIF es válido
     INSERT INTO inversiones
     VALUES
     (@mes, 
      @interesmensual, 
      @valorInversion, 
      @nif
     );


--Probar el procedimiento almacenado de alta inversion
declare @retorno int;
exec @retorno = altaInversion '12345678C',25000,0.1,1
select @retorno
go
--Procedimiento almacenado para cerrar la inversión
CREATE PROCEDURE cerrarInversion @monto       MONEY, --Aquí nos llega el ValorInvertido + rendimientos
                                 @cuentaId    INT, 
                                 @inversionid INT
AS
     --validar la cuenta corriente
     DECLARE @cuentaidBBDD INT;
     SELECT @cuentaidBBDD = cuentaId
     FROM cuenta
     WHERE cuentaId = @cuentaId;
     IF @cuentaidBBDD IS NULL
         RETURN 1;
     --Actualizar la cuenta corriente
     UPDATE cuenta
       SET 
           saldo = saldo + @monto
     WHERE cuentaId = @cuentaId;

     --Eliminar la inversion
     DELETE FROM inversiones
     WHERE inversionid = @inversionid;

--se termina el procedimiento almacenado
--ejecutar el procedimiento almacenado 
declare @retorno int;
exec @retorno = cerrarInversion 25250,1,3
select @retorno

	 select * from inversiones
	 select * from cuenta



select * from inversiones