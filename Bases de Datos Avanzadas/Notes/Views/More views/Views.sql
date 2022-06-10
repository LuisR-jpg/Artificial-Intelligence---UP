#Like a window to our table
create or replace view invoices_with_balance as
SELECT `invoices`.`invoice_id`,
    `invoices`.`number`,
    `invoices`.`client_id`,
    `invoices`.`invoice_total`,
    `invoices`.`payment_total`,
    invoice_total - payment_total as balance,
    `invoices`.`invoice_date`,
    `invoices`.`due_date`,
    `invoices`.`payment_date`
FROM `sql_invoicing`.`invoices`
where invoice_total - payment_total > 0;

select * from invoices_with_balance;

#Updates 1 row of the view and the table itself
update invoices_with_balance 
set due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
where invoice_id = 1;

#Delete 1 row
delete from invoices_with_balance
where invoice_id = 1


#Check option 
create or replace view invoices_with_balance as
SELECT `invoices`.`invoice_id`,
    `invoices`.`number`,
    `invoices`.`client_id`,
    `invoices`.`invoice_total`,
    `invoices`.`payment_total`,
    invoice_total - payment_total as balance,
    `invoices`.`invoice_date`,
    `invoices`.`due_date`,
    `invoices`.`payment_date`
FROM `sql_invoicing`.`invoices`
where invoice_total - payment_total > 0
with check option;


#Count el numero de facturas por cliente
select count(1) as lol, client_id from invoices group by client_id;

