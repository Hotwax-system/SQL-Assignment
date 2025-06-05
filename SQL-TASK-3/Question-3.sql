SELECT 
    rh.from_party_id,
    per.first_name
FROM return_item ri
JOIN return_header rh ON ri.return_id = rh.return_id
JOIN person per ON per.party_id = rh.from_party_id
WHERE ri.order_id IN (
    SELECT order_id
    FROM return_item
    GROUP BY order_id
    HAVING COUNT(DISTINCT return_id) = 1
)
AND (rh.return_date >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d')
AND rh.return_date < DATE_FORMAT(CURDATE(), '%Y-%m-%d')) 
;
