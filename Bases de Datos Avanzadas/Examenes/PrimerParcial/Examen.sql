select max(creditLimit) as MaximoCredito from customers;
select firstName, lastName from employees where not email regexp '@classicmodelcars.com$';
select count(1) as NumberofCustomersWithNoCredit from customers where creditLimit = 0;
select * from customers where country in ('USA', 'CANADA');
SELECT 
	customers.contactFirstName, customers.contactLastName, `orders`.`orderNumber`, `orders`.`orderDate`,
    `orders`.`requiredDate`, `orders`.`shippedDate`, `orders`.`status`, `orders`.`comments`, `orders`.`customerNumber`,
    `orderdetails`.`orderNumber`, `orderdetails`.`productCode`, `orderdetails`.`quantityOrdered`, `orderdetails`.`priceEach`,
    `orderdetails`.`orderLineNumber`
FROM orders
join orderdetails on orders.orderNumber = orderdetails.orderNumber
join customers on customers.customerNumber = orders.customerNumber
where orders.status = 'Shipped';
SELECT 
	`orders`.`orderNumber`, `orders`.`orderDate`,
    `orders`.`requiredDate`, `orders`.`shippedDate`, `orders`.`status`, `orders`.`comments`, `orders`.`customerNumber`,
    `orderdetails`.`orderNumber`, products.productName, orderdetails.quantityOrdered*orderdetails.priceEach as Total , `orderdetails`.`quantityOrdered`, `orderdetails`.`priceEach`,
    `orderdetails`.`orderLineNumber`
FROM orders
join orderdetails on orders.orderNumber = orderdetails.orderNumber
join products on orderdetails.productCode = products.productCode;
select country, sum(creditLimit) from customers group by country;
select count(1) as NumberofCustomers, country from customers group by country;
select contactFirstName, contactLastName, 'Bronce' as Nivel from customers where creditLimit between 0 and 50000 
union
select contactFirstName, contactLastName, 'Plata' as Nivel from customers where creditLimit between 50001 and 100000
union
select contactFirstName, contactLastName, 'Oro' as Nivel from customers where creditLimit between 100001 and 150000
union
select contactFirstName, contactLastName, 'Diamante' as Nivel from customers where creditLimit > 150000;
SELECT 
	a.`employeeNumber`, a.`lastName`, a.`firstName`, a.`extension`, a.`email`, a.officeCode, a.`reportsTo`,
    b.firstName, b.lastName, a.`jobTitle`,
    o.addressLine1, 
    o.addressLine2,
    o.state
FROM classicmodels.`employees` a
left join employees b on a.reportsTo = b.employeeNumber
left join offices o on o.officeCode = a.officeCode;