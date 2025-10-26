#!/usr/bin/env python3
# Date: 2025-10-26 13:43:38 -0700
"""
Create the alx_book_store database on a MySQL server.

- Uses CREATE DATABASE IF NOT EXISTS alx_book_store.
- Handles opening and closing the DB connection and cursor.
- Prints "Database 'alx_book_store' created successfully!" after executing the CREATE statement.
- Prints error messages when failing to connect or on other MySQL errors.
"""

import getpass
import sys

try:
    import mysql.connector
    from mysql.connector import errorcode
except ModuleNotFoundError:
    print("Required module 'mysql-connector-python' is not installed. Install with: pip install mysql-connector-python")
    sys.exit(1)


def main():
    host = input("Enter MySQL host [localhost]: ").strip() or "localhost"
    user = input("Enter MySQL user [root]: ").strip() or "root"
    password = getpass.getpass("Enter MySQL password (leave blank for none): ")

    conn = None
    cursor = None
    try:
        conn = mysql.connector.connect(host=host, user=user, password=password)
        cursor = conn.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied - check your username or password.")
        elif err.errno == errorcode.ER_BAD_HOST_ERROR:
            print("Error: Unable to connect to the MySQL host.")
        else:
            print(f"Error connecting to MySQL or creating database: {err}")
    except Exception as exc:
        print(f"An unexpected error occurred: {exc}")
    finally:
        if cursor is not None:
            try:
                cursor.close()
            except Exception:
                pass
        if conn is not None and getattr(conn, "is_connected", lambda: False)():
            try:
                conn.close()
            except Exception:
                pass


if __name__ == "__main__":
    main()
