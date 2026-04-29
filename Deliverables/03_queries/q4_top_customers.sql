-- Q4: Top Customers by Spending

SELECT 
    o.customer_id,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_spent
FROM olist_orders o
JOIN olist_order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 10;