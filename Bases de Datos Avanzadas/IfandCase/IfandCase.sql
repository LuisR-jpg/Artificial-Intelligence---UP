select 
	order_items.id_order,
	products.name,
    count(*) as "order",
    if(count(name) > 1, "Varias veces", "una vez") as "Frequency"
from order_items
join products on order_items.product_id = products.id
group by name

SELECT `customers`.`id`,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    case
	when EXTRACT(YEAR from birth_date) >= 1980 and EXTRACT(YEAR from birth_date) <=2000 then"Milenial"
    else "GenX" 
	END as "Category"
FROM `sql_store`.`customers`

SELECT `customers`.`id`,
    `customers`.`first_name`,
    `customers`.`last_name`,
    `customers`.`birth_date`,
    `customers`.`points`,
    case
	when customers.points > 1999  then "oro"
    when customers.points < 1000  then "bronce"
    else "plata"
	END as "Category"
FROM `sql_store`.`customers`;

select 
	clients.client_id,
    clients.name,
    ROUND(sum(invoice_total),2) as total
from invoices
join clients on invoices.client_id = clients.client_id
group by invoices.client_id;

Create view Clients_balance as
select 
	clients.client_id,
    clients.name,
    ROUND(sum(invoice_total),2) as total
from invoices
join clients on invoices.client_id = clients.client_id
group by invoices.client_id;