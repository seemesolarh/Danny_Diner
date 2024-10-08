--In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?


SELECT
    s.customer_id,
    SUM(
        CASE
            WHEN s.order_date BETWEEN mb.join_date AND mb.join_date + INTERVAL '6 days' THEN m.price * 20 -- 2x points for all items in the first week
            WHEN m.product_name = 'sushi' THEN m.price * 20 -- 2x points for sushi
            ELSE m.price * 10
        END
    ) AS total_points
FROM  dannys_diner.sales s
JOIN  dannys_diner.menu m
    ON s.product_id = m.product_id
JOIN  dannys_diner.members mb
    ON s.customer_id = mb.customer_id
WHERE s.customer_id IN ('A', 'B')
  AND s.order_date <= '2021-01-31'
GROUP BY s.customer_id;
