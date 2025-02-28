select 
    HOUR(oh.order_date)+1 as Hours,
    count(oh.order_id) as total_order
from order_header oh 
where oh.status_id='ORDER_COMPLETED'
group by Hours
order by Hours;
