## Q7. Customers with Same Email but Different Names/Addresses  

**Objective:**  
To identify customers who have the same email (represented by `customer_unique_id`) but different address details, which may indicate potential data quality issues.

---

**Approach Used:**  
Grouped records using `customer_unique_id` to identify multiple entries for the same customer.  
Then analyzed whether these records have different location attributes such as city or state.

---

**Query Used:**  
```sql
SELECT 
    customer_unique_id,
    COUNT(*) AS record_count
FROM olist_customers
GROUP BY customer_unique_id
HAVING COUNT(*) > 1;

---

**Detailed Analysis Query:**  
```sql
SELECT *
FROM olist_customers
WHERE customer_unique_id IN (
    SELECT customer_unique_id
    FROM olist_customers
    GROUP BY customer_unique_id
    HAVING COUNT(*) > 1
)
ORDER BY customer_unique_id;

---

**Observation:**  
The queries returned 0 rows, indicating that no customers were found with the same `customer_unique_id` having different address details.

---

**Conclusion:**  
No data quality issues were identified for this scenario.  
Each `customer_unique_id` is consistently associated with a single set of customer details, ensuring data integrity and eliminating concerns of duplicate or conflicting customer records.
