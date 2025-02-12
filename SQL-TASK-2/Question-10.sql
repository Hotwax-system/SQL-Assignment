SELECT oh.sales_channel_enum_id,count(oh.order_id),oh.grand_total,oh.Entry_date
FROM order_header oh
Group By oh.order_id;