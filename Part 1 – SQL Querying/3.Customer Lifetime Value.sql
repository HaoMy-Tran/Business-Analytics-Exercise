SELECT 
  user_id as User, 
  SUM(sale_price) as Total_revenue
FROM `thelook_ecommerce.order_items` oi
WHERE status = 'Complete'
GROUP BY user_id
ORDER BY Total_revenue DESC
