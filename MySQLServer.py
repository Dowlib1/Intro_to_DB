#!/usr/bin/env python3
# Date: 2025-10-26 13:43:38 -0700
"""
Create the alx_book_store database on a MySQL server.

- If the database already exists, the script will not fail.
- Uses CREATE DATABASE IF NOT EXISTS alx_book_store (no SELECT or SHOW).
- Handles opening and closing the DB connection and cursor.
- Prints "Database 'alx_book_store' created successfully!" when the CREATE statement runs.
- Prints error messages when failing to connect or on other MySQL errors.
"""

import getpass
import sys

try:
    import mysql.connector
    from mysql.connector import errorcode
except ModuleNotFoundError:
    print("Required module 'mysql-connector-python' is not installed. Install with:")
    print("    pip install mysql-connector-python")
    sys.exit(1)


def main():
    host = input("Enter MySQL host [localhost]: ").strip() or "localhost"
    user = input("Enter MySQL user [root]: ").strip() or "root"
    password = getpass.getpass("Enter MySQL password (leave blank for none): ")

    conn = None
    cursor = None
    try:
        # Establish connection to MySQL server (no database specified)
        conn = mysql.connector.connect(host=host, user=user, password=password)
        cursor = conn.cursor()

        # Create the database if it does not exist.
        # NOTE: This statement must appear exactly as required by the checks:
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        # If the statement executed without raising, report success.
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        # Handle connection and other MySQL errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied - check your username or password.")
        elif err.errno == errorcode.ER_BAD_HOST_ERROR:
            print("Error: Unable to connect to the MySQL host.")
        else:
            print(f"Error connecting to MySQL or creating database: {err}")
    except Exception as exc:
        # Generic exception handler
        print(f"An unexpected error occurred: {exc}")
    finally:
        # Ensure cursor and connection are closed
        if cursor is not None:
            try:
                cursor.close()
            except Exception:
                pass
        if conn is not None and conn.is_connected():
            try:
                conn.close()
            except Exception:
                pass


if __name__ == "__main__":
    main()
