# E-Commerce Data Warehouse Data Model

## Overview

This project uses a simple layered data warehouse architecture:

Raw → Staging → Warehouse → Analytics

## Warehouse Model

### Dimension: dim_customer

Stores customer information.

| Column | Description |
|---|---|
| customer_id | Unique customer identifier |
| customer_name | Customer name |
| email | Customer email |
| phone | Customer phone number |
| city | Customer city |
| state | Customer state |
| country | Customer country |
| signup_date | Customer registration date |

### Dimension: dim_product

Stores product information.

| Column | Description |
|---|---|
| product_id | Unique product identifier |
| product_name | Product name |
| category | Product category |
| price | Selling price |
| cost | Product cost |

### Fact: fact_sales

Stores sales transaction details.

| Column | Description |
|---|---|
| order_item_id | Unique order item identifier |
| order_id | Order identifier |
| customer_id | Customer identifier |
| product_id | Product identifier |
| order_date | Order date |
| order_status | Order status |
| quantity | Quantity purchased |
| unit_price | Unit price |
| discount | Discount amount |
| sales_amount | Final sales amount |

## Relationships

- `fact_sales.customer_id` → `dim_customer.customer_id`
- `fact_sales.product_id` → `dim_product.product_id`

## Sales Calculation

```text
sales_amount = (quantity × unit_price) - discount

## Data Flow

Raw Tables
    ↓
Staging Tables
    ↓
Data Quality Checks
    ↓
Warehouse
    ├── dim_customer
    ├── dim_product
    └── fact_sales
    ↓
SQL Analytics
