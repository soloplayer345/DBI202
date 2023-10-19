select empName,depName,depRelationship
from dbo.tblDependent join dbo.tblEmployee
on dbo.tblEmployee.empSSN=dbo.tblDependent.empSSN
where DATEDIFF(YEAR,depBirthdate,GETDATE())>18 and depNum in(
select depNum
from dbo.tblDepartment
where depName=N'Phòng Nghiên cứu và phát triển')