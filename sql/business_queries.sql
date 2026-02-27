-- 4️⃣ Business Insight Query (Returns by Category)
SELECT
  dc.name AS distribution_center,
  p.category,
  COUNT(*) AS product_return_count
FROM `thelook_gcda.product_returns` pr
INNER JOIN `thelook_gcda.distribution_centers` dc
  ON dc.id = pr.distribution_center_id
INNER JOIN `thelook_gcda.products` p
  ON p.id = pr.product_id
WHERE p.category = 'Jeans'
GROUP BY dc.name, p.category;