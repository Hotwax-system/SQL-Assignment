SELECT oh.sales_channel_enum_id,
	   count(oh.order_id) as TOTAL_ORDERS,
      sum(oh.grand_total) as TOTAL_REVENUE,
       concat(min(oh.order_date), ' to ', max(oh.order_date)) as REPORTING_PERIOD
FROM order_header oh
Group By oh.sales_channel_enum_id;
