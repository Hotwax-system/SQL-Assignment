SELECT distinct (ri.return_id) as Return_id,
       ra.return_adjustment_type_id,
       ra.amount,
       ra.comments,
       ri.order_id,
       oh.order_date,
       oh.product_store_id,
       rh.return_date,
       rh.entry_date
FROM return_item ri
JOIN return_adjustment ra ON ra.return_id=ri.return_id
JOIN return_header rh ON rh.return_id=ri.return_id
JOIN order_header oh ON oh.order_id=ri.order_id;


