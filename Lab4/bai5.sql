SELECT empName, empSSN
FROM dbo.tblEmployee
WHERE empSSN IN (
    SELECT supervisorSSN
    FROM dbo.tblEmployee
    WHERE empName = 'Mai Duy An'
);