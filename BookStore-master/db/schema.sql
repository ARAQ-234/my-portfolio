CREATE DATABASE IF NOT EXISTS bookstore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bookstore;

CREATE TABLE IF NOT EXISTS `user` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100), email VARCHAR(150) UNIQUE, phoneNo VARCHAR(30),
  password VARCHAR(255), address VARCHAR(255), lankmark VARCHAR(255),
  city VARCHAR(100), state VARCHAR(100), pincode VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS book_dtls (
  bookId INT AUTO_INCREMENT PRIMARY KEY,
  bookname VARCHAR(255), author VARCHAR(255), price VARCHAR(30),
  bookCategory VARCHAR(30), status VARCHAR(30), photo VARCHAR(255), email VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS cart (
  cid INT AUTO_INCREMENT PRIMARY KEY,
  bid INT, uid INT, bookName VARCHAR(255), author VARCHAR(255),
  price DOUBLE, total_price DOUBLE
);

CREATE TABLE IF NOT EXISTS b_order (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id VARCHAR(50), user_name VARCHAR(100), email VARCHAR(150),
  address VARCHAR(500), phone VARCHAR(30), book_name VARCHAR(255),
  author VARCHAR(255), price VARCHAR(30), payment VARCHAR(50)
);
