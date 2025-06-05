SELECT 
  it.inventory_transfer_id,
  it.facility_id,
  it.facility_id_to,
  ii.product_id,
  it.quantity as REQUESTED_QUANTITY,
  oisgir.quantity as RESERVED_QUANTITY,
  it.send_date,
  it.status_id 
FROM Inventory_Transfer it JOIN inventory_item ii ON ii.inventory_item_id=it.inventory_item_id
LEFT JOIN order_item_ship_grp_inv_res oisgir ON oisgir.inventory_item_id=it.inventory_item_id
WHERE oisgir.quantity is null;
