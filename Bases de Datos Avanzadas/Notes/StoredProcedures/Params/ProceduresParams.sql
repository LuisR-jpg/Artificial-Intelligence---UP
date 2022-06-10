delimiter $$
create procedure get_clients_by_state(
	state char(2)
)
begin
	select * from clients c
    where c.state = state;
end$$
delimiter ;

call get_clients_by_state('NL');