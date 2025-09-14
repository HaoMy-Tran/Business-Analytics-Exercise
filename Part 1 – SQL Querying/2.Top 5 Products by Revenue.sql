SELECT 
  p.id,
  p.name,
  Revenue
FROM `thelook_ecommerce.products` p
LEFT JOIN (
  SELECT oi.product_id, SUM(sale_price) as Revenue
  FROM `thelook_ecommerce.order_items` oi
  WHERE oi.status = 'Complete'
  GROUP BY oi.product_id
) as sub
ON sub.product_id = p.id
ORDER BY Revenue DESC
LIMIT 5
