CREATE TABLE staging.customers AS
SELECT * FROM raw.customers;

CREATE TABLE staging.products AS
SELECT * FROM raw.products;

CREATE TABLE staging.orders AS
SELECT * FROM raw.orders;

CREATE TABLE staging.order_items AS
SELECT * FROM raw.order_items;

CREATE TABLE staging.payments AS
SELECT * FROM raw.payments;

