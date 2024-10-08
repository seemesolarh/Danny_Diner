--Which item was purchased just before the customer became a member?

SELECT
      s.customer_id, s.order_date,  m.product_name
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
ORDER BY
         s.customer_id, s.order_date

LIMIT 1;