SELECT iid.reason_Enum_id,count(iid.REASON_ENUM_ID) as Total_order from order_header oh
JOIN inventory_item_detail iid on iid.order_id=oh.order_id 
WHERE oh.STATUS_ID='ORDER_CANCELLED' AND MONTH(oh.Entry_date) = MONTH(CURRENT_DATE)-1
AND YEAR(oh.Entry_date) =YEAR(CURRENT_DATE) 
group by iid.reason_Enum_id;
