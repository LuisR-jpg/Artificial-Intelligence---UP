select payment_method, round(sum(amount), 2) as 'sum(amount)' from payments group by payment_method with rollup;

select (select name from payment_methods p where p.payment_method_id = a.payment_method) as payment_method, round(sum(amount), 2) as 'sum(amount)' from payments a group by payment_method with rollup;

SELECT customer_id,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    concat(floor(datediff(now(), customers.birth_date)/365), " años") as edad
FROM `customers`;

SELECT `invoices`.`invoice_id`,
    `invoices`.`number`,
    `invoices`.`client_id`,
    `invoices`.`invoice_total`,
    `invoices`.`payment_total`,
    date_format(`invoices`.`invoice_date`, "%d %M %Y"),
    date_format(`invoices`.`due_date`, "%d %M %Y"),
    date_format(`invoices`.`payment_date`, "%d %M %Y"),
    concat(datediff(payment_date, invoice_date), ' days') as payment_done from invoices where payment_date is not null;

select concat(first_name, " ", last_name) as name, ifnull(phone, "Desconocido") as phone from customers;