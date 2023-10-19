SELECT TOP 1 dbo.tblWorksOn.empSSN, empName, SUM(workHours) AS sumhours
FROM dbo.tblWorksOn
JOIN dbo.tblEmployee ON dbo.tblEmployee.empSSN = dbo.tblWorksOn.empSSN
JOIN dbo.tblProject ON dbo.tblProject.proNum = dbo.tblWorksOn.proNum
GROUP BY dbo.tblWorksOn.empSSN, empName, dbo.tblProject.proName
ORDER BY sumhours desc;