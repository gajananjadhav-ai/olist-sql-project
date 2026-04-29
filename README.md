# SQL MASTERY - The E-Commerce Analytics Challenge

## Project Overview

This project is based on the **Olist Brazilian E-Commerce Dataset** and focuses on building a complete analytics database using SQL.

The objective of this project was to design a structured relational database, improve data quality, write analytical business queries, and optimize query performance.

This project simulates real-world Data Engineering and SQL Analytics workflows.

---

## Problem Statement

As a Data Engineer for an e-commerce platform, the goal was to transform raw transactional data into a structured analytics-ready database.

The project covers:

- Database schema design
- Data quality validation
- Data cleaning
- Business analysis
- Query optimization
- Performance tuning

---

## Dataset Information

**Dataset:** Olist Brazilian E-Commerce Public Dataset  
**Database Name:** `olist_db`  
**SQL Version:** MySQL 8.0  

Dataset includes:

- 100K+ orders
- Multiple related tables
- Real-world data quality issues
- Business transactions across customers, products, sellers, and payments

---

## Project Objectives

- Design normalized database schema (3NF)
- Establish table relationships using foreign keys
- Detect and fix data quality issues
- Build analytical SQL queries
- Implement stored procedures
- Optimize slow queries using EXPLAIN and indexing

---

## Database Architecture

The database is designed using structured table relationships.

### Parent Tables (Master Data)

These tables store the main business entities.

| Table Name | Description |
|---|---|
| olist_customers | Stores customer information |
| olist_products | Stores product information |
| olist_sellers | Stores seller information |
| product_category_name_translation | Category translation mapping |

---

### Child Tables (Transactional Data)

These tables depend on parent tables and store business transactions.

| Table Name | Depends On |
|---|---|
| olist_orders | olist_customers |
| olist_order_items | olist_orders, olist_products, olist_sellers |
| olist_order_payments | olist_orders |
| olist_order_reviews | olist_orders |

---

### Supporting Table

| Table Name | Description |
|---|---|
| olist_geolocation | Stores location-based information |

---

## Entity Relationship Diagram (ERD)

Database relationship design and structure visualization.

![ERD Diagram](ERD diagram/erd_diagram.png)

---

## SQL Concepts Covered

This project includes:

- Schema Design
- Primary Keys
- Foreign Keys
- Constraints
- Joins
- Subqueries
- CTEs
- Window Functions
- Transactions
- Stored Procedures
- Indexing
- EXPLAIN Analysis
- Query Optimization

---

## Deliverables

### 1. SQL Script Files

Organized into structured folders:

```bash
Deliverables/
├── 01_schema/
│   ├── create_tables.sql
│   ├── schema_explanation.md
│
├── 02_data_cleaning/
│   ├── 01_duplicate_customers.sql
│   ├── q5_data_dictionary.md
│   ├── q6_transactions_error.md
│   ├── q7_same_email_issue.md
│   ├── q8_orphan_records.md
│   ├── q9_no_orders.md
│   ├── q10_fraud_detection.md
│
├── 03_queries/
│   ├── q1_top_selling_products.sql
│   ├── q2_revenue_by_state.sql
│   ├── q3_monthly_orders.sql
│   ├── q4_top_customers.sql
│   ├── q5_delivery_performance.sql
│   ├── q6_rank_products.sql
│   ├── queries_documentation.md
│
├── 04_optimization/
│   ├── index_cleanup.sql
│   ├── indexing.sql
│   ├── optimization_summary.md
```

---

### ERD Diagram

📌 [Open Full ERD Diagram](Deliverables/ERD%20diagram/erd_diagram.png)

![ERD Diagram](Deliverables/ERD%20diagram/erd_diagram.png)

---

### Data Quality Findings Report

📌 [View Data Quality Report](Deliverables/Data%20quality%20findings%20report_Q1-Q4/data_quality_report.md)

---

### Performance Optimization Report

📌 [View Performance Optimization Report](Deliverables/Performance%20optimization/performance_optimization_report.md)

---

## Business Analysis Performed

Key analysis performed:

- Top selling products
- Revenue analysis by state
- Monthly order trends
- Top customers by spending
- Delivery performance analysis
- Product ranking by category

---

## Data Quality Checks Performed

This project includes:

- Duplicate customer detection
- Transaction error handling
- Same email issue detection
- Orphan record identification
- Customers without orders
- Fraud detection based on payment mismatch

---

## Performance Optimization

Optimization work includes:

- Existing index analysis
- Duplicate index cleanup
- Missing index creation
- EXPLAIN analysis
- Query performance improvement

---

## Key Learnings

Through this project, I improved my knowledge in:

- Relational database design
- SQL query writing
- Data quality engineering
- Query optimization
- Indexing strategies
- Analytical SQL
- Business problem solving

---

## Future Improvements

Possible future enhancements:

- ETL pipeline using PySpark
- Dashboard creation
- Cloud deployment
- Data warehouse implementation

---

## Author

**Gajanan Jadhav**

Aspiring Data Engineer | MIS Executive
