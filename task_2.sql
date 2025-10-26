-- SQL script to create all required tables for the alx_book_store database

DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE alx_book_store CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE alx_book_store;

CREATE TABLE authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL DEFAULT 0,
  publication_date DATE,
  PRIMARY KEY (book_id),
  INDEX idx_books_author_id (author_id),
  CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  PRIMARY KEY (order_id),
  INDEX idx_orders_customer_id (customer_id),
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE order_details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL DEFAULT 1,
  PRIMARY KEY (orderdetailid),
  INDEX idx_orderdetails_order_id (order_id),
  INDEX idx_orderdetails_book_id (book_id),
  CONSTRAINT fk_orderdetails_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_orderdetails_book FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
