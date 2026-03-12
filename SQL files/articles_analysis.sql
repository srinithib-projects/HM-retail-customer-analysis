-- 1. What types of products exist in the catalog?
SELECT DISTINCT product_type_name
FROM articles_analysis
ORDER BY product_type_name;


-- 2. How are products distributed across product groups?
SELECT
product_group_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY product_group_name
ORDER BY number_of_products DESC;


-- 3. Which departments dominate the catalog?
SELECT
department_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY department_name
ORDER BY number_of_products DESC;


-- 4. How are garments grouped across the catalog?
SELECT
garment_group_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY garment_group_name
ORDER BY number_of_products DESC;


-- 5. Which product types appear most frequently in the catalog?
SELECT
product_type_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY product_type_name
ORDER BY number_of_products DESC
LIMIT 10;


-- 6. What are the most common colours in the product catalog?
SELECT
colour_group_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY colour_group_name
ORDER BY number_of_products DESC
LIMIT 10;


-- 7. How are products distributed across different sections?
SELECT
section_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY section_name
ORDER BY number_of_products DESC;


-- 8. Which garment groups contain the highest number of products?
SELECT
garment_group_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY garment_group_name
ORDER BY number_of_products DESC
LIMIT 10;


-- 9. Which product groups dominate specific departments?
SELECT
department_name,
product_group_name,
COUNT(*) AS number_of_products
FROM articles_analysis
GROUP BY department_name, product_group_name
ORDER BY number_of_products DESC;


-- 10. How diverse is the product catalog?
SELECT
COUNT(DISTINCT product_type_name) AS unique_product_types,
COUNT(DISTINCT product_group_name) AS unique_product_groups,
COUNT(DISTINCT garment_group_name) AS unique_garment_groups,
COUNT(DISTINCT department_name) AS unique_departments
FROM articles_analysis;