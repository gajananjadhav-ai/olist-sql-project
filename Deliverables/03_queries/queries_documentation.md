# Business Queries Documentation  
**Project:** Olist E-commerce Data Analysis  

---

## Q1. Top Selling Products  

**Objective:**  
Identify the most frequently sold products and their revenue contribution.

**Query Logic:**  
Grouped order items by product and calculated total orders and revenue.

---

## Q2. Revenue by State  

**Objective:**  
Analyze revenue distribution across different states.

**Query Logic:**  
Joined customers, orders, and order_items tables and aggregated revenue by state.

---

## Q3. Monthly Orders Trend  

**Objective:**  
Track order volume trends over time.

**Query Logic:**  
Used DATE_FORMAT to group orders by month and count total orders.

---

## Q4. Top Customers  

**Objective:**  
Identify customers with highest spending.

**Query Logic:**  
Joined orders and order_items to calculate total spending per customer.

---

## Q5. Delivery Performance  

**Objective:**  
Measure delivery time for orders.

**Query Logic:**  
Calculated difference between order purchase date and delivery date.

---

## Q6. Product Ranking by Category (Window Function)  

**Objective:**  
Rank products within each category based on revenue.

**Query Logic:**  
Used RANK() window function partitioned by category and ordered by revenue.

---

## Conclusion  

These queries demonstrate key SQL concepts including joins, aggregation, date functions, and window functions.  
They provide meaningful business insights from the dataset and validate analytical capabilities.

---