SELECT 
  p.category, 
  SUM(sub.Revenue) as Total_revenue
FROM `thelook_ecommerce.products` p
LEFT JOIN
  (
    SELECT 
      product_id, 
      SUM(sale_price) as Revenue
    FROM `thelook_ecommerce.order_items` oi
    WHERE oi.status = 'Complete'
    GROUP BY product_id
  ) as sub
ON p.id = sub.product_id
GROUP BY category
ORDER BY Total_revenue DESC
