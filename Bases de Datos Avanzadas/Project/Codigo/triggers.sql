drop trigger if exists audit_insert;
delimiter $$
create trigger audit_insert
after insert on pasajerovuelo
for each row
begin
	insert into audit VALUES ("Insert", now(), new.curp);
end $$
delimiter ;  
INSERT INTO `flights`.`pasajerovuelo` (`curp`, `idVuelo`) VALUES ("ROJK070927MHGBMRA6", 5);

drop trigger if exists audit_update;
delimiter $$
create trigger audit_update
after update on pasajerovuelo
for each row 
begin
	insert into audit values ("Update", now(), new.curp);
end $$
delimiter ;
update pasajerovuelo set idVuelo = 3 where (curp = 'ROJK070927MHGBMRA6' and idVuelo = '5');

drop trigger if exists audit_delete;
delimiter $$
create trigger audit_delete
after delete on pasajerovuelo
for each row
begin
	insert into audit values ("Delete", now(), old.curp);
end $$
delimiter ;
delete from pasajerovuelo where (curp = 'ROJK070927MHGBMRA6' and idVuelo = '3');

select * from audit;