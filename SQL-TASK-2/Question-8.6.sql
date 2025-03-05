SELECT oh.sales_channel_enum_id,
	   count(oh.order_id) as TOTAL_ORDERS,
       oh.grand_total as TOTAL_REVENUE,
       oh.Entry_date as REPORTING_PERIOD
FROM order_header oh
Group By oh.order_id;
