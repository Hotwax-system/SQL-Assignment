SELECT f.facility_id,
	   f.facility_name,
       count(oi.order_id) as total_orders,
       sum(oi.quantity * oi.unit_price) as total_revenue
FROM order_item oi
JOIN order_item_ship_group oisg ON oisg.order_id=oi.order_id
JOIN facility f ON oisg.facility_id=f.facility_id 
WHERE oi.status_id='ITEM_COMPLETED'
GROUP BY f.facility_id;