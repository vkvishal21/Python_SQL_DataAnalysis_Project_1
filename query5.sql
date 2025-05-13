-- Q5 : which subcategory has the highest growth by profit in 2023 as compared to 2022

WITH yearly_profit AS (
  SELECT sub_category,
         YEAR(order_date) AS year,
         SUM(profit) AS total_profit
  FROM project_db
  WHERE YEAR(order_date) IN (2022, 2023)
  GROUP BY sub_category, year
),
profit_growth AS (
  SELECT a.sub_category,
         (b.total_profit - a.total_profit) / a.total_profit * 100 AS growth
  FROM yearly_profit a
  JOIN yearly_profit b ON a.sub_category = b.sub_category
  WHERE a.year = 2022 AND b.year = 2023
)
SELECT sub_category, growth
FROM profit_growth
ORDER BY growth DESC
LIMIT 1;
