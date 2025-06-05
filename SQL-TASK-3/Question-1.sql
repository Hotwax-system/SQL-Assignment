SELECT DISTINCT oi.order_id,
       oi.order_item_seq_id,
       oi.product_id,
	p.product_type_id,
       oh.sales_channel_enum_id,
       oh.order_date,
       oh.entry_date,
       oh.status_id,
	   mos.max_date as status_datetime,
       oh.order_type_id,
       oh.product_store_id
FROM order_header oh 
JOIN order_item oi ON oh.order_id = oi.order_id
JOIN product p ON p.product_id = oi.product_id
JOIN (
SELECT max(os.status_datetime) as max_date,os.order_id from order_status os group by os.order_id
) as mos ON mos.order_id=oi.order_id
JOIN product_type pt ON p.product_type_id = pt.product_type_id
WHERE pt.is_physical = 'Y' 
AND oh.status_id = 'ORDER_COMPLETED' 
AND oh.order_type_id = 'SALES_ORDER';
