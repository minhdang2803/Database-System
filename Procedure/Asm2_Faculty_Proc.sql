use teaching_system;

-- ii.1
delimiter //
drop procedure if exists update_course;
create procedure update_course(in `course_id` varchar(255), in `sem` int)
begin
update Course set `semester` = `sem` where `id` = `course_id`;
end //
delimiter ;

-- ii.2
delimiter //
drop procedure if exists update_class;
create procedure update_class(in `cID` varchar(255), in `gr` varchar(255), in `sem` int, in `lID` int, in `no_stu` int)
begin
update Class
set `semester` = `sem`, `lecturer_id` = `lID`, `no_student` = `no_stu`
where (`course_id` = `cID` and `group` = `gr`);
end //
delimiter ;

-- ii.3
delimiter //
drop procedure if exists view_course;
create procedure view_course(in `sem` int)
begin
select `id`, `name`, `no_credit`, `faculty_name`
from Course
where `semester` = `sem`;
end //
delimiter ;

-- ii.4
delimiter //
drop procedure if exists view_lecturer;
create procedure view_lecturer(in `sem` int)
begin
select Lecturer.`id`, Lecturer.`name`, Lecturer.`email`, Lecturer.`phone`, Lecturer.`faculty_name`
from Lecturer
inner join Class on Lecturer.`id` = Class.`lecturer_id`
where Class.`semester` = `sem`;
end //
delimiter ;

-- ii.5
delimiter //
drop procedure if exists view_class_by_lecturer;
create procedure view_class_by_lecturer(in `sem` int, in `lID` int)
begin
select Class.`course_id`, Class.`group`, Class.`lecturer_id`, Class.`no_student`
from Lecturer
inner join Class on Lecturer.`id` = Class.`lecturer_id`
where Class.`semester` = `sem` and Lecturer.`id` = `lID`;
end //
delimiter ;

-- ii.6
delimiter //
drop procedure if exists view_lecturer_by_class;
create procedure view_lecturer_by_class(in `sem` int, in `cID` varchar(255), in `gr` varchar(255))
begin
select Lecturer.`id`, Lecturer.`name`, Lecturer.`email`, Lecturer.`phone`, Lecturer.`faculty_name`
from Lecturer
inner join Class on Lecturer.`id` = Class.`lecturer_id`
where Class.`semester` = `sem`and Class.`course_id` = `cID` and Class.`group` = `gr`;
end //
delimiter ;

-- ii.7
delimiter //
drop procedure if exists view_assigned_textbook;
create procedure view_assigned_textbook(in `sem` int, in `cID` varchar(255))
begin
select Textbook.`title`, Textbook.`topic`, Textbook.`publish_year`, Textbook.`author`, Textbook.`publisher_name`
from ((Textbook
inner join Course_use_Textbook
on Textbook.`title` = Course_use_Textbook.`textbook_title`)
inner join Course
on Course_use_Textbook.`course_id` = Course.`id`)
where Course.`semester` = `sem` and Course.`id` = `cID`;
end //
delimiter ;

-- ii.8
delimiter //
drop procedure if exists view_student_in_class;
create procedure view_student_in_class(in `sem` int, in `cID` varchar(255), in `gr` varchar(255))
begin
select Student.`id`, Student.`name`, Student.`faculty_name`, Student.`phone`, Student.`grade`, Student.`status`
from ((Student
inner join Student_join_Class on Student.`id` = Student_join_Class.`student_id`)
inner join Class on Student_join_Class.`class_group` = Class.`group`)
where Class.`semester` = `sem` and Class.`course_id` = `cID` and Class.`group` = `gr`;
end //
delimiter ;

-- ii.9
delimiter //
drop procedure if exists view_total_student;
create procedure view_total_student(in `sem` int)
begin
select count(`id`)
from ((Student
inner join Student_join_Class on Student.`id` = Student_join_Class.`student_id`)
inner join Class on Student_join_Class.`class_group` = Class.`group`)
where Class.`semester` = `sem`
group by `id`;
end //
delimiter ;

-- ii.10
delimiter //
drop procedure if exists view_total_class;
create procedure view_total_class(in `sem` int)
begin
select count(`group`)
from Class
where `semester` = `sem`
group by `course_id`, `group`;
end //
delimiter ;

-- ii.11
delimiter //
drop procedure if exists view_most_lecturer_class;
create procedure view_most_lecturer_class(in `sem` int)
begin
select `id`, `name`, `no_credit`, `faculty_name`, max(no_lec) as max_lec
from (select *, count(`lecturer_id`) as no_lec
from (select *
from Course
inner join Class on Course.`id` = Class.`course_id`
where Class.`semester` = `sem`
group by Course.`id`, Class.`lecturer_id`) as temp1
group by `id`) as temp2;
end //
delimiter ;

-- ii.12
delimiter //
drop procedure if exists view_course_average_student;
create procedure view_course_average_student()
begin
select count_student / count_course
from (select *, count_student, count(Course.`id`) as count_course
from (select *, count(Student.`id`) as count_student, Student.`id` as sID, Course.`id` as cID
from ((Student
inner join Student_enroll_Course on Student.`id` = Student_enroll_Course.`student_id`)
inner join Course on Student_enroll_Course.`course_id` = Course.`id`)
where (extract(year from current_date) % 100 - 
	((select cast(`semester` as unsigned) from Course) - 
    (select cast(`semester` as unsigned) from Course) % 10)) / 10 < 3) as temp1
group by Course.`semester`, Course.`id`) as temp2;
end //
delimiter ;
