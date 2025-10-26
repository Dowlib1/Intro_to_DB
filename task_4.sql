-- Date: 2025-10-26 14:56:52 -0700
-- Full description of the 'books' table using INFORMATION_SCHEMA.
-- The database name will be passed as an argument to the mysql command.
USE alx_book_store;

SELECT
  COLUMN_NAME AS Field,
  COLUMN_TYPE AS Type,
  IS_NULLABLE AS `Null`,
  COLUMN_KEY AS `Key`,
  COLUMN_DEFAULT AS `Default`,
  EXTRA AS Extra,
  COLUMN_COMMENT AS Comment
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'books'
ORDER BY ORDINAL_POSITION;
