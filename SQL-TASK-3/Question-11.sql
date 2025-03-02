SELECT 
  it.inventory_transfer_id,
  it.facility_id,
  it.facility_id_to,
  ii.product_id,
  l.quantity,
  ii.quantity_On_Hand_Total,
  it.send_date,
  it.status_id
FROM Inventory_Transfer it JOIN inventory_item ii ON ii.inventory_item_id=it.inventory_item_id
JOIN lot l ON l.inventory_item_id=it,inventory_item_id
