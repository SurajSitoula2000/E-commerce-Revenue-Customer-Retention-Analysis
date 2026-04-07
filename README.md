# E-commerce Revenue & Customer Retention Analysis

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black) \
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white) \
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white) \
![SQL](https://img.shields.io/badge/SQL-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)

## Problem Statement
E-commerce businesses generate large volumes of transaction
data but often lack visibility into revenue trends, customer
retention patterns, and customer lifetime value. Without
these insights, marketing budgets are wasted on the wrong
customers and churn goes undetected until it is too late.

This project builds a complete analytics pipeline to answer:
- Which product categories and time periods drive revenue?
- At which month do customers stop returning after their
  first purchase?
- Who are the high-value customers driving 80% of revenue?

---

## Dashboard Preview

### Page 1 — Revenue Overview
<img width="1338" height="754" alt="image" src="https://github.com/user-attachments/assets/04d7f2c8-a1d7-42d6-8cbf-1e3ffb0f8d21" />

### Page 2 — Customer Retention (Cohort Analysis)
<img width="1335" height="746" alt="image" src="https://github.com/user-attachments/assets/18d5c81e-076b-4cf2-990e-40da8d47b17c" />


### Page 3 — RFM Segmentation
<img width="1341" height="745" alt="image" src="https://github.com/user-attachments/assets/20008be5-2370-446a-82f7-f78b03520a75" />


### Page 4 — Customer Detail (Drill-through)
<img width="737" height="749" alt="image" src="https://github.com/user-attachments/assets/426879e7-59d1-4d28-8cf0-5940247d47c5" />

---

## Key Insights

| Insight | Finding |
|---------|---------|
| Total Revenue | $3.5M across 5,000 orders |
| Top Category | Beauty ($0.98M — 27.6% of revenue) |
| At Risk Revenue | $2.06M held by At Risk customers |
| Champions | 15.5% of customers, $1.34M revenue |
| Avg Order Value | $704 per transaction |
| Retention Focus | Months 1–3 show highest drop-off |

### Business Recommendations
1. **Re-engage At Risk customers** — $2M+ in revenue at
   risk of churn. Launch targeted email campaign immediately.
2. **Upsell Electronics category** — lowest revenue share
   (12.2%) despite high unit prices. Improve visibility.
3. **Reward Champions** — 15.5% of customers drive
   disproportionate value. Build a loyalty programme.

---


## Tech Stack

| Tool | Purpose |
|------|---------|
| PostgreSQL 18 | Database design and SQL analysis |
| Python (Faker, psycopg2) | Synthetic data generation |
| Power BI Desktop | Interactive dashboard |
| DAX | Time intelligence measures (YoY, MTD, Rolling 90D) |

---


## Project Structure

```
ecommerce-revenue-retention-analysis/
├── sql/
│   ├── 01_schema.sql              # Table creation
│   ├── 02_revenue_by_category.sql # Category analysis
│   ├── 03_monthly_trend.sql       # MoM revenue trend
│   ├── 04_top_customers.sql       # Top 10 customers
│   ├── 05_cohort_base.sql         # Cohort assignment
│   ├── 06_cohort_retention.sql    # Retention % by cohort
│   ├── 07_rfm_scores.sql          # RFM scoring with NTILE
│   ├── 08_rfm_summary.sql         # Segment aggregation
│   ├── 09_yoy_growth.sql          # YoY comparison
│   ├── 10_rolling_90d.sql         # Rolling 90-day revenue
│   └── 11_create_views.sql        # PostgreSQL views for Power BI
├── python/
│   └── generate_Ecommerce.py           # Synthetic data generator
├── powerbi/
│   └── E-commerce Revenue & Customer Retention Analysis.pbix   # Power BI report file
├── screenshots/
│   ├── page1_revenue.png
│   ├── page2_retention.png
│   ├── page3_rfm_segments.png
│   └── page4_customer_detail.png
└── README.md
```

---

## How to Reproduce

### Step 1 — Set up PostgreSQL
```sql
-- Run in pgAdmin Query Tool
-- Make sure you are connected to your 'ecommerce' database
\i sql/01_schema.sql
```

### Step 2 — Generate data
```bash
pip install faker psycopg2-binary
python python/generate_Ecommerce.py
```

### Step 3 — Create views
```sql
\i sql/11_create_views.sql
```

### Step 4 — Open Power BI
- Open `powerbi/E-commerce Revenue & Customer Retention Analysis.pbix`
- Update the PostgreSQL connection:
  Home → Transform data → Data source settings
  → Change localhost credentials if needed
- Click Refresh

---

## SQL Techniques Used

- **CTEs** (Common Table Expressions) for multi-step analysis
- **Window Functions** — LAG, NTILE, SUM OVER, ROWS BETWEEN
- **Cohort Analysis** — DATE_TRUNC, EXTRACT for month buckets
- **RFM Scoring** — NTILE(5) for Recency, Frequency, Monetary
- **Time Series** — Rolling 90-day revenue with window frames
- **Views** — PostgreSQL views for direct Power BI connection

---


## Power BI Features Used

- KPI cards with time intelligence targets
- Matrix visual with conditional formatting heatmap
- Drill-through from RFM segments to customer detail
- Cross-filtering across all visuals
- DAX measures: YoY Growth %, Revenue MTD, Rolling 90D
- Date Table with CALENDARAUTO() for time intelligence
- Row-level slicer for Year and Category filtering

---

## Author

**Suraj Sitoula** \
Data Analyst | Python | SQL | Power BI | PostgreSQL | MS-Excel

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/suraj-sitoula/)

---


---
## 🔖 Tags
#DataAnalytics #PowerBI #SQL #Python #BusinessIntelligence #DataVisualization
---

*Note: Data used in this project is synthetically generated
using the Faker library for portfolio demonstration purposes.*


