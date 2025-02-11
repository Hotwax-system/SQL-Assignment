select oh.order_id,
oh.status_id as order_status,
opp.status_id as payment_status,
s.status_id
FROM order_header oh 
JOIN order_payment_preference opp
ON opp.order_id=oh.order_id
JOIN item_issuance ii 
ON ii.order_id=oh.order_id 
JOIN shipment s
ON ii.shipment_id = s.shipment_id
WHERE opp.status_id ='PAYMENT_SETTLED'
AND s.status_id != 'SHIPMENT_SHIPPED';



