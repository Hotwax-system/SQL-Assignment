SELECT DISTINCT oi.order_id,
       oi.order_item_seq_id,
       oi.product_id,
	p.product_type_id,
       oh.sales_channel_enum_id,
       oh.order_date,
       oh.entry_date,
       oh.status_id,
	CAST(os.status_datetime AS DATE) AS status_date_time,
       oh.order_type_id,
       oh.product_store_id
FROM order_header oh 
JOIN order_item oi ON oh.order_id = oi.order_id
JOIN product p ON p.product_id = oi.product_id
JOIN order_status os ON os.order_id = oh.order_id
JOIN product_type pt ON p.product_type_id = pt.product_type_id
WHERE pt.is_physical = 'Y' 
AND oh.status_id = 'ORDER_COMPLETED' 
AND oh.order_type_id = 'SALES_ORDER';
