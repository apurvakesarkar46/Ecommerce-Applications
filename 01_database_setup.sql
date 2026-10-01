-- ============================================================
-- E-COMMERCE SQL PROJECT
-- File: 01_database_setup.sql
-- Database: ecommerce
-- Tool: MySQL Workbench
-- ============================================================

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- =========================
-- 1. CUSTOMER TABLE
-- =========================
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    email VARCHAR(255),
    phone_no VARCHAR(15)
);

INSERT INTO customer VALUES
(101, 'Amit', 'Bengaluru', 'Karnataka', 'amit@gmail.com', '+919876543210'),
(102, 'Ravi', 'Belagavi', 'Karnataka', 'ravi@gmail.com', '+919876543211'),
(103, 'Priya', 'Pune', 'Maharashtra', 'priya@gmail.com', '+919876543212'),
(104, 'Neha', 'Mumbai', 'Maharashtra', 'neha@gmail.com', '+919876543213'),
(105, 'Raj', 'Hubballi', 'Karnataka', 'raj@gmail.com', '+919876543214'),
(106, 'Anu', 'Mysuru', 'Karnataka', 'anu@gmail.com', '+919876543215'),
(107, 'Kiran', 'Delhi', 'Delhi', 'kiran@gmail.com', '+919876543216'),
(108, 'Riya', 'Hyderabad', 'Telangana', 'riya@gmail.com', '+919876543217'),
(109, 'Ajay', 'Ahmedabad', 'Gujarat', 'ajay@gmail.com', '+919876543218'),
(110, 'Pooja', 'Kochi', 'Kerala', 'pooja@gmail.com', '+919876543219'),
(111, 'Vijay', 'Chennai', 'Tamil Nadu', 'vijay@gmail.com', '+919876543220'),
(112, 'Rohan', 'Mangaluru', 'Karnataka', 'rohan@gmail.com', '+919876543221'),
(113, 'Arun', 'Hyderabad', 'Telangana', 'arun@gmail.com', '+919876543222'),
(114, 'Meena', 'Chennai', 'Tamil Nadu', 'meena@gmail.com', '+919876543223'),
(115, 'Sita', 'Nagpur', 'Maharashtra', 'sita@gmail.com', '+919876543224');

-- =========================
-- 2. PRODUCT TABLE
-- =========================
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(12,2),
    stock INT
);

INSERT INTO product VALUES
(1, 'Laptop', 'Electronics', 55000.00, 10),
(2, 'Mobile', 'Electronics', 25000.00, 15),
(3, 'Monitor', 'Electronics', 12000.00, 8),
(4, 'Tablet', 'Electronics', 18000.00, 12),
(5, 'Pen', 'Stationary', 10.00, 30),
(6, 'Pencil', 'Stationary', 5.00, 25),
(7, 'Book', 'Stationary', 100.00, 20),
(8, 'Eraser', 'Stationary', 5.00, 35),
(9, 'Chair', 'Furniture', 4500.00, 14),
(10, 'Table', 'Furniture', 7000.00, 9),
(11, 'Sofa', 'Furniture', 15000.00, 5),
(12, 'Shelf', 'Furniture', 3500.00, 12),
(13, 'Bottle', 'Home', 400.00, 40),
(14, 'Bucket', 'Home', 300.00, 25),
(15, 'Mug', 'Home', 150.00, 50),
(16, 'Lamp', 'Home', 1000.00, 20);

-- =========================
-- 3. ORDERS TABLE
-- =========================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO orders VALUES
(1001, 101, '2026-09-01', 'Delivered'),
(1002, 102, '2026-09-02', 'Shipped'),
(1003, 103, '2026-09-03', 'Processing'),
(1004, 104, '2026-09-04', 'Cancelled'),
(1005, 105, '2026-09-05', 'Delivered'),
(1006, 106, '2026-09-06', 'Processing'),
(1007, 107, '2026-09-07', 'Shipped'),
(1008, 108, '2026-09-08', 'Delivered'),
(1009, 109, '2026-09-09', 'Cancelled'),
(1010, 110, '2026-09-10', 'Processing'),
(1011, 111, '2026-09-11', 'Delivered'),
(1012, 112, '2026-09-12', 'Shipped'),
(1013, 113, '2026-09-13', 'Processing'),
(1014, 114, '2026-09-14', 'Delivered'),
(1015, 115, '2026-09-15', 'Cancelled');

-- =========================
-- 4. ORDER_ITEMS TABLE
-- =========================
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_items VALUES
(1, 1001, 1, 1),
(2, 1001, 5, 2),
(3, 1002, 2, 1),
(4, 1003, 3, 2),
(5, 1003, 7, 1),
(6, 1004, 9, 1),
(7, 1005, 4, 1),
(8, 1005, 8, 3),
(9, 1006, 10, 2),
(10, 1007, 11, 1);

-- =========================
-- 5. PAYMENT TABLE
-- =========================
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(100),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(200),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payment VALUES
(1, 1001, 'Credit Card', 55000.00, 'Success'),
(2, 1002, 'UPI', 25000.00, 'Success'),
(3, 1003, 'Debit Card', 12000.00, 'Failure'),
(4, 1004, 'Cash on Delivery', 4500.00, 'Success'),
(5, 1005, 'UPI', 18000.00, 'Success'),
(6, 1006, 'Credit Card', 7000.00, 'Refund'),
(7, 1007, 'Debit Card', 15000.00, 'Success'),
(8, 1008, 'UPI', 400.00, 'Failure'),
(9, 1009, 'Cash on Delivery', 3500.00, 'Success'),
(10, 1010, 'Credit Card', 1000.00, 'Refund');
