SELECT 
  (
    SUM(sub1.Q12026_revenue)/
    SUM(sub1.Q42025_revenue) - 1
  )
	*100 growth_percent
FROM (
SELECT 
	FORMAT_TIMESTAMP('%B %Y',d.Date) as Month,
  sub.Q42025_revenue,
  sub.Q12026_revenue
FROM `thelook_ecommerce.Date` d
LEFT JOIN (
  SELECT 
    FORMAT_TIMESTAMP('%B %Y',delivered_at) as Month,
    SUM(CASE WHEN oi.delivered_at BETWEEN '2025-10-01' AND '2025-12-31' THEN sale_price ELSE 0 END) Q42025_revenue,
    SUM(CASE WHEN oi.delivered_at BETWEEN '2026-01-01' AND '2026-03-31' THEN sale_price ELSE 0 END) Q12026_revenue
  FROM `thelook_ecommerce.order_items` oi
  WHERE oi.status = 'Complete'
  GROUP BY Month
) as sub
ON sub.Month = FORMAT_TIMESTAMP('%B %Y',d.Date)
) sub1
