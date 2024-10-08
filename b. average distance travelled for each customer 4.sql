--What was the average distance travelled for each customer?

SELECT 
		co.customer_id, AVG(NULLIF(REPLACE(ro.distance, 'km', '')::FLOAT, 0)) AS average_distance_km
FROM 
	pizza_runner.runner_orders ro
JOIN 
	pizza_runner.customer_orders co ON ro.order_id = co.order_id
WHERE 
		ro.cancellation IS NULL
GROUP BY 
		co.customer_id;
