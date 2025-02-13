SELECT distinct(per.first_name),
	   rh.FROM_PARTY_ID
FROM return_item ri
JOIN return_header rh ON ri.return_id=rh.return_id
JOIN person per ON per.party_id=rh.FROM_PARTY_ID
Group BY ri.order_id,rh.return_date,per.first_name,rh.FROM_PARTY_ID
HAVING count(ri.order_id)=1 AND month(rh.return_date)=month(current_date)-1 AND rh.FROM_PARTY_ID != '_NA_';