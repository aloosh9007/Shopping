<cfquery>
select * from users where usersfirst like '%%' and 1 = sleep(2) --'
</cfquery>