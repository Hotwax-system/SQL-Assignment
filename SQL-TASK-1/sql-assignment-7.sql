-- Question : 7 Newly Created Sales Orders and Payment Methods
-- Business Problem:
-- Finance teams need to see new orders and their payment methods for reconciliation and fraud checks.

-- Fields to Retrieve:

-- ORDER_ID
-- TOTAL_AMOUNT
-- PAYMENT_METHOD
-- Shopify Order ID (if applicable)

SELECT 
  oh.order_id,
  oh.grand_total,
  opp.payment_method_type_id,
  oh.external_id as shopify_order_id
FROM order_header oh 
JOIN order_payment_preference opp 
ON opp.order_id=oh.order_id 
WHERE oh.status_id='ORDER_CREATED';
