SELECT 
    oi.product_id,
    iid.inventory_item_id,
    iid.reason_enum_id,
    iid.effective_date,
    oisg.facility_id,
    SUM(oi.quantity) AS total_quantity
FROM order_item oi 
JOIN order_item_ship_group oisg ON oisg.order_id = oi.order_id 
JOIN inventory_item_detail iid ON iid.order_id = oi.order_id
WHERE iid.reason_enum_id IS NOT NULL
GROUP BY 
    oi.product_id, 
    iid.inventory_item_id, 
    iid.reason_enum_id, 
    iid.effective_date, 
    oisg.facility_id;
