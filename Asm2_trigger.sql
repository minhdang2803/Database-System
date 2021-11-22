delimiter //
drop trigger if exists Student_status;
create trigger Student_status before insert on Student_enroll_Course
for each row
begin
	declare Sstatus varchar(100);
    set Sstatus = (select Student.`status` from Student where Student.`id` = NEW.`student_id`);
    if Sstatus <> "Active"
	then
    signal sqlstate '45000'
	set message_text = 'ERROR: Student must have the Active status to register Courses!';
    end if;
end//
delimiter ;

delimiter //
drop trigger if exists Student_credit;
create trigger Student_credit after update on Student_enroll_Course
for each row
begin
    declare Scredit int;
    set Scredit = (select Student.`no_credit` from Student where Student.`id` = NEW.`student_id`);
	if Scredit > 18
    then
	signal sqlstate '45000'
	set message_text = 'ERROR: Student can not register more than 18 credits each semester!';
    end if;
end//
delimiter ;

delimiter //
drop trigger if exists Textbook_publish_year;
create trigger Textbook_publish_year before insert on Lecturer_assign_Textbook
for each row
begin
    declare Pyear int;
	set Pyear = (select Textbook.`publish_year` from Textbook where Textbook.`title` = NEW.`textbook_title`);
	if (select extract(year from current_date)) - Pyear >= 10
    then
	signal sqlstate '45000'
	set message_text = 'ERROR: Main Textbook must have publish year less than 10 years!';
    end if;
end//
delimiter ;

show triggers;
