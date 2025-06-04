SELECT f.facility_id,
	   f.facility_name,
       count(oh.order_id) as total_orders,
       sum(oi.quantity*oi.unit_price) as total_revenue,
       concat(min(oh.order_date), ' to ', max(oh.order_date)) as date_range
FROM order_item_ship_group oisg 
join order_item oi on oi.ship_group_seq_id = oisg.SHIP_GROUP_SEQ_ID and oisg.order_id=oi.order_id
JOIN order_header oh ON oi.order_id=oh.order_id
JOIN facility f ON oisg.facility_id=f.facility_id 
WHERE oh.status_id='ORDER_COMPLETED'
GROUP BY f.facility_id;
