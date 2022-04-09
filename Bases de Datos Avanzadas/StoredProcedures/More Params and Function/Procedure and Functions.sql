-- Actividad 9
-- Ricardo Antonio Gutiérrez Esparza

use invoicing;

select * from `payments`; 
select * from payments;

-- 1. Store proceudre payments por client_id y payment_id 
delimiter $$
create procedure get_payments_by_client_and_method(
	payment_id int,
    client_id int
)
begin
	select * from  `payments`
    where `payments`.`payment_method` = payment_id 
    and `payments`.`client_id` = client_id;
end$$
delimiter ; 
call get_payments_by_client_and_method(1, 3);

-- 2. Actualice tabla de payments segun id, cantidad y fecha
delimiter $$
create procedure make_payment(
	`payment_id` int,
    `amount` decimal(15, 2),
    `date` date
)
begin
	if `amount` <= 0 then 
		signal sqlstate '22003'
			set message_text = 'Invalid payment amount'; 
	end if;
	update `payments`
    set 
		`payments`.`amount` = `amount`,
		`payments`.`date` = `date`
	where `payments`.`payment_id` = `payment_id`;
end$$
delimiter ; 
call make_payment(1, -100.00, '2022-04-01');
select * from payments;

-- 3. Retorne cuantas factures y la suma total
delimiter $$
create procedure get_unpayed_invoices_for_clients(
	`client_id` int
)
begin
	select 
		count(*) `amount`, 
        sum(`invoice_total`) `total`
    from `invoices` i 
    where i.`client_id` = `client_id`
    and `payment_total` = 0; 
end$$
delimiter ; 
call get_unpayed_invoices_for_clients(1);

-- 3.1 get_unpayed_invoices_for_clients con valores de retorno 
drop procedure get_unpayed_invoices_for_clients; 
delimiter $$
create procedure get_unpayed_invoices_for_clients(
	`client_id` int,
    out `invoices_count` int,
    out `invoices_total` decimal(15, 2)
)
begin
	select 
		count(*) `amount`, 
        sum(`invoice_total`) `total`
	into
		`invoices_count`, 
        `invoices_total`
    from `invoices` i 
    where i.`client_id` = `client_id`
    and `payment_total` = 0; 
end$$
delimiter ;

set @param1 = 0;
set @param2 = 0; 
call get_unpayed_invoices_for_clients(1, @param1, @param2);
select @param1, @param2;

select * from `invoices`;

-- 4. Risk factor
delimiter $$
create procedure get_risk_factor()
begin
	select 
		sum(`invoice_total`) / count(*) * 5
	from `invoices`;
end$$
delimiter ;
call get_risk_factor(); 

-- 4.1 Con variables locales 
delimiter $$
create procedure get_risk_factor_2()
begin
	declare risk_factor decimal(9, 2) default 0; 
	select 
		sum(`invoice_total`) / count(*) * 5
	into risk_factor
	from `invoices`;
    select risk_factor;
end$$
delimiter ;
call get_risk_factor_2(); 

-- 5. Funcion get_risk_factor
delimiter $$
create function `get_risk_factor` ()
returns decimal(9, 2)
reads sql data
begin
	declare `risk_factor` decimal(9, 2) default 0;
    declare `total_sum` decimal(9, 2) default 0; 
    declare `count` int default 0; 
    select sum(`invoice_total`), count(*)
    into `total_sum`, `count`
    from `invoices`; 
    set `risk_factor` = `total_sum` / `count` * 5; 
    return `risk_factor`; 
end$$
delimiter ;
select get_risk_factor();