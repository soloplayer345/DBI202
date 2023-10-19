select proNum,locName
from dbo.tblProject join dbo.tblLocation 
on dbo.tblLocation.locNum in
(
select locNum
from dbo.tblProject
where proName='ProjectA'
)
where proName='ProjectA'