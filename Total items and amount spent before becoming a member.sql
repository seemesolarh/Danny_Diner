--What is the total items and amount spent for each member before they became a member?

SELECT
      s.customer_id,
	  count(s.product_id) AS product_id, 
	  sum(m.price) AS total_spent
FROM 
    dannys_diner.sales s
JOIN 
     dannys_diner.menu m
ON 
    s.product_id = m.product_id
JOIN 
     dannys_diner.members mb
On 
    s.customer_id = mb.customer_id
WHERE 
      s.order_date < mb.join_date
GROUP BY
         s.customer_id

