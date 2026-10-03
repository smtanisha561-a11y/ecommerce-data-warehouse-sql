INSERT INTO raw.customers
(customer_id, customer_name, email, phone, city, state, country, signup_date)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876543210', 'Chennai', 'Tamil Nadu', 'India', '2024-01-15'),
(2, 'Priya Sharma', 'priya@gmail.com', '9876543211', 'Bangalore', 'Karnataka', 'India', '2024-02-10'),
(3, 'Rahul Singh', 'rahul@gmail.com', '9876543212', 'Mumbai', 'Maharashtra', 'India', '2024-03-05'),
(4, 'Sneha Raj', 'sneha@gmail.com', '9876543213', 'Coimbatore', 'Tamil Nadu', 'India', '2024-03-20'),
(5, 'Vikram Patel', 'vikram@gmail.com', '9876543214', 'Ahmedabad', 'Gujarat', 'India', '2024-04-12');

INSERT INTO raw.products
(product_id, product_name, category, price, cost)
VALUES
(101, 'Laptop', 'Electronics', 55000.00, 42000.00),
(102, 'Smartphone', 'Electronics', 30000.00, 22000.00),
(103, 'Headphones', 'Electronics', 2500.00, 1500.00),
(104, 'Office Chair', 'Furniture', 8000.00, 5500.00),
(105, 'Backpack', 'Accessories', 1800.00, 1000.00);

INSERT INTO raw.orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(1001, 1, '2024-05-01', 'Delivered', 57500.00),
(1002, 2, '2024-05-03', 'Delivered', 30000.00),
(1003, 3, '2024-05-05', 'Shipped', 10500.00),
(1004, 1, '2024-05-08', 'Delivered', 1800.00),
(1005, 4, '2024-05-10', 'Pending', 8000.00);

INSERT INTO raw.order_items
(order_item_id, order_id, product_id, quantity, unit_price, discount)
VALUES
(1, 1001, 101, 1, 55000.00, 0.00),
(2, 1001, 103, 1, 2500.00, 0.00),
(3, 1002, 102, 1, 30000.00, 0.00),
(4, 1003, 104, 1, 8000.00, 500.00),
(5, 1003, 105, 1, 1800.00, 0.00),
(6, 1004, 105, 1, 1800.00, 0.00),
(7, 1005, 104, 1, 8000.00, 0.00);

INSERT INTO raw.payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(5001, 1001, '2024-05-01', 'Credit Card', 'Paid', 57500.00),
(5002, 1002, '2024-05-03', 'UPI', 'Paid', 30000.00),
(5003, 1003, '2024-05-05', 'Debit Card', 'Paid', 10500.00),
(5004, 1004, '2024-05-08', 'UPI', 'Paid', 1800.00),
(5005, 1005, '2024-05-10', 'Credit Card', 'Pending', 8000.00);


