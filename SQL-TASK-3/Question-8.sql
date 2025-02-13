SELECT distinct(plr.party_id),
	   plr.role_type_id,
       per.first_name,
       per.last_name,
       pl.facility_id,
       CASE 
			WHEN plr.thru_date is null THEN 'ACtive'
            ELSE 'Inactive'
	   END AS User_Status
FROM picklist_role plr 
JOIN person per ON per.party_id=plr.party_id
JOIN picklist pl ON pl.picklist_id=plr.picklist_id;
       
       
			