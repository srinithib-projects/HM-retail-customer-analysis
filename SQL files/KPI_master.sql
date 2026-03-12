-- KPI 1: Total Revenue
SELECT SUM(price) AS total_revenue
FROM sales_analysis;


-- KPI 2: Average Order Value (AOV)
SELECT AVG(price) AS avg_order_value
FROM sales_analysis;


-- KPI 3: Revenue by Sales Channel
SELECT
sales_channel_id,
SUM(price) AS revenue
FROM sales_analysis
GROUP BY sales_channel_id
ORDER BY revenue DESC;


-- KPI 4: Customer Lifetime Value (CLV)
SELECT
AVG(customer_revenue) AS avg_customer_lifetime_value
FROM (
    SELECT
    customer_id,
    SUM(price) AS customer_revenue
    FROM sales_analysis
    GROUP BY customer_id
) sub;


-- KPI 5: Repeat Purchase Rate
SELECT
COUNT(*) FILTER (WHERE purchase_count > 1) * 100.0 / COUNT(*) AS repeat_purchase_rate
FROM (
    SELECT
    customer_id,
    COUNT(*) AS purchase_count
    FROM sales_analysis
    GROUP BY customer_id
) sub;


-- KPI 6: Average Purchases per Customer
SELECT
AVG(purchase_count) AS avg_purchases_per_customer
FROM (
    SELECT
    customer_id,
    COUNT(*) AS purchase_count
    FROM sales_analysis
    GROUP BY customer_id
) sub;


-- KPI 7: Most Valuable Age Segment
SELECT
CONCAT(FLOOR(CAST(age AS INT)/10)*10, '-', FLOOR(CAST(age AS INT)/10)*10 + 9) AS age_group,
SUM(price) AS revenue
FROM sales_analysis
WHERE age IS NOT NULL 
GROUP BY age_group
ORDER BY revenue DESC;


-- KPI 8: Revenue by Club Membership Status
SELECT
club_member_status,
SUM(price) AS revenue
FROM sales_analysis
GROUP BY club_member_status
ORDER BY revenue DESC;


-- KPI 9: Top Product Category by Revenue
SELECT
product_group_name,
SUM(price) AS revenue
FROM sales_analysis
GROUP BY product_group_name
ORDER BY revenue DESC
LIMIT 1;


-- KPI 10: Most Purchased Product Type
SELECT
product_type_name,
COUNT(*) AS purchases
FROM sales_analysis
GROUP BY product_type_name
ORDER BY purchases DESC
LIMIT 1;


-- KPI 11: Purchases by Newsletter Subscription
SELECT
fashion_news_frequency,
COUNT(*) AS purchases
FROM sales_analysis
GROUP BY fashion_news_frequency
ORDER BY purchases DESC;


-- KPI 12: Revenue from Customers Receiving Regular News
SELECT
SUM(price) AS revenue_regular_news
FROM sales_analysis
WHERE fashion_news_frequency = 'Regularly';