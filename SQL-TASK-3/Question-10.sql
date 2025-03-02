SELECT ii.product_id,
       ii.facility_id,
       f.facility_type_id,
       ii.available_to_promise_total,
       ii.quantity_on_hand_total
FROM inventory_item ii
JOIN facility f ON f.facility_id=ii.facility_id
JOIN facility_type ft ON ft.facility_type_id=f.facility_type_id
WHERE ft.parent_type_id='VIRTUAL_FACILITY';



