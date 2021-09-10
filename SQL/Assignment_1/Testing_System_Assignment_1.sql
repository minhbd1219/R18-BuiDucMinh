-- Tao database
drop database if exists testingsystem; 
create database testingsystem;
-- Su dung DB vua tao
use testingsystem;

-- Table 1
drop table if exists Department;
CREATE TABLE Department (
    DepartmentID TINYINT,
    DepartmentName VARCHAR(30)
);
-- Them du lieu vao bang 1
insert into Department values (1, 'Sales');
insert into Department values (2, 'Marketing');
-- Kiem tra
SELECT 
    *
FROM
    Department;	

-- Table 2
drop table if exists Position;
CREATE TABLE Position (
    PositionID TINYINT,
    PositionName VARCHAR(30)
);
insert into Position values (1, 'Dev');
insert into Position values (2, 'Test');
insert into Position values (3, 'Scrum Master');
insert into Position values (4, 'PM');
SELECT 
    *
FROM
    Position;	

-- Table 3
CREATE TABLE Account (
    AccountID INT,
    Email VARCHAR(30),
    Username VARCHAR(30),
    Fullname VARCHAR(30),
    DepartmentID TINYINT,
    PositionID TINYINT,
    CreateDate DATE
);

-- Table 4
CREATE TABLE Group1 (
    GroupID TINYINT,
    GroupName VARCHAR(30),
    CreatorID INT,
    CreateDate DATE
);

-- Table 5
CREATE TABLE GroupAccount (
    GroupID TINYINT,
    AccountID INT,
    JoinDate DATE
);

-- Table 6
CREATE TABLE TypeQuestion (
    TypeID INT,
    TypeName ENUM('Image', 'CAPTCHA')
);

-- Table 7
CREATE TABLE CategoryQuestion (
    CategoryID TINYINT,
    CategoryName ENUM('JAVA', '.NET', 'SQL', 'Postman', 'Ruby')
);
insert into CategoryQuestion values (1,'JAVA');
insert into CategoryQuestion values (2,'.NET');
insert into CategoryQuestion values (3,'SQL');
insert into CategoryQuestion values (4,'Postman');
insert into CategoryQuestion values (5,'Ruby');

-- Table 8
CREATE TABLE Question (
    QuestionID INT AUTO_INCREMENT,
    Content VARCHAR(30),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE
);

-- Table 9
CREATE TABLE Answer (
    AnswerID INT,
    Content VARCHAR(30),
    QuestionID INT,
    isCorrect ENUM('true', 'false')
);

-- Table 10
CREATE TABLE Exam (
    ExamID TINYINT,
    Code TINYINT,
    Title CHAR(30),
    CategoryID TINYINT,
    Duration VARCHAR(30),
    CreatorID INT,
    CreateDate DATE
);

-- Table 11
CREATE TABLE ExamQuestion (
    ExamID INT,
    QuestionID INT
);