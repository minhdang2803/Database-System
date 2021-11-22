DROP ROLE IF EXISTS 'teacher';
CREATE ROLE 'teacher';

DROP ROLE IF EXISTS 'student';
CREATE ROLE 'student';

DROP ROLE IF EXISTS 'academic staff';
CREATE ROLE 'academic staff';

#GRANT STUDENT 
GRANT SELECT on textbook to 'student';
GRANT SELECT on class to 'student';
GRANT SELECT on course to 'student';
GRANT SELECT on course_use_textbook to 'student';
GRANT SELECT on author_write_textbook to 'student';
GRANT SELECT, UPDATE, INSERT on student to 'student';

#GRANT TEACHER
GRANT SELECT on author to 'teacher';
GRANT SELECT on author_write_textbook to 'teacher';
GRANT SELECT on course to 'teacher';
GRANT SELECT, UPDATE on class to 'teacher';
GRANT SELECT, UPDATE, INSERT on lecturer to 'teacher';
GRANT SELECT, UPDATE, INSERT on lecturer_assign_textbook to 'teacher';
GRANT SELECT, UPDATE, INSERT on lecturer_teach_class to 'teacher';
GRANT SELECT, UPDATE, INSERT on student_enroll_course to 'teacher';
GRANT SELECT, UPDATE, INSERT on student_join_class to 'teacher';
GRANT SELECT, UPDATE, INSERT on faculty to 'teacher';

#GRANT STAFF
GRANT ALL on teaching_system to 'academic staff';

#Create user and grant 
CREATE USER 'student'@'localhost' IDENTIFIED BY 'password';
GRANT 'student' to 'student'@'localhost';
SHOW GRANTS FOR 'student'@'localhost';

CREATE USER 'teacher'@'localhost' IDENTIFIED BY 'password';
GRANT 'teacher' to 'teacher'@'localhost';
SHOW GRANTS FOR 'teacher'@'localhost';

CREATE USER 'academic staff'@'localhost' IDENTIFIED BY 'password';
GRANT 'academic staff' to 'academic staff'@'localhost';

