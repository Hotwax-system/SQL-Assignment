SELECT 
       ii.facility_id,
       ii.QUANTITY_ON_HAND_TOTAL,
       ii.available_to_promise_total,
       (ii.QUANTITY_ON_HAND_TOTAL-ii.available_to_promise_total) as Difference
FROM inventory_item ii;

