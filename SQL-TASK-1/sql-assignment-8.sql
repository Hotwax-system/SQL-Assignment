select 
  oh.order_id,
  oh.status_id as order_status,
  opp.status_id as payment_status,
  s.status_id as shipment_status
FROM order_header oh 
JOIN order_payment_preference opp
ON opp.order_id=oh.order_id
JOIN order_shipment os 
ON os.order_id=oh.order_id 
JOIN shipment s
ON os.shipment_id = s.shipment_id
WHERE opp.status_id ='PAYMENT_SETTLED'
AND s.status_id != 'SHIPMENT_SHIPPED';

