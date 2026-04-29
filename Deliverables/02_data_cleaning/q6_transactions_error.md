## Q6. Transactions with COMMIT and ROLLBACK (Error Handling)

**Objective:**  
To demonstrate transaction control using COMMIT and ROLLBACK, including handling of error scenarios to maintain data integrity.

---

**Approach Used:**  
A transaction was initiated to insert records into the `olist_customers` table.  
Two scenarios were tested:
1. Successful transaction using COMMIT  
2. Failed transaction using ROLLBACK due to constraint violation  

---

**Query Used (Successful Transaction - COMMIT):**  
```sql
START TRANSACTION;

INSERT INTO olist_customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
) VALUES (
    'txn_customer_001',
    'txn_unique_001',
    11111,
    'test_city',
    'TS'
);

COMMIT;

**Observation (COMMIT):**
The record was successfully inserted and permanently stored in the table.

---

**Query Used (Error Scenario - ROLLBACK):**

```sql
START TRANSACTION;

-- This will fail because customer_id is PRIMARY KEY (duplicate or NULL not allowed)
INSERT INTO olist_customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
) VALUES (
    NULL,  -- Invalid (violates NOT NULL constraint)
    'txn_unique_002',
    22222,
    'test_city',
    'TS'
);

ROLLBACK;

**Observation (ROLLBACK):**
The transaction failed due to constraint violation (NULL in PRIMARY KEY).
ROLLBACK ensured that no invalid data was inserted into the table.

**Conclusion:**
Transactions help maintain data consistency and integrity.
COMMIT permanently saves valid changes, while ROLLBACK prevents incorrect or failed operations from affecting the database.