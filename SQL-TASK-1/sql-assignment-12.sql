SELECT p.product_id,pf.minimum_stock as Threshold
FROM product p 
JOIN product_facility pf ON pf.product_id=p.product_id 
WHERE pf.MINIMUM_STOCK is not null;

-- SELECT p.product_id,pf.minimum_stock as Threshold
-- FROM product p 
-- JOIN product_facility pf ON pf.product_id=p.product_id 
-- JOIN facility f on p.facility_id=f.facility_id 
-- JOIN facility_type ft on ft.facility_type_id=f.facility_type_id
-- WHERE ft.PARENT_TYPE_ID='VIRTUAL_FACILITY';

