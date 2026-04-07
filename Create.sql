CREATE TABLE customers (
  customer_id   SERIAL PRIMARY KEY,
  name          VARCHAR(100),
  email         VARCHAR(150) UNIQUE,
  city          VARCHAR(80),
  signup_date   DATE
);

CREATE TABLE products (
  product_id    SERIAL PRIMARY KEY,
  product_name  VARCHAR(150),
  category      VARCHAR(80),
  unit_price    NUMERIC(10,2)
);

CREATE TABLE orders (
  order_id      SERIAL PRIMARY KEY,
  customer_id   INT REFERENCES customers(customer_id),
  product_id    INT REFERENCES products(product_id),
  quantity      INT,
  order_date    DATE,
  total_amount  NUMERIC(10,2)
);






# Finds which product categories drive the most revenue. The window function calculates each category's % share of total revenue.
SELECT
    p.category,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    ROUND(
      SUM(o.total_amount) * 100.0 /
      SUM(SUM(o.total_amount)) OVER (), 2
    ) AS revenue_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;



# Month-over-month revenue with percentage growth rate using the LAG window function. This feeds your Power BI line chart.
WITH monthly AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS revenue
  FROM orders
  GROUP BY 1
)
SELECT
  TO_CHAR(month, 'Mon YYYY') AS month,
  ROUND(revenue, 2) AS revenue,
  ROUND(
    (revenue - LAG(revenue) OVER (ORDER BY month))
    * 100.0 /
    NULLIF(LAG(revenue) OVER (ORDER BY month), 0)
  , 2) AS mom_growth_pct
FROM monthly
ORDER BY month;


# Identify your highest-value customers with total spend, order count, and average order value.

SELECT
    c.customer_id,
    c.name,
    c.city,
    COUNT(o.order_id)              AS total_orders,
    ROUND(SUM(o.total_amount), 2)  AS total_spent,
    ROUND(AVG(o.total_amount), 2)  AS avg_order_value,
    MIN(o.order_date)              AS first_order,
    MAX(o.order_date)              AS last_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.city
ORDER BY total_spent DESC
LIMIT 10;








# Year-over-year revenue comparison using LAG. This feeds your Power BI KPI card and YoY DAX measure.
WITH yearly AS (
  SELECT
    EXTRACT(YEAR FROM order_date)::INT  AS yr,
    SUM(total_amount)  AS revenue
  FROM orders
  GROUP BY 1
)
SELECT
  yr,
  ROUND(revenue, 2) AS revenue,
  ROUND(LAG(revenue) OVER
    (ORDER BY yr), 2)  AS prev_year_revenue,
  ROUND(
    (revenue - LAG(revenue) OVER (ORDER BY yr))
    * 100.0 /
    NULLIF(LAG(revenue) OVER (ORDER BY yr), 0)
  , 1)  AS yoy_growth_pct
FROM yearly
ORDER BY yr;




# Trailing 90-day rolling revenue using window frame syntax. Advanced SQL technique worth mentioning in interviews.
WITH daily AS (
  SELECT
    order_date,
    SUM(total_amount) AS daily_revenue
  FROM orders
  GROUP BY order_date
)
SELECT
  order_date,
  ROUND(daily_revenue, 2) AS daily_revenue,
  ROUND(
    SUM(daily_revenue) OVER (
      ORDER BY order_date
      ROWS BETWEEN 89 PRECEDING AND CURRENT ROW
    )
  , 2) AS rolling_90d_revenue
FROM daily
ORDER BY order_date;


















































































