SELECT p.product_id,p.internal_name,p.product_type_id,gi.id_value as NetSuitId FROM 
product p join good_identification gi on 
p.product_id=gi.product_id where gi.id_value is null OR gi.id_value='';
