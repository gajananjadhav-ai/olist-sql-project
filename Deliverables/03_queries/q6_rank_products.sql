-- Q6: Top Products by Revenue in Each Category using RANK()

SELECT 
    p.product_category_name,
    p.product_id,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    RANK() OVER (
        PARTITION BY p.product_category_name 
        ORDER BY SUM(oi.price) DESC
    ) AS product_rank
FROM olist_order_items oi
JOIN olist_products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name, p.product_id;