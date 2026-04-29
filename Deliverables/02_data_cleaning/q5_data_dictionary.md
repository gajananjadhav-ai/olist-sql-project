# Data Dictionary  
**Project:** Olist E-commerce Data Analysis  

---

## 1. olist_customers  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| customer_id | VARCHAR(50) | PK | Unique identifier for each customer record |
| customer_unique_id | VARCHAR(50) | Indexed | Unique identifier for a customer across multiple orders |
| customer_zip_code_prefix | INT | | ZIP code prefix of customer |
| customer_city | VARCHAR(50) | | City of customer |
| customer_state | CHAR(2) | Indexed | State of customer |

**Business Purpose:** Stores customer identity and location details.

---

## 2. olist_geolocation  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| geolocation_zip_code_prefix | INT | | ZIP code prefix |
| geolocation_lat | DOUBLE | | Latitude |
| geolocation_lng | DOUBLE | | Longitude |
| geolocation_city | VARCHAR(50) | | City name |
| geolocation_state | CHAR(2) | | State name |

**Business Purpose:** Provides geographical mapping information.

---

## 3. olist_orders  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| order_id | VARCHAR(50) | PK | Unique identifier for each order |
| customer_id | VARCHAR(50) | FK | Links to customer |
| order_status | VARCHAR(20) | | Status of order |
| order_purchase_timestamp | DATETIME | Indexed | Order purchase time |
| order_approved_at | DATETIME | | Approval timestamp |
| order_delivered_carrier_date | DATETIME | | Carrier delivery date |
| order_delivered_customer_date | DATETIME | | Customer delivery date |
| order_estimated_delivery_date | DATETIME | | Estimated delivery |

**Business Purpose:** Stores order lifecycle and status.

---

## 4. olist_order_items  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| order_id | VARCHAR(50) | PK, FK | Order reference |
| order_item_id | INT | PK | Item sequence in order |
| product_id | VARCHAR(50) | FK | Product reference |
| seller_id | VARCHAR(50) | FK | Seller reference |
| shipping_limit_date | DATETIME | | Shipping deadline |
| price | DECIMAL(10,2) | | Product price |
| freight_value | DECIMAL(10,2) | | Shipping cost |

**Constraints:**
- price ≥ 0  
- freight_value ≥ 0  

**Business Purpose:** Stores item-level details for each order.

---

## 5. olist_order_payments  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| order_id | VARCHAR(50) | PK, FK | Order reference |
| payment_sequential | INT | PK | Payment sequence |
| payment_type | VARCHAR(20) | | Type of payment |
| payment_installments | INT | | Number of installments |
| payment_value | DECIMAL(10,2) | | Payment amount |

**Constraints:**
- payment_value > 0  

**Business Purpose:** Stores payment details per order.

---

## 6. olist_order_reviews  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| review_id | VARCHAR(50) | PK | Review identifier |
| order_id | VARCHAR(50) | FK | Order reference |
| review_score | INT | | Rating (1–5) |
| review_comment_title | VARCHAR(100) | | Review title |
| review_comment_message | TEXT | | Review message |
| review_creation_date | DATETIME | | Review creation date |
| review_answer_timestamp | DATETIME | | Seller response time |

**Constraints:**
- review_score between 1 and 5  

**Business Purpose:** Stores customer feedback.

---

## 7. olist_products  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| product_id | VARCHAR(50) | PK | Product identifier |
| product_category_name | VARCHAR(50) | FK | Product category |
| product_name_length | INT | | Name length |
| product_description_lenght | INT | | Description length |
| product_photos_qty | INT | | Number of photos |
| product_weight_g | INT | | Weight in grams |
| product_length_cm | INT | | Length |
| product_height_cm | INT | | Height |
| product_width_cm | INT | | Width |

**Business Purpose:** Stores product attributes.

---

## 8. olist_sellers  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| seller_id | VARCHAR(50) | PK | Seller identifier |
| seller_zip_code_prefix | INT | | ZIP code |
| seller_city | VARCHAR(50) | | City |
| seller_state | CHAR(2) | Indexed | State |

**Business Purpose:** Stores seller information.

---

## 9. product_category_name_translation  

| Column Name | Data Type | Key | Description |
|------------|----------|-----|-------------|
| product_category_name | VARCHAR(50) | PK | Category (Portuguese) |
| product_category_name_english | VARCHAR(50) | | Category (English) |

**Business Purpose:** Provides category translation.

---

## Conclusion  

This data dictionary is derived directly from the database schema and includes keys, constraints, and business context.  
It provides a complete understanding of data structure, relationships, and ensures accurate data analysis.

---