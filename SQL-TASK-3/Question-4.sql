SELECT COUNT(ri.return_id) as Total_Return,
	   SUM(ri.return_price * ri.return_quantity) as Return_Total,
       COUNT(a.return_id) as Total_appeasement,
       SUM(a.amount) as appeasement_Total
FROM return_item ri 
JOIN return_adjustment a ON a.return_id=ri.return_id;
