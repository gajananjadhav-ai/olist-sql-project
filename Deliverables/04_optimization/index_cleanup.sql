-- =========================================
-- File: index_cleanup.sql
-- Description: Remove duplicate and redundant indexes
-- =========================================

-- =========================================
-- Objective:
-- =========================================
-- To improve database performance by removing duplicate and unnecessary indexes
-- that increase storage and slow down write operations.

-- =========================================
-- Approach:
-- =========================================
-- 1. Reviewed existing indexes from schema
-- 2. Identified duplicate indexes on same columns
-- 3. Removed redundant indexes while keeping required ones

-- =========================================
-- STEP 1: Remove Duplicate Indexes
-- =========================================

-- Order Items table (duplicate indexes on order_id)
ALTER TABLE olist_order_items
DROP INDEX idx_oi_order;

-- Duplicate index on seller_id
ALTER TABLE olist_order_items
DROP INDEX idx_oi_seller;

-- =========================================
-- STEP 2: Verify Remaining Indexes
-- =========================================

SHOW INDEX FROM olist_order_items;

-- =========================================
-- Observation:
-- =========================================
-- Duplicate indexes were successfully removed.
-- Required indexes are retained for optimal query performance.

-- =========================================
-- Conclusion:
-- =========================================
-- Removing redundant indexes reduces storage overhead and improves
-- INSERT and UPDATE performance without affecting query efficiency.    