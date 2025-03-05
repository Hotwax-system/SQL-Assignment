select 
	change_reason,
    	count(order_id) as total 
from order_status 
	where status_id='ORDER_CANCELLED' AND status_datetime >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-%d')
AND status_datetime < DATE_FORMAT(CURDATE(), '%Y-%m-%d')
group by CHANGE_REASON;
