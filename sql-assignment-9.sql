SELECT COUNT(oh.order_id) AS Total_Order,SUM(oh.grand_total) FROM order_header oh 
JOIN order_item_ship_group oisg ON oh.order_id=oisg.order_id 
WHERE oisg.shipment_method_type_id='STOREPICKUP' AND YEAR(oh.Entry_date)=YEAR(current_date())-1
GROUP BY YEAR(oh.Entry_date);
