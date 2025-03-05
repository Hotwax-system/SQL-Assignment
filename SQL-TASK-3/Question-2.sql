SELECT ri.return_id,
       ri.order_id,
       oh.product_store_id,
       (SELECT os.status_datetime FROM order_status os WHERE os.order_id=ri.order_id
       ORDER BY os.status_datetime desc limit 1) as status_datetime,
       oh.order_name,
       rh.from_party_id,
       rh.return_date,
       rh.entry_date,
       rh.return_channel_enum_id
FROM return_header rh
JOIN return_item ri ON rh.return_id=ri.return_id 
JOIN order_header oh ON oh.order_id=ri.order_id
where ri.status_id='RETURN_COMPLETED';
