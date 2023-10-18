select proNum,proName,depName 
from dbo.tblProject 
join dbo.tblDepartment 
on dbo.tblDepartment.depNum 
in (select depNum 
from dbo.tblDepLocation 
where locNum in 
(select locNum 
from dbo.tblLocation 
where locName=N'TP Hồ Chí Minh'))
where locNum 
in (select locNum 
from dbo.tblLocation 
where locName=N'TP Hồ Chí Minh')