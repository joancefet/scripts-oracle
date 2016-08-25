
	select * from call_req  a
	left join ca_category_def b
	on a.category = b.category_uuid
	where ref_num = 142950
	