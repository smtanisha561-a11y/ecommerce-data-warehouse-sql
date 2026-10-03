# E-Commerce Data Warehouse & Analytics using SQL

## Project Objective

The objective of this project is to build an end-to-end E-Commerce Data Warehouse using PostgreSQL and SQL.

The project demonstrates how raw e-commerce data can be:

- Loaded into a Raw layer
- Transformed into a Staging layer
- Validated using SQL data quality checks
- Organized into a Warehouse using fact and dimension tables
- Analyzed using advanced SQL queries and business KPIs

## Technology Used

- PostgreSQL
- pgAdmin 4
- SQL

## Project Architecture

The project follows a simple layered data warehouse architecture:

Raw Data
   ↓
Staging Layer
   ↓
Data Quality & Validation
   ↓
Warehouse Layer
   ↓
SQL Analytics & Business KPIs

### Database Schemas

- `raw` — Stores source/raw e-commerce data
- `staging` — Stores cleaned and prepared data
- `warehouse` — Stores analytical fact and dimension tables

### Warehouse Tables

#### Dimension Tables

- `warehouse.dim_customer`
- `warehouse.dim_product`

#### Fact Table

- `warehouse.fact_sales`

## Data Quality Checks

The following SQL data quality checks were performed before loading data into the warehouse:

- Duplicate customer email check
- Customer NULL value check
- Product price and cost validation
- Order-to-customer reference validation
- Order-item-to-product reference validation
- Order-item-to-order reference validation
- Fact table duplicate check
- Fact sales calculation validation
- Order total vs fact sales validation

All validation checks passed successfully for the sample dataset.

## SQL Analytics

The project includes SQL queries for analyzing e-commerce sales data.

### Analytics Performed

- Customer total spending
- Category-wise sales
- Order status-wise sales
- Top-selling products
- Monthly sales
- Customer ranking using window functions
- Customer spending using CTEs
- Sales categorization using CASE WHEN
- Filtering aggregated results using HAVING
- NULL handling using COALESCE
- Repeat customer analysis
- Product profit analysis
- Average Order Value (AOV)
- Payment status analysis

### Key Business KPIs

- Total Orders
- Total Sales
- Average Order Value
- Total Quantity Sold
- Customer Total Spend
- Product Profit

## Project Results

The final warehouse and analytics validation produced the following results:

- Customers: 5
- Products: 5
- Sales fact records: 7
- Total Orders: 5
- Total Sales: ₹106,600
- Average Order Value: ₹21,320
- All major data quality checks passed
- Fact sales calculations were successfully validated
- No duplicate fact records were found

## Project Structure

```text
ecommerce-data-warehouse-sql/
│
├── README.md
│
├── sql/
│   ├── 01_create_schemas.sql
│   ├── 02_create_raw_tables.sql
│   ├── 03_insert_raw_data.sql
│   ├── 04_create_staging_tables.sql
│   ├── 05_data_quality_checks.sql
│   ├── 06_create_warehouse.sql
│   └── 07_analytics.sql
│
└── docs/
    └── data_model.md

## Skills Demonstrated

- PostgreSQL
- SQL
- Data Warehousing
- ETL / ELT Concepts
- Data Quality Validation
- Star Schema Design
- Fact and Dimension Tables
- SQL Joins
- Aggregations
- GROUP BY and HAVING
- Common Table Expressions (CTEs)
- Window Functions
- CASE WHEN
- COALESCE
- Business KPI Analysis