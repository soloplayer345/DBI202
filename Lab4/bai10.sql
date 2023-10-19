select depNum,depName,locName
from dbo.tblDepartment join dbo.tblLocation 
on locNum in(
select locNum 
from dbo.tblDepLocation
where depNum in(
select depNum
from dbo.tblDepartment
where depName=N'Phòng Nghiên cứu và phát triển'))
where depName=N'Phòng Nghiên cứu và phát triển'