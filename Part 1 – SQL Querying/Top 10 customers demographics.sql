SELECT 
  id,
  age,
  CASE 
    WHEN age <= 18 THEN '<18'
    WHEN age <= 30 THEN '18-30'
    ELSE '>30' END AS age_group,
  gender,
  state,
  city,
  country,
  traffic_source
FROM `thelook_ecommerce.users` u
WHERE id IN (
  SELECT user_id FROM `thelook_ecommerce.6_Top 10 Customers by Average Order Price `
)
