SELECT
  Date
FROM
  UNNEST(
    GENERATE_DATE_ARRAY(
      (SELECT 
        DATE(MIN(oi.delivered_at))
      FROM `business-analysis-exercise.thelook_ecommerce.order_items` AS oi
      ), 
      (SELECT 
        DATE(MAX(oi.delivered_at))
      FROM `business-analysis-exercise.thelook_ecommerce.order_items` AS oi
      ), 
      INTERVAL 1 MONTH
    )
  ) AS Date
