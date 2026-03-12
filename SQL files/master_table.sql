CREATE OR REPLACE VIEW sales_analysis AS
SELECT
    t.t_dat AS transaction_date,
    t.customer_id,
    t.article_id,
    t.price,
    t.sales_channel_id,
    c.age,
    c.club_member_status,
    c.fashion_news_frequency,
    a.prod_name,
    a.product_type_name,
    a.product_group_name,
    a.colour_group_name,
    a.department_name,
    a.section_name,
    a.garment_group_name
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
JOIN articles_analysis a
    ON t.article_id = a.article_id;





select * from sales_analysis;