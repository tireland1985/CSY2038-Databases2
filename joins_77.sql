--@E:\DB2-FILES\joins_77.sql
--week 9

--list subject_areas and courses, only show matched items
SELECT c.title, su.subject_name
FROM courses c
JOIN subject_areas su
ON c.subject_id = su.subject_id;

-- display courses inc title, instructor who teaches it by name
SELECT i.instructor_name, c.title
FROM instructors i
RIGHT JOIN offerings o
ON i.instructor_id = o.instructor_id
JOIN courses c
ON o.course_id = c.course_id;

COLUMN firstname FORMAT A15;
COLUMN price FORMAT 9999;

-- display course title, instructor name and course cost ordered by cost
COLUMN title FORMAT A10;
SELECT i.instructor_name, c.title, c.cost
FROM instructors i
RIGHT JOIN offerings o
ON i.instructor_id = o.instructor_id
JOIN courses c
ON o.course_id = c.course_id
ORDER BY c.cost DESC;

-- display students and whether or not they have attended anything
SELECT s.student_surname, a.student_id, a.offering_id
FROM students s
LEFT JOIN attendance a
ON s.student_id = a.student_id
ORDER BY a.student_id DESC;

-- display all courses, offering and their site(s) and the relationship between them, including ID's
SELECT c.course_id, c.title, o.offering_id, o.start_date, s.site_id, s.address.city
FROM courses c
FULL OUTER JOIN offerings o
ON c.course_id = o.course_id
FULL OUTER JOIN sites s
ON o.site_id = s.site_id
ORDER BY o.start_date;

