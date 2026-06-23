-- create database walmart_db;

USE walmart_db;

-- Checking data of ours table
SELECT * FROM salestable LIMIT 10;
SELECT COUNT(*) AS total_records FROM salestable;

-- Q1: OVERALL BUSINESS KPIs or OVERALL SUMMARY
SELECT 
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(SUM(total_amount * profit_margin), 2) AS total_profit,
    SUM(quantity) AS total_items_sold
FROM salestable;

-- Q2: YEAR-OVER-YEAR SALES GROWTH
SELECT 
    order_year,
    ROUND(SUM(total_amount), 2) AS yearly_revenue,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount * profit_margin), 2) AS yearly_profit
FROM salestable
GROUP BY order_year
ORDER BY order_year ASC;

-- Q3: QUARTERLY BUSINESS TRENDS (Q1, Q2, Q3, Q4 Analysis)
SELECT 
    order_year,
    order_quarter,
    ROUND(SUM(total_amount), 2) AS quarterly_revenue,
    ROUND(SUM(total_amount * profit_margin), 2) AS quarterly_profit
FROM salestable
GROUP BY order_year, order_quarter
ORDER BY order_year, order_quarter;

-- Q4: MONTHLY REVENUE TREND 
SELECT 
    order_year,
    MONTH(order_date) AS month_num,
    order_month,
    ROUND(SUM(total_amount), 2) AS monthly_sales,
    COUNT(order_id) AS total_orders
FROM salestable
GROUP BY order_year, MONTH(order_date), order_month
ORDER BY order_year, month_num;

-- Q5: CUSTOMER TYPE BEHAVIOR (Member vs Normal)
SELECT 
    customer_type,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_spent,
    ROUND(AVG(total_amount), 2) AS avg_ticket_size
FROM salestable
GROUP BY customer_type
ORDER BY total_spent DESC;

-- Q6: STATE & CITY PERFORMANCE 
SELECT 
    state,
    city,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_sales
FROM salestable
GROUP BY state, city
ORDER BY total_sales DESC
LIMIT 5;

-- Q7: CATEGORY-WISE REVENUE & PROFIT
SELECT 
    category,
    ROUND(SUM(total_amount), 2) AS category_revenue,
    ROUND(SUM(total_amount * profit_margin), 2) AS category_profit
FROM salestable
GROUP BY category
ORDER BY category_profit DESC;

-- Q8: TOP 5 BEST-SELLING PRODUCTS
SELECT 
    product_name,
    category,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(total_amount), 2) AS total_sales
FROM salestable
GROUP BY product_name, category
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- Q9: DAY-OF-WEEK ANALYSIS 
SELECT 
    day_of_week,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount), 2) AS daily_sales
FROM salestable
GROUP BY day_of_week
ORDER BY total_orders DESC;


-- Q10: ORDER STATUS & CANCELLATION ANALYSIS
SELECT 
    order_status,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND((COUNT(order_id) / (SELECT COUNT(*) FROM walmartsales)) * 100, 2) AS percentage_share
FROM salestable
GROUP BY order_status
ORDER BY total_orders DESC;

-- Now, Connecting to PowerBI 

-- 1. pahle user banate hain or use password dete hain
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'zxcvbnm';

-- 2. ye user powerbi se connect karte hai or local password se entry mil sake
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'zxcvbnm';

-- 3. Ab saari permissions dete hain (Yaha table/DB ka naam sahi hona chahiye: 'walmart_db.*')
GRANT ALL PRIVILEGES ON walmart_db.* TO 'root'@'%';

-- 4. Changes ko save karte hain
FLUSH PRIVILEGES;
