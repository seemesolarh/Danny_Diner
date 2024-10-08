--Join All The Things

SELECT
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    CASE
        WHEN s.order_date >= mb.join_date THEN 'Y'
        ELSE 'N'
    END AS member
FROM  dannys_diner.sales s
JOIN  dannys_diner.menu m
    ON s.product_id = m.product_id
LEFT JOIN  dannys_diner.members mb
    ON s.customer_id = mb.customer_id
ORDER BY s.customer_id, s.order_date;

