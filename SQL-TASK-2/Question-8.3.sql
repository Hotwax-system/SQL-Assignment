SELECT oi.order_id,
       oi.status_id AS order_status,
       ii.facility_id,
       f.facility_name,
       ft.parent_type_id
FROM order_item oi
JOIN order_item_ship_grp_inv_res oisgir ON oisgir.order_id = oi.order_id AND oi.ORDER_ITEM_SEQ_ID = oisgir.ORDER_ITEM_SEQ_ID
JOIN inventory_item ii ON ii.INVENTORY_ITEM_ID = oisgir.INVENTORY_ITEM_ID
JOIN facility f ON ii.facility_id = f.facility_id
JOIN facility_type ft ON ft.facility_type_id = f.facility_type_id;
