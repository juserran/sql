CREATE DEFINER=`root`@`localhost` PROCEDURE `retiro-ingreso`(pcuentaR varchar(20), pcuentaI varchar(20), pimporte double)
BEGIN

declare actualizacion int;

savepoint retiro;
update cuentas set saldo = saldo - pimporte
where idcuenta=pcuentaR and saldo>=pimporte;
SELECT FOUND_ROWS() into actualizacion;

if actualizacion > 0 then
	savepoint retiro_transaccion;
	insert into transacciones_b values (0, 'R', pimporte);
    SELECT FOUND_ROWS() into actualizacion;
    if actualizacion > 0 then
     savepoint ingreso;
     update cuentas set saldo = saldo + pimporte
		where idcuenta=pcuentaI;
	 select FOUND_ROWS() into actualizacion;
     if actualizacion > 0 then
         savepoint ingreso_transaccion;
		 insert into transacciones_b values (0, 'I', pimporte);
		 SELECT FOUND_ROWS() into actualizacion;
         if actualizacion > 0 then
            commit;
         else
             rollback to savepoint ingreso_transaccion;
         end if;
     else
         rollback to savepoint ingreso_transaccion;
     end if;
    else
      rollback to savepoint ingreso;
    end if;

else 
rollback to savepoint retiro;
end if;

END