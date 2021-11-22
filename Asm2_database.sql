SET GLOBAL FOREIGN_KEY_CHECKS=0;
drop database if exists teaching_system;
create database teaching_system;
use teaching_system;

create table if not exists Author(
`name` 	varchar(255) not null unique,
`email` varchar(255),
primary key(`name`)
);

create table if not exists Publisher(
`name` varchar(255) not null unique,
`location` varchar(255), 
primary key(`name`)
);

create table if not exists Faculty(
`name` varchar(255) not null unique,
primary key(`Name`)
);

create table if not exists Lecturer(
`id` int not null unique,
`name` varchar(255) not null,
`email` varchar(255) unique,
`phone` varchar(255) unique,
`role` 	enum('Teaching','Grading') not null,
`faculty_name`	varchar(255) not null,
primary key(`id`),
foreign key (`faculty_name`) references Faculty(`name`)
);

create table if not exists Course(
`id` varchar(255) not null unique,
`no_credit` int not null,
`semester` 	varchar(255) not null,
`faculty_name` varchar(255)	not null,
check(`no_credit` >=1 and `no_credit` <=3),
primary key(`id`),
foreign key (`faculty_name`) references Faculty(`name`)
);

create table if not exists Class(
`group` varchar(255) not null,
`semester` varchar(255)	not null,
`course_id` varchar(255) not null,
`lecturer_id` int not null,
`no_student` int not null default 0,
check (`no_student` >= 0 and `no_student` <= 60),
primary key (`group`,`course_id`),
foreign key (`course_id`) references Course(`id`),
foreign key (`lecturer_id`) references Lecturer(`id`)
);

create table if not exists Student(
`id` varchar(255) not null unique,		
`grade` float not null,
`name` varchar(255)	not null,
`status` enum('Active','Suspended') not null default 'Active',
`no_credit` int not null,
`phone` varchar(255) unique,
`faculty_name`	varchar(255) not null,
check(`grade` >=0 and `grade` <=10),
check(`no_credit` >=0 and `no_credit` <= 18),
primary key(`id`),
foreign key (`faculty_name`) references Faculty(`name`)
);

create table if not exists Textbook (
`title` varchar(255) not null unique,
`topic` varchar(255) not null,
`publish_year` int not null,
`author` varchar(255) not null,
`publisher_name` varchar(255) not null,
check (`publish_year` <= 2021 and `publish_year` >= 2010),
primary key(`title`),
foreign key (`publisher_name`) references Publisher(`name`)
);

create table if not exists Student_join_Class(
`student_id` varchar(255) not null,
`class_group` varchar(255) not null,
constraint `pk_join` primary key (`student_id`,`class_group`),
foreign key (`student_id`) references Student(`id`),
foreign key (`class_group`) references Class(`group`)
);
create table if not exists Student_enroll_Course(
`student_id` varchar(255) not null,
`course_id` varchar(255) not null,
constraint `pk_enroll` primary key (`student_id`,`course_id`),
foreign key (`student_id`) references Student(`id`),
foreign key (`course_id`) references Course(`id`)
);

create table if not exists Lecturer_teach_Class(
`lecturer_id` int not null,
`class_group` varchar(255) not null,
constraint `pk_lecturer_teach_class` primary key(`class_group`,`lecturer_id`),
foreign key (`class_group`) references Class(`group`),
foreign key (`lecturer_id`) references Lecturer(`id`)
);

create table if not exists Course_use_Textbook(
`course_id` varchar(255) not null,
`textbook_title` varchar(255) not null,
constraint `pk_course_use_textbook` primary key (`course_id`,`textbook_title`),
foreign key(`course_id`) references Course(`id`),
foreign key(`textbook_title`) references Textbook(`title`)
);

create table if not exists Author_write_Textbook(
`textBook_title` varchar(255) not null,
`author_name` varchar(255) not null,
constraint `pk_textbook_write_author` primary key(`textbook_title`,`author_name`),
foreign key(`textbook_title`) references Textbook(`title`),
foreign key(`author_name`) references Author(`name`)
);

create table if not exists Lecturer_assign_TextBook(
`lecturer_id` int not null,
`textbook_title` varchar(255) not null,
constraint `pk_lecturer_assign_textbook` primary key(`lecturer_id`,`textbook_title`),
foreign key(`lecturer_id`) references Lecturer(`id`),
foreign key(`textbook_title`) references Textbook(`title`)
);

-- Implementation for Indexing
ALTER TABLE Student
ADD INDEX student_idx(`id`);
ALTER TABLE Lecturer
ADD INDEX lecturer_idx(`id`);
ALTER TABLE Publisher
ADD INDEX publisher_idx(`name`);
ALTER TABLE Author
ADD INDEX author_idx(`name`);
