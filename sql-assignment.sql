SELECT 
    p.party_id, 
    p.first_name, 
    p.last_name, 
    c.info_string AS email,
    t.contact_number AS phone
FROM person p
LEFT JOIN party_contact_mech pcm ON pcm.party_id = p.party_id
LEFT JOIN contact_mech c ON c.contact_mech_id = pcm.contact_mech_id
LEFT JOIN telecom_number t ON t.contact_mech_id = c.contact_mech_id 
JOIN party pa on pa.party_id=p.party_id JOIN party_role pr on pr.party_id=p.party_id
where pa.created_date >='2023-06-01' and pa.created_date <='2023-07-01' and pr.role_type_id='CUSTOMER';
