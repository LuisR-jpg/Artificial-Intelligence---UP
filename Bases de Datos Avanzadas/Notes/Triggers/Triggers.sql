DELIMITER $$
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
    BEGIN
		UPDATE invoices
        SET payment_total = payment_total + NEW.amount
        WHERE invoice_id = NEW.invoice_id;
	END$$
DELIMITER ;
insert into payments
(payment_id,
client_id, 
invoice_id,
date,
amount,
payment_method
)
VALUES
(default, 5, 5, NOW(), 10,1);
SHOW TRIGGERS;
DROP TRIGGER payments_after_insert;

DELIMITER $$
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
    BEGIN
		UPDATE invoices
        SET payment_total = payment_total - OLD.amount
        WHERE invoice_id = OLD.invoice_id;
	END$$
DELIMITER ;
DELETE FROM payments WHERE payment_id = 1;

create table if not exists sql_hr.employees_backup as select * from sql_hr.employees;
DELIMITER $$
DROP TRIGGER IF EXISTS sql_hr.employees_after_insert$$
CREATE TRIGGER sql_hr.employees_after_insert
	after insert on sql_hr.employees
    for each row 		
    begin
		insert into sql_hr.employees_backup (select * from sql_hr.employees where employee_id not in (select * from sql_hr.employees_backup));
    end $$
delimiter ;