select proNum,proName,depName
from dbo.tblProject
join dbo.tblDepartment on dbo.tblDepartment.depName=N'Phòng Phần mềm trong nước'
where dbo.tblProject.depNum in (
select depNum 
from dbo.tblDepartment
where depName=N'Phòng Phần mềm trong nước'
)