SELECT COUNT(DISTINCT customer_id)
FROM customers;

SELECT COUNT(DISTINCT article_id)
FROM articles;

SELECT COUNT(*)
FROM transactions;

SELECT COUNT(*)
FROM customers
WHERE age IS NULL;


SELECT
COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
COUNT(*) FILTER (WHERE club_member_status IS NULL OR club_member_status = '') AS missing_club_status,
COUNT(*) FILTER (WHERE fashion_news_frequency IS NULL OR fashion_news_frequency = '') AS missing_news_frequency
FROM customers;


SELECT
COUNT(*) FILTER (WHERE prod_name IS NULL OR prod_name = '') AS missing_prod_name,
COUNT(*) FILTER (WHERE product_type_name IS NULL OR product_type_name = '') AS missing_product_type,
COUNT(*) FILTER (WHERE product_group_name IS NULL OR product_group_name = '') AS missing_product_group,
COUNT(*) FILTER (WHERE colour_group_name IS NULL OR colour_group_name = '') AS missing_colour_group,
COUNT(*) FILTER (WHERE department_name IS NULL OR department_name = '') AS missing_department,
COUNT(*) FILTER (WHERE index_name IS NULL OR index_name = '') AS missing_index,
COUNT(*) FILTER (WHERE section_name IS NULL OR section_name = '') AS missing_section,
COUNT(*) FILTER (WHERE garment_group_name IS NULL OR garment_group_name = '') AS missing_garment_group,
COUNT(*) FILTER (WHERE detail_desc IS NULL OR detail_desc = '') AS missing_detail_desc
FROM articles_analysis;


SELECT
COUNT(*) FILTER (WHERE t_dat IS NULL) AS missing_date,
COUNT(*) FILTER (WHERE customer_id IS NULL OR customer_id = '') AS missing_customer,
COUNT(*) FILTER (WHERE article_id IS NULL) AS missing_article,
COUNT(*) FILTER (WHERE price IS NULL) AS missing_price,
COUNT(*) FILTER (WHERE sales_channel_id IS NULL) AS missing_sales_channel
FROM transactions;


UPDATE customers
SET club_member_status = 'UNKNOWN'
WHERE club_member_status IS NULL OR club_member_status = '';

UPDATE customers
SET fashion_news_frequency = 'NEVER'
WHERE fashion_news_frequency IS NULL OR fashion_news_frequency = '';




