select p.product_id,
       p.product_type_id,
       oh.product_store_id,
       oi.quantity AS TotalQuantity,
       p.internal_name,
       f.facility_id,
       f.external_id,
       f.facility_type_id,
       orh.order_history_id,
       orh.order_id,
       orh.order_item_seq_id,
       orh.ship_group_seq_id
from Order_Header oh JOIN order_item oi ON oi.order_id=oh.order_id
JOIN product p ON p.product_id=oi.product_id 
JOIN order_history orh ON orh.order_id=oi.order_id and oi.ORDER_ITEM_SEQ_ID = orh.ORDER_ITEM_SEQ_ID
JOIN order_item_ship_group oisg ON oisg.ship_group_seq_id=oi.ship_group_seq_id and oisg.order_id=oi.order_id
JOIN facility f ON f.facility_id=oisg.facility_id 
JOIN order_status os ON os.order_id=oh.order_id
WHERE os.status_id='ORDER_COMPLETED' and date(os.status_datetime)>=date('2023-08-01') AND date(os.status_datetime)<=date('2023-08-31');
