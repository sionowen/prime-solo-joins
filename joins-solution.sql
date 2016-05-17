--Get all customers and their addresses.
SELECT first_name, last_name, street, city, state, zip FROM customers
	join addresses ON customers.id = addresses.id
--Get all orders and their line items.
SELECT * FROM orders
	join line_items ON orders.id = line_items.id
--Which warehouses have cheetos?
SELECT warehouse, description FROM warehouse_product
	JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
	JOIN products ON warehouse_product.product_id = products.id
	WHERE description = 'cheetos'
--Which warehouses have diet pepsi?
SELECT warehouse, description FROM warehouse_product
	JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
	JOIN products ON warehouse_product.product_id = products.id
	WHERE description = 'diet pepsi'
--Get the number of orders for each customer. NOTE: It is OK if those without orders are not --included in results.
SELECT * FROM addresses
SELECT customers.first_name, COUNT(first_name)
FROM customers
JOIN addresses
ON addresses.customer_id = customers.id
JOIN orders
ON orders.address_id = addresses.id
GROUP BY first_name
--How many customers do we have?
SELECT COUNT(*) FROM customers
--How many products do we carry?
SELECT COUNT(*) FROM products
--What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) AS Dietpepsionhand FROM warehouse_product
	JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
	JOIN products ON warehouse_product.product_id = products.id
	WHERE description = 'diet pepsi'
