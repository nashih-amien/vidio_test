/*--MUHAMMAD NASHIH AMIEN--*/

create table Student(student_id integer primary key, name text, age integer)
create table Classroom(classroom_id integer, student_id integer)

insert into Student(student_id,name, age) VALUES (1, 'John', 15)
insert into Student(student_id,name, age) VALUES (2, 'marqueez', 16)
insert into Student(student_id,name, age) VALUES (3, 'chip', 14)
insert into Student(student_id,name, age) VALUES (4, 'marley', 14)

insert into Classroom(classroom_id, student_id) VALUES (123, 1)
insert into Classroom(classroom_id, student_id) VALUES (234, 2)
insert into Classroom(classroom_id, student_id) VALUES (123, 4)


/*--1a*/
SELECT classroom_id from Classroom as cl
	Left join student as st
on cl.student_id = st.student_id
where cl.student_id is NULL

/*--1b*/
SELECT DISTINCT (a.classroom_id), a.student_id
From Classroom as a
	LEFT join Student as b
on a.student_id = b.student_id
order by a.classroom_id

/*--1c*/
Select 
CASE  
        WHEN age <16 THEN 'Middle School'
        ELSE 'High School'
        END as grade, count(*)
from Student
group by grade
having count(*)<16

/*--1d*/
Select student_id, Student.name, age
from Student
WHERE age = ( SELECT MAX(age) FROM student );

/*--1e*/
SELECT student_id, age, sum(age) 
OVER (ORDER BY student_id) as cumulative_age 
FROM Student

/*--1f
--Marqueez is the oldest and a highschool student meanwhile other three are Middle schoolers.
--Chip isn't enrolled in any class.
--John and Marley are in the same class.*/