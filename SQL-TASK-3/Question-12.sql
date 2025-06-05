select
	oi.order_id,
    oh.order_date,
    oi.status_id,
    ii.facility_id,
    concat(min(oisgir.reserved_datetime),' to ',max(oisgir.reserved_datetime)) as Duration
from order_item oi JOIN order_header oh on oh.order_id=oi.order_id
JOIN order_item_ship_grp_inv_res oisgir ON oisgir.order_id=oi.order_id and oisgir.order_item_seq_id=oi.order_item_seq_id and 
oisgir.SHIP_GROUP_SEQ_ID = oi.SHIP_GROUP_SEQ_ID
JOIN inventory_item ii ON ii.inventory_item_id=oisgir.inventory_item_id
left join (select picklist_bin_id,primary_order_id,PRIMARY_SHIP_GROUP_SEQ_ID from picklist_bin ) as plb on plb.primary_order_id = oi.order_id and plb.PRIMARY_SHIP_GROUP_SEQ_ID = oi.SHIP_GROUP_SEQ_ID
where plb.picklist_bin_id is null
GROUP BY oi.order_id, oh.order_date, oi.status_id, ii.facility_id;
