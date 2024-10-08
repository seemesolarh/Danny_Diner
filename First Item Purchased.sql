--What was the first item from the menu purchased by each customer?

WITH ranked_purchases AS (
    SELECT
        S.customer_id,
        S.product_id,
        ROW_NUMBER() OVER (PARTITION BY S.customer_id ORDER BY S.order_date) AS First_purchase
    FROM dannys_diner.sales AS S
)
SELECT
    rp.customer_id,
    m.product_name
FROM ranked_purchases rp
JOIN dannys_diner.menu m
    ON rp.product_id = m.product_id
WHERE rp.first_purchase = 1;
