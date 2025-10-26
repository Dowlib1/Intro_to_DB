-- Date: 2025-10-26
-- Full description of the books table from the alx_book_store database
-- The database name is passed as an argument to the mysql command
SELECT
  COLUMN_NAME AS Field,
  COLUMN_TYPE AS Type,
  IS_NULLABLE AS `Null`,
  COLUMN_KEY AS `Key`,
  COLUMN_DEFAULT AS `Default`,
  EXTRA AS Extra
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'books'
ORDER BY ORDINAL_POSITION;
