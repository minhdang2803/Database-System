#STUDENT'S QUERY
#1
delimiter //
create procedure view_courses(in `sem` int)
begin
select *
from `course` c
where c.`semester` = `sem`;
end //
delimiter;

#2
delimiter //
create procedure view_class_course_lecture()
begin
select c1.`Group`, c2.`id`, l1.`name`
from `class` c1
inner join `course` c2
on c1.`course_id` = c2.`id`
inner join `lecturer` l1
on c1.`lecturer_id` = l1.`id`
order by c1.`Group`;
end //
delimiter;

#3
delimiter //
create procedure view_course_and_textbook(in `sem` int)
begin
select c2.`id`, t1.`TextBook_Title`
from `class` c1
inner join `course` c2
on c1.`Course_id` = c2.`id`
inner join `course_use_textbook` t1
on c2.`id` = t1.`Course_id`
where c1.`semester` = `sem`;
end //
delimiter;

#4
delimiter //
create procedure view_classes(in `sem` int)
begin
select c1.`Group`, c2.`id`
from `class` c1
inner join `course` c2
on c1.`Course_id` = c2.`id`
where c1.`semester` = `sem`
group by  c2.`id`;
end //
delimiter;

#5
delimiter //
create procedure view_classes_with_more_than_1_lecturer()
begin
select ltc.class_group, COUNT(ltc.lecturer_id) as number_of_lectures
from lecturer_teach_class ltc
group by lecturer_id
having  COUNT(lecturer_id) > 1
order by lecturer_id;
end //
delimiter;

#6 
delimiter //
create procedure view_total_credits(in `sem` int, out total_cre int)
begin
select sec.`student_id`, SUM(c1.`no_credit`) into total_cre 
From `course` c1
inner join student_enroll_course sec
on c1.`id` = sec.`course_id`
where c1.`semester` = `sem`
group by sec.`student_id`
order by SUM(c1.`no_credit`) DESC;
end //
delimiter;

#7
delimiter //
create procedure view_total_courses(in `sem` int, out total_courses int)
begin
select sec.`student_id`, COUNT(c1.`id`) into total_courses
From `course` c1
inner join student_enroll_course sec
on c1.`id` = sec.`course_id`
where c1.`semester` = `sem`
group by sec.`student_id`
order by COUNT(c1.`id`) DESC;
end //
delimiter; 

#8
delimiter //
create procedure view_3_highest_total_credits_semes()
begin
select SUM(`no_credit`) as number_of_credits
From `course` c1
inner join student_enroll_course sec
on c1.`id` = sec.`course_id`
group by c1.semester
order by SUM(`no_credit`) DESC
limit 3;
end //
delimiter;



