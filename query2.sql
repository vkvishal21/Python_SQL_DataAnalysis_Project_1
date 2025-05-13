-- Q2 : Find top 5 highest selling products

SELECT product_id, region, COUNT(product_id) AS count_products
FROM project_db
GROUP BY product_id, region
ORDER BY  count_products DESC
LIMIT 5;