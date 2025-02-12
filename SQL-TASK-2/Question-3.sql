SELECT 
    p.product_id,
    p.internal_name,
    pad.city,
    pad.state_province_geo_id,
    SUM(oi.quantity) AS Total_quantity_sold,
    SUM(oi.unit_price * oi.quantity) AS REVENUE
FROM product p 
JOIN order_item oi ON oi.product_id = p.product_id 
JOIN order_contact_mech ocm ON ocm.order_id = oi.order_id
LEFT JOIN postal_address pad ON pad.contact_mech_id = ocm.contact_mech_id
WHERE
pad.state_province_geo_id = 'NY' 
AND oi.status_id = 'ITEM_COMPLETED'
GROUP BY p.product_id,pad.city;



