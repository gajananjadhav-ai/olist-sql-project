-- Q3: Monthly Orders Trend

SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM olist_orders
GROUP BY month
ORDER BY month;