select oi.order_id,
      oh.order_date,
      oi.status_id,
      oisg.facility_id,
      concat(min(oisgir.reserved_datetime), ' to ', max(oisgir.reserved_datetime)) as duration
from order_item oi
JOIN order_item_ship_group oisg ON oisg.order_id = oi.order_id
JOIN order_item_ship_grp_inv_res oisgir ON oisgir.order_id = oi.order_id and oisgir.order_item_seq_id = oi.order_item_seq_id and oisgir.ship_group_seq_id = oisg.ship_group_seq_id
JOIN order_header oh ON oh.order_id = oi.order_id
LEFT JOIN picklist_item pli ON pli.order_id = oi.order_id and pli.order_item_seq_id = oi.order_item_seq_id AND pli.ship_group_seq_id = oisgir.ship_group_seq_id and pli.inventory_item_id=oisgir.inventory_item_id
WHERE pli.picklist_bin_id is null
GROUP BY oi.order_id, oh.order_date, oi.status_id, oisg.facility_id;
