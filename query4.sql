-- Q4 : For each category which month has highest sales

WITH monthly_sales AS (
  SELECT category,
         DATE_FORMAT(order_date, '%Y-%m') AS month,
         SUM(selling_price) AS revenue
  FROM project_db
  GROUP BY category, month
),
ranked_sales AS (
  SELECT *,
         RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
  FROM monthly_sales
)
SELECT category, month, revenue
FROM ranked_sales
WHERE rnk = 1;
