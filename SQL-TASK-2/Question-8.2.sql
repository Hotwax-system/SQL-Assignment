SELECT  
	p.product_id,
	p.product_name,
       ii.facility_id,
       ii.QUANTITY_ON_HAND_TOTAL,
       ii.available_to_promise_total,
       pf.minimum_stock as REORDER_THRESHOLD
FROM product p 
JOIN inventory_item ii ON ii.product_id=p.product_id
JOIN product_facility pf ON pf.product_id=p.product_id
WHERE pf.minimum_stock > ii.QUANTITY_ON_HAND_TOTAL;
