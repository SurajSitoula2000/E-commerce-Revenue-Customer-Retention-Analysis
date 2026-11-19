
# 🛒 E-commerce Revenue & Customer Retention Analysis

### Turning transaction data into actionable business insights

[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Python](https://img.shields.io/badge/Python-Data_Generation-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![SQL](https://img.shields.io/badge/SQL-Analytics-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.postgresql.org/)

**An end-to-end analytics project to understand revenue performance, customer retention, and customer value through SQL, Python, and Power BI.**

</div>

---

## 1. 🧩 Components

The project brings together the following tools and analytical components:

| Component | Technology | Purpose |
|---|---|---|
| Database | PostgreSQL | Store and query customer, product, and order data |
| Data generation | Python, Faker | Generate realistic synthetic e-commerce data |
| Data analysis | SQL | Analyze revenue, customer behavior, cohorts, and RFM segments |
| Data visualization | Power BI | Build interactive dashboards and customer-level views |
| Business calculations | DAX | Create KPIs and time-intelligence measures |

### Key analytical techniques

- **Revenue analysis:** Category-wise revenue, average order value (AOV), and monthly trends.
- **Cohort analysis:** Group customers by their first purchase month and track retention over time.
- **RFM segmentation:** Classify customers using Recency, Frequency, and Monetary value.
- **Time intelligence:** Month-to-date (MTD), year-over-year (YoY), and rolling 90-day revenue.
- **SQL techniques:** CTEs, joins, aggregate functions, window functions (`LAG`, `NTILE`), and views.
- **Power BI features:** KPI cards, matrix visuals, conditional formatting, slicers, cross-filtering, and drill-through.

---

## 2. 🎯 Problem Statements

E-commerce businesses generate large volumes of order and customer data. However, without structured analysis, it can be difficult to understand what drives revenue and which customers are likely to stop purchasing.

This project addresses five key business questions:

1. **Revenue performance:** Which product categories contribute the most to total revenue?
2. **Sales trends:** How does revenue change month over month and year over year?
3. **Customer retention:** After the first purchase, how consistently do customers return?
4. **Customer value:** Who are the high-value customers contributing a significant share of revenue?
5. **Churn risk:** Which customers are becoming inactive and may need targeted re-engagement?

The objective is to convert transaction-level data into clear insights that support better marketing, sales, and customer-retention decisions.

---

## 3. 💡 Solution

The project follows an end-to-end data analytics workflow.

### Step 1 — Database creation and data preparation

- Designed relational tables for `customers`, `products`, and `orders` in PostgreSQL.
- Used primary keys and foreign keys to define relationships.
- Generated synthetic e-commerce records using Python and the Faker library.

### Step 2 — SQL analysis

Used PostgreSQL queries to extract business insights:

- Calculate total revenue, total orders, and average order value.
- Identify top-performing product categories.
- Analyze monthly revenue and month-over-month growth using `LAG()`.
- Identify top customers based on total spending and order activity.
- Calculate customer cohorts and monthly retention percentages.
- Assign RFM scores using `NTILE()` and summarize customer segments.
- Prepare analytical views for Power BI reporting.

### Step 3 — Customer cohort analysis

- Identify each customer's first purchase month.
- Assign customers to monthly cohorts.
- Track repeat purchases in subsequent months.
- Calculate retention percentages to identify when customer activity drops.

### Step 4 — RFM customer segmentation

Customers are evaluated using three metrics:

| Metric | Meaning | Business use |
|---|---|---|
| Recency (R) | How recently a customer purchased | Identify inactive customers |
| Frequency (F) | How often a customer purchased | Identify repeat buyers |
| Monetary (M) | How much a customer spent | Identify high-value customers |

Based on their RFM scores, customers are grouped into segments such as **Champions**, **At Risk**, and other customer-value categories.

### Step 5 — Power BI dashboard

The Power BI report presents the analysis through four pages:

| Dashboard page | Purpose |
|---|---|
| Revenue Overview | Monitor revenue, orders, category performance, and trends |
| Customer Retention | Understand cohort-wise customer retention |
| RFM Segmentation | Compare customer segments and their revenue contribution |
| Customer Detail | Explore individual customer information using drill-through |

DAX measures support KPI calculations and time-based comparisons, including YoY growth, MTD revenue, and rolling 90-day revenue.

---

## 4. 📁 Folder Structure

The repository currently contains the following main files and folders:

```text
E-commerce-Revenue-Customer-Retention-Analysis/
│
├── PowerBI/
│   └── Power BI report and dashboard files
│
├── Cohort.sql
│   └── Customer cohort and retention analysis
│
├── Create.sql
│   └── Database table creation and SQL analysis queries
│
├── Ecommerce.ipynb
│   └── Python notebook for project data generation
│
├── Rfm.sql
│   └── RFM scoring and customer segmentation
│
└── README.md
    └── Project documentation
```

---

## 5. 📊 Outcomes

The analysis produced the following key findings from the project's synthetic dataset:

| Business metric | Result |
|---|---:|
| Total revenue | **$3.5M** |
| Total orders | **5,000** |
| Top revenue category | **Beauty — $0.98M (27.6%)** |
| Revenue associated with At Risk customers | **$2.06M** |
| Champion customer share | **15.5% of customers** |
| Champion customer revenue | **$1.34M** |
| Average order value | **$704** |

### Key business insights

- **Customer retention:** The highest customer drop-off occurs during months 1–3, highlighting the importance of early engagement after the first purchase.
- **At Risk customers:** Approximately $2.06M in revenue is associated with the At Risk segment, making customer re-engagement a priority.
- **High-value customers:** Champions represent 15.5% of customers and contribute approximately $1.34M in revenue.
- **Category performance:** Beauty is the leading category, contributing 27.6% of total revenue.
- **Growth opportunity:** Electronics contributes a relatively smaller revenue share (12.2%), indicating an opportunity to improve category visibility and promotion.

### Recommended business actions

1. **Re-engage At Risk customers:** Run targeted email campaigns and personalized offers to encourage repeat purchases.
2. **Reward Champions:** Introduce loyalty benefits and exclusive offers for high-value customers.
3. **Improve early retention:** Create post-purchase engagement campaigns during the first three months.
4. **Strengthen category performance:** Review product visibility and promotional strategies for lower-contributing categories.

---

<div align="center">

### 👨‍💻 Project Author

**Suraj Sitoula**  
Data Analyst | SQL | Python | PostgreSQL | Power BI

[![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github)](https://github.com/SurajSitoula2000/E-commerce-Revenue-Customer-Retention-Analysis)

</div>

> **Note:** The dataset used in this project is synthetically generated with the Faker library for learning and portfolio demonstration purposes. The reported metrics represent the project's generated dataset and are not actual business results.
'''
