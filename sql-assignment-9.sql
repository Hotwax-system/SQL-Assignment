SELECT 
DATE(oh.Entry_date) as Entry_date1,
HOUR(oh.Entry_date) as order_hour,
count(oh.order_id) as Total_order
from order_header oh
WHERE oh.status_id='ORDER_COMPLETED'
AND DATE(oh.Entry_date)=current_date()
group by Entry_date1,order_hour
order by Entry_date1,order_hour;


