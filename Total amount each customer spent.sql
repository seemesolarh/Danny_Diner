--What is the total amount each customer spent at the restaurant?

select 
       s.customer_id, sum(m.price) AS total_price
from  
      dannys_diner.sales s
join 
      dannys_diner.menu m
on 
       s.product_id = m.product_id
Group BY 
        s.customer_id 