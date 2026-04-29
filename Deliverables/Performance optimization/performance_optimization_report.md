# Performance Optimization Report  
**Project:** Olist E-commerce Data Analysis  

---

## 1. Objective  

To optimize database performance by analyzing and improving indexing strategy using EXPLAIN and index management techniques.

---

## 2. Existing Index Analysis  

The database schema already contained several indexes defined during table creation, including:

- Index on `customer_unique_id` (customers)
- Index on `customer_state` (customers)
- Index on `order_purchase_timestamp` (orders)
- Index on `customer_id` (orders)
- Indexes on `order_id` and `seller_id` (order_items)
- Index on `seller_state` (sellers)

These indexes support common query operations such as filtering, joins, and aggregations.

---

## 3. Optimization Approach  

- Reviewed existing indexes from schema  
- Identified redundant indexes and removed them  
- Identified missing indexes required for query optimization  
- Used EXPLAIN to analyze query performance  

---

## 4. Redundant Index Removal  

Duplicate and unnecessary indexes were removed to improve write performance and reduce storage overhead.

---

## 5. Missing Indexes Added  

The following indexes were added to improve performance:

```sql
CREATE INDEX idx_order_items_product_id 
ON olist_order_items(product_id);

CREATE INDEX idx_payments_order_id 
ON olist_order_payments(order_id);

---

**6. EXPLAIN Analysis**
Sample Query:
EXPLAIN
SELECT 
    oi.order_id,
    SUM(oi.price + oi.freight_value) AS total_order_value
FROM olist_order_items oi
JOIN olist_orders o
ON oi.order_id = o.order_id
GROUP BY oi.order_id;

---

**7. Observation**
Existing indexes were already well-designed
Removing duplicate indexes improved performance
Adding missing indexes improved JOIN efficiency
EXPLAIN confirmed optimized execution plans

---

**8. Conclusion**

The database performance was successfully optimized by refining the indexing strategy.
Existing indexes were leveraged, redundant ones were removed, and only necessary indexes were added.

This ensures efficient query execution, reduced resource usage, and scalability for large datasets.
