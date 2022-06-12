drop function if exists duracion_promedio;
delimiter $$
create function duracion_promedio()
returns float
reads sql data
begin
	declare promedio float default 0.0;
    select sum(duracion) / sum(1) into promedio from vuelo;
return promedio;
end $$
select duracion_promedio() as "Minutos promedio";

drop function if exists pasajeros_por_aerolinea;
delimiter $$
create function pasajeros_por_aerolinea(
	airline varchar(50)
)
returns int
reads sql data
begin
	declare pasajeros float default 0;
    select count(1) into pasajeros from vuelo v
	join pasajerovuelo pv on pv.idVuelo = v.id
	where aerolinea = airline;
return pasajeros;
end $$
select pasajeros_por_aerolinea("American Airlines") as "Pasajeros";

drop function if exists vuelo_mas_barato;
delimiter $$
create function vuelo_mas_barato()
returns float
reads sql data
begin
	declare price float default 0;
	select min(precio) into price from ticket;
    set price = 1.16 * price; #Taxes
	return price;
end $$
delimiter ;
select vuelo_mas_barato() as "Ofertas";