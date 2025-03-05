SELECT
	  os.order_id,
    os.order_item_seq_id,
    os.status_id as Current_status_id,
    os.status_datetime as Status_change_datetime,
    os.status_user_login as Changed_by
FROM order_status os WHERE os.order_item_seq_id is not null;
