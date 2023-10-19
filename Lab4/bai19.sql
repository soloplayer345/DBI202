select sum(workHours)as sumhours, dbo.tblWorksOn.empSSN,empName,depName
from dbo.tblWorksOn join dbo.tblEmployee 
on dbo.tblEmployee.empSSN=dbo.tblWorksOn.empSSN
join dbo.tblDepartment
on dbo.tblDepartment.depNum=dbo.tblEmployee.depNum
group by dbo.tblWorksOn.empSSN,empName,depName