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


DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client(client_id int)
BEGIN
	select count(*) as facturas, sum(invoice_total) as total from invoices i
	where i.client_id = client_id and payment_total = 0;
END$$
DELIMITER ;
CALL `sql_invoicing`.get_unpaid_invoices_for_client(1);

drop procedure if exists get_unpaid_invoices_for_client;
DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_client(
	client_id int, 
    out invoices_count int, 
    out invoices_total decimal(9,2)
)
BEGIN
	select count(*) as facturas, sum(invoice_total) as total
	into invoices_count, invoices_total
	from invoices i
	where i.client_id = client_id and payment_total = 0;
END$$
DELIMITER ;
set @invoices_count = 0;
set @invoices_total = 0;
call sql_invoicing.get_unpaid_invoices_for_client(3, @invoices_count, @invoices_total);
select @invoices_count, @invoices_total;

DELIMITER $$
CREATE PROCEDURE `get_risk_factor`()
BEGIN
	declare risk_factor decimal(9,2) default 0;
	declare invoices_total decimal(9,2);
	declare invoices_count int;
	select count(*), sum(invoice_total)
	into invoices_count, invoices_total
	from invoices;
	set risk_factor = invoices_total / invoices_count * 5;
	select risk_factor;
END$$
DELIMITER ;
call sql_invoicing.get_risk_factor();

DELIMITER $$
CREATE FUNCTION `get_risk_factor_for_client`(client_id int)
returns decimal(9,2)
not deterministic
reads sql data
BEGIN
	declare risk_factor decimal(9,2) default 0;
	declare invoices_total decimal(9,2);
	declare invoices_count int;
	select count(*), sum(invoice_total)
	into invoices_count, invoices_total
	from invoices inv
	where inv.client_id = client_id;
	set risk_factor = invoices_total / invoices_count*5;
	return risk_factor;
END$$
DELIMITER ;
select get_risk_factor_for_client(2) risk_factor from invoices where client_id = 3;