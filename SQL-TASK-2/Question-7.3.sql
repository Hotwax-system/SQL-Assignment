SELECT f.facility_id,
	   f.facility_name,
       count(oh.order_id) as total_orders,
       sum(oh.GRAND_TOTAL) as total_revenue,
       concat(min(oh.order_date), ' to ', max(oh.order_date)) as date_range
FROM order_header oh
JOIN order_item_ship_group oisg ON oisg.order_id=oh.order_id
JOIN facility f ON oisg.facility_id=f.facility_id 
WHERE oh.status_id='ORDER_COMPLETED'
GROUP BY f.facility_id;
