select sum(workHours)as sumhours, dbo.tblDepartment.depNum,depName
from dbo.tblWorksOn join dbo.tblEmployee 
on dbo.tblEmployee.empSSN=dbo.tblWorksOn.empSSN
join dbo.tblDepartment
on dbo.tblDepartment.depNum=dbo.tblEmployee.depNum
group by dbo.tblDepartment.depNum,depName