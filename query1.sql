-- Q1 : Find top 10 highest revenue generating products

SELECT product_id, SUM(selling_price) AS revenue
FROM project_db
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;