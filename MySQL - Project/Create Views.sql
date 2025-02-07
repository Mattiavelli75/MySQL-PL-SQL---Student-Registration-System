-- Create views to show students courses' and their grades.

-- View to show students courses.
create or replace view student_course as
select s.student_id, s.first_name, s.last_name, c.course_name, e.grade
from students s
inner join enrolments e
on s.student_id = e.student_id
inner join courses c
on e.course_id = c.course_id
order by s.student_id;

-- selects all students, course names and grades. 
select * from student_course;

-- selects single student using student_id (1-100).
select * from student_course 
where student_id = 31;

-- END











