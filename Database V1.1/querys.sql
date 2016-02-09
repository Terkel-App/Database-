use mydb2;

/*
select * 
from students, class, enrollment, teacher, subj_teacher, timetable, lesson_plan ; 
*/

/*
select a.course, a.room, b.teacher_teacherid, c.firstname 
from timetable a 
inner join lesson_plan b 
on a.timetableid = b.lesson_planid 
inner join teacher c 
on c.teacherid = a.timetableid; 
*/

/*
select a.course, b.teacher_teacherid 
from timetable a 
inner join lesson_plan b 
on a.timetableid = b.lesson_planid; 
*/

/*
'select s.firstname,  e.grade 
FROM students s
INNER JOIN enrollment e
ON s.studentid=e.student_studentid
ORDER BY s.firstname;
*/

/*
select s.firstname, c.classname
FROM students s
INNER JOIN class c
ON s.studentid  =  c.classid
ORDER BY s.firstname;
*/

/*
select t.firstname, s.subject_teacherid, f.firstname
from teacher t 
inner join subj_teacher s
inner join students f
on t.teacherid=s.subject_teacherid;'
*/
