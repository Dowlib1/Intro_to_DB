-- Insert multiple customers into the customers table of alx_book_store.
-- The database name must be passed as an argument to the mysql command:
-- Example: mysql -u user -p alx_book_store < task_6.sql

INSERT INTO customers (customer_id, customer_name, email, address) VALUES
  (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
  (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
  (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.')
ON DUPLICATE KEY UPDATE customer_id = customer_id;
