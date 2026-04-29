## Q8. Identify Orphan Records in Order Items  

**Objective:**  
To identify orphan records in `olist_order_items` where referenced `order_id` or `product_id` does not exist in the parent tables.

---

**Approach Used:**  
Used LEFT JOIN between `olist_order_items` (child table) and parent tables (`olist_orders`, `olist_products`).  
Filtered records where parent keys are missing to detect orphan records.

---

**Query Used (Order Items vs Orders):**  
```sql
SELECT oi.*
FROM olist_order_items oi
LEFT JOIN olist_orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

**Observation:**
No orphan records were found.
All order_items records have valid references to both orders and products.

---

**Conclusion:**
Referential integrity is properly maintained in the dataset.
There are no inconsistencies due to missing parent records.