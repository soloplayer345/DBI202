select depName,empName,depRelationship
from dbo.tblDependent join dbo.tblEmployee 
on dbo.tblDependent.empSSN = dbo.tblEmployee.empSSN
where depNum in(
select depNum
from dbo.tblDepartment
where depName = N'Phòng Nghiên cứu và phát triển')
and depSex ='F'