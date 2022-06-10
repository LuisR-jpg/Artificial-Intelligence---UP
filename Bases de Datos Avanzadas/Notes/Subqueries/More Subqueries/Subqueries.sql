select * from customers;
select * from orders;
select * from products;

SELECT 
    c.first_name,
    c.last_name,
    i.`product_id`
FROM `store`.`order_items` i
join orders o on o.id = i.order_id
join customers c on c.id = o.customer_id
where i.product_id = 3;

select * from products where unit_price > (select unit_price from products where id = 2);

select * from employees where salary > (select avg(salary) from employees);

select * from products where id not in (select distinct product_id from order_items);

select * from clients where id not in (select distinct client_id from invoices);
