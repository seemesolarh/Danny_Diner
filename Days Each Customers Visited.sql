--How many days has each customer visited the restaurant?

SELECT s.customer_id AS Customer_id,
COUNT(distinct s.order_date) AS Visit_days
FROM dannys_diner.sales s
GROUP BY Customer_iD
ORDER BY Visit_days;