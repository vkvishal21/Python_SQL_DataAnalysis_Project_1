-- Q3 : Find month-over-month growth comparison for 2022

WITH monthly AS (
  SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
         SUM(selling_price) AS revenue
  FROM project_db
  WHERE YEAR(order_date) = 2022
  GROUP BY month
),
growth AS (
  SELECT month, revenue,
         LAG(revenue) OVER (ORDER BY month) AS prev
  FROM monthly
)
SELECT month, revenue, prev,
       ROUND((revenue - prev)/prev * 100, 2) AS mom_growth
FROM growth;


