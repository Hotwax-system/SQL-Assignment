SELECT oh.order_id,
       oh.status_id AS order_status,
       oisg.facility_id,
       f.facility_name,
       f.facility_type_id
FROM order_header oh
JOIN order_item_ship_group oisg ON oisg.order_id = oh.order_id
JOIN facility f ON oisg.facility_id = f.facility_id
WHERE oh.status_id !='ORDER_COMPLETED' AND oh.status_id !='ORDER_CANCELLED';
