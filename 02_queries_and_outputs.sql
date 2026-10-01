-- ============================================================
-- E-COMMERCE SQL PROJECT
-- File: 02_queries_and_outputs.sql
-- Purpose: Practice queries + expected result summaries
-- ============================================================

USE ecommerce;

-- ============================================================
-- A. CUSTOMER QUERIES
-- ============================================================

-- 1. Display all customers
SELECT * FROM customer;
-- OUTPUT: 15 customer records (101 to 115).

-- 2. Display selected column
SELECT customer_name FROM customer;
-- OUTPUT: Amit, Ravi, Priya, Neha, Raj, Anu, Kiran, Riya, Ajay,
--         Pooja, Vijay, Rohan, Arun, Meena, Sita.

-- 3. Hyderabad customers
SELECT * FROM customer WHERE city = 'Hyderabad';
-- OUTPUT: Riya (108), Arun (113).

-- 4. Karnataka customers
SELECT * FROM customer WHERE state = 'Karnataka';
-- OUTPUT: Amit, Ravi, Raj, Anu, Rohan.

-- 5. Customers from selected cities
SELECT * FROM customer
WHERE city IN ('Hyderabad','Pune','Chennai');
-- OUTPUT: Riya, Priya, Arun, Vijay, Meena.

-- 6. AND condition
SELECT * FROM customer
WHERE city = 'Hyderabad' AND state = 'Telangana';
-- OUTPUT: Riya (108), Arun (113).

-- 7. BETWEEN customer IDs
SELECT * FROM customer
WHERE customer_id BETWEEN 102 AND 106;
-- OUTPUT: IDs 102, 103, 104, 105, 106.

-- 8. OR condition
SELECT * FROM customer
WHERE city='Hyderabad' OR city='Pune' OR city='Chennai';
-- OUTPUT: Priya, Riya, Arun, Vijay, Meena.

-- 9. LIKE starts with H
SELECT * FROM customer WHERE city LIKE 'H%';
-- OUTPUT: Hubballi, Hyderabad, Hyderabad.

-- 10. LIKE ends with i
SELECT * FROM customer WHERE city LIKE '%i';
-- OUTPUT: Belagavi, Delhi, Kochi.
-- Note: LIKE matching is case/collation dependent.

-- 11. Display city values starting with H
SELECT city FROM customer WHERE city LIKE 'H%';
-- OUTPUT: Hubballi, Hyderabad, Hyderabad.

-- 12. Pattern H%d
SELECT * FROM customer WHERE city LIKE 'H%d';
-- OUTPUT: No rows. This pattern means: starts H, then any number
--         of characters, and ends with d.

-- 13. Count customers
SELECT COUNT(*) AS total_customers FROM customer;
-- OUTPUT: 15.

-- 14. Unique states
SELECT DISTINCT state FROM customer;
-- OUTPUT: Karnataka, Maharashtra, Delhi, Telangana, Gujarat,
--         Kerala, Tamil Nadu.

-- ============================================================
-- B. PRODUCT QUERIES
-- ============================================================

-- 15. Display all products
SELECT * FROM product;
-- OUTPUT: 16 product records.

-- 16. Maximum price
SELECT MAX(price) AS maximum_price FROM product;
-- OUTPUT: 55000.00.

-- 17. Minimum price
SELECT MIN(price) AS minimum_price FROM product;
-- OUTPUT: 5.00.

-- 18. Average price
SELECT AVG(price) AS average_price FROM product;
-- OUTPUT: 10482.812500 (approximately).

-- 19. Average stock
SELECT AVG(stock) AS average_stock FROM product;
-- OUTPUT: 20.6250.

-- 20. Average price and stock
SELECT AVG(price) AS average_price, AVG(stock) AS average_stock
FROM product;
-- OUTPUT: Average price ≈ 10482.8125, average stock = 20.625.

-- 21. Prices descending
SELECT price FROM product ORDER BY price DESC;
-- OUTPUT: 55000, 25000, 18000, 15000, 12000, 7000, 4500,
--         3500, 1000, 400, 300, 150, 100, 10, 5, 5.

-- 22. Prices ascending
SELECT price FROM product ORDER BY price ASC;
-- OUTPUT: 5, 5, 10, 100, 150, 300, 400, 1000, 3500, 4500,
--         7000, 12000, 15000, 18000, 25000, 55000.

-- 23. Count products
SELECT COUNT(*) AS total_products FROM product;
-- OUTPUT: 16.

-- 24. Total price
SELECT SUM(price) AS total_price FROM product;
-- OUTPUT: 167725.00.

-- 25. Total stock
SELECT SUM(stock) AS total_stock FROM product;
-- OUTPUT: 330.

-- 26. Price > 10000
SELECT * FROM product WHERE price > 10000;
-- OUTPUT: Laptop, Mobile, Monitor, Tablet, Sofa.

-- 27. Price = 10000
SELECT * FROM product WHERE price = 10000;
-- OUTPUT: No rows.

-- 28. Price < 10000
SELECT * FROM product WHERE price < 10000;
-- OUTPUT: 11 products.

-- 29. Product names with price < 10000
SELECT product_name FROM product WHERE price < 10000;
-- OUTPUT: Pen, Pencil, Book, Eraser, Chair, Table, Shelf,
--         Bottle, Bucket, Mug, Lamp.

-- 30. Top 5 expensive products
SELECT * FROM product
ORDER BY price DESC LIMIT 5;
-- OUTPUT: Laptop, Mobile, Tablet, Sofa, Monitor.

-- 31. Bottom 5 cheapest products
SELECT * FROM product
ORDER BY price ASC LIMIT 5;
-- OUTPUT: Pencil, Eraser, Pen, Book, Mug.

-- 32. Unique categories
SELECT DISTINCT category FROM product;
-- OUTPUT: Electronics, Stationary, Furniture, Home.

-- 33. Products priced between 1000 and 10000
SELECT product_name, price
FROM product
WHERE price BETWEEN 1000 AND 10000;
-- OUTPUT: Chair 4500, Table 7000, Shelf 3500, Lamp 1000.

-- 34. Correct way to filter categories + price
SELECT *
FROM product
WHERE category IN ('Electronics','Stationary','Home')
AND price > 10000;
-- OUTPUT: Laptop, Mobile, Monitor, Tablet.
-- IMPORTANT: HAVING is not needed because this query is not grouped.

-- 35. Selected categories
SELECT *
FROM product
WHERE category IN ('Electronics','Stationary','Home');
-- OUTPUT: 13 products.

-- 36. Alias
SELECT stock AS total_stock
FROM product;
-- OUTPUT: One column named total_stock containing each product's stock.

-- 37. Count Stationary products
SELECT COUNT(*) AS total_products
FROM product
WHERE category = 'Stationary';
-- OUTPUT: 4.
-- IMPORTANT: Do NOT use GROUP BY category='Stationary' for this purpose.

-- ============================================================
-- C. ORDERS QUERIES
-- ============================================================

-- 38. Display all orders
SELECT * FROM orders;
-- OUTPUT: 15 orders.

-- 39. Delivered orders
SELECT * FROM orders
WHERE order_status = 'Delivered';
-- OUTPUT: 1001, 1005, 1008, 1011, 1014.

-- 40. Orders between dates
SELECT * FROM orders
WHERE order_date BETWEEN '2026-09-03' AND '2026-09-09';
-- OUTPUT: Orders 1003 through 1009.

-- 41. Cancelled orders
SELECT * FROM orders
WHERE order_status = 'Cancelled';
-- OUTPUT: 1004, 1009, 1015.

-- 42. Delivered orders (case as stored)
SELECT * FROM orders
WHERE order_status = 'Delivered';
-- OUTPUT: 1001, 1005, 1008, 1011, 1014.

-- 43. Customers with more than one order
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- OUTPUT: No rows because each customer currently has exactly one order.

-- ============================================================
-- D. ORDER_ITEMS QUERIES
-- ============================================================

-- 44. Display all order items
SELECT * FROM order_items;
-- OUTPUT: 10 order-item records.

-- 45. Selected columns
SELECT order_id, product_id FROM order_items;
-- OUTPUT: 10 order_id/product_id pairs.

-- 46. Quantity > 1
SELECT * FROM order_items
WHERE quantity > 1;
-- OUTPUT: Items 2, 4, 8, 9.

-- 47. Quantity < 3
SELECT * FROM order_items
WHERE quantity < 3;
-- OUTPUT: 9 records; only item 8 (quantity 3) is excluded.

-- 48. Items for order 1001
SELECT * FROM order_items
WHERE order_id = 1001;
-- OUTPUT: Item 1 (product 1, qty 1) and item 2 (product 5, qty 2).

-- 49. Quantity between 1 and 2
SELECT * FROM order_items
WHERE quantity BETWEEN 1 AND 2;
-- OUTPUT: All except item 8 (quantity 3).

-- 50. Product IDs 1, 3, 5
SELECT * FROM order_items
WHERE product_id IN (1, 3, 5);
-- OUTPUT: Items for products 1, 5, and 3.

-- 51. Quantity > 1 and product 5
SELECT * FROM order_items
WHERE quantity > 1 AND product_id = 5;
-- OUTPUT: Item 2, order 1001, product 5, quantity 2.

-- 52. Unique product IDs in orders
SELECT DISTINCT product_id
FROM order_items;
-- OUTPUT: 1, 5, 2, 3, 7, 9, 4, 8, 10, 11.

-- 53. Count order-item records
SELECT COUNT(*) AS total_items
FROM order_items;
-- OUTPUT: 10.

-- 54. Total quantity
SELECT SUM(quantity) AS total_quantity
FROM order_items;
-- OUTPUT: 15.

-- ============================================================
-- E. PAYMENT QUERIES
-- ============================================================

-- 55. Display payments
SELECT * FROM payment;
-- OUTPUT: 10 payment records.

-- 56. Success or Failure
SELECT * FROM payment
WHERE payment_status IN ('Success','Failure');
-- OUTPUT: 8 records.

-- 57. Cash on Delivery
SELECT * FROM payment
WHERE payment_method = 'Cash on Delivery';
-- OUTPUT: Payments 4 and 9.

-- 58. Payment amount between 5000 and 20000
SELECT * FROM payment
WHERE payment_amount BETWEEN 5000 AND 20000;
-- OUTPUT: 12000, 18000, 7000, 15000.

-- ============================================================
-- F. JOINS
-- ============================================================

-- 59. INNER JOIN: customer + orders
SELECT *
FROM customer
JOIN orders
ON customer.customer_id = orders.customer_id;
-- OUTPUT: 15 matching customer/order rows.

-- 60. Same JOIN using aliases
SELECT *
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id;
-- OUTPUT: Same 15 matching rows.

-- 61. Selected columns + Bengaluru filter
SELECT
    c.customer_id,
    o.order_id,
    o.order_date,
    o.order_status
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.city = 'Bengaluru';
-- OUTPUT: 101 | 1001 | 2026-09-01 | Delivered.

-- 62. Customer + Orders + Products
-- IMPORTANT: With the current database design, order_items is required
-- to connect orders and products. Therefore this is 4 tables / 3 JOINs.
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    p.product_name,
    p.category,
    p.price,
    oi.quantity
FROM customer c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN product p
ON oi.product_id = p.product_id;
-- OUTPUT: 10 matching order-item rows with customer/order/product details.

-- ============================================================
-- G. USEFUL BUSINESS REPORT QUERIES
-- ============================================================

-- 63. Customer purchase details
SELECT
    c.customer_name,
    p.product_name,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS total_amount
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id;
-- OUTPUT: Purchase-level sales rows for the 10 order-item records.

-- 64. Total amount spent by each customer
SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;
-- OUTPUT: Customer-wise total purchase amount.

-- 65. Total quantity purchased by each customer
SELECT
    c.customer_name,
    SUM(oi.quantity) AS total_quantity
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;
-- OUTPUT: Customer-wise total quantity.

-- 66. Total sales by product
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.quantity * p.price) AS total_sales
FROM product p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;
-- OUTPUT: Product-wise quantity and sales.

-- 67. Total sales by category
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS total_sales
FROM product p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category;
-- OUTPUT: Category-wise sales.

-- 68. Delivered order sales
SELECT
    SUM(oi.quantity * p.price) AS delivered_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';
-- OUTPUT: 73035.00.

-- ============================================================
-- END OF QUERY FILE
-- ============================================================
