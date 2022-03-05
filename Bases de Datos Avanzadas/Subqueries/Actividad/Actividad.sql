
create table customersBackup as select * from customers;
select * from customersBackup;
insert into customers values (11, 'Lalito', 'Robles', '2001-09-05', '4499040225', 'SAN MIGUEL', 'Jesus Maria', 'AG', 10000);
select * from store.customers;
insert into customersBackup select * from customers where id not in (select customersBackup.id from customersBackup);
select * from store.customersBackup;

create table ordersBackup as select * from orders;
select * from store.ordersBackup;

create table orderItemsBackup as select * from order_items;
select * from store.orderItemsBackup;

create table invoices_archived as
SELECT `invoices`.`id`,
    `invoices`.`number`,
    `invoices`.`client_id`,
    invoicing.clients.name,
    `invoices`.`invoice_total`,
    `invoices`.`payment_total`,
    `invoices`.`invoice_date`,
    `invoices`.`due_date`,
    `invoices`.`payment_date`
FROM `invoicing`.`invoices`
join invoicing.clients on invoicing.invoices.client_id = invoicing.clients.id;

select * from invoices_archived;

insert into invoices values (20, '449-904-0225', 1, 55.55, 0.05, '2022-04-03', '2022-04-04', '2022-04-05');
insert into invoices_archived SELECT `invoices`.`id`,
    `invoices`.`number`,
    `invoices`.`client_id`,
    invoicing.clients.name,
    `invoices`.`invoice_total`,
    `invoices`.`payment_total`,
    `invoices`.`invoice_date`,
    `invoices`.`due_date`,
    `invoices`.`payment_date`
FROM `invoicing`.`invoices`
join invoicing.clients on invoicing.invoices.client_id = invoicing.clients.id where invoices.number not in (select invoices_archived.number from invoices_archived);
