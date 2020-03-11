with account as(
	select account_no
		  ,account_number
		  ,amount
		  ,row_number() over (partition by account_no order by account_no) as seq
	from Account
)
select 
	concat(
		concat('{
		"account_no":"',p.account_no,'",
		"account":['
		,'{"account_number":"'+a1.account_number+'","amount":'+concat(varchar(20),a1.amount)+'}'
		,'{"account_number":"'+a2.account_number+'","amount":'+concat(varchar(20),a2.amount)+'}'
		,']}'
	) as [json]
from personal as p
left join account as a1 on p.account_no = a1.account_no and a1.seq = 1
left join account as a2 on p.account_no = a2.account_no and a2.seq = 2