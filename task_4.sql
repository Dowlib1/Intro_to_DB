-- Print a full description of the table `books` without using DESCRIBE/EXPLAIN.
-- The database name will be passed as an argument to the mysql command:
-- Example: mysql -u user -p alx_book_store < task_4.sql

SELECT
  COLUMN_NAME AS 'Field',
  COLUMN_TYPE AS 'Type',
  IS_NULLABLE AS 'Null',
  COLUMN_KEY AS 'Key',
  COLUMN_DEFAULT AS 'Default',
  EXTRA AS 'Extra',
  COLUMN_COMMENT AS 'Comment'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'books'
ORDER BY ORDINAL_POSITION;
