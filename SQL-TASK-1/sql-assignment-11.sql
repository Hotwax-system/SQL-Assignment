select 
	change_reason,
    	count(order_id) as total 
from order_status 
where status_id='ORDER_CANCELLED' and (status_datetime) >='2024-12-31' and date(status_datetime) <='2025-01-31' 
and year(status_datetime)=year(current_date())
group by CHANGE_REASON;
