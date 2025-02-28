SELECT 
  oh.order_id,
  oh.grand_total,
  opp.payment_method_type_id,
  sso.shopify_order_id 
FROM order_header oh 
JOIN order_payment_preference opp 
ON opp.order_id=oh.order_id 
JOIN shopify_shop_order sso
ON oh.order_id=sso.order_id
WHERE oh.status_id='ORDER_CREATED';
