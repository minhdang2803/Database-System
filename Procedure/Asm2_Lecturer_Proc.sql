--iii.1
delimiter //
create procedure update textbook(`cID` int,`textbook_title`varchar(255),`lID` varchar(255))
begin
update textbook set `title`=`textbook_title` where(`course_id` = `cID` and `lecturer_id`=`lID`)
return 1;
end //
delimiter ;

--iii.2
delimiter //
create procedure view_class_by_course(in `sem` int, in `cID` int)
begin
select Class.`course_id`, Class.`group`, Class.`lecturer_id`, 
       Class.`no_student` 
from Course
inner join Class on Course.`id` = Class.`course_id`
where (Class.`semester` = `sem` and Course.`id` = `cID`);
end //
delimiter ;

--iii.3
delimiter //
create procedure view_student_in_class(in `cID` varchar(255), 
                                       in `gr` varchar(255))
begin
select Student.`id`, Student.`name`, Student.`faculty_name`, Student.`phone`, 
       Student.`email`,Class.`course_id`, Class.`group`
from Student
inner join Class on Student.`class_group` = Class.`group`
where (Class.`course_id` = `cID` and  Class.`group` = `gr`);
end //
delimiter ;

--iii.4
delimiter //
create procedure view_course_and_textbook(in `sem` int, in `cID` varchar(255))
begin
select Textbook.`id`, Textbook.`title`, Textbook.`topic`, Textbook.`publish_year`, 
       Textbook.`edition`, Textbook.`language`, Textbook.`publisher_name`, 
	   Course.`id`, Course.`name`, Course.`Faculty`, Course.`no_credit`
from (((Textbook
inner join Course_use_Textbook
on Textbook.`id` = Course_use_Textbook.`textbook_id`)
inner join Course
on Course_use_Textbook.`course_id` = Course.`id`)
inner join Lecturer
on `Lecturer_Assign_textbook`.`lecturer_id` = Lecturer.`id`)
where (Course.`semester` = `sem` and Course.`id` = `cID`);
end //
delimiter ;

--iii.5
delimiter //
create procedure view_total_student(in `lID` int, in `sem` int)
begin
select count(`id`)
from Student
inner join Class on Student.`class_group` = Class.`group`
where (Class.`lecturer_id` = `lID`and Class.`semester` = `sem`);
group by `id`;
end //
delimiter ;

--iii.6
delimiter //
create procedure view_total_class(in `sem` int)
begin
select SUM(`group`) 
from Class
inner join Lecturer_teach_Class
	  on Class.`lecturer_id` = Lecturer_teach_Class.`lecturer_id`
	  group by Lecturer_teach_Class.Semester
where date > DATEADD(year,-3,GETDATE());
end //
delimiter ;

--iii.7
delimiter //
create procedure view_total_class(in `sem` int)
begin
use teaching_system;
select Class.`no_student` 
from Class
inner join Lecturer_teach_Class
	  on Class.`lecturer_id` = Lecturer_teach_Class.`lecturer_id`
	  group by Lecturer_teach_Class.`class_group`
	  order by (`no_student`) DESC
limit 5;
end //
delimiter ;

--iii.8
delimiter //
create procedure view_total_class(in `sem` int)
begin
use teaching_system;
select SUM(`group`) 
from Class
inner join Lecturer_teach_Class
	  on Class.`lecturer_id` = Lecturer_teach_Class.`lecturer_id`
	  group by Lecturer_teach_Class.Semester
	  order by SUM(`class_group`) DESC
limit 5;
end //
delimiter ;

