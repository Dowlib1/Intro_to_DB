-- Insert a single customer row into the customers table of alx_book_store.
-- The database name must be passed as an argument to the mysql command:
-- Example: mysql -u user -p alx_book_store < task_5.sql

INSERT INTO customers (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.')
ON DUPLICATE KEY UPDATE customer_id = customer_id;
