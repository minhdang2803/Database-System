USE teaching_system;
-- (i1). Cập nhật đăng ký môn học của các lớp
DELIMITER //
CREATE PROCEDURE update_courseOfClass( in `class_group` varchar(255), in `course` varchar(255) , 
in `sem` varchar(255), in `no_stu` int, in `lec_id` int)
BEGIN
UPDATE class AS c
SET c.`course_id` = `course`, c.`semester` = `sem`, c.`no_student` = `no_stu`, c.`lecturer_id` = `lec_id`
WHERE c.`group` = `class_group`;
END //
DELIMITER ;

-- (i2). Xem danh sách lớp đã được đăng ký bởi một sinh viên ở một học kỳ.
SELECT s.`id` AS `Student`, c.`group` AS `Class`, c.`course_id` AS `Course`
FROM Class AS c 
INNER JOIN Student_Join_Class AS sc
ON  c.`group` = sc.`class_group` 
INNER JOIN 
Student AS s
ON sc.`student_id` = s.`id`;

-- (i3). Xem danh sách lớp được phụ trách bởi một giảng viên ở một học kỳ
SELECT l.`id` AS `Lecturer`, c.`course_id` AS `Course`, c.`group` AS `Class`
FROM Class AS c 
INNER JOIN Lecturer_teach_class AS lc
ON  c.`group` = lc.`class_group` 
INNER JOIN 
Lecturer AS l
ON lc.`lecturer_id` = l.`id`;


-- (i4). Xem danh sách môn học được đăng ký ở mỗi học kỳ ở mỗi khoa.
SELECT c.`id`, c.`semester`,f.`name`
FROM Course AS c
INNER JOIN Faculty AS f
ON c.`faculty_name` = f.`name`;

-- (i5). Xem danh sách sinh viên đăng ký ở mỗi lớp ở mỗi học kỳ ở mỗi khoa.
SELECT s.`id` AS `Student`, c.`course_id` AS `Course`, 
c.`group` AS `Class`, c.`semester`AS`Semester`, f.`name`AS `Faculty`
FROM Class AS c 
INNER JOIN Student_Join_Class AS sc
ON  c.`group` = sc.`class_group` 
INNER JOIN Student AS s
ON sc.`student_id` = s.`id`
INNER JOIN Faculty AS f
ON s.`faculty_name` = f.`name`;

-- (i6). Xem danh sách giảng viên phụ trách ở mỗi lớp ở mỗi học kỳ ở mỗi khoa.
SELECT l.`id` AS `Lecturer`, c.`course_id` AS `Course`, 
c.`group` AS `Class`, c.`semester`AS`Semester`, f.`name`AS `Faculty`
FROM Class AS c 
INNER JOIN Lecturer_teach_Class AS lc
ON  c.`group` = lc.`class_group` 
Inner JOIN Lecturer AS l
ON lc.`lecturer_id` = l.`id`
INNER JOIN Faculty AS f
ON l.`faculty_name` = f.`name`;

-- (i7). Xem các giáo trình được chỉ định cho mỗi môn học ở mỗi học kỳ ở mỗi khoa.
SELECT t.`title` AS 'Textbook', c.`id` AS 'Course',
c.`semester` AS 'Semester', f.`name` AS 'Faculty'
FROM Textbook AS t
INNER JOIN Course_use_textbook AS ct
ON t.`title` = ct.`textbook_title`
INNER JOIN	Course AS c
ON ct.`course_id` = c.`id`
INNER JOIN faculty AS f
ON c.`faculty_name` = f.`name`;

-- (i8). Xem tổng số môn học được đăng ký ở mỗi học kỳ ở mỗi khoa.
SELECT  c.`id` AS 'Course Name', COUNT(c.`id`) AS 'Total Courses',
c.`semester` AS 'Semester', f.`name` AS 'Faculty'
FROM Course AS c
LEFT OUTER JOIN Faculty AS f
ON c.`faculty_name` = f.`name`
GROUP BY c.`id`, c.`semester`, f.`name`;

-- (i9). Xem tổng số lớp được mở ở mỗi học kỳ ở mỗi khoa.
SELECT DISTINCT course.`id` AS 'Course Name', COUNT(class.`group`) AS 'Total class', 
course.`semester` AS 'Semester', f.`name` AS 'Faculty'
FROM Class AS class
INNER JOIN Course AS course
ON class.`course_id` = course.`id`
RIGHT JOIN Faculty AS f
ON course.`faculty_name` = f.`name`
GROUP BY  course.`id`,class.`group`, course.`semester`, f.`name`;

-- (i10). Xem tổng số sinh viên đăng ký ở mỗi lớp của một môn học ở một học kỳ.
SELECT COUNT(s.`id`) AS 'Number Students', class.`group` AS 'Class', 
course.`id` AS 'Course', course.`semester` AS 'Semester'
FROM student as s
INNER JOIN student_join_class AS sc
ON s.`id` = sc.`student_id`
INNER JOIN class
ON sc.`class_group` = class.`group`
INNER JOIN course
ON class.`course_id` = course.`id`
GROUP BY s.`id`,class.`group`,course.`id`;

-- (i11). Xem tổng số sinh viên đăng ký ở mỗi môn học ở một học kỳ.
SELECT COUNT(sc.`student_id`) AS 'Number of students',c.`id` AS 'Course Name', c.`semester` AS 'Semester'
FROM student_enroll_course AS sc
INNER JOIN course AS c
ON sc.`course_id` = c.`id`
GROUP BY sc.`student_id`, c.`id`;

-- (i12). Xem tổng số sinh viên đăng ký ở mỗi học kỳ ở mỗi khoa.
SELECT COUNT(sc.`student_id`) AS 'Number of students',
c.`id` AS 'Course Name',c.`semester` AS 'Semester', 
c.`faculty_name` AS 'Faculty'
FROM student_enroll_course AS sc
RIGHT JOIN course AS c
ON sc.`course_id` = c.`id`
GROUP BY sc.`student_id`,c.`id`, c.`semester`, c.`faculty_name`;