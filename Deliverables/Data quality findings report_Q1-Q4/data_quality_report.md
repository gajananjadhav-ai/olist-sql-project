# Data Quality Findings Report  
**Project:** Olist E-commerce Data Analysis  

---

## 1. Objective  

The objective of this analysis is to assess and ensure data quality before performing further analytics.  
This includes identifying duplicates, NULL values, enforcing constraints, and validating relationships across tables.

---

## 2. Duplicate Check  

**Query Used:**  
```sql
SELECT 
    customer_unique_id,
    COUNT(*) AS total_records
FROM olist_customers
GROUP BY customer_unique_id
HAVING COUNT(*) > 1;

---

**Observation:**
The query returned 0 rows, indicating no duplicate records exist based on customer_unique_id.

Conclusion:
Each customer is uniquely identified, ensuring data consistency and eliminating duplication issues.

---

*3. NULL Value Check**

Query Used:

SELECT *
FROM olist_customers
WHERE customer_id IS NULL;

Observation:
No NULL values were found in the primary key column.

Conclusion:
Critical fields such as primary keys are complete and reliable.

---

**4. Constraint Validation**

Validation Performed:

Primary Key constraints applied on all main tables
Foreign Key relationships established across tables
CHECK constraints implemented:
price ≥ 0
freight_value ≥ 0
payment_value > 0
review_score between 1 and 5

Observation:
All constraints are correctly defined and enforced.

Conclusion:
The schema maintains strong data integrity and prevents invalid data entry.

---
**5. Referential Integrity Check**

Query Used:

SELECT oi.*
FROM olist_order_items oi
LEFT JOIN olist_orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

Observation:
No orphan records were found.

Conclusion:
All child records are properly linked to parent tables, ensuring referential integrity.

---

**6. Data Quality Issues Identified**

The following potential issues were identified in raw data:

NULL values in delivery-related columns
Missing product attributes in some records
Inconsistent date formats in raw CSV files
Potential duplicate customer entries before cleaning
Risk of orphan records before applying foreign keys
Inconsistent text formatting (city/state casing)
Multiple entries for same customer across locations
Missing review comments
Variations in payment installments
Data type inconsistencies during raw ingestion

---

**7. Data Transformation Performed**
Standardized data types across all tables
Converted geolocation fields to appropriate formats:
ZIP code → INT
Latitude/Longitude → DOUBLE
Cleaned text fields (city/state formatting)
Ensured compatibility with schema constraints

---

**8. Overall Data Quality Summary**
No duplicate records found
No NULL values in primary key columns
Constraints properly enforced
Referential integrity maintained
Data standardized and cleaned

---

**9. Final Conclusion**

The dataset has been successfully validated and cleaned for analysis.
No critical data quality issues remain.
The data is consistent, reliable, and ready for analytical processing and reporting.