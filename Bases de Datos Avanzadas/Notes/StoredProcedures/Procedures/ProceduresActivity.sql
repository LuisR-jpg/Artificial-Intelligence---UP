delimiter $$
create procedure get_invoices_with_balances()
begin 
	select * 
    from invoices_with_balance
    where balance > 0;
end$$
delimiter ;
delimiter $$
create procedure get_invoices()
begin
	select * 
    from invoices;
end$$
delimiter ;
delimiter $$
create procedure get_clients()
begin 
	select * from clients;
end$$
delimiter ;
delimiter $$
create procedure get_payment_methods()
begin
select *
from payment_methods;
end$$
delimiter ;
delimiter $$
create procedure get_payments()
begin
select *
from payments;
end$$
delimiter ;
call get_invoices_with_balances();
call get_invoices();
call get_clients();
call get_payment_methods();
call get_payments();

delimiter $$
create procedure get_employees()
begin
select *
from employees;
end$$
delimiter ;
delimiter $$
create procedure get_offices()
begin
select *
from offices;
end$$
delimiter ;
call get_employees();
call get_offices();

delimiter $$
create procedure get_products()
begin
select *
from products;
end$$
delimiter ;
call get_products();

delimiter $$
create procedure get_customers()
begin
select *
from customers;
end$$
delimiter ;
delimiter $$
create procedure get_order_item_notes()
begin
select *
from order_item_notes;        
end$$
delimiter ;
delimiter $$
create procedure get_order_items()
begin
select *
from order_items;
end$$
delimiter ;
delimiter $$
create procedure get_order_statuses()
begin
select *
from order_statuses;
end$$
delimiter ;
delimiter $$
create procedure get_orders() 
begin
select *
from orders;
end$$
delimiter ;
delimiter $$
create procedure get_products()
begin
select *
from products;
end$$
delimiter ;
delimiter $$
shippers
delimiter $$
create procedure get_shippers()
begin
select *
from shippers;
end$$
delimiter ;
call get_customers();
call get_order_item_notes();
call get_order_items();
call get_order_statuses();
call get_orders();
call get_products();
call get_shippers();