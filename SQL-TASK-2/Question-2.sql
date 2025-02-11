SELECT 
oh.order_id,
per.first_name,
per.last_name,
pad.address1,
pad.address2,
pad.city,
pad.state_province_geo_id,
pad.postal_code,
pad.country_geo_id,
oh.Entry_date 
FROM order_header oh
JOIN order_contact_mech ocm ON ocm.order_id=oh.order_id AND ocm.CONTACT_MECH_PURPOSE_TYPE_ID='SHIPPING_LOCATION'
JOIN party_contact_mech pcm ON pcm.contact_mech_id=ocm.contact_mech_id
JOIN postal_address pad ON pad.contact_mech_id=ocm.contact_mech_id
JOIN person per ON per.party_id=pcm.party_id
WHERE pad.state_province_geo_id='NY';
