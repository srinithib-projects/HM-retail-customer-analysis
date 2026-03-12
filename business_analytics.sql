-- 1. Which age group purchases the most products?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS total_purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.age IS NOT NULL
GROUP BY age_group
ORDER BY total_purchases DESC;


-- 2. Which age group generates the highest revenue?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.age IS NOT NULL
GROUP BY age_group
ORDER BY total_revenue DESC;


-- 3. Which product types are most popular among different age groups?

SELECT
a.product_type_name,
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.age IS NOT NULL
GROUP BY a.product_type_name, age_group
ORDER BY purchases DESC;


-- 4. Which garment groups are most frequently purchased by each age category?

SELECT
a.garment_group_name,
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.age IS NOT NULL
GROUP BY a.garment_group_name, age_group
ORDER BY purchases DESC;


-- 5. Which departments generate the most purchases among active club members?

SELECT
a.department_name,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.club_member_status = 'ACTIVE'
GROUP BY a.department_name
ORDER BY purchases DESC;


-- 6. Do customers who subscribe to fashion news regularly purchase more products?

SELECT
c.fashion_news_frequency,
COUNT(*) AS total_purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.fashion_news_frequency
ORDER BY total_purchases DESC;


-- 7. Which product types are most popular among customers receiving regular fashion news?

SELECT
a.product_type_name,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.fashion_news_frequency = 'Regularly'
GROUP BY a.product_type_name
ORDER BY purchases DESC;


-- 8. Which age group of customers receiving regular fashion news purchases the most?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.fashion_news_frequency = 'Regularly'
AND c.age IS NOT NULL 
GROUP BY age_group
ORDER BY purchases DESC;


-- 9. Which club membership category generates the most revenue across product groups?

SELECT
c.club_member_status,
a.product_group_name,
SUM(t.price) AS revenue
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
GROUP BY c.club_member_status, a.product_group_name
ORDER BY revenue DESC;


-- 10. Which product types are most purchased by active club members?

SELECT
a.product_type_name,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.club_member_status = 'ACTIVE'
GROUP BY a.product_type_name
ORDER BY purchases DESC;


-- 11. Which colours are most popular among different age groups?

SELECT
a.colour_group_name,
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.age IS NOT NULL
GROUP BY a.colour_group_name, age_group
ORDER BY purchases DESC;


-- 12. Which garment groups are most popular among different membership statuses?

SELECT
c.club_member_status,
a.garment_group_name,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
GROUP BY c.club_member_status, a.garment_group_name
ORDER BY purchases DESC;


-- 13. Which age group spends the most on each product group?

SELECT
a.product_group_name,
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
SUM(t.price) AS revenue
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
WHERE c.age IS NOT NULL
GROUP BY a.product_group_name, age_group
ORDER BY revenue DESC;


-- 14. Which customer segments purchase the widest variety of product types?

SELECT
c.customer_id,
COUNT(DISTINCT a.product_type_name) AS unique_product_types
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN articles_analysis a ON t.article_id = a.article_id
GROUP BY c.customer_id
ORDER BY unique_product_types DESC
LIMIT 10;


-- 15. Which customers (by age group and membership status) generate the highest revenue?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
c.club_member_status,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.age IS NOT NULL
GROUP BY age_group, c.club_member_status
ORDER BY total_revenue DESC;