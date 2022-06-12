set transaction isolation level repeatable read;
start transaction;
    set FOREIGN_KEY_CHECKS=0;
	update ticket set precio = precio + 10 where 1 = 1;
	set FOREIGN_KEY_CHECKS = 1; 
commit;

set transaction isolation level repeatable read;
start transaction;
    set FOREIGN_KEY_CHECKS=0;
	update vuelo set aerolinea = "American Airlines" where aerolinea = "AeroMexico";
	set FOREIGN_KEY_CHECKS = 1; 
commit;

set transaction isolation level repeatable read;
start transaction;
    set FOREIGN_KEY_CHECKS=0;
	update pasajero set direccion = "16643 NE 89th St, Redmond" where curp = "ROJL010905HMCBMSA3";
	set FOREIGN_KEY_CHECKS = 1; 
commit;
