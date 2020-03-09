CREATE DEFINER=`root`@`localhost` PROCEDURE `ejemplotransacciones`
(porderid int, pproductid int, punitprice double, pquantity smallint, pdiscount double)
BEGIN

declare actualizacion int;
insert into orderdetails values
(
porderid,
pproductid,
punitprice,
pquantity,
pdiscount
);
SELECT FOUND_ROWS() into actualizacion;
select actualizacion;
if actualizacion > 0 then
	update products set 
    unitsInStock = unitsInStock - pquantity
    where productid = pproductid and unitsInStock >= pquantity;
    SELECT FOUND_ROWS() into actualizacion;
    if actualizacion > 0 then
       commit;
	else
       rollback;
	end if;
else 
rollback;
end if;

END

CREATE DEFINER=`root`@`localhost` PROCEDURE `retiro-ingreso`(pcuentaR varchar(20), pcuentaI varchar(20), pimporte double)
BEGIN
declare actualizacion int;
update cuentas set saldo = saldo - pimporte
where idcuenta=pcuentaR and saldo>=pimporte;
SELECT FOUND_ROWS() into actualizacion;
select actualizacion;
if actualizacion > 0 then
	insert into transacciones_b values (0, 'R', pimporte);
    SELECT FOUND_ROWS() into actualizacion;
    if actualizacion > 0 then
     
     update cuentas set saldo = saldo + pimporte
		where idcuenta=pcuentaI;
	 select FOUND_ROWS() into actualizacion;
     if actualizacion > 0 then
         
		 insert into transacciones_b values (0, 'I', pimporte);
		 SELECT FOUND_ROWS() into actualizacion;
         if actualizacion > 0 then
            commit;
         else
             rollback ;
         end if;
     else
         rollback ;
     end if;
    else
      rollback ;
    end if;

else 
rollback ;
end if;

END