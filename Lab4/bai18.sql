SELECT
  TOP 1  COUNT(dbo.tblDependent.depName) AS NumberOfDependents,
    dbo.tblEmployee.depNum,
    dbo.tblDepartment.depName
FROM
    dbo.tblDependent,
    dbo.tblEmployee,
    dbo.tblDepartment
WHERE
    dbo.tblEmployee.empSSN = dbo.tblDependent.empSSN
    AND dbo.tblDepartment.depNum = dbo.tblEmployee.depNum
GROUP BY
    dbo.tblEmployee.depNum, dbo.tblDepartment.depName
Order by NumberOfDependents desc
