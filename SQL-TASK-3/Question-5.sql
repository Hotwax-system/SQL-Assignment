SELECT distinct (ri.return_id) as Return_id,
	   rh.entry_date,
       ra.return_adjustment_type_id,
       ra.amount,
       ra.comments,
       ri.order_id,
       oh.order_date,
       rh.return_date,
       oh.product_store_id
FROM return_item ri
JOIN return_adjustment ra ON ra.return_id = ri.return_id
JOIN return_header rh ON rh.return_id = ri.return_id
JOIN order_header oh ON oh.order_id = ri.order_id;
