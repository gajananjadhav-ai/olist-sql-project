-- Q2: Revenue by State

SELECT 
    c.customer_state,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM olist_customers c
JOIN olist_orders o ON c.customer_id = o.customer_id
JOIN olist_order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;