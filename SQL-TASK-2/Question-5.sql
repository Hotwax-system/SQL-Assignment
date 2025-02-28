SELECT p.product_id,
ii.inventory_item_id,
iid.reason_enum_id,
ii.facility_id,
count(p.product_id) as product_total
FROM product p JOIN inventory_item ii ON ii.PRODUCT_ID=p.PRODUCT_ID
JOIN inventory_item_detail iid ON iid.INVENTORY_ITEM_ID=ii.INVENTORY_ITEM_ID
WHERE iid.reason_enum_id is not null and iid.reason_enum_id='VAR_LOST' OR iid.reason_enum_id='REJ_RSN_DAMAGED'
Group By ii.facility_id,iid.INVENTORY_ITEM_ID,p.product_id,iid.REASON_ENUM_ID;
