SELECT distinct (ri.return_id),
	   oi.order_id,
       oh.product_store_id,
       (SELECT os.status_datetime FROM order_status os WHERE os.order_id=oi.order_id
       ORDER BY os.status_datetime desc limit 1) as status_datetime,
       oh.order_name,
       rh.from_party_id,
       rh.entry_date,
       rh.return_date,
       rh.return_channel_enum_id
FROM order_item oi
JOIN order_header oh ON oh.order_id=oi.order_id
JOIN return_item ri ON oi.order_id=ri.order_id
JOIN return_header rh ON rh.return_id=ri.return_id
JOIN order_status os ON os.order_id=oi.order_id;
