select p.product_id,sp.shopify_product_id,gi.id_value from product p join good_identification gi on gi.PRODUCT_ID=p.product_id join shopify_product sp on sp.product_id=p.product_id;