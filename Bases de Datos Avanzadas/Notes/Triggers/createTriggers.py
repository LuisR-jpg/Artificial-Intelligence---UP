tables = [('sql_hr.employees', 'employee_id'), ('sql_hr.offices', 'office_id'), ('sql_inventory.products', 'product_id'), ('sql_invoicing.clients', 'client_id'), ('sql_invoicing.invoices', 'invoice_id'), ('sql_invoicing.payment_methods', 'payment_method_id'), ('sql_invoicing.payments', 'payment_id'), ('sql_store.customers', 'customer_id'), ('sql_store.order_item_notes', 'order_item_note_id'), ('sql_store.order_items', 'order_item_id'), ('sql_store.order_statuses', 'order_status_id'), ('sql_store.orders', 'order_id'), ('sql_store.products', 'product_id')]
for i in tables: 
    print('create table if not exists ', i[0], '_backup as select * from ', i[0], ';', sep = '')
    print('delimiter $$')    
    print('DROP TRIGGER IF EXISTS', i[0] ,'_after_insert$$')
    print('create trigger ', i[0], '_after_insert')
    print('\t', 'after insert on ', i[0])
    print('\t', 'for each row')
    print('\t', 'begin')
    print('\t\t', 'insert into ', i[0], '_backup (select * from ', i[0], ' where ', i[1], ' not in (select * from ', i[0],'_backup));')
    print('\t', 'end $$')
    print('delimiter ;')    
