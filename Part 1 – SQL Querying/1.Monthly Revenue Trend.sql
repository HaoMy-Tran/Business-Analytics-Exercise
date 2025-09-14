SELECT 
	FORMAT_TIMESTAMP('%B %Y',d.Date) as Month,
  sub.Revenue
FROM `thelook_ecommerce.Date` d
LEFT JOIN (
  SELECT 
    FORMAT_TIMESTAMP('%B %Y',delivered_at) as Month,
	  SUM(sale_price) as Revenue
  FROM `thelook_ecommerce.order_items` oi
  WHERE oi.status = 'Complete'
  GROUP BY Month
) as sub
ON sub.Month = FORMAT_TIMESTAMP('%B %Y',d.Date)
