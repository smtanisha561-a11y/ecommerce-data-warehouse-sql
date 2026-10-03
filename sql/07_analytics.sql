-- 1. Customer total spending
SELECT
    c.customer_id,
    c.customer_name,
    SUM(f.sales_amount) AS total_spend
FROM warehouse.fact_sales f
JOIN warehouse.dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spend DESC;


-- 2. Category-wise sales
SELECT
    p.category,
    SUM(f.sales_amount) AS total_sales
FROM warehouse.fact_sales f
JOIN warehouse.dim_product p
    ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;


-- 3. Order status-wise sales
SELECT
    order_status,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(sales_amount) AS total_sales
FROM warehouse.fact_sales
GROUP BY order_status
ORDER BY total_sales DESC;


-- 4. Top-selling products
SELECT
    p.product_name,
    SUM(f.quantity) AS total_quantity_sold,
    SUM(f.sales_amount) AS total_sales
FROM warehouse.fact_sales f
JOIN warehouse.dim_product p
    ON f.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC;


-- 5. Monthly sales
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales_amount) AS total_sales,
    ROUND(
        SUM(sales_amount) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM warehouse.fact_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


-- 6. Customer ranking using Window Function
SELECT
    c.customer_name,
    SUM(f.sales_amount) AS total_spend,
    RANK() OVER (
        ORDER BY SUM(f.sales_amount) DESC
    ) AS customer_rank
FROM warehouse.fact_sales f
JOIN warehouse.dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY customer_rank;


-- 7. Repeat customers
SELECT
    c.customer_name,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM warehouse.dim_customer c
JOIN warehouse.fact_sales f
    ON c.customer_id = f.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT f.order_id) > 1
ORDER BY total_orders DESC;


-- 8. Product profit analysis
SELECT
    p.product_name,
    SUM(f.quantity) AS quantity_sold,
    SUM(
        f.quantity * (p.price - p.cost)
    ) AS total_profit
FROM warehouse.fact_sales f
JOIN warehouse.dim_product p
    ON f.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_profit DESC;


-- 9. Average Order Value
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales_amount) AS total_sales,
    ROUND(
        SUM(sales_amount) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM warehouse.fact_sales;
