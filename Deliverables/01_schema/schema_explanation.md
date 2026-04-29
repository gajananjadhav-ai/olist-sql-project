# Schema Creation – Explanation & Observations  
**Project:** Olist E-commerce Data Analysis  

---

## 1. Objective  
To design and implement a structured relational database schema using appropriate data types, constraints, and relationships.

---

## 2. Approach  

- Created tables based on business entities such as customers, orders, products, sellers, and payments  
- Applied normalization principles (up to 3NF) to reduce redundancy  
- Defined Primary Keys (PK) for uniqueness  
- Established Foreign Key (FK) relationships to maintain referential integrity  
- Applied constraints such as:
  - NOT NULL  
  - CHECK constraints (price ≥ 0, payment > 0)  
- Added indexes for performance optimization  

---

## 3. Data Loading Strategy  

- Smaller datasets were imported directly using MySQL import wizard  
- Larger datasets were inserted using SQL queries for better control  
- Data types were aligned with schema before insertion  

---

## 4. Data Transformation (Geolocation Fix)  

Columns Updated:
- `geolocation_zip_code_prefix`  
- `geolocation_lat`  
- `geolocation_lng`  
- `geolocation_city`  
- `geolocation_state`  

**Reason for Changes:**  
- Converted ZIP code to INT for consistency  
- Latitude and Longitude converted to DOUBLE for precision  
- Standardized city and state formats  
- Removed inconsistencies such as extra spaces and mixed casing  

**Impact:**  
- Improved data consistency  
- Better query performance  
- Accurate geographical analysis  

---

## 5. Observation  

- All tables were successfully created with correct schema definitions  
- Primary and Foreign Keys were properly defined  
- Constraints ensured valid and consistent data  
- No structural issues were found in schema design  

---

## 6. Conclusion  

The database schema is well-structured, normalized, and optimized for performance.  
All relationships and constraints ensure strong data integrity.  
The schema is ready for data loading, cleaning, and analytical queries.

---

## 7. Additional Notes  

- Indexes were added to improve query performance  
- Composite keys were used where required (e.g., order_items, payments)  
- CHECK constraints help enforce business rules at database level  

---