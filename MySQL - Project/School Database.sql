-- Matthew Williams 23/01/2025.
-- Project 3 Student Course Enrollment System.

-- Create the Database.
create database SchoolDB;

-- Set SQL workbench to use SchoolDB as default database.
use SchoolDB;

-- Create the Students table.
create table Students(
	student_id int not null primary key auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,    
    date_of_birth date not null,
    email varchar(50) not null  
);

-- Create the Courses table.
create table Courses (
	course_id int  not null primary key auto_increment ,
	course_name varchar(30) not null,
    course_description varchar(100) not null,
    credits varchar(15) not null
);

-- Create the Enrolments table.
create table Enrolments (
	enrolment_id int not null primary key auto_increment,
    student_id int,
    course_id int,    
    constraint student_id
    foreign key (student_id) 
    references Students(student_id)
    on delete cascade
    on update cascade,    
    constraint course_id    
    foreign key (course_id) 
    references Courses(course_id)
    on delete cascade
    on update cascade,
    enrolment_date date not null,
    grade varchar(2)
);

-- END














