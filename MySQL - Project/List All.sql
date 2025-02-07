-- select all students.
select * from students;

-- select all courses.
select * from courses;

-- select all enrolments.
select * from enrolments;

-- select all students and all enrolments and all courses.
select s.*, c.*, e.*
from students s
inner join enrolments e
on s.student_id = e.student_id
inner join courses c
on e.course_id = c.course_id
order by s.student_id asc;

-- END






