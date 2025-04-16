USE SEDC_ACADEMY_HOMEWORK
GO

-- Calculate the count of all grades per Teacher in the system
SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY TeacherID

-- Calculate the count of all grades per Teacher in the system for the first 100 Students (ID < 100)
SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentID, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM Grade
GROUP BY StudentID

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater than 200
SELECT TeacherID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY TeacherID
HAVING COUNT(*) > 200

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT StudentID, COUNT(*) AS GradeCount, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM Grade
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade)

-- List Student First Name and Last Name next to the other details from the previous query
SELECT s.FirstName, s.LastName, g.StudentID, COUNT(*) AS GradeCount, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

-- Create a new view (vv_StudentGrades) that will list all StudentIds and the count of Grades per student
CREATE VIEW vv_StudentGrades AS
SELECT StudentID, COUNT(*) 
FROM Grade
GROUP BY StudentID
GO

-- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT
s.FirstName,
s.LastName,
g.Grade
FROM 
Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName, g.Grade
GO

-- List all rows from the view ordered by the biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY Grade DESC
GO
