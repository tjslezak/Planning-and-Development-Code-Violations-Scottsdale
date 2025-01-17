
select * from [City_of_Scottsdale].[dbo].[np_CodeViolations]


  -- ViolationID seems to be unique, however, some violations have multiple ComplaintIDs associated with them

  select *
  from [City_of_Scottsdale].[dbo].[np_CodeViolations] as A
  inner join (

				 select
				 [_ComplaintID_]
				 ,count([_ComplaintID_]) as _count_
				  FROM [City_of_Scottsdale].[dbo].[np_CodeViolations]
				  group by [_ComplaintID_]

				  ) as B on B.[_ComplaintID_] = A.[_ComplaintID_]
  order by B._count_ desc