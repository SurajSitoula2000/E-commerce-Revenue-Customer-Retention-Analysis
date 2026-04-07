# Score each customer 1–5 on Recency, Frequency, and Monetary value using NTILE. Then assign a segment label.


CREATE OR REPLACE VIEW v_rfm AS


WITH rfm_base AS (
  SELECT
    customer_id,
    CURRENT_DATE - MAX(order_date) AS recency_days,
    COUNT(DISTINCT order_id) AS frequency,
    SUM(total_amount) AS monetary
  FROM orders
  GROUP BY customer_id
),
rfm_scored AS (
  SELECT *,
    NTILE(5) OVER (ORDER BY recency_days DESC) AS r_score,
    NTILE(5) OVER (ORDER BY frequency ASC)     AS f_score,
    NTILE(5) OVER (ORDER BY monetary ASC)      AS m_score
  FROM rfm_base
)
SELECT
  customer_id,
  recency_days,
  frequency,
  ROUND(monetary, 2) AS monetary,
  r_score, f_score, m_score,
  (r_score + f_score + m_score) AS rfm_total,
  CASE
    WHEN (r_score+f_score+m_score) >= 13 THEN 'Champions'
    WHEN (r_score+f_score+m_score) >= 10 THEN 'Loyal'
    WHEN (r_score+f_score+m_score) >= 7  THEN 'At Risk'
    WHEN (r_score+f_score+m_score) >= 4  THEN 'Dormant'
    ELSE 'Lost'
  END  AS segment
FROM rfm_scored
ORDER BY rfm_total DESC;


# Aggregate segments to prove the Pareto principle: top 20% customers = 80% of revenue.

WITH rfm_base AS (
  SELECT customer_id,
    CURRENT_DATE - MAX(order_date) AS recency_days,
    COUNT(DISTINCT order_id)   AS frequency,
    SUM(total_amount)  AS monetary
  FROM orders GROUP BY customer_id
),
rfm_scored AS (
  SELECT *,
    NTILE(5) OVER (ORDER BY recency_days DESC) AS r,
    NTILE(5) OVER (ORDER BY frequency ASC)     AS f,
    NTILE(5) OVER (ORDER BY monetary ASC)      AS m
  FROM rfm_base
),
segmented AS (
  SELECT *,
    CASE
      WHEN (r+f+m) >= 13 THEN 'Champions'
      WHEN (r+f+m) >= 10 THEN 'Loyal'
      WHEN (r+f+m) >= 7  THEN 'At Risk'
      WHEN (r+f+m) >= 4  THEN 'Dormant'
      ELSE 'Lost'
    END AS segment
  FROM rfm_scored
)
SELECT
  segment,
  COUNT(*) AS customers,
  ROUND(SUM(monetary), 0) AS total_revenue,
  ROUND(AVG(monetary), 0) AS avg_revenue_per_customer,
  ROUND(
    SUM(monetary) * 100.0 /
    SUM(SUM(monetary)) OVER ()
  , 1)   AS revenue_pct
FROM segmented
GROUP BY segment
ORDER BY total_revenue DESC;


