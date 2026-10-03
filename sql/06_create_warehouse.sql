-- Customer dimension
CREATE TABLE warehouse.dim_customer AS
SELECT
    customer_id,
    customer_name,
    email,
    phone,
    city,
    state,
    country,
    signup_date
FROM staging.customers;


-- Product dimension
CREATE TABLE warehouse.dim_product AS
SELECT
    product_id,
    product_name,
    category,
    price,
    cost
FROM staging.products;


-- Sales fact table
CREATE TABLE warehouse.fact_sales AS
SELECT
    oi.order_item_id,
    o.order_id,
    o.customer_id,
    oi.product_id,
    o.order_date,
    o.order_status,
    oi.quantity,
    oi.unit_price,
    oi.discount,
    (oi.quantity * oi.unit_price) - oi.discount AS sales_amount
FROM staging.order_items oi
JOIN staging.orders o
    ON oi.order_id = o.order_id;
