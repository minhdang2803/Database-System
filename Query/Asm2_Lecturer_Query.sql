--iii.1
delimiter //
create procedure update textbook(`cID` int,`textbook_title`varchar(255))
begin
update textbook set `title`=`textbook_title` where(`course_id` = `cID`)
return 1;
end //
delimiter ;

--iii.2
use teaching_system;
select Class.`course_id`, Class.`group`,
       Class.`no_student` 
from Course
inner join Class on Course.`id` = Class.`course_id`
where `semester` = `211`
group by Course.`id`

--iii.3
use teaching_system;
select Student.`id`, Student.`name`, Student.`faculty_name`, Student.`phone`, 
       Student.`email`
from Student
inner join Class on Student.`class_group` = Class.`group`
where `semester` = `211`



--iii.4
use teaching_system;
select Textbook.`id`, Textbook.`title`, Textbook.`topic`, Textbook.`publish_year`, 
       Textbook.`edition`, Textbook.`language`, Textbook.`publisher_name`, 
	   Course.`id`, Course.`name`, Course.`Faculty`, Course.`no_credit`
from (((Textbook
inner join Course_use_Textbook
on Textbook.`id` = Course_use_Textbook.`textbook_id`)
inner join Course
on Course_use_Textbook.`course_id` = Course.`id`)
inner join Lecturer
where `semester` = `211`



--iii.5
use teaching_system;
select count(`id`)
from Student
inner join Class on Student.`class_group` = Class.`group`
where `semester` = `211`
group by `id`;


--iii.6
use teaching_system;
select SUM(`group`) 
from Class
inner join Lecturer_teach_Class
	  on Class.`lecturer_id` = Lecturer_teach_Class.`lecturer_id`
	  group by `group`,`course_id`
where (date > DATEADD(year,-3,GETDATE()));


--iii.7
use teaching_system;
select Class.`no_student` 
from Class
inner join Lecturer_teach_Class
	  on Class.`lecturer_id` = Lecturer_teach_Class.`lecturer_id`
	  group by Lecturer_teach_Class.`class_group`
	  order by (`no_student`) DESC
limit 5;


--iii.8
use teaching_system;
select SUM(`group`) 
from Class
inner join Lecturer_teach_Class
	  on Class.`lecturer_id` = Lecturer_teach_Class.`lecturer_id`
	  group by Lecturer_teach_Class.Semester
	  order by SUM(`class_group`) DESC
limit 5;


