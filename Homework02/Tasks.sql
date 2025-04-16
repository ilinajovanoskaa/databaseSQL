USE SEDC_ACADEMY_HOMEWORK
GO

-- Find all Students with FirstName = 'Antonio'
SELECT * 
FROM Student 
WHERE FirstName = 'Antonio'


--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * 
FROM Student
WHERE DateOfBirth > '1999-01-01'

-- Find all Students with LastName starting With ‘J’ enrolled in January 1998
SELECT *
FROM Student
WHERE LastName LIKE 'J%'
  AND EnrolledDate >= '1998-01-01'
  AND EnrolledDate < '1998-02-01'

-- List all Students ordered by FirstName
SELECT * FROM Student
ORDER BY FirstName ASC

--  List all Teacher Last Names and Student Last Names in single result set (no duplicates)
SELECT LastName 
FROM Teacher

UNION

SELECT LastName 
FROM Student

-- Create Foreign Key Constraints
-- List all possible combinations of Course names and AchievementType names
SELECT 
    Course.Name, 
    AchievementType.Name
FROM Course
CROSS JOIN AchievementType

-- List all Teachers without exam Grade
SELECT t.*
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
WHERE g.ID IS NULL
