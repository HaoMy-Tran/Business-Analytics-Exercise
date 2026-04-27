WITH customer_stats AS (
  SELECT 
    user_id, 
    SUM(sale_price) spending
  FROM `thelook_ecommerce.order_items`
  WHERE status = 'Complete' AND delivered_at BETWEEN '2026-01-01' AND '2026-03-31'
  GROUP BY user_id
),
ranked_customers AS (
  SELECT 
    *,
    PERCENT_RANK() OVER (ORDER BY spending ASC) AS p_rank
  FROM customer_stats
)

SELECT 
  user_id, 
  spending
FROM ranked_customers
WHERE p_rank >= 0.8 -- filter for the top 20 percentile of spending
ORDER BY spending DESC
