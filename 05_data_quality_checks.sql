-- 1. Duplicate customer email check
SELECT
    email,
    COUNT(*) AS count
FROM staging.customers
GROUP BY email
HAVING COUNT(*) > 1;


-- 2. Customer NULL check
SELECT *
FROM staging.customers
WHERE customer_id IS NULL
   OR customer_name IS NULL
   OR email IS NULL;


-- 3. Product price/cost validation
SELECT *
FROM staging.products
WHERE price <= 0
   OR cost <= 0;


-- 4. Order-to-customer reference check
SELECT
    o.order_id,
    o.customer_id
FROM staging.orders o
LEFT JOIN staging.customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- 5. Order-item-to-product reference check
SELECT
    oi.order_item_id,
    oi.product_id
FROM staging.order_items oi
LEFT JOIN staging.products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;


-- 6. Order-item-to-order reference check
SELECT
    oi.order_item_id,
    oi.order_id
FROM staging.order_items oi
LEFT JOIN staging.orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;


-- 7. Fact table duplicate check
SELECT
    order_item_id,
    COUNT(*) AS row_count
FROM warehouse.fact_sales
GROUP BY order_item_id
HAVING COUNT(*) > 1;