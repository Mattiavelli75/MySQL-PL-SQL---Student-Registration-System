-- Update students grade

-- select any student by student_id (1-100).
select s.student_id, s.first_name, s.last_name, e.grade, e.enrolment_id, c.course_name
from students s
inner join enrolments e
on s.student_id = e.student_id
inner join courses c
on e.course_id = c.course_id
where s.student_id = 75;

-- use the enrolments PK enrolment_id to update grade.
update enrolments
set grade = 'A'
where enrolment_id = 524;

-- END













