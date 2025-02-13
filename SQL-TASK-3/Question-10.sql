SELECT p.product_id,
	   pf.facility_id,
       f.facility_type_id,
       ii.available_to_promise_total,
       ii.quantity_on_hand_total
FROM product p
JOIN product_facility pf ON pf.product_id=p.product_id
JOIN facility f ON f.facility_id=pf.facility_id
JOIN facility_type ft ON ft.facility_type_id=f.facility_type_id
JOIN inventory_item ii ON ii.product_id=p.product_id
WHERE ft.parent_type_id='VIRTUAL_FACILITY';



