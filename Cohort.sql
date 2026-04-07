## This takes your existing cohort retention query from your file and wraps it in CREATE OR REPLACE VIEW.


CREATE OR REPLACE VIEW v_cohort_retention AS

WITH first_purchase AS (
  SELECT
    customer_id,
    MIN(DATE_TRUNC('month', order_date)) AS cohort_month
  FROM orders
  GROUP BY customer_id
),
activity AS (
  SELECT
    o.customer_id,
    f.cohort_month,
    (
      EXTRACT(YEAR FROM o.order_date) -
      EXTRACT(YEAR FROM f.cohort_month)
    ) * 12 +
    (
      EXTRACT(MONTH FROM o.order_date) -
      EXTRACT(MONTH FROM f.cohort_month)
    )                                     AS month_num
  FROM orders o
  JOIN first_purchase f USING (customer_id)
),
cohort_size AS (
  SELECT
    cohort_month,
    COUNT(DISTINCT customer_id)           AS total_size
  FROM first_purchase
  GROUP BY cohort_month
)
SELECT
  TO_CHAR(a.cohort_month, 'Mon YYYY')     AS cohort,
  a.month_num,
  COUNT(DISTINCT a.customer_id)           AS retained,
  cs.total_size,
  ROUND(
    COUNT(DISTINCT a.customer_id) * 100.0
    / cs.total_size
  , 1)                                    AS retention_pct
FROM activity a
JOIN cohort_size cs
  ON a.cohort_month = cs.cohort_month
GROUP BY
  a.cohort_month,
  a.month_num,
  cs.total_size
ORDER BY
  a.cohort_month,
  a.month_num;



SELECT * FROM v_cohort_retention
ORDER BY cohort, month_num
LIMIT 20;
 