SELECT per.first_name,
       rh.FROM_PARTY_ID
FROM return_item ri
JOIN return_header rh ON ri.return_id=rh.return_id
JOIN person per ON per.party_id=rh.FROM_PARTY_ID
WHERE ri.return_id IN(select return_id FROM return_item GROUP BY order_id HAVING count(*)=1)
AND rh.FROM_PARTY_ID != '_NA_';
