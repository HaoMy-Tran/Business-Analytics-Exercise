SELECT 
  tp.id,
  name,
  Revenue,
  sub.Profit
FROM `thelook_ecommerce.2_Top 5 Products by Revenue` tp
LEFT JOIN (
  SELECT 
    id, 
    retail_price - cost as Profit
  FROM `thelook_ecommerce.products` p
) as sub
ON sub.id = tp.id
ORDER BY Revenue DESC
