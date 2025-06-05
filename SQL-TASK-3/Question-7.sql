-- Have to modify

select
	 f.facility_id,
     f.facility_name,
     count(oisg.order_id) as TOTAL_ONE_DAY_SHIP_ORDERS
FROM facility f
JOIN order_item_ship_group oisg ON oisg.facility_id = f.facility_id 
JOIN order_shipment os ON os.order_id = oisg.order_id
JOIN shipment s ON s.shipment_id = os.shipment_id
WHERE oisg.shipment_method_type_id='NEXT_DAY'
AND s.STATUS_ID='SHIPMENT_SHIPPED'
Group by oisg.facility_id;


     
