select 
	distinct p.product_id as Hotwax_id,
    gi_sub.id_value as NetsuitId,
    gi_sub_prod.id_value as SHopifyId
    from product p
join (
select 
	 id_value,	
	product_id
    from good_identification gi where gi.GOOD_IDENTIFICATION_TYPE_ID='ERP_ID'
) as gi_sub on gi_sub.product_id=p.product_id
join (
select 
	 id_value,	
	product_id
    from good_identification gi where gi.GOOD_IDENTIFICATION_TYPE_ID='SHOPIFY_PROD_ID'
) as gi_sub_prod on gi_sub_prod.product_id=p.product_id;
