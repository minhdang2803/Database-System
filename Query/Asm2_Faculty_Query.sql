-- ii.1
delimiter //
create procedure update_course(in `course_id` varchar(255), in `sem` int)
begin
update Course set `semester` = `sem` where `id` = `course_id`;
end //
delimiter ;

-- ii.2
delimiter //
create procedure update_class(in `cID` varchar(255), in `gr` varchar(255), 
    in `sem` int, in `lID` int, in `no_stu` int)
begin
update Class
set `semester` = `sem`, `lecturer_id` = `lID`, `no_student` = `no_stu`
where (`course_id` = `cID` and `group` = `gr`);
end //
delimiter ;

-- ii.3
use teaching_system;
select `semester`, `id`, `no_credit`, `faculty_name`
from Course
order by `semester` desc, `id` asc;

-- ii.4
use teaching_system;
select Class.`semester`, Lecturer.`id`, Lecturer.`name`, Lecturer.`email`, 
    Lecturer.`phone`, Lecturer.`faculty_name`
from Lecturer
inner join Class 
on Lecturer.`id` = Class.`lecturer_id`
order by Class.`semester` desc, Lecturer.`id` asc;

-- ii.5
use teaching_system;
select Class.`semester`, Class.`lecturer_id`, Class.`course_id`, 
    Class.`group`, Class.`no_student`
from Lecturer
inner join Class 
on Lecturer.`id` = Class.`lecturer_id`
order by Class.`semester` desc, Lecturer.`id` asc;

-- ii.6
use teaching_system;
select Class.`semester`, Class.`course_id`, Class.`group`, Lecturer.`id`, 
    Lecturer.`name`, Lecturer.`email`, Lecturer.`phone`, 
    Lecturer.`faculty_name`
from Lecturer
inner join Class 
on Lecturer.`id` = Class.`lecturer_id`
order by Class.`semester` desc, Class.`course_id` asc, Class.`group` asc;

-- ii.7
use teaching_system;
select Course.`semester`, Course.`id`, Textbook.`title`, Textbook.`topic`, 
    Textbook.`publish_year`, Textbook.`author`, Textbook.`publisher_name`
from ((Textbook
inner join Course_use_Textbook
on Textbook.`title` = Course_use_Textbook.`textbook_title`)
inner join Course
on Course_use_Textbook.`course_id` = Course.`id`)
order by Course.`semester`desc , Course.`id` asc;

-- ii.8
use teaching_system;
select Student.`id`, Student.`name`, Student.`faculty_name`, Student.`phone`, 
	Student.`grade`, Student.`status`
from ((Student
inner join Student_join_Class
on Student.`id` = Student_join_Class.`student_id`)
inner join Class 
on Student_join_Class.`class_group` = Class.`group`)
order by Class.`semester` desc, Class.`course_id` asc, Class.`group` asc;

-- ii.9
use teaching_system;
select count(`id`)
from ((Student
inner join Student_join_Class
on Student.`id` = Student_join_Class.`student_id`)
inner join Class 
on Student_join_Class.`class_group` = Class.`group`)
group by Class.`semester`, Student.`id`;

-- ii.10
use teaching_system;
select count(`group`)
from Class
group by `semester`, `course_id`, `group`;

-- ii.11
use teaching_system;
select `id`, `name`, `no_credit`, `faculty_name`, max(no_lec) as max_lecturer
from (select *, count(`lecturer_id`) as no_lec
from (select *
from Course
inner join Class on Course.`id` = Class.`course_id`
group by Class.`semester`, Course.`id`, Class.`lecturer_id`) as temp1
group by temp2.`id`) as temp2;

-- ii.12
use teaching_system;
select count_student / count_course
from (select *, count_student, count(Course.`id`) as count_course
from (select *, count(Student.`id`) as count_student
from ((Student
inner join Student_enroll_Course on Student.`id` = Student_enroll_Course.`student_id`)
inner join Course on Student_enroll_Course.`course_id` = Course.`id`)
where (extract(year from current_date) % 100 - 
	((select cast(`semester` as unsigned) from Course) - 
    (select cast(`semester` as unsigned) from Course) % 10)) / 10 < 3) as temp1
group by Course.`semester`, Course.`id`) as temp2;
