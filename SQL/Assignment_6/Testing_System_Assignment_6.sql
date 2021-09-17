use testingsystem;

					                   -- ASSIGNMENT 6 --
                                       
                                       
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
drop procedure if exists account_of_department;
DELIMITER $$
create procedure account_of_department (IN in_department_name VARCHAR(30))
begin
select a.Username, a.Email, d.DepartmentName
from `Account` a
join Department d ON a.DepartmentID = d.DepartmentID
where DepartmentName = in_department_name;
end $$
DELIMITER;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
drop procedure if exists accounts_of_group; 
DELIMITER $$
create procedure accounts_of_group (IN in_groupID tinyint unsigned)
begin
select GroupID, count(AccountID)   
from GroupAccount
where GroupID = in_groupID
group by GroupID;
end $$
DELIMITER;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DELIMITER $$
create procedure type_question_of_month ()
begin 
select count(TypeID) from Question
where MONTH(CreateDate) = MONTH(NOW());
end $$
DELIMITER;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question


-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người 
-- dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào

-- Nhập:1  Trả về Group có tên chứa chuỗi
-- Nhập:2  Trả về User có username chứa chuỗi 

DELIMITER $$
CREATE PROCEDURE name_of_group_usernamev (IN in_StringInput VARCHAR(30), IN in_select TINYINT) 
BEGIN
	IF inselect = 1 THEN
		SELECT *  FROM `Group`
        WHERE     GroupName LIKE in_StringInput;
    
    ELSE 
		SELECT Username, Email, FullName
        FROM   `Account`
        WHERE Username LIKE in_StringInput;
        
	END IF;
END $$
DELIMITER;


-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán: 
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ Sau đó in ra kết quả tạo thành công
DELIMITER $$ 
CREATE PROCEDURE input_info (IN in_email VARCHAR (50), IN in_Fullname VARCHAR(50))
BEGIN
	DECLARE Username VARCHAR(50) DEFAULT SUBSTRING_INDEX(in_email,'@',1);
    DECLARE PositionID TINYINT UNSIGNED DEFAULT 1;
    DECLARE DepartmentID TINYINT UNSIGNED DEFAULT 10;
    DECLARE CreateDate DATETIME DEFAULT NOW();
	
	INSERT INTO `Account` 	(Email		,Username, FullName		, DepartmentID,	PositionID,	CreateDate)
    VALUE					(in_email	,Username, in_fullName	, DepartmentID, PositionID, CreateDate);
	
    SELECT 	*
    FROM 	`Account`a
    WHERE	a.Username = Username;
	
END$$
DELIMITER ;



-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay 
-- hoặc multiple-choice nào có content dài nhất
DELIMITER $$
CREATE PROCEDURE max_content_by_typeID (IN in_TypeName VARCHAR(50))
BEGIN
	IF (in_TypeName = 'Essay') THEN
		SELECT	Content, MAX(LENGTH(Content))
		FROM	Question
		WHERE	TypeID = 1;
	ELSEIF (in_TypeName = 'Multiple-Choice') THEN
		SELECT	Content, MAX(LENGTH(Content))
		FROM	Question
		WHERE	TypeID = 2;
	END IF;
END$$
DELIMITER ;


-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DELIMITER $$
CREATE PROCEDURE delete_exam_by_id (IN in_ExamID TINYINT UNSIGNED)
BEGIN
	DELETE 	
    FROM 	Exam 
    WHERE	ExamID = in_ExamID;	
END$$
DELIMITER ;

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
DELIMITER $$
CREATE PROCEDURE delete_exam_over_3_years ()
BEGIN
	DELETE FROM Exam
    WHERE ((YEAR(NOW())-YEAR(CreateDate))> 3);
END $$
DELIMITER $$;

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban 
-- và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc

DELIMITER $$
CREATE PROCEDURE delete_department (IN in_DepartmentName VARCHAR(50))
BEGIN
	UPDATE 	`Account`
    SET		DepartmentID = 10
    WHERE	DepartmentID = (SELECT 	DepartmentID	
							FROM	Department
							WHERE 	DepartmentName = in_DepartmentName);
	DELETE 
    FROM	Department
    WHERE	DepartmentName = in_DepartmentName;
END$$
DELIMITER ;

 

