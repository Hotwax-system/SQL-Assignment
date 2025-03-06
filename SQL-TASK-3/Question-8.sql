SELECT distinct(plr.party_id),
	   per.first_name,
	   plr.role_type_id,
       pl.facility_id,
	   p.status_id as User_Status
FROM picklist_role plr 
JOIN person per ON per.party_id=plr.party_id
JOIN picklist pl ON pl.picklist_id=plr.picklist_id
JOIN party p ON p.party_id=plr.party_id;
