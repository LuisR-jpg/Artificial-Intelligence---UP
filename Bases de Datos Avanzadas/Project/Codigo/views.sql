create or replace view Informacion_General as
	select concat(p.nombre, " ", p.apellido) as Pasajero, a1.Nombre as Desde, a2.Nombre as Hasta, v.duracion as "Duracion (minutos)", t.clase as Clase from pasajero p 
	join pasajerovuelo pv on pv.curp = p.curp
	join vuelo v on v.id = pv.idVuelo
	join ticket t on t.idvuelo = v.id
	join aeropuerto a1 on v.salidaAero = a1.IATA
	join aeropuerto a2 on v.llegadaAero = a2.IATA;
select * from Informacion_General;

create or replace view Kilometros_acumulados as
	select nombre, apellido, p.curp, sum(recorrido) as "Kilometros totales" from pasajero p 
	join pasajerovuelo pv on pv.curp = p.curp
	join vuelo v on v.id = pv.idVuelo
	group by p.curp;
select * from Kilometros_acumulados;

create or replace view Informacion_Vuelo as
select idVuelo as "ID de vuelo", aerolinea as Aerolinea, salida as Salida, llegada as Llegada, count(1) as "Numero de pasajeros" from pasajerovuelo pv
join vuelo v on v.id = pv.idVuelo
group by idVuelo;
select * from Informacion_Vuelo;