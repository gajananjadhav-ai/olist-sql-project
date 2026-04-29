## Q10. Detect Potential Fraud (Payment Mismatch)

**Objective:**  
To identify orders where the total payment amount does not match the calculated order value, indicating potential fraud or data inconsistency.

---

**Approach Used:**  
Calculated the total order value by summing `price + freight_value` from `olist_order_items`.  
Compared it with the total payment value from `olist_order_payments` for each order.

---

**Query Used:**  
```sql
SELECT 
    oi.order_id,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS calculated_order_value,
    ROUND(SUM(op.payment_value), 2) AS payment_value
FROM olist_order_items oi
JOIN olist_order_payments op
ON oi.order_id = op.order_id
GROUP BY oi.order_id
HAVING calculated_order_value <> payment_value;

**Observation:**
Some orders were identified where the calculated order value does not match the actual payment value.

---

**Conclusion:**
These mismatches may indicate potential fraud, data inconsistencies, or legitimate scenarios such as multiple payments, discounts, or rounding differences.
Further investigation is required to validate such cases.