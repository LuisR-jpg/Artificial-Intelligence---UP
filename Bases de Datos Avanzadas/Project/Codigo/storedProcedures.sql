drop procedure if exists vuelos_aerolinea;
delimiter $$
create procedure vuelos_aerolinea(
	airline varchar(255) 
)
begin
	declare vAirline varchar(255) default "";
    set vAirline = airline;
	if char_length(vAirline) <= 0 then
		signal sqlstate '22003'
			set message_text = 'Invalid Argument';
	end if;
	select * from vuelo where aerolinea = airline;
end$$
delimiter ;
call vuelos_aerolinea("");
call vuelos_aerolinea("American Airlines");

drop procedure if exists gasto_pasajero;
delimiter $$
create procedure gasto_pasajero(
	aCurp varchar(255) 
)
begin
	declare vCurp varchar(255) default "";
    set vCurp = aCurp;
	if char_length(vCurp) <= 0 then
		signal sqlstate '22003'
			set message_text = 'Invalid Argument';
	end if;
	select p.curp as CURP, concat(p.nombre, " ", p.apellido) as Nombre, sum(t.precio) from pasajero p
    join pasajerovuelo pv on pv.curp = p.curp
    join ticket t on t.idvuelo = pv.idVuelo
    group by p.curp 
    having p.curp = vCurp;
end$$
delimiter ;
call gasto_pasajero("");
call gasto_pasajero("ROJL010905HMCBMSA3");

drop procedure if exists vuelo;
delimiter $$
create procedure vuelo(
	idVuelo int
)
begin
	declare vID int default 1;
	if idVuelo > 0 then
		set vID = idVuelo;
	end if;
	select * from vuelo v where v.id = vID;
end$$
delimiter ;
call vuelo(-10);
call vuelo(300);