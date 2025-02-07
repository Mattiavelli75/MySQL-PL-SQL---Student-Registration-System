-- Stored procedure to enrol a student on a course
-- PKs do not populate to subqueries so native funstion last_insert_id() was used.
-- Assumed that the enrolment date is now, so native function curdate() was used.

delimiter //
create procedure enrol_student (in f_name varchar(30), in l_name varchar(30), in birth_date date, 
in e_address varchar(50),in c_name varchar(30))
begin
	declare c_id int;   
    select course_id into c_id
    from courses
    where course_name = c_name;
	insert into students(first_name, last_name, date_of_birth, email) 
    values (f_name, l_name, birth_date, e_address);   
    set @student_last_id = last_insert_id();    -- get PK of primary students table to insert into enrolments table.
    insert into enrolments(student_id, course_id, enrolment_date)
    values (@student_last_id, c_id, curdate());	-- use current date for enrolment date.
end//
delimiter ;

-- Call procedure, please change details the user below has been added.
call enrol_student('Maria', 'Sanchez', '1989-09-02', 'msanchez@apple.com', 'Computing');

-- Check user has been added to the students table.
select * from students where first_name = 'Maria' and last_name = 'Sanchez';

-- Check the user has been added to all tables using the view created in the previous exercise.
select * from student_course 
where student_id = 43;

-- END



