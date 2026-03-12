-- View 1: Revenue by Month (Sales Trend)
CREATE OR REPLACE VIEW revenue_by_month AS
SELECT
DATE_TRUNC('month', transaction_date) AS month,
SUM(price) AS total_revenue,
COUNT(*) AS total_transactions
FROM sales_analysis
GROUP BY month
ORDER BY month;

select * from revenue_by_month Limit 10;

-- View 2: Sales by Age Group
CREATE OR REPLACE VIEW sales_by_age_group AS
SELECT
CONCAT(FLOOR(CAST(age AS INT)/10)*10, '-', FLOOR(CAST(age AS INT)/10)*10 + 9) AS age_group,
COUNT(*) AS purchases,
SUM(price) AS revenue
FROM sales_analysis
WHERE age IS NOT NULL
GROUP BY age_group
ORDER BY revenue DESC;

select * from sales_by_age_group Limit 10;

-- View 3: Revenue by Product Group
CREATE OR REPLACE VIEW revenue_by_product_group AS
SELECT
product_group_name,
SUM(price) AS total_revenue,
COUNT(*) AS total_sales
FROM sales_analysis
GROUP BY product_group_name
ORDER BY total_revenue DESC;

select * from revenue_by_product_group Limit 10;

-- View 4: Revenue by Club Membership
CREATE OR REPLACE VIEW revenue_by_membership_status AS
SELECT
club_member_status,
SUM(price) AS total_revenue,
COUNT(*) AS purchases
FROM sales_analysis
GROUP BY club_member_status
ORDER BY total_revenue DESC;

select * from revenue_by_membership_status Limit 10;

-- View 5: Top Selling Products
CREATE OR REPLACE VIEW top_products AS
SELECT
prod_name,
product_type_name,
COUNT(*) AS total_purchases,
SUM(price) AS total_revenue
FROM sales_analysis
GROUP BY prod_name, product_type_name
ORDER BY total_purchases DESC
LIMIT 20;

select * from top_products Limit 10;

-- View 6: Sales by Channel
CREATE OR REPLACE VIEW sales_by_channel AS
SELECT
sales_channel_id,
COUNT(*) AS purchases,
SUM(price) AS revenue
FROM sales_analysis
GROUP BY sales_channel_id
ORDER BY revenue DESC;

select * from sales_by_channel Limit 10;

-- View 7: Product Type Performance
CREATE OR REPLACE VIEW revenue_by_product_type AS
SELECT
product_type_name,
COUNT(*) AS purchases,
SUM(price) AS revenue
FROM sales_analysis
GROUP BY product_type_name
ORDER BY revenue DESC;

select * from revenue_by_product_type Limit 10;
