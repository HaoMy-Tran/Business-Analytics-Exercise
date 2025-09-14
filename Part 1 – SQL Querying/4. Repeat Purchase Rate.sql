SELECT 
    ROUND(
        SUM(CASE WHEN order_count >= 2 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS repeat_purchase_rate
FROM (
    SELECT 
        user_id,
        COUNT(*) AS order_count
    FROM `thelook_ecommerce.order_items` oi
    WHERE status = 'Complete' 
    GROUP BY user_id
) AS customer_orders
