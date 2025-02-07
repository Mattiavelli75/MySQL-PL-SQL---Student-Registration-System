-- Case statement to give students an overall category.
-- Wrapped in a procedure.
-- Uses a subquery.
-- Two case statements needed.
-- The nested query converts alphabetical grades to numbers and averages them 
-- The calling query then categorises the averaged grade.

delimiter //
create procedure Get_Grade_Category()
begin
select student_id, first_name, last_name, GPA,
	case
		when GPA > 2.9999 then 'First Class'
		when GPA > 1.9999 and GPA < 3 then 'Second Class'
		when GPA > 0.9999 and GPA < 2 then 'Third Class'
		When GPA > 0 and GPA < 1 then 'Fourth Class'
		when GPA = 0 then 'Failed' 
		when GPA is null then 'Course incomplete'
		else null
	end as 'Grade Category'     
from (
	select s.student_id, s.first_name, s.last_name, 
		avg(case  
			when e.grade = 'A' then 4				
			when e.grade = 'B' then 3
			when e.grade = 'C' then 2
			when e.grade = 'D' then 1
			when e.grade = 'F' then 0
			else null
		end) as GPA
	from students s
	inner join enrolments e
	on s.student_id = e.student_id 
    group by student_id	
    order by GPA desc
) as Grade_Point_Average;          
end //    
delimiter ;

call Get_Grade_Category();    
-- drop procedure Get_Grade_Category;

-- end
    





