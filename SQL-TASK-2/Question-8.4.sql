SELECT 
       p.product_id,
       p.product_name,
       ii.facility_id,
       ii.QUANTITY_ON_HAND_TOTAL,
       ii.available_to_promise_total,
       (ii.QaUANTITY_ON_HAND_TOTAL-ii.available_to_promise_total) as Difference
FROM inventory_item ii JOIN Product p ON ii.product_id=p.product_id;
