select depName,depBirthdate,empName from dbo.tblDependent join dbo.tblEmployee on dbo.tblEmployee.empSSN in(select empSSN from dbo.tblDependent where depSex='M')where depSex='M' ;
