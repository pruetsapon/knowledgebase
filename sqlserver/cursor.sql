--Creating a SQL Server cursor is a consistent process, so once you learn the steps you are easily able to duplicate them with various sets of logic to loop through data.--
--// open cursor
declare cursor_User cursor for 
select distinct
	Id
	,FullName
from User

--// declare variable
declare @Id int
declare @FullName varchar(100)

--// loop data from cursor
open cursor_User fetch from cursor_User into @Id, @FullName;
while (@@FETCH_STATUS = 0)
begin
	
    print @FullName

    --// next data from cursor
	fetch from cursor_User into @Id, @FullName;
end

--// clear cursor
close cursor_User;
deallocate cursor_User;