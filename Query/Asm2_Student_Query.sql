#STUDENT'S QUERY
#1
select *
from `course`;

#2
select c1.`Group`, c2.`id`, l1.`name`
from `class` c1
inner join `course` c2
on c1.`course_id` = c2.`id`
inner join `lecturer` l1
on c1.`lecturer_id` = l1.`id`
order by c1.`Group`;

#3
select c2.`id`, t1.`TextBook_Title`
from `class` c1
inner join `course` c2
on c1.`Course_id` = c2.`id`
inner join `course_use_textbook` t1
on c2.`id` = t1.`Course_id`
where c1.`semester` = '211';

#4
select c1.`Group`, c2.`id`
from `class` c1
inner join `course` c2
on c1.`Course_id` = c2.`id`
where c1.`semester` = '211'
group by  c2.`id`;

#5

select ltc.class_group, COUNT(ltc.lecturer_id) as number_of_lectures
from lecturer_teach_class ltc
group by lecturer_id
having  COUNT(lecturer_id) > 1
order by lecturer_id;

#6 
select sec.`student_id`, SUM(c1.`no_credit`) as number_of_credits
From `course` c1
inner join student_enroll_course sec
on c1.`id` = sec.`course_id`
group by sec.`student_id`
order by SUM(c1.`no_credit`) DESC;

#7
select sec.`student_id`, COUNT(c1.`id`) as number_of_courses
From `course` c1
inner join student_enroll_course sec
on c1.`id` = sec.`course_id`
group by sec.`student_id`
order by COUNT(c1.`id`) DESC;

#8
select SUM(`no_credit`) as number_of_credits
From `course` c1
inner join student_enroll_course sec
on c1.`id` = sec.`course_id`
group by c1.semester
order by SUM(`no_credit`) DESC
limit 3;



