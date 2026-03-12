create table customers ( customer_id text,FN text,
Active text,club_member_status text,fashion_news_frequency text,
age int,postal_code text); 

CREATE TABLE articles (
    article_id BIGINT,
    product_code BIGINT,
    prod_name TEXT,
    product_type_no INT,
    product_type_name TEXT,
    product_group_name TEXT,
    graphical_appearance_no INT,
    graphical_appearance_name TEXT,
    colour_group_code INT,
    colour_group_name TEXT,
    perceived_colour_value_id INT,
    perceived_colour_value_name TEXT,
    perceived_colour_master_id INT,
    perceived_colour_master_name TEXT,
    department_no INT,
    department_name TEXT,
    index_code TEXT,
    index_name TEXT,
    index_group_no INT,
    index_group_name TEXT,
    section_no INT,
    section_name TEXT,
    garment_group_no INT,
    garment_group_name TEXT,
    detail_desc TEXT
);


CREATE TABLE transactions (
t_dat DATE,
customer_id TEXT,
article_id BIGINT,
price FLOAT,
sales_channel_id INT
);

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM articles;
SELECT COUNT(*) FROM transactions;


CREATE TABLE articles_analysis AS
SELECT
    article_id,
    prod_name,
    product_type_name,
    product_group_name,
    colour_group_name,
    department_name,
    index_name,
	section_name,
    garment_group_name,
	detail_desc
FROM articles;

select * from articles_analysis;

select * from customers;















