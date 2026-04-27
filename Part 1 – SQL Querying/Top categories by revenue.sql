SELECT p.category,SUM(oi.sale_price) as Revenue
FROM `thelook_ecommerce.order_items` oi
JOIN `thelook_ecommerce.products` p ON oi.product_id = p.id
WHERE oi.status = 'Complete' 
  AND oi.delivered_at BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY 1
ORDER BY SUM(oi.sale_price) DESC
