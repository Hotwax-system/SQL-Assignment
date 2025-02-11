SELECT * FROM product_facility;
SELECT * FROM facility_type;

SELECT p.product_id,pf.facility_id,ft.facility_type_id,pf.minimum_stock
FROM product p 
JOIN product_facility pf on pf.product_id=p.product_id 
JOIN facility_type ft on p.product_id=ft.product_id