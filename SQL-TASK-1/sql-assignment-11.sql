select 
	distinct p.product_id,
  pf.minimum_stock as Threshold
from product p 
join product_facility pf on p.product_id=pf.product_id;
