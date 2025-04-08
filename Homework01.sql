USE master
GO

CREATE DATABASE SEDCACADEMYDB
GO

USE SEDCACADEMYDB
GO

CREATE TABLE Student (
	Id INT NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	DateOfBirth NVARCHAR(20) NOT NULL,
	EnrolledDate NVARCHAR(20) NOT NULL,
	Gender NVARCHAR(20) NOT NULL,
	NationalIDNumber INT NOT NULL,
	StudentCardNumber INT NOT NULL
)
GO
SELECT * FROM dbo.Student

INSERT INTO dbo.Student(Id, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber) 
VALUES (1, 'Martina', 'Martinovska', '09.09.2005', '2025/04/08', 'Female', 202, 363) 
GO

CREATE TABLE Teacher (
	Id INT NOT NULL,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(40) NOT NULL,
	DateOfBirth NVARCHAR(20) NOT NULL,
	AcademicRank INT NOT NULL,
	HireDate NVARCHAR(20) NOT NULL
)
GO

SELECT * FROM dbo.Teacher

INSERT INTO dbo.Teacher(Id, FirstName, LastName, DateOfBirth, AcademicRank, HireDate) 
VALUES (11, 'Jovana', 'Joveska', '15.12.2000', 33, '2022/10/11') 
GO


CREATE TABLE Grade (
	Id INT NOT NULL,
	StudentID INT NOT NULL,
	CourseID INT NOT NULL,
	TeacherID INT NOT NULL,
	Grade INT NOT NULL,
	Comment NVARCHAR(90) NOT NULL,
	CreatedDate NVARCHAR(20) NOT NULL
)
GO

SELECT * FROM dbo.Grade

INSERT INTO dbo.Grade(Id, StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate) 
VALUES (5, 61, 96, 55, 10, 'Very good', '2025/03/19') 
GO


CREATE TABLE Course (
	Id INT NOT NULL,
	Names NVARCHAR(20) NOT NULL,
	Credit INT NOT NULL,
	AcademicYear NVARCHAR(20) NOT NULL,
	Semester NVARCHAR(20) NOT NULL,
)
GO

SELECT * FROM dbo.Course

INSERT INTO dbo.Course(Id, Names, Credit, AcademicYear, Semester) 
VALUES (22, 'Alice', 33, '2023-2024', 'Fall') 
GO


CREATE TABLE GradeDetails (
	Id INT NOT NULL,
	GradeID INT NOT NULL,
	AchievementTypeID INT NOT NULL,
	AchievementPoints INT NOT NULL,
	AchievementMaxPoints INT NOT NULL,
	AchievementDate NVARCHAR(25) NOT NULL
)
GO

SELECT * FROM dbo.GradeDetails

INSERT INTO dbo.GradeDetails(Id, GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate) 
VALUES (6, 4, 102, 60, 70, '2025-04-01' ) 
GO


CREATE TABLE AchievementType(
	ID INT NOT NULL,
	Names NVARCHAR(30) NOT NULL,
	Descriptions NVARCHAR(90) NOT NULL,
	ParticipationRate INT NOT NULL
)
GO

SELECT * FROM dbo.AchievementType

INSERT INTO dbo.AchievementType(ID, Names, Descriptions, ParticipationRate) 
VALUES (9, 'Spelling Bee', 'English spelling competition', 3) 
GO






