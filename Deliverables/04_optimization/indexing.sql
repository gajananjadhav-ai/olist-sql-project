-- =========================================
-- File: indexing.sql
-- Description: Add missing indexes for performance optimization
-- =========================================

-- =========================================
-- Objective:
-- =========================================
-- To improve query performance by adding indexes on frequently used columns
-- in JOIN and filtering operations.

-- =========================================
-- Approach:
-- =========================================
-- 1. Reviewed existing indexes from schema
-- 2. Identified missing indexes required for query optimization
-- 3. Added only necessary indexes to avoid redundancy

-- =========================================
-- STEP 1: Add Missing Indexes
-- =========================================

-- Improve join performance (order_items → products)
CREATE INDEX idx_order_items_product_id 
ON olist_order_items(product_id);

-- Improve join performance (payments → orders)
CREATE INDEX idx_payments_order_id 
ON olist_order_payments(order_id);

-- =========================================
-- STEP 2: Verify Indexes
-- =========================================

SHOW INDEX FROM olist_order_items;
SHOW INDEX FROM olist_order_payments;

-- =========================================
-- Observation:
-- =========================================
-- Missing indexes were successfully added.
-- Query performance for JOIN operations is expected to improve.

-- =========================================
-- Conclusion:
-- =========================================
-- Adding targeted indexes enhances query speed while maintaining
-- efficient storage and write performance.