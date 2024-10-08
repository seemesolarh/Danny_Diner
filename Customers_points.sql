--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT 
      s.customer_id,
	  SUM(
        CASE
            WHEN m.product_name = 'sushi' THEN m.price * 20 -- 2x points multiplier
            ELSE m.price * 10
        END
    ) AS total_points
FROM
    dannys_diner.sales s
JOIN
     dannys_diner.menu m
ON
     s.product_id = m.product_id
GROUP BY 
         customer_id
ORDER BY 
		total_points;