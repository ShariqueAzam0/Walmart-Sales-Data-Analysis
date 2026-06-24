<h1 align="center">📊 Walmart Sales Analytics Dashboard</h1>

<p align="center">
  <img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" alt="Python">
  <img src="https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white" alt="NumPy">
  <img src="https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white" alt="Jupyter">
  <img src="https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI">
</p>

> **An end-to-end data analytics project using Python · SQL · Power BI**

---

### 📌 Project Overview
This project analyzes over 50,000+ Walmart sales records to uncover actionable business insights related to:
* Overall sales performance and profitability
* Customer purchasing behavior (Member vs. Normal)
* Product and category trends
* Geographic performance across states and cities
* Revenue drivers and order cancellation analysis

**The analysis covers the full data pipeline:**
* ✔️ **Data Cleaning & Feature Engineering** (Python/Pandas)
* ✔️ **Exploratory Data Analysis & KPI Calculation** (MySQL)
* ✔️ **Interactive Business Intelligence Dashboard** (Power BI)

This project demonstrates real-world data analytics skills used to drive strategic business decisions.

---

### 📊 Dataset Summary
The dataset consists of **50,306 cleaned records** with the following key attributes:
* **Order Details:** `order_id`, `order_date`, `order_status`, `payment_method`, `delivery_method`
* **Customer Information:** `customer_id`, `customer_type` (Member/Normal), `gender`, `city`, `state`, `country`
* **Product Info:** `product_name`, `category`
* **Sales Metrics:** `quantity`, `unit_price`, `shipping_cost`, `discount_amount`, `profit_margin`
* **Feature-Engineered Fields:** `order_year`, `order_quarter`, `order_month`, `day_of_week`, `base_price`, `net_sales`, `tax`, `total_amount`

---

### 🛠️ Tools Used
* 🐍 **Python:** Pandas, NumPy *(Data Cleaning & Manipulation)*
* 📓 **Jupyter Notebook:** *(Interactive Development & Scripting)*
* 🐬 **MySQL:** *(Relational Database, EDA & Querying)*
* 🟡 **Power BI:** *(Data Modeling, DAX, and Visualizations)*

---

### ⚙️ Project Architecture & Workflow

#### 1. Data Cleaning (Jupyter Notebook)
* **Data Formatting:** Stripped whitespace from text columns and cleaned currency symbols (`$`) to convert pricing columns to float data types.
* **Handling Missing Data:** Identified and removed 200 duplicate records and dropped rows with null values to maintain data integrity.
* **Time-Series Extraction:** Converted dates to standard datetime formats and extracted `Order_Year`, `Order_Quarter`, `Order_Month`, and `Day_Of_Week`.

#### 2. Feature Engineering
* **Financial Calculations:** Logically generated new business columns:
  * `Base_Price` = Quantity × Unit Price
  * `Net_Sales` = Base Price – Discount Amount
  * `Tax` = Net Sales × 0.08 *(Standardized 8% tax rate)*
  * `Total_Amount` = Net Sales + Tax + Shipping Cost
* **Export:** Saved the refined dataset as `Walmart_Cleaned_Data.csv` for database insertion.

---

### 🔍 SQL Analysis
MySQL was used to query the cleaned dataset to explore customer, product, and operational performance.

**Key SQL Queries Executed:**
* **Overall Summary:** Total orders, total revenue, and total profit.
* **Year-Over-Year Growth:** Yearly revenue and profit tracking.
* **Quarterly Trends:** Q1, Q2, Q3, Q4 performance breakdowns.
* **Monthly Trends:** Granular monthly sales patterns.
* **Customer Behavior:** Spending differences between 'Member' and 'Normal' customers.
* **Geographic Performance:** Top 5 performing cities and states.
* **Category Revenue:** Profit and sales grouped by product category.
* **Top Selling Products:** Identifying highest-volume products.
* **Day-of-Week Analysis:** Tracking peak shopping days.
* **Order Status:** Cancellation rates and percentage shares.

**📌 Sample Query (Top 5 Best-Selling Products):**
```sql
SELECT 
    product_name,
    category,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(total_amount), 2) AS total_sales
FROM salestable
GROUP BY product_name, category
ORDER BY total_quantity_sold DESC
LIMIT 5;
```

---

### 📈 Power BI Dashboard Breakdown

The dashboard is designed with an intuitive and interactive interface to translate complex datasets into visually compelling business intelligence. It is divided into three core reporting pages:

#### 🔵 PAGE 1 — Business Performance Overview

* **KPI Overview:**
 * **Total Sales:** 38.30M
   * **Total Orders:** 50K
   * **Total Quantity Sold:** 250K
   * **Total Profit:** 11.53M
   * **Average Order Value (AOV):** 761.40

* **Monthly Sales & Profit Trend**
  * Sales fluctuate steadily around the 1M mark monthly.
  * Strong peaks observed around October and April.
  * Lowest dip occurs in February.

* **Category-Wise Revenue**
  * **Top performing categories:**
    * **Health & beauty:** 7.3M
    * **Fashion accessories:** 6.3M
    * **Electronic accessories:** 6.2M
    * **Sports & travel:** 6.2M

* **Sales by Customer Type**
  * Customer Revenue Distribution:
    * **Normal Customers:** 50.25% (19.25M)
    * **Member Customers:** 49.75% (19.06M)


#### 🟣 PAGE 2 — Product & Category Insights

* **Top 10 Selling Products**
  * Examples:
    * Bluetooth Speaker
    * Sunglasses
    * Body Wash
    * Wallet
    * Wrist Watch

* **Price vs Quantity (Bubble Chart)**
  * Scattered distribution showing correlation between Unit Price (230-260 range) and Sales.
  * Mid-to-high priced items (like Bluetooth Speakers) maintain strong sales volumes.

* **Quantity Sold by Category**
  * **Health & beauty** leads massively in volume (47.7K items).
  * **Home & lifestyle** has the lowest quantity sold (39.6K items).

* **Top 10 Profit-Driving Products**
  * Top contributors to profit:
     * Wrist Watch
     * Bluetooth Speaker
     * Sunglasses
     * Dumbbells
     * Water Bottle


#### 🟩 PAGE 3 — Regional Sales Analysis##

* **Regional Performance Map**
  * Highest sales clusters around:
    * West Coast USA (San Francisco, Los Angeles, San Diego)
    * Texas & Midwest (Dallas, San Antonio, Kansas City)
    * Canada (Vancouver, Ottawa, Brampton)
    * Mexico (Mexico City, Zapopan)

* **Monthly Sales Trends by Country**
  * USA consistently drives the highest monthly revenue (~1.8M avg).
  * Canada holds the second spot (~1.0M avg), followed by Mexico.

* **Sales Performance Distribution (Decomposition Tree)**
  * Top contributors:
    * Country: USA (2.17M contribution in current view)
    * State: Missouri, California, New York
    * City: San Diego, Los Angeles, San Jose

* **Regional Sales & Profit Summary**
  * Highest performing states/provinces:
    * British Columbia
    * Ontario
    * Missouri
    * California
---

### 💼 Key Business Insights & Strategic Recommendations

#### 💰 Sales & Profitability
* The company generated a solid 38.30M in total sales with 11.53M in profit.
* **Health & beauty** is the standout category, driving both the highest revenue (7.3M) and highest sales volume.
* Sales experience notable peaks in Q2 (April) and Q4 (October), suggesting the need for optimized inventory stocking ahead of these high-demand periods.

#### 🛒 Customer Behavior
* Revenue is almost perfectly split between **Normal (50.25%)** and **Member (49.75%)** customers, showing a balanced customer base.
* The Average Order Value (AOV) stands strong at 761.40, indicating customers generally buy mid-to-high ticket items or bulk quantities.

#### 📦 Product Insights
* **Bluetooth Speakers, Sunglasses, and Body Wash** are the absolute top sellers by revenue.
* Interestingly, **Wrist Watches and Bluetooth Speakers** drive the highest pure profit for the business, making them key items for promotional campaigns.

#### 🌍 Geography Insights
* The **USA** is the strongest region by a large margin, especially in cities like San Diego and Los Angeles.
* Canadian provinces like **British Columbia and Ontario** are also massive revenue drivers and should be prioritized for regional marketing.


### 📁 Repository Structure

```text
📦 Walmart-Sales-Analytics
 ┣ 📜 Data Transformation.ipynb      
 ┣ 📜 MySQL Analysis Queries.sql     
 ┣ 📄 Walmart_Cleaned_Data.csv      
 ┣ 📊 Walmart_Sales_Dashboard.pbix
 ┗ 📖 README.md                      
```

---

### 🔮 Future Enhancements
* **Predictive Sales Forecasting:** Implement machine learning models to predict future sales trends and revenue.
* **RFM Customer Segmentation:** Group customers based on Recency, Frequency, and Monetary value for targeted marketing campaigns.
* **Market Basket Analysis:** Analyze which products are frequently bought together to optimize cross-selling and bundling strategies.
* **Automated ETL Pipeline:** Transition the manual Python cleaning script into a fully automated cloud-based ETL pipeline.

---

