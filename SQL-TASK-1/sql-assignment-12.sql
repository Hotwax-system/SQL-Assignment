select 
  p.product_id,
  pf.minimum_stock as Threshold
from product p 
join product_facility pf on p.product_id=pf.product_id 
join facility f ON f.facility_id=pf.facility_id
WHERE facility_type_id='CONFIGURATION'
order by pf.minimum_stock desc;
