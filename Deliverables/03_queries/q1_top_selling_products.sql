-- Q1: Top Selling Products

SELECT 
    product_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(price), 2) AS total_revenue
FROM olist_order_items
GROUP BY product_id
ORDER BY total_orders DESC
LIMIT 10;