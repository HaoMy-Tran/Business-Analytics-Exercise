WITH cte AS (
SELECT 
  p.id,
  p.brand,
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
)
SELECT 
  SUM(cte.Revenue) as Total_revenue,
  cte.brand 
FROM cte
GROUP BY brand
ORDER BY Total_revenue DESC
LIMIT 5
