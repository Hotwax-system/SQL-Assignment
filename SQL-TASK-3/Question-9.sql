SELECT p.product_id,
	   p.internal_name,
       count(pf.facility_id) as FACILITY_COUNT
FROM product p JOIN product_facility pf
ON pf.product_id=p.product_id
Group by p.product_id;