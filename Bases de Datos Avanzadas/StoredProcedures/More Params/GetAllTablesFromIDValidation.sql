delimiter $$
drop procedure if exists sql_hr.get_employees_by_id_null$$
create procedure sql_hr.get_employees_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_hr.employees s where s.employee_id = id;     
end$$
delimiter ;
call sql_hr.get_employees_by_id_null(1);

delimiter $$
drop procedure if exists sql_hr.get_offices_by_id_null$$
create procedure sql_hr.get_offices_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_hr.offices s where s.office_id = id;
end$$
delimiter ;
call sql_hr.get_offices_by_id_null(2);

delimiter $$
drop procedure if exists sql_inventory.get_products_by_id_null$$
create procedure sql_inventory.get_products_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_inventory.products s where s.product_id = id;
end$$
delimiter ;
call sql_inventory.get_products_by_id_null(2);

delimiter $$
drop procedure if exists sql_invoicing.get_clients_by_id_null$$
create procedure sql_invoicing.get_clients_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_invoicing.clients s where s.client_id = id;  
end$$
delimiter ;
call sql_invoicing.get_clients_by_id_null(2);

delimiter $$
drop procedure if exists sql_invoicing.get_invoices_by_id_null$$
create procedure sql_invoicing.get_invoices_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_invoicing.invoices s where s.invoice_id = id;
end$$
delimiter ;
call sql_invoicing.get_invoices_by_id_null(2);

delimiter $$
drop procedure if exists sql_invoicing.get_payment_methods_by_id_null$$
create procedure sql_invoicing.get_payment_methods_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_invoicing.payment_methods s where s.payment_method_id = id;
end$$
delimiter ;
call sql_invoicing.get_payment_methods_by_id_null(2);

delimiter $$
drop procedure if exists sql_invoicing.get_payments_by_id_null$$
create procedure sql_invoicing.get_payments_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_invoicing.payments s where s.payment_id = id;
end$$
delimiter ;
call sql_invoicing.get_payments_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_customers_by_id_null$$
create procedure sql_store.get_customers_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.customers s where s.id = id;
end$$
delimiter ;
call sql_store.get_customers_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_order_item_notes_by_id_null$$
create procedure sql_store.get_order_item_notes_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.order_item_notes s where s.note_id = id;
end$$
delimiter ;
call sql_store.get_order_item_notes_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_order_items_by_id_null$$
create procedure sql_store.get_order_items_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.order_items s where s.id_order = id;
end$$
delimiter ;
call sql_store.get_order_items_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_order_statuses_by_id_null$$
create procedure sql_store.get_order_statuses_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.order_statuses s where s.id = id;
end$$
delimiter ;
call sql_store.get_order_statuses_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_orders_by_id_null$$
create procedure sql_store.get_orders_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.orders s where s.order_id = id;
end$$
delimiter ;
call sql_store.get_orders_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_products_by_id_null$$
create procedure sql_store.get_products_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.products s where s.id = id;
end$$
delimiter ;
call sql_store.get_products_by_id_null(2);

delimiter $$
drop procedure if exists sql_store.get_shippers_by_id_null$$
create procedure sql_store.get_shippers_by_id_null(id int)
begin
	if isnull(id) then
		signal sqlstate '22003'
			set message_text = 'Invalid argument';
	end if;
    select * from sql_store.shippers s where s.id = id;
end$$
delimiter ;
call sql_store.get_shippers_by_id_null(2);