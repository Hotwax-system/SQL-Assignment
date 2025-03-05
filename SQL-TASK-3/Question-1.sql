SELECT 
       oi.order_id,
       oi.order_item_seq_id,
       oi.product_id,
       oh.sales_channel_enum_id,
       p.product_type_id,
       oh.order_date,
       oh.entry_date,
       oh.status_id,
       oh.order_type_id,
       oh.product_store_id
FROM order_item oi 
JOIN order_header oh ON oh.order_id=oi.order_id
JOIN product p ON p.product_id=oi.product_id
JOIN product_type pt ON p.product_type_id=pt.product_type_id
WHERE pt.is_physical='Y';
