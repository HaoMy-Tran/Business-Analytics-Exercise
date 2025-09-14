SELECT 
  oi.user_id, 
  SUM(sale_price)/COUNT(*) as average_price 
FROM `thelook_ecommerce.order_items` oi
WHERE oi.status = 'Complete'
GROUP BY oi.user_id
ORDER BY average_price DESC
LIMIT 10
