-- Tao database
drop database if exists testingsystem; 
create database testingsystem;
-- Su dung DB vua tao
use testingsystem;

--------------------------------------------------------------------------------------------------------------
                                                       -- SCROLL TO BOTTOM --
--------------------------------------------------------------------------------------------------------------
-- Table 1
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(30) unique key
);

insert into Department (DepartmentName) values  ('Sale'), ('Marketing'), ('IT'), ('Accountant'), ('Manager'),
										        ('HR'), ('Assitant'), ('IOT'), ('Media'), ('Data Analysis'),
												('IT Support'), ('Content'), ('APIs'), ('Security'), ('Data Storage');
select *from Department order by DepartmentID ASC;
--------------------------------------------------------------------------------------------------------------
-- Table 2
DROP TABLE IF EXISTS  `Position`;
CREATE TABLE `Position` (
    PositionID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName ENUM ( 'Dev', 'Test', 'Scrum Master', 'PM','QA', 
						'SA', 'BA', 'Brse', 'DevOps','Android Dev', 
                        'Fresher', 'Junior', 'Senior', 'IOS Dev','Game Dev')
);

insert into `Position` (PositionName) values  ('Dev'), ('Test'),('Scrum Master'),('PM'), ('QA'),	
											  ('SA'), ('BA'), ('Brse'), ('DevOps'),('Android Dev'), 
											  ('Fresher'), ('Junior'), ('Senior'), ('IOS Dev'),('Game Dev');
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
    CreateDate DATE 
     FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID) ON DELETE CASCADE, on update cascade,
     FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ON DELETE CASCADE on update cascade
);
insert into Account(Email, Username, DepartmentID, PositionID, Fullname) values 
('vtiedu@gmail.com','admin',12,12,'A'),  ('vtiedu@gmail.com1','admin1',12,0,'B'),  ('vtiedu@gmail.com2','admin2',12,13,'Nguyen Van A'),
('root@gmail.com','root',21,21,'A'),     ('root@gmail.com1','root1',21,22,'Tran Thi Thao Anh');
-- ('vtiedu@gmail.com','admin1',12,13,'A'),  ('vtiedu@gmail.com1','admin1',12,0,'B'),  ('vtiedu@gmail.com2','admin2',12,13,'Nguyen Van Ba'),
-- ('root@gmail.com','root',21,21,'A'),     ('root@gmail.com1','root1',21,22,'B'),
-- ('vtiedu@gmail.com','admin2',12,12,'A'),  ('vtiedu@gmail.com1','admin1',12,0,'B'),  ('vtiedu@gmail.com2','admin2',12,13,'Nguyen Thi Thao'),
-- ('root@gmail.com','root',21,21,'A'),     ('root@gmail.com1','root1',21,22,'B');   
select * from `Account`;
--------------------------------------------------------------------------------------------------------------

-- Table 4
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID TINYINT UNSIGNED UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(30) unique key,
    CreatorID INT UNSIGNED not null,
    CreateDate DATE
    -- FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

insert into `Group` (CreatorID,GroupName) values (11,'Artist'),    (16,'Physic'),         (21,'Love'), 
												 (12,'Science'),   (17,'I.E'),            (22,'War'), 
                                                 (13,'AI'),        (18,'History'),        (23,'Trash_talk'),
                                                 (14,'ML'),        (19,'Politics'),       (24,'FWB'),    
                                                 (15,'Bigdata'),   (20,'Block_chain'),    (25,'Social');
select * from `Group`;
--------------------------------------------------------------------------------------------------------------

-- Table 5
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
    GroupID TINYINT UNSIGNED,
    AccountID INT  UNSIGNED,
    JoinDate DATE
    -- PRIMARY KEY (GroupID , AccountID),
    -- FOREIGN KEY (GroupID) 	REFERENCES `Group`(GroupID) ON DELETE CASCADE,
    -- FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

insert into GroupAccount (GroupID, AccountID, JoinDate) values 	(1, 10,'2021-08-07'), (6, 22,'2020-08-07'), (11, 27,'2019-08-07'),
																(2, 11,'2021-08-08'), (7, 23,'2020-08-08'), (12, 28,'2019-08-08'), 
																(3, 12,'2021-08-09'), (8, 24,'2020-08-09'), (13, 29,'2019-08-09'), 
																(4, 13,'2021-08-10'), (9, 25,'2020-08-10'), (14, 30,'2019-08-10'), 
																(5, 14,'2021-08-11'), (10,26,'2020-08-11'), (15, 31,'2019-08-11');
select * from GroupAccount;
--------------------------------------------------------------------------------------------------------------
-- Table 6
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR (30)
);

insert into TypeQuestion(TypeID,TypeName) values 	(1, 'Multiple Choice'), (6, 'Likert Scale Question'),        (11, 'Star Rating Question'), 
													(2, 'Text Question'),   (7, 'Constant Sum Question'),        (12, 'Max Diff Question'),  
													(3, 'Rank Order'),      (8, 'Contact Information Question'), (13, 'Push to Social Questions'), 
													(4, 'Image'),           (9, 'Demographic Question'),         (14, 'Lookup Table Question'), 
													(5, 'CAPTCHA'), 		(10, 'Matrix Table Question'),       (15, 'Calendar Question'); 
select*from TypeQuestion;                                           
--------------------------------------------------------------------------------------------------------------
-- Table 7
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName ENUM('Java', '.NET', 'SQL', 'Postman', 'Ruby',
					  'Python','C#','JScript','HTML','CSS',
                      'PHP','R','Go','Assembly','Matlab') not null
);
insert into CategoryQuestion(CategoryID, CategoryName) values (1,'Java'),(2,'.NET'),(3,'SQL'),(4,'Postman'),(5,'Ruby'),
															  (6,'Python'),(7,'C#'),(8,'JScript'),(9,'HTML'),(10,'CSS'),
                                                              (11,'PHP'),(12,'R'),(13,'Assembly'),(14,'Go'),(15,'Matlab');
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
    CreateDate DATE
    -- FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE,
   --  FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID) ON DELETE CASCADE,
   --  FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
);

insert into Question(CategoryID, Content, CreatorID,TypeID) values  (1, 'Multiple Choice',11,20),
																	(2, 'Text Question',12,21),   
																	(3, 'Rank Order',13,22),    
																	(4, 'Image',14,23),         
																	(5, 'CAPTCHA',15,24);
select *from Question;                                                            
--------------------------------------------------------------------------------------------------------------
-- Table 9
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(200) not null,
    QuestionID INT UNSIGNED ,
    isCorrect ENUM('True', 'False') not null
    -- FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID) ON DELETE CASCADE
);

insert into Answer(Content, QuestionID, isCorrect) values 
	('The cat stretched.',1,'True'),  
	('Jacob stood on his tiptoes.',2,'False'), 
	('The car turned the corner.',3,'False'), 
	('Kelly twirled in circles.',4,'True'),  
	('She opened the door.',5,'True');
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
    CreateDate DATETIME
    -- FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE,
    -- FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE CASCADE
); 

insert into Exam(CODE1,Title,CategoryID,CreatorID) values
												(1,'Math',33,1),    (6,'Science',33,6),      	(11,'Speech',33,11), 
												(2,'IT',34,2),      (7,'Health',33,7),       	(12,'Algebra',33,12), 
                                                (3,'English',35,3), (8,'Handwriting',33,8),     (13,'Geometry',33,13), 
                                                (4,'Biology',36,4), (9,'Dance',33,9),        	(14,'Lab',33,14), 
                                                (5,'History',37,5), (10,'Leadership',33,10), 	(15,'Woodshop',33,15); 
select * from Exam;
--------------------------------------------------------------------------------------------------------------
-- Table 11
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID INT UNSIGNED,
    QuestionID INT UNSIGNED
    -- PRIMARY KEY (ExamID ,QuestionID),
    -- FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE,
    -- FOREIGN KEY (QuestionID)REFERENCES Question(QuestionID) ON DELETE CASCADE
);
insert into ExamQuestion (ExamID,QuestionID) values (1,5), (4,7), (3,6), (2,8), (7,4),
													(2,9), (1,1), (5,4), (6,1), (9,3),
                                                    (7,7), (6,9), (9,6), (4,8), (2,0);
select * from ExamQuestion;
--------------------------------------------------------------------------------------------------------------
-- Q1 Them 10 du lieu vao cac bang
--------------------------------------------------------------------------------------------------------------
-- Q2 Lay ra tat ca cac phong ban
select * from Department;
--------------------------------------------------------------------------------------------------------------
-- Q3 Lay ra id cua cac phong ban Sale
select DepartmentID, DepartmentName 
from Department 
where DepartmentName = 'Sale';
--------------------------------------------------------------------------------------------------------------
-- Q4 lay ra account fullname dai nhat
select Fullname, length(Fullname) 
from Account 
order by length(Fullname) DESC ;
--------------------------------------------------------------------------------------------------------------
-- Q5 lay ra account fullname dai nhat thuoc phong ban id = 3
select length(Fullname), Fullname 
from Account
where AccountID = '3'
order by length(Fullname) DESC
limit 5;
--------------------------------------------------------------------------------------------------------------
-- Q6 lay ten group da tham gia truoc 2019/12/20
select distinct GroupName,JoinDate 
from (GroupAccount,`Group`) 
where JoinDate <'2019-12-20';
--------------------------------------------------------------------------------------------------------------
-- Q7 lay id cua question co > = 4 cau tra loi
select QuestionID, Content from Question where Content >4;
--------------------------------------------------------------------------------------------------------------
-- Q8 ma de thi co tg thi > 60p va tao trc ngay 20/12/2019
select CreateDate,Duration from Exam
where Duration > '60'
having CreateDate < '2019-12-20';
--------------------------------------------------------------------------------------------------------------
-- Q9 5 group dc tao gan day nhat
select CreateDate, GroupID
from `Group`
where CreateDate <'2021-09-09'
limit 5;
--------------------------------------------------------------------------------------------------------------
-- Q10 dem so nhan vien co thuoc Dep co id = 2
select count(DepartmentID) 
from Department 
where DepartmentID = 2;
--------------------------------------------------------------------------------------------------------------
-- Q11 ten bat dau bang D ket thuc bang o
select FullName from Account
where FullName LIKE 'D%o';
--------------------------------------------------------------------------------------------------------------
-- Q12 xoa cac exam tao trc 20/12/2019
delete from Exam where CreateDate <'2019-12-20';
--------------------------------------------------------------------------------------------------------------
-- Q13 xoa cac question co noi dung bat dau tu "cau hoi"
delete from Question where Content LIKE 'cau hoi%';
--------------------------------------------------------------------------------------------------------------
-- Q14 update thong tin id = 5 -> Nguyen Ba Loc, email = locnguyenba@vti.com.vn
update `Account`
set FullName = 'Nguyen Ba Loc' , Email ='locnguyenba@vti.com.vn'
where AccountID = 5;
select * from `Account`;
--------------------------------------------------------------------------------------------------------------
-- Q15 update account co id = 5 thuoc group co id = 4
update AccountID 
set groupID = 4
where accountID = 5;