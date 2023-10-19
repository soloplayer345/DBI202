select empSSN,empName
from dbo.tblEmployee
where supervisorSSN in(
select empSSN
from dbo.tblEmployee
where empName=N'Mai Duy An'
)