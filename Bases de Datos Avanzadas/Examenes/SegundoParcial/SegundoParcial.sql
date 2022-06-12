select * from pokemon;
select * from estadisticas_base;
create view MMDISIMO_POKEMON as
	select
		`p`.`pok_id`,
		`p`.`pok_name`,
		`p`.`pok_alt`,
		`p`.`pok_peso`,
		`p`.`pok_base_exp`,
		`e`.`b_hp`,
		`e`.`b_atk`,
		`e`.`b_def`,
		`e`.`b_sp_atk`,
		`e`.`b_sp_def`,
		`e`.`b_speed`
    from pokemon p join estadisticas_base e on e.pok_id = p.pok_id
	where e.b_hp > 100 and e.b_def > 100 and e.b_atk > 100;
select * from mmdisimo_pokemon;
select * from pokemon_evolucion_relacion;
select * from pokemon_habitats;
create view urban_pokemon as
select
	`pokemon`.`pok_id`,
    `pokemon`.`pok_name`,
    `pokemon`.`pok_alt`,
    `pokemon`.`pok_peso`,
    `pokemon`.`pok_base_exp`,
	`pokemon_habitats`.`hab_id`,
    `pokemon_habitats`.`hab_name`,
    `pokemon_habitats`.`hab_descript`,
    `pokemon_evolucion_relacion`.`evolves_from_species_id`,
    `pokemon_evolucion_relacion`.`gender_rate`,
    `pokemon_evolucion_relacion`.`capture_rate`,
    `pokemon_evolucion_relacion`.`base_happiness`
	from pokemon_evolucion_relacion 
    join pokemon_habitats on pokemon_habitats.hab_id = pokemon_evolucion_relacion.hab_id
    join pokemon on pokemon.pok_id = pokemon_evolucion_relacion.pok_id
    where hab_name = "urban"
;
select * from urban_pokemon;
create view habilidades_pokemon as 
SELECT 
	`pokemon`.`pok_id`,
    `pokemon`.`pok_name`,
	`habilidades`.`habil_name`,
    `pokemon`.`pok_alt`,
    `pokemon`.`pok_peso`,
    `pokemon`.`pok_base_exp`,
    `pokemon_habilidades`.`habil_id`,
    `pokemon_habilidades`.`oculta`,
    `pokemon_habilidades`.`slot`
FROM `PokeUP`.`pokemon_habilidades`
join pokemon on pokemon.pok_id = pokemon_habilidades.pok_id
join habilidades on habilidades.habil_id = pokemon_habilidades.habil_id;
select * from habilidades_pokemon;
create view puntaje_pokemon as
SELECT 
	`pokemon`.`pok_id`,
    `pokemon`.`pok_name`,
	`estadisticas_base`.`b_hp` +
    `estadisticas_base`.`b_atk` +
    `estadisticas_base`.`b_def` +
    `estadisticas_base`.`b_sp_atk` +
    `estadisticas_base`.`b_sp_def` +
    `estadisticas_base`.`b_speed` as PuntajeTotal
FROM `PokeUP`.`estadisticas_base`
join pokemon on pokemon.pok_id = estadisticas_base.pok_id;
select * from puntaje_pokemon;
#ghost
create view topghost_pokemon as
select
    `puntaje_pokemon`.`pok_name`,
	`tipos`.`type_name`,
    `puntaje_pokemon`.`PuntajeTotal`,
    `pokemon_tipos`.`pok_id`,
    `pokemon_tipos`.`tipo_id`,
    `pokemon_tipos`.`slot`,
    `tipos`.`damage_tipo_id`
from puntaje_pokemon
join pokemon_tipos on pokemon_tipos.pok_id = puntaje_pokemon.pok_id
join tipos on tipos.tipo_id = pokemon_tipos.tipo_id
where tipos.tipo_id = 8
limit 10;
select * from topghost_pokemon;

delimiter $$
drop procedure if exists pokevolucion_pokemon$$
create procedure pokevolucion_pokemon(poke_id int)
begin 
	select (select pok_name from pokemon where pok_id = poke_id) as name, pok_name as evolves from pokemon where pok_id = (select pok_id from pokemon_evolucion_relacion where evolves_from_species_id = (select pok_id from pokemon where pokemon.pok_id = poke_id));
end$$
delimiter ;
call pokevolucion_pokemon(1);

delimiter $$
drop procedure if exists resite_ataque$$
create procedure resite_ataque (
	poke_name varchar(100),
    atack_name varchar(100)
)
begin
	if isnull((select movi_power from movimientos where movimientos.movi_name = atack_name)) then
		signal sqlstate '22003'
			set message_text = 'Ìnvalid attack';
    end if;
	if (select b_hp - (select movi_power from movimientos where movimientos.movi_name = atack_name)
		from estadisticas_base where pok_id = (select pok_id from pokemon where pok_name = poke_name)) > 0
    then (select b_hp - (select movi_power from movimientos where movimientos.movi_name = atack_name)
		as Sobrevive from estadisticas_base where pok_id = (select pok_id from pokemon where pok_name = poke_name));
	else (select b_hp - (select movi_power from movimientos where movimientos.movi_name = atack_name)
		as 'Se desmaya' from estadisticas_base where pok_id = (select pok_id from pokemon where pok_name = poke_name));
    end if;
end$$
delimiter ;
CALL resite_ataque("bulbasaur", "karate-chop");
CALL resite_ataque("bulbasaur", "constrict");
call resite_ataque("bulbasaur", "bide");

delimiter $$
drop procedure if exists tipo_de_movimiento$$
create procedure tipo_de_movimiento (
	mov_name varchar(100)
)
begin
	select type_name from tipos where tipo_id = (select tipo_id from movimientos where movimientos.movi_name = mov_name);
end$$
delimiter ;
call tipo_de_movimiento("pay-day");

delimiter $$
drop procedure if exists tipo_pokemon$$
create procedure tipo_pokemon(poke_name varchar(75))
begin
	select type_name from tipos where tipo_id in 
	(select tipo_id from pokemon_tipos where pok_id = (
		select pok_id from pokemon where pokemon.pok_name = poke_name
    ));
end$$
delimiter ;
call tipo_pokemon("bulbasaur");



