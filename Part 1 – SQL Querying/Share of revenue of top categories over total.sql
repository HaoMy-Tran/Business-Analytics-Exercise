SELECT SUM(Revenue)/
  (SELECT SUM(Total_revenue) FROM `thelook_ecommerce.5_Top Categories in Last Quarter `
) as Share_of_revenue
FROM `thelook_ecommerce.Total revenue in last quarter`
