WITH Brand_Revenue AS (
  SELECT 
    p.category,
    p.brand,
    SUM(oi.sale_price) as brand_revenue
  FROM `thelook_ecommerce.order_items` oi
  JOIN `thelook_ecommerce.products` p ON oi.product_id = p.id
  WHERE oi.status = 'Complete' 
    AND oi.delivered_at BETWEEN '2026-01-01' AND '2026-03-31'
    AND p.category IN (SELECT category FROM `thelook_ecommerce.Top categories by revenue` LIMIT 3)
  GROUP BY 1, 2
)

SELECT * FROM Brand_Revenue
ORDER BY category, brand_revenue DESC
