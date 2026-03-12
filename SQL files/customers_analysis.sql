-- 1. Distinct values of categorical columns

SELECT DISTINCT club_member_status
FROM customers
ORDER BY club_member_status;

SELECT DISTINCT fashion_news_frequency
FROM customers
ORDER BY fashion_news_frequency;


-- 2. Number of customers in each age category

SELECT
    CONCAT(FLOOR(CAST(age AS INT)/10)*10, '-', FLOOR(CAST(age AS INT)/10)*10 + 9) AS age_group,
    COUNT(*) AS number_of_customers
FROM customers
WHERE age IS NOT NULL
GROUP BY age_group
ORDER BY age_group;


-- 3. Number of customers by club membership status

SELECT
club_member_status,
COUNT(*) AS number_of_customers
FROM customers
GROUP BY club_member_status
ORDER BY number_of_customers DESC;


-- 4. Which age category of customers is the most active

SELECT
    CONCAT(FLOOR(CAST(age AS INT)/10)*10, '-', FLOOR(CAST(age AS INT)/10)*10 + 9) AS age_group,
    COUNT(*) AS active_customers
FROM customers
WHERE club_member_status = 'ACTIVE'
AND age IS NOT NULL
GROUP BY age_group
ORDER BY active_customers DESC;

-- 5. Number of customers who selected regularly news frequency

SELECT
    fashion_news_frequency,
    COUNT(*) AS number_of_customers
FROM customers
WHERE fashion_news_frequency IN ('Regularly', 'Monthly')
GROUP BY fashion_news_frequency
ORDER BY number_of_customers DESC;

-- 6. Which age category chose regularly news frequency

SELECT
    CONCAT(FLOOR(CAST(age AS INT)/10)*10, '-', FLOOR(CAST(age AS INT)/10)*10 + 9) AS age_group,
    COUNT(*) AS customers_regular_news
FROM customers
WHERE fashion_news_frequency = 'Regularly'
AND age IS NOT NULL
GROUP BY age_group
ORDER BY customers_regular_news DESC;


-- 7. Percentage of customers receiving regular news

SELECT
ROUND(
COUNT(*) FILTER (WHERE fashion_news_frequency = 'Regularly') * 100.0 / COUNT(*),
2
) AS percentage_regular_news
FROM customers;