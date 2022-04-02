#Stored procedure with NULL validation
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clients_by_state`(
	state char(2)
)
begin
	select * from clients c
    where c.state = ifnull(state, c.state);
end$$
DELIMITER ;
CALL `sql_invoicing`.`get_clients_by_state`(null);

DELIMITER $$
create procedure get_payments_by_client_and_method(payment_id int, client_id int)
begin
	select * from payments p
    where p.client_id = client_id and p.payment_method = payment_id;
end$$
DELIMITER ;
call get_payments_by_client_and_method(1, 1);

delimiter $$
drop procedure if exists sql_invoicing.make_payment;
create procedure sql_invoicing.make_payment(payment_id int, amount float, date date)
begin 
	if amount <= 0 then
		signal sqlstate '22003'
			set message_text = 'Invalid payment amount';
	end if;
	UPDATE `sql_invoicing`.`payments` p
	SET
	p.`date` = date,
	p.`amount` = amount
	WHERE p.`payment_id` = payment_id;
end$$
delimiter ;
call sql_invoicing.make_payment(1, -100, now());
select * from payments;