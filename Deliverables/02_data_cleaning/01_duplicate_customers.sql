-- =========================================
-- File: 01_duplicate_customers.sql
-- Description: Check and remove duplicate customers
-- =========================================

-- Step 1: Identify duplicate customers
SELECT 
    customer_unique_id,
    COUNT(*) AS total_records
FROM olist_customers
GROUP BY customer_unique_id
HAVING COUNT(*) > 1;

-- Observation:
-- No duplicate records found (0 rows returned)

-- Conclusion:
-- No cleaning required for duplicate customers