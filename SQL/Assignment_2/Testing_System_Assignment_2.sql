-- Tao database
drop database if exists testingsystem; 
create database testingsystem;
-- Su dung DB vua tao
use testingsystem;

--------------------------------------------------------------------------------------------------------------
-- Table 1
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(30) unique key
);

insert into Department (DepartmentName) values ('Sale'), ('Marketing'), ('IT'), ('Accountant'), ('Manager');
select *from Department order by DepartmentID ASC;
--------------------------------------------------------------------------------------------------------------
-- Table 2
DROP TABLE IF EXISTS  `Position`;
CREATE TABLE `Position` (
    PositionID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName ENUM ('Dev', 'Test', 'Scrum Master', 'PM','QA') 
);

insert into `Position` (PositionName) values ('Dev'), ('Test'),('Scrum Master'),('PM'), ('QA');											                                          																					
select * from `Position`;
--------------------------------------------------------------------------------------------------------------
-- Table 3
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID INT UNSIGNED UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Age INT,
    Email VARCHAR(30) UNIQUE KEY,
    Username VARCHAR(30) NOT NULL unique key,
    FullName VARCHAR(30) not null,
    DepartmentID TINYINT UNSIGNED not null,
    PositionID TINYINT UNSIGNED not null,
    CreateDate DATE ,
    FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID) ON DELETE CASCADE,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ON DELETE CASCADE
);
insert into Account(Email, Username, DepartmentID, PositionID, Fullname) values 
('vtiedu@gmail.com','admin',12,12,'A'),  ('vtiedu@gmail.com1','admin1',12,0,'B'),  ('vtiedu@gmail.com2','admin2',12,13,'Nguyen Van A'),
('root@gmail.com','root',21,21,'A'),     ('root@gmail.com1','root1',21,22,'B');  
select * from `Account`;
--------------------------------------------------------------------------------------------------------------

-- Table 4
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID TINYINT UNSIGNED UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(30) unique key,
    CreatorID INT UNSIGNED not null,
    CreateDate DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

insert into `Group` (CreatorID,GroupName) values (11,'Artist'),  
												 (12,'Science'), 
                                                 (13,'AI'),      
                                                 (14,'ML'),      
                                                 (15,'Bigdata');
select * from `Group`;
--------------------------------------------------------------------------------------------------------------

-- Table 5
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID TINYINT UNSIGNED,
    AccountID INT  UNSIGNED,
    JoinDate DATE,
    PRIMARY KEY (GroupID , AccountID),
    FOREIGN KEY (GroupID) 	REFERENCES `Group`(GroupID) ON DELETE CASCADE,
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

insert into GroupAccount (GroupID, AccountID, JoinDate) values 	(1, 10,'2021-08-07'),
																(2, 11,'2021-08-08'), 
																(3, 12,'2021-08-09'), 
																(4, 13,'2021-08-10'), 
																(5, 14,'2021-08-11');
select * from GroupAccount;
--------------------------------------------------------------------------------------------------------------

-- Table 6
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR (30)
);

insert into TypeQuestion(TypeID,TypeName) values 	(1, 'Multiple Choice'), 
													(2, 'Text Question'),   
													(3, 'Rank Order'),      
													(4, 'Image'),          
													(5, 'CAPTCHA');
select*from TypeQuestion;                                           
--------------------------------------------------------------------------------------------------------------

-- Table 7
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName ENUM('Java', '.NET', 'SQL', 'Postman', 'Ruby') not null
);
insert into CategoryQuestion(CategoryID, CategoryName) values (1,'Java'),(2,'.NET'),(3,'SQL'),(4,'Postman'),(5,'Ruby');
select*from CategoryQuestion;
--------------------------------------------------------------------------------------------------------------

-- Table 8
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(30) not null,
    CategoryID TINYINT UNSIGNED not null,
    TypeID INT UNSIGNED not null,
    CreatorID INT UNSIGNED not null,
    CreateDate DATE ,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE,
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID) ON DELETE CASCADE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

insert into Question(CategoryID, Content, CreatorID,TypeID) values  (1, 'Multiple Choice',11,20),
																	(2, 'Text Question',12,21),   
																	(3, 'Rank Order',13,22),    
																	(4, 'Image',14,23),         
																	(5, 'CAPTCHA',15,24);
select *from Question;                                                            
--------------------------------------------------------------------------------------------------------------

-- Table 9
CREATE TABLE Answer (
    AnswerID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(200) not null,
    QuestionID INT UNSIGNED ,
    isCorrect ENUM('True', 'False') not null,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID) ON DELETE CASCADE
);

insert into Answer(Content, QuestionID, isCorrect) values 
										        ('A',1,'True'),  
												('AB',2,'False'), 
                                                ('ABC',3,'False'), 
                                                ('ABCD',4,'True'),  
                                                ('ABCDE',5,'True');
select * from Answer;                                                
--------------------------------------------------------------------------------------------------------------
-- Table 10
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CODE1 TINYINT,
    Title VARCHAR(100),
    CategoryID TINYINT UNSIGNED,
    Duration TIME,
    CreatorID INT UNSIGNED,
    CreateDate DATETIME,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE,
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
); 

insert into Exam(CODE1,Title,CategoryID,CreatorID) values
												(1,'Math',33,12),    
												(2,'IT',34,13),     
                                                (3,'English',35,14), 
                                                (5,'Biology',36,15), 
                                                (8,'History',37,16);
select * from Exam;
--------------------------------------------------------------------------------------------------------------

-- Table 11
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID INT UNSIGNED,
    QuestionID INT UNSIGNED,
    PRIMARY KEY (ExamID ,QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID)REFERENCES Question(QuestionID) ON DELETE CASCADE
);
insert into ExamQuestion (ExamID,QuestionID) values (1,5), (4,7), (3,6),(2,8),(7,4);
select * from ExamQuestion;