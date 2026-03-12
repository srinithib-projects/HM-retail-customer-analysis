-- 1. How many customers have made at least one purchase?

SELECT COUNT(DISTINCT customer_id) AS customers_with_purchases
FROM transactions;


-- 2. Which age group makes the most purchases?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS total_purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.age IS NOT NULL
GROUP BY age_group
ORDER BY total_purchases DESC;


-- 3. Which age group generates the highest revenue?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.age IS NOT NULL
GROUP BY age_group
ORDER BY total_revenue DESC;


-- 4. What is the average spending per customer?

SELECT
AVG(customer_spending) AS avg_spending_per_customer
FROM (
    SELECT
    customer_id,
    SUM(price) AS customer_spending
    FROM transactions
    GROUP BY customer_id
) sub;


-- 5. Which customers are the most frequent buyers?

SELECT
customer_id,
COUNT(*) AS total_purchases
FROM transactions
GROUP BY customer_id
ORDER BY total_purchases DESC
LIMIT 10;


-- 6. How do purchases vary across different age groups?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS total_transactions
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.age IS NOT NULL 
GROUP BY age_group
ORDER BY total_transactions DESC;


-- 7. Which age group spends the most per transaction?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
AVG(t.price) AS avg_transaction_value
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.age IS NOT NULL
GROUP BY age_group
ORDER BY avg_transaction_value DESC;


-- 8. Do active club members make more purchases than non-members?

SELECT
c.club_member_status,
COUNT(*) AS total_transactions
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.club_member_status
ORDER BY total_transactions DESC;


-- 9. Which club membership category generates the most revenue?

SELECT
c.club_member_status,
SUM(t.price) AS total_revenue
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.club_member_status
ORDER BY total_revenue DESC;


-- 10. Do customers who subscribe to regular fashion news purchase more frequently?

SELECT
c.fashion_news_frequency,
COUNT(*) AS total_purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.fashion_news_frequency
ORDER BY total_purchases DESC;


-- 11. Which age groups are most engaged with fashion newsletters and purchases?

SELECT
CONCAT(FLOOR(CAST(c.age AS INT)/10)*10, '-', FLOOR(CAST(c.age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS purchases
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.fashion_news_frequency = 'Regularly'
AND c.age IS NOT NULL
GROUP BY age_group
ORDER BY purchases DESC;


-- 12. What percentage of purchasing customers receive fashion news regularly?

SELECT
ROUND(
COUNT(DISTINCT CASE WHEN c.fashion_news_frequency = 'Regularly' THEN c.customer_id END) * 100.0
/ COUNT(DISTINCT c.customer_id),
2
) AS percentage_regular_news_customers
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id;


-- 13. How many customers have made multiple purchases?

SELECT
COUNT(*) AS customers_multiple_purchases
FROM (
    SELECT customer_id
    FROM transactions
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) sub;


-- 14. What is the average number of purchases per customer?

SELECT
AVG(purchase_count) AS avg_purchases_per_customer
FROM (
    SELECT
    customer_id,
    COUNT(*) AS purchase_count
    FROM transactions
    GROUP BY customer_id
) sub;


-- 15. Who are the top 10 highest spending customers?

SELECT
t.customer_id,
SUM(t.price) AS total_spent
FROM transactions t
GROUP BY t.customer_id
ORDER BY total_spent DESC
LIMIT 10;