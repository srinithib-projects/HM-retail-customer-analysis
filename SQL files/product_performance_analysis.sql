-- 1. Which products are purchased the most?

SELECT
a.prod_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.prod_name
ORDER BY total_purchases DESC
LIMIT 10;


-- 2. Which product types are purchased the most?

SELECT
a.product_type_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_type_name
ORDER BY total_purchases DESC;


-- 3. Which product groups generate the most revenue?

SELECT
a.product_group_name,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_group_name
ORDER BY total_revenue DESC;


-- 4. Which garment groups have the highest sales volume?

SELECT
a.garment_group_name,
COUNT(*) AS total_sales
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.garment_group_name
ORDER BY total_sales DESC;


-- 5. Which departments sell the most products?

SELECT
a.department_name,
COUNT(*) AS total_sales
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.department_name
ORDER BY total_sales DESC;


-- 6. Which product types generate the highest revenue?

SELECT
a.product_type_name,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_type_name
ORDER BY total_revenue DESC;


-- 7. Which departments generate the highest revenue?

SELECT
a.department_name,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.department_name
ORDER BY total_revenue DESC;


-- 8. What is the average price of products sold in each product group?

SELECT
a.product_group_name,
AVG(t.price) AS avg_price
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_group_name
ORDER BY avg_price DESC;


-- 9. Which colours are most frequently purchased?

SELECT
a.colour_group_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.colour_group_name
ORDER BY total_purchases DESC
LIMIT 10;


-- 10. Which sections of the catalog generate the most purchases?

SELECT
a.section_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.section_name
ORDER BY total_purchases DESC;


-- 11. How do product sales vary over time (monthly sales per product group)?

SELECT
DATE_TRUNC('month', t.t_dat) AS month,
a.product_group_name,
COUNT(*) AS total_sales
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY month, a.product_group_name
ORDER BY month;


-- 12. Which product types are most popular in online vs store purchases?

SELECT
t.sales_channel_id,
a.product_type_name,
COUNT(*) AS total_purchases
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY t.sales_channel_id, a.product_type_name
ORDER BY total_purchases DESC;


-- 13. Which product groups have the widest sales distribution?

SELECT
a.product_group_name,
COUNT(DISTINCT a.product_type_name) AS product_type_count
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.product_group_name
ORDER BY product_type_count DESC;


-- 14. Which garment groups generate the most revenue?

SELECT
a.garment_group_name,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.garment_group_name
ORDER BY total_revenue DESC;


-- 15. What are the top 10 best-selling products in the catalog?

SELECT
a.prod_name,
COUNT(*) AS total_sales
FROM transactions t
JOIN articles_analysis a
ON t.article_id = a.article_id
GROUP BY a.prod_name
ORDER BY total_sales DESC
LIMIT 10;