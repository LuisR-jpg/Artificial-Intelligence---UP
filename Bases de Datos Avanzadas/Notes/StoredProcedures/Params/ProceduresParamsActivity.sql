delimiter $$
create procedure get_invoices_by_client(client_id int)
begin
	select * from invoices i
    where i.client_id = client_id;
end$$
delimiter ;
call get_invoices_by_client(1);

delimiter $$
create procedure get_clients_by_category(category char(10)) 
begin
	select * from (
		SELECT `customers`.`id`,
		`customers`.`first_name`,
		`customers`.`last_name`,
		`customers`.`birth_date`,
		`customers`.`points`,
		case
		when customers.points > 1999  then "GLD"
		when customers.points < 1000  then "BRZ"
		else "SLV"
		END as "Category"
		FROM `sql_store`.`customers`
    ) x where x.Category = category;
end$$
delimiter ;
call get_clients_by_category("GLD");