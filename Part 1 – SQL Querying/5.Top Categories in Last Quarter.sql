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
      AND 
      FORMAT_TIMESTAMP('%B %Y',oi.delivered_at) IN 
      -- The 3 lastest months:
        (SELECT FORMAT_TIMESTAMP('%B %Y',d.Date) 
        FROM `thelook_ecommerce.Date` d
        ORDER BY Date DESC LIMIT 3) 
    GROUP BY product_id
  ) as sub
ON p.id = sub.product_id
GROUP BY category
ORDER BY Total_revenue
LIMIT 3
