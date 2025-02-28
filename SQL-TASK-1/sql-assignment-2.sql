SELECT 
  p.product_id,
  p.product_type_id,
  p.internal_name 
FROM product p 
JOIN product_type pt on p.product_type_id=pt.product_type_id 
where pt.is_physical='Y';	
