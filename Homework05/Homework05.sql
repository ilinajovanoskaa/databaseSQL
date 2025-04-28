USE SEDC_ACADEMY_HOMEWORK
GO

-- 1. Declare a scalar variable for storing FirstName
DECLARE @FirstName NVARCHAR(50);

-- 2. Assign value 'Antonio' to the FirstName variable
SET @FirstName = 'Antonio';

-- 3. Find all Students having FirstName same as the variable
SELECT *
FROM Student
WHERE FirstName = @FirstName;

-- 4. Declare table variable to store StudentId, StudentName, and DateOfBirth
DECLARE @FemaleStudents TABLE (
    StudentId INT,
    StudentName NVARCHAR(100),
    DateOfBirth DATE
);

-- 5. Fill the table variable with all Female students
INSERT INTO @FemaleStudents (StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName + ' ' + LastName AS StudentName, DateOfBirth
FROM Student
WHERE Gender = 'Female';

-- (Optional) See what's inside @FemaleStudents
SELECT * FROM @FemaleStudents;

-- 6. Declare temp table for LastName and EnrolledDate
CREATE TABLE #MaleStudents (
    LastName NVARCHAR(50),
    EnrolledDate DATE
);

-- 7. Fill the temp table with Male students whose FirstName starts with 'A'
INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM Student
WHERE Gender = 'Male' AND FirstName LIKE 'A%';

-- (Optional) See what's inside #MaleStudents
SELECT * FROM #MaleStudents;

-- 8. Retrieve students from the temp table with LastName of exactly 7 characters
SELECT *
FROM #MaleStudents
WHERE LEN(LastName) = 7;

-- 9. Find all Teachers whose FirstName length is less than 5
--    and first 3 characters of FirstName and LastName are the same
SELECT *
FROM Teacher
WHERE LEN(FirstName) < 5
  AND LEFT(FirstName, 3) = LEFT(LastName, 3);
