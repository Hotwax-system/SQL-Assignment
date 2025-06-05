select
      plr.party_id,
      per.first_name,
      plr.role_type_id,
	  pli.facility_id,
      CASE 
		WHEN  plr.thru_date is null or plr.thru_date >current_Date()
        THEN "Active"
        ELSE  "Inactive"
        END AS status
FROM picklist pli JOIN picklist_role plr 
ON pli.picklist_id = plr.picklist_id
JOIN person per ON per.party_id = plr.party_id
WHERE plr.role_type_id='WAREHOUSE_PICKER';
