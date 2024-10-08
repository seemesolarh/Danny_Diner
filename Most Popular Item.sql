--Which item was the most popular for each customer?

WITH purchase_counts AS (
    SELECT
        s.customer_id,
        m.product_name,
        COUNT(s.product_id) AS purchase_count,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY COUNT(s.product_id)DESC ) AS rank
    FROM dannys_diner.sales  s
    JOIN dannys_diner.menu  m
        ON s.product_id = m.product_id
    GROUP BY s.customer_id, m.product_name
	ORDER BY purchase_count
)
SELECT
    customer_id,
    product_name,
    purchase_count
FROM purchase_counts
WHERE rank = 1;

