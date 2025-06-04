select 
	distinct oh.order_id,
    pad.to_name,
    pad.city,
    pad.state_province_geo_id,
    pad.postal_code,
    oh.grand_total,
    oh.order_date,
    oh.status_id
from order_header oh join order_contact_mech ocm on ocm.order_id=oh.order_id
JOIN postal_address pad on pad.contact_mech_id = ocm.contact_mech_id 
WHERE pad.state_province_geo_id='NY' and ocm.CONTACT_MECH_PURPOSE_TYPE_ID='SHIPPING_LOCATION';
