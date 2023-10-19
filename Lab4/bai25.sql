select sum(proNum) as sumproject,dbo.tblEmployee.empSSN,empName,depName
from dbo.tblWorksOn
join dbo.tblEmployee 
on dbo.tblEmployee.empSSN=dbo.tblWorksOn.empSSN
join dbo.tblDepartment 
on dbo.tblDepartment.depNum=dbo.tblEmployee.depNum
group by dbo.tblEmployee.empSSN,depName,empName
having sum(proNum)>=2