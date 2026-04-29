-- File: create_tables.sql
-- Description: Olist Database Schema Creation

-- =========================================
-- Table: olist_customers
-- Description: Stores customer details and location info
-- =========================================
CREATE TABLE olist_customers (
    customer_id VARCHAR(50) NOT NULL,
    customer_unique_id VARCHAR(50) NOT NULL,
    customer_zip_code_prefix INT DEFAULT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state CHAR(2) NOT NULL,
    PRIMARY KEY (customer_id),
    KEY idx_customer_state (customer_state),
    KEY idx_customer_unique_id (customer_unique_id)
);

-- =========================================
-- Table: olist_geolocation
-- Description: Contains geographical data based on zip code
-- =========================================
CREATE TABLE olist_geolocation (
    geolocation_zip_code_prefix INT DEFAULT NULL,
    geolocation_lat DOUBLE DEFAULT NULL,
    geolocation_lng DOUBLE DEFAULT NULL,
    geolocation_city VARCHAR(50) DEFAULT NULL,
    geolocation_state CHAR(2) DEFAULT NULL
);

-- =========================================
-- Table: olist_sellers
-- Description: Stores seller information and location
-- =========================================
CREATE TABLE olist_sellers (
    seller_id VARCHAR(50) NOT NULL,
    seller_zip_code_prefix INT DEFAULT NULL,
    seller_city VARCHAR(50) DEFAULT NULL,
    seller_state CHAR(2) DEFAULT NULL,
    PRIMARY KEY (seller_id),
    KEY idx_seller_state (seller_state)
);

-- =========================================
-- Table: olist_products
-- Description: Contains product details and specifications
-- =========================================
CREATE TABLE olist_products (
    product_id VARCHAR(50) NOT NULL,
    product_category_name VARCHAR(50) DEFAULT NULL,
    product_name_length INT DEFAULT NULL,
    product_description_lenght INT DEFAULT NULL,
    product_photos_qty INT DEFAULT NULL,
    product_weight_g INT DEFAULT NULL,
    product_length_cm INT DEFAULT NULL,
    product_height_cm INT DEFAULT NULL,
    product_width_cm INT DEFAULT NULL,
    PRIMARY KEY (product_id)
);

-- =========================================
-- Table: product_category_name_translation
-- Description: Maps product categories to English names
-- =========================================
CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(50) NOT NULL,
    product_category_name_english VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (product_category_name)
);

-- =========================================
-- Table: olist_orders
-- Description: Contains order transaction details and status
-- =========================================
CREATE TABLE olist_orders (
    order_id VARCHAR(50) NOT NULL,
    customer_id VARCHAR(50) NOT NULL,
    order_status VARCHAR(20) DEFAULT NULL,
    order_purchase_timestamp DATETIME DEFAULT NULL,
    order_approved_at DATETIME DEFAULT NULL,
    order_delivered_carrier_date DATETIME DEFAULT NULL,
    order_delivered_customer_date DATETIME DEFAULT NULL,
    order_estimated_delivery_date DATETIME DEFAULT NULL,
    PRIMARY KEY (order_id),
    KEY idx_orders_purchase_ts (order_purchase_timestamp),
    KEY idx_orders_customer (customer_id),
    CONSTRAINT fk_orders_customers 
        FOREIGN KEY (customer_id) REFERENCES olist_customers(customer_id),
    CONSTRAINT chk_delivery_date 
        CHECK (
            order_delivered_customer_date IS NULL 
            OR order_delivered_customer_date >= order_purchase_timestamp
        )
);

-- =========================================
-- Table: olist_order_items
-- Description: Contains line-level details of products within each order
-- =========================================
CREATE TABLE olist_order_items (
    order_id VARCHAR(50) NOT NULL,
    order_item_id INT NOT NULL,
    product_id VARCHAR(50) DEFAULT NULL,
    seller_id VARCHAR(50) DEFAULT NULL,
    shipping_limit_date DATETIME DEFAULT NULL,
    price DECIMAL(10,2) DEFAULT NULL,
    freight_value DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (order_id, order_item_id),
    KEY fk_items_product (product_id),
    KEY fk_items_seller (seller_id),
    KEY idx_order_items_order (order_id),
    KEY idx_oi_order (order_id),
    KEY idx_oi_seller (seller_id),
    CONSTRAINT fk_items_order 
        FOREIGN KEY (order_id) REFERENCES olist_orders(order_id),
    CONSTRAINT fk_items_product 
        FOREIGN KEY (product_id) REFERENCES olist_products(product_id),
    CONSTRAINT fk_items_seller 
        FOREIGN KEY (seller_id) REFERENCES olist_sellers(seller_id),
    CONSTRAINT chk_freight_positive CHECK (freight_value >= 0),
    CONSTRAINT chk_price_positive CHECK (price >= 0)
);

-- =========================================
-- Table: olist_order_payments
-- Description: Stores payment details for each order
-- =========================================
CREATE TABLE olist_order_payments (
    order_id VARCHAR(50) NOT NULL,
    payment_sequential INT NOT NULL,
    payment_type VARCHAR(20) DEFAULT NULL,
    payment_installments INT DEFAULT NULL,
    payment_value DECIMAL(10,2) DEFAULT NULL,
    PRIMARY KEY (order_id, payment_sequential),
    CONSTRAINT fk_payments_order 
        FOREIGN KEY (order_id) REFERENCES olist_orders(order_id),
    CONSTRAINT chk_payment_positive 
        CHECK (payment_value > 0)
);

-- =========================================
-- Table: olist_order_reviews
-- Description: Captures customer reviews and ratings
-- =========================================
    CREATE TABLE olist_order_reviews (
        review_id VARCHAR(50) NOT NULL,
        order_id VARCHAR(50) DEFAULT NULL,
        review_score INT DEFAULT NULL,
        review_comment_title VARCHAR(100) DEFAULT NULL,
        review_comment_message TEXT,
        review_creation_date DATETIME DEFAULT NULL,
        review_answer_timestamp DATETIME DEFAULT NULL,
        PRIMARY KEY (review_id),
        KEY fk_reviews_order (order_id),
        CONSTRAINT fk_reviews_order 
            FOREIGN KEY (order_id) REFERENCES olist_orders(order_id),
        CONSTRAINT chk_review_score 
            CHECK (review_score BETWEEN 1 AND 5)
    );  
