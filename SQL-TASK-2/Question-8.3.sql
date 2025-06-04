SELECT 
	distinct oi.order_id,
       oi.status_id AS order_status,
       oisg.facility_id,
       f.facility_name,
       f.facility_type_id,
       osh.shipment_id
FROM order_item oi
JOIN order_item_ship_group oisg ON oisg.order_id = oi.order_id and oisg.SHIP_GROUP_SEQ_ID=oi.SHIP_GROUP_SEQ_ID
JOIN facility f ON oisg.facility_id = f.facility_id
LEFT JOIN order_shipment osh on osh.order_id=oi.order_id and osh.ORDER_ITEM_SEQ_ID=oi.ORDER_ITEM_SEQ_ID
WHERE oi.status_id = 'ITEM_APPROVED' and
f.facility_type_id='RETAIL_STORE' and  osh.shipment_id is null;
