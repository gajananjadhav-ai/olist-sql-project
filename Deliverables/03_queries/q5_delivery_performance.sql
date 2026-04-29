-- Q5: Delivery Performance

SELECT 
    order_id,
    DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) AS delivery_days
FROM olist_orders
WHERE order_delivered_customer_date IS NOT NULL;