-- 1. How many total transactions occurred in the dataset?

SELECT COUNT(*) AS total_transactions
FROM transactions;


-- 2. How many unique customers made purchases?

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM transactions;


-- 3. How many unique products were purchased?

SELECT COUNT(DISTINCT article_id) AS unique_products_purchased
FROM transactions;


-- 4. What is the total revenue generated from all transactions?

SELECT SUM(price) AS total_revenue
FROM transactions;


-- 5. What is the average transaction price?

SELECT AVG(price) AS average_transaction_price
FROM transactions;


-- 6. How do transactions vary over time (monthly sales trend)?

SELECT
DATE_TRUNC('month', t_dat) AS month,
COUNT(*) AS total_transactions,
SUM(price) AS total_revenue
FROM transactions
GROUP BY month
ORDER BY month;


-- 7. Which sales channel has the most transactions?

SELECT
sales_channel_id,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY sales_channel_id
ORDER BY total_transactions DESC;


-- 8. Which products were purchased the most?

SELECT
a.prod_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.prod_name
ORDER BY total_purchases DESC
LIMIT 10;


-- 9. Which product groups generate the most revenue?

SELECT
a.product_group_name,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_group_name
ORDER BY total_revenue DESC;


-- 10. Which product types are most frequently purchased?

SELECT
a.product_type_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_type_name
ORDER BY total_purchases DESC
LIMIT 10;