select depName,depBirthdate,empName
from dbo.tblDependent join dbo.tblEmployee 
on dbo.tblEmployee.empSSN = dbo.tblDependent.empSSN
where DATEDIFF(YEAR,depBirthdate,GETDATE())>18
