SELECT p.product_id,
ii.inventory_item_id,
iiv.variance_reason_id,
ii.facility_id,
(-1*iiv.QUANTITY_ON_HAND_VAR) as QUANTITY_LOST_OR_DAMAGED
FROM product p JOIN inventory_item ii ON ii.PRODUCT_ID=p.PRODUCT_ID
JOIN inventory_item_variance iiv ON iiv.INVENTORY_ITEM_ID=ii.INVENTORY_ITEM_ID
WHERE iiv.variance_reason_id is not null and iiv.variance_reason_id='VAR_LOST' OR iiv.variance_reason_id='VAR_DAMAGED'
Group By ii.facility_id,p.product_id,iiv.variance_reason_id,ii.inventory_item_id,QUANTITY_LOST_OR_DAMAGED;
