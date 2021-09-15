use testingsystem;

                                      -- ASSIGNMENT 5 --
   
-- Q1 Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
create view Sale_employees AS 
select d.DepartmentID
from `Account` a
join Department d ON a.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sale';
-----------------------------------------------------------------------------------------
-- Q2 Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
drop view if exists AccountList;
create view AccountList as
select * from GroupAccount
group by AccountID
having count(GroupID) = (select count(groupID)
						from GroupAccount
                        group by AccountID
                        order by count(GroupID) desc
                        limit 1);
-----------------------------------------------------------------------------------------
-- Q3 Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
create view LongContent as
select length(Content), QuestionID from Question
where length(Content) > 20;
delete from Question where length(Content) > 20;
-----------------------------------------------------------------------------------------
-- Q4 Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
create view Max_department as
select d.DepartmentID, count(a.AccountID)
from Department d
join `Account` a ON d.DepartmentID = a.DepartmentID
group by d.DepartmentID
order by count(a.AccountID) DESC;
-----------------------------------------------------------------------------------------
-- Q5 Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
drop view if exists Questions_by_Nguyen;
create view Questions_by_Nguyen AS
select QuestionID, Content
from Question q
join `Account` a
ON q.CreatorID = a.AccountID
where a.FullName LIKE 'Nguyen%';
