SELECT 
  p.name AS product_name,
  SUM(oi.sale_price) AS revenue
FROM `thelook_ecommerce.order_items` oi
JOIN `thelook_ecommerce.products` p ON oi.product_id = p.id
WHERE oi.status = 'Complete' 
  AND oi.delivered_at BETWEEN '2026-01-01' AND '2026-03-31'
  AND p.brand IN (SELECT brand FROM `thelook_ecommerce.Revenue by brands in top categories` LIMIT 5)
GROUP BY 1
ORDER BY revenue DESC
