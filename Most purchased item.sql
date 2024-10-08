--What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT
    m.product_name,
    COUNT(s.product_id) AS times_purchased
FROM dannys_diner.sales s
JOIN dannys_diner.menu m
    ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY times_purchased DESC
LIMIT 1;
