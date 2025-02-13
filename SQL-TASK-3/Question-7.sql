SELECT 
	  oisg.facility_id,
      f.facility_name,
      oh.entry_Date,
      count(oisg.order_id) as TOTAL_ONE_DAY_SHIP_ORDERS
FROM order_header oh
JOIN order_item_ship_group oisg ON oisg.order_id=oh.order_id
JOIN facility f ON f.facility_id=oisg.facility_id
WHERE MONTH(oh.entry_date)=MONTH(current_date)- 1
AND year(oh.entry_date) = year(current_date)
AND oisg.shipment_method_type_id='NEXT_DAY'
AND oh.status_id='ORDER_COMPLETED'
Group by f.facility_id,f.facility_name,oh.entry_Date;
