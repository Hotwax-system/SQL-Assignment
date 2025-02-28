  SELECT
   p.product_id,
  gi.id_value as NetSuitId,
  sp.shopify_product_id as shopify_id
FROM product p left join good_identification gi on p.product_id=gi.product_id 
join shopify_product sp on sp.product_id=p.product_id
where gi.id_value is not null and gi.good_identification_type_id='ERP_ID';
