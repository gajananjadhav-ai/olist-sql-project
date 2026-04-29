## Q9. Customers Who Registered but Never Placed an Order  

**Objective:**  
To identify customers who registered in the system but never placed an order, indicating a potential conversion funnel leak.

---

**Approach Used:**  
Performed a LEFT JOIN between `olist_customers` and `olist_orders`.  
Filtered customers who do not have any matching orders.

---

**Query Used:**  
```sql
SELECT c.*
FROM olist_customers c
LEFT JOIN olist_orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

**Observation:**
No records were returned, indicating that all registered customers have placed at least one order.

---

**Conclusion:**
There is no conversion funnel leakage observed in the dataset.
All customers successfully progressed from registration to placing an order.