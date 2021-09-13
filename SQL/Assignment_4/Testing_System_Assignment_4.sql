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
     -- FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID) ON DELETE CASCADE, on update cascade,
     -- FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ON DELETE CASCADE on update cascade
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

										
                                        -- ASSIGNMENT 4 --

--------------------------------------------------------------------------------------------------------------
-- Q1 Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
select 
AccountID, DepartmentName
from `Account` a
left join Department d
ON a.DepartmentID = d.DepartmentID
order by AccountID ASC;
--------------------------------------------------------------------------------------------------------------
-- Q2 Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
select AccountID from `Account` where CreateDate > '2010-12-20';
--------------------------------------------------------------------------------------------------------------
-- Q3 Viết lệnh để lấy ra tất cả các developer
select PositionID from `Account` where PositionID LIKE 'Developer';
--------------------------------------------------------------------------------------------------------------
-- Q4 Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
select Department.DepartmentName, `Account`.AccountID
from `Account` 
join Department 
ON `Account`.DepartmentID = Department.DepartmentID
where AccountID > 3
order by DepartmentName;
--------------------------------------------------------------------------------------------------------------
-- Q5 Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
select QuestionID 
from ExamQuestion
group by QuestionID
order by count(ExamID); 
--------------------------------------------------------------------------------------------------------------
-- Q6 Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
select CategoryID, count(CategoryID)
from Question
group by CategoryID;
--------------------------------------------------------------------------------------------------------------
-- Q7 Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select QuestionID, count(ExamID)
from Examquestion
group by QuestionID;
--------------------------------------------------------------------------------------------------------------
-- Q8 Lấy ra Question có nhiều câu trả lời nhất
select Question.QuestionID, Question.Content
from Question 
left join Answer 
ON Question.QuestionID = Answer.QuestionID
group by Question.QuestionID
order by Answer.AnswerID;
--------------------------------------------------------------------------------------------------------------
-- Q9 Thống kê số lượng account trong mỗi group
select count(AccountID),GroupID
from GroupAccount
group by GroupID;
--------------------------------------------------------------------------------------------------------------
-- Q10 Tìm chức vụ có ít người nhất
select `Position`.PositionName, `Position`.PositionID
from `Position`
join Account
ON `Position`.PositionID = Account.PositionID
group by `Position`.PositionID
order by Account.AccountID DESC
limit 1;
--------------------------------------------------------------------------------------------------------------
-- Q11 Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
select `Position`.PositionName,Department.DepartmentName, count(`Position`.PositionID)
from `Position`
join `Account` on `Position`.PositionID = `Account`.PositionID
join Department on Department.DepartmentID = `Account`.DepartmentID
group by Department.DepartmentName, `Position`.PositionName;
--------------------------------------------------------------------------------------------------------------
-- Q12 Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
select * from Question 
JOIN Answer 
ON Question.QuestionID = Answer.QuestionID;
--------------------------------------------------------------------------------------------------------------
-- Q13 Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select count(QuestionID),Question.TypeID
from Question
join TypeQuestion
ON Question.TypeID = TypeQuestion.TypeID
Group by TypeQuestion.TypeName;
--------------------------------------------------------------------------------------------------------------
-- Q14 Lấy ra group không có account nào
select `Group`.GroupName, `Group`.GroupID
from `Group` 
join GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
left join `Account` ON GroupAccount.AccountID = `Account`.AccountID
group by `Group`.GroupID 
having count(GroupAccount.AccountID) = 0;
--------------------------------------------------------------------------------------------------------------
-- Q15 Lấy ra group không có account nào
select `Group`.GroupName, `Group`.GroupID
from `Group` 
join GroupAccount ON `Group`.GroupID = GroupAccount.GroupID
left join `Account` ON GroupAccount.AccountID = `Account`.AccountID
group by `Group`.GroupID 
having count(GroupAccount.AccountID) = 0;
--------------------------------------------------------------------------------------------------------------
-- Q16 Lấy ra question không có answer nào
select Question.QuestionID
from Question 
join Answer 
ON Question.QuestionID = Answer.QuestionID
group by Question.QuestionID
having count(Answer.AnswerID) = 0;
--------------------------------------------------------------------------------------------------------------
-- Q17 a) Lấy các account thuộc nhóm thứ 1
   --  b) Lấy các account thuộc nhóm thứ 2
   --  c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
   select AccountID from GroupAccount
   where GroupID = 1
   union
   select AccountID from GroupAccount
   where GroupID = 2;
--------------------------------------------------------------------------------------------------------------
-- Q18 a) Lấy các group có lớn hơn 5 thành viên
	-- b) Lấy các group có nhỏ hơn 7 thành viên
	-- c) Ghép 2 kết quả từ câu a) và câu b)
    select GroupID from GroupAccount
	group by GroupID
    having count(AccountID > 5)
    union all
	select GroupID from GroupAccount
    group by GroupID
    having count(AccountID < 7)
    