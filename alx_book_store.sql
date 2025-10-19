-- SQL DDL for alx_book_store #talink stateof art
-- NOTE: All SQL keywords are uppercase as requested.

DROP DATABASE IF EXISTS `alx_book_store`;
CREATE DATABASE `alx_book_store` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `alx_book_store`;

CREATE TABLE `Authors` (
  `author_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(215) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Books` (
  `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT UNSIGNED NOT NULL,
  `price` DOUBLE NOT NULL,
  `publication_date` DATE,
  PRIMARY KEY (`book_id`),
  CONSTRAINT `fk_books_author` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Customers` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215) NOT NULL,
  `address` TEXT,
  PRIMARY KEY (`customer_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `order_date` DATE NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Order_Details` (
  `orderdetailid` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` INT UNSIGNED NOT NULL,
  `book_id` INT UNSIGNED NOT NULL,
  `quantity` DOUBLE NOT NULL,
  PRIMARY KEY (`orderdetailid`),
  CONSTRAINT `fk_orderdetails_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderdetails_book` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;
