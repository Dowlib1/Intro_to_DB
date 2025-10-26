#!/usr/bin/env python3
"""
Simple script to create the alx_book_store database on a MySQL server.

- If the database already exists, the script will not fail and will inform you.
- Does NOT use SELECT or SHOW statements.
- Handles opening and closing the DB connection and cursor.
- Prints an error message when failing to connect.
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
        # Open connection (no database specified)
        conn = mysql.connector.connect(host=host, user=user, password=password)
        cursor = conn.cursor()
        try:
            # Try to create the database. Do NOT use SHOW or SELECT.
            cursor.execute("CREATE DATABASE alx_book_store")
            print("Database 'alx_book_store' created successfully!")
        except mysql.connector.Error as err:
            # If database already exists, MySQL returns ER_DB_CREATE_EXISTS (1007).
            if err.errno == errorcode.ER_DB_CREATE_EXISTS:
                print("Database 'alx_book_store' already exists.")
            else:
                # Any other error while creating DB
                print(f"Failed creating database: {err}")
    except mysql.connector.Error as err:
        # Handle connection errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied - check your username or password.")
        elif err.errno == errorcode.ER_BAD_HOST_ERROR:
            print("Error: Unable to connect to the MySQL host.")
        else:
            print(f"Error connecting to MySQL: {err}")
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
