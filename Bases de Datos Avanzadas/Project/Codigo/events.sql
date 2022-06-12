#Guarda en una tabla auxiliar los vuelos que ya pasaron.
delimiter $$
create event registrar_vuelos_pasados
on schedule every 1 day
starts now
ends '2023-01-01'
do
	select * from vuelo where llegada < now() and id not in (select idvuelo from successfulflights);
delimiter ;

#Borra de la tabla auxiliar cada año los vuelos muy viejos.
delimiter $$
create event borrar_vuelos_pasados
on schedule every 1 year
starts now
do
	delete from vuelo where year(llegada) < year(now()) - 1;
delimiter ;

delimiter $$
create event actualizar_edad
on schedule every 1 year
starts now()
do
	update pasajero set edad = edad + 1;
delimiter ;
        