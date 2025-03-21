select * from customers where state in ('AG', 'JA', 'GT', 'QT', 'SL', 'MI', 'ZA');
select * from customers where state not in ('AG', 'JA', 'GT', 'QT', 'SL', 'MI', 'ZA') and state not in ('BC', 'BS', 'CO', 'CH', 'DU', 'NL', 'SI', 'SO', 'TA', 'ZA');
select * from customers where extract(year from birth_date) between 1980 and 2000;
select * from customers where extract(year from birth_date) between 1965 and 1979;
select * from customers where points between 501 and 1499;
select * from customers where last_name regexp '^[Ll]';
select * from customers where last_name regexp '[zZ]$';
select * from customers where last_name regexp 'r';
select * from customers where last_name regexp '^.....$';
select * from customers where first_name regexp '[mvb]a';
select * from customers where first_name regexp 'e[zs]$';