# Ecommerce-Applications
A MySQL e-commerce database project demonstrating relational database design, SQL querying, data analysis, and business reporting.

## Project structure

Ecommerce-Applications/
│
├── README.md
├── 01_database_setup.sql
└── 02_queries_and_outputs.sql

## Project Overview

This project implements an e-commerce database using MySQL. It contains customer, product, order, order item, and payment data.

The project demonstrates how SQL can be used to store, retrieve, filter, analyze, and generate useful insights from e-commerce data.

                 ┌──────────────┐
                 │   CUSTOMER   │
                 └──────┬───────┘
                        │
                   customer_id
                        │
                        ▼
                 ┌──────────────┐
                 │    ORDERS    │
                 └──────┬───────┘
                        │
                    order_id
                        │
                        ▼
              ┌─────────────────┐
              │   ORDER_ITEMS   │
              └────────┬────────┘
                       │
                   product_id
                       │
                       ▼
                ┌─────────────┐
                │   PRODUCT   │
                └─────────────┘

                 ORDERS
                    │
                 order_id
                    │
                    ▼
                ┌──────────┐
                │ PAYMENT  │
                └──────────┘

## Database Tables

The database contains the following tables:

- Customer – stores customer information
- Product – stores product details, categories, prices, and stock
- Orders – stores customer orders and order status
- Order Items – stores products included in each order
- Payment – stores payment information and payment status

┌────────────────────┬──────────────────────────┐
│ SQL Area           │ Concepts in Your Project │
├────────────────────┼──────────────────────────┤
│ Filtering          │ WHERE, IN, BETWEEN, LIKE │
│ Aggregation        │ COUNT, SUM, AVG, MAX ,MIN│
│ Grouping           │ GROUP BY, HAVING         │
│ Sorting            │ ORDER BY, LIMIT          │ 
│ Relationships      │ Primary/Foreign Keys     │
│ Joins              │ INNER JOIN               │
│ Analysis           │ Business queries , etc.  |
└────────────────────┴──────────────────────────┘

## Learning Outcomes

- Understanding relational database design
- Working with primary and foreign keys
- Writing SQL queries for data analysis
- Using joins and aggregate functions
- Analyzing e-commerce data
- Generating business-oriented reports using SQL

