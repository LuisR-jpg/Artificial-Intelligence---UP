Create view employees_above_salary as
	select * from employees 
		where salary > (
			select avg(salary) from employees
		);

create view clients_with_no_activity as 
	select * from clients
		where client_id not in (
			select client_id from invoices group by client_id
		);
        
create view payments_summary as
	select *, (
		select sum(amount) from payments
			where payment_method = payment_method_id
		) as Qty
	from payment_methods;

