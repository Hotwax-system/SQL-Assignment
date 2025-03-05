SELECT per.first_name,
       rh.FROM_PARTY_ID
FROM return_item ri
JOIN return_header rh ON ri.return_id=rh.return_id
JOIN person per ON per.party_id=rh.FROM_PARTY_ID
WHERE ri.order_id IN(select order_id FROM return_item GROUP BY order_id HAVING count(*)=1)
order by rh.FROM_PARTY_ID;
