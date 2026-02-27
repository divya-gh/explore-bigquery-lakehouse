--3️⃣ Join Data Lake with Data Warehouse
SELECT dc.name, pr.*
FROM `thelook_gcda.product_returns` pr
INNER JOIN `thelook_gcda.distribution_centers` dc
ON dc.id = pr.distribution_center_id;