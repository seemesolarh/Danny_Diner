--Rank All The Things

WITH customer_purchases AS (
    SELECT
        s.customer_id,
        s.order_date,
        m.product_name,
        m.price,
        CASE
            WHEN s.order_date >= mb.join_date THEN 'Y'
            ELSE 'N'
        END AS member,
        CASE
            -- Apply ranking only for members (Y)
            WHEN s.order_date >= mb.join_date THEN ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date, s.product_id)
            ELSE NULL
        END AS ranking
    FROM dannys_diner.sales s
    JOIN dannys_diner.menu m
        ON s.product_id = m.product_id
    LEFT JOIN dannys_diner.members mb
        ON s.customer_id = mb.customer_id
)
SELECT *
FROM customer_purchases
ORDER BY customer_id, order_date;
