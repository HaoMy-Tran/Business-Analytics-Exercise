SELECT 
  FORMAT_TIMESTAMP('%B %Y',delivered_at) as Month,
	SUM(sale_price) as Revenue
FROM `thelook_ecommerce.order_items` oi
WHERE oi.status = 'Complete'
  AND 
    FORMAT_TIMESTAMP('%B %Y',oi.delivered_at) IN 
    -- The 3 lastest months:
      (SELECT FORMAT_TIMESTAMP('%B %Y',d.Date) 
      FROM `thelook_ecommerce.Date` d
      ORDER BY Date DESC LIMIT 3)
GROUP BY Month
