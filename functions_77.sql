--@E:\DB2-FILES\functions_77.sql
--week 8

-- find instructors with a salary of either 2000, 2500, or 3000
SELECT instructor_name, salary 
FROM instructors 
WHERE salary = '2000'
OR salary = '2500'
OR salary = '3000';

--find instructors whose name begins with S
SELECT instructor_name
FROM instructors
WHERE instructor_name LIKE 'S%';

--FIND INSTRUCTORS WITH A SALARY BETWEEN 2000 AND 2999
SELECT instructor_name, salary
FROM instructors 
WHERE salary BETWEEN 2000 AND 2999;

DESC attendance;

--find number of times students have attended courses
SELECT student_id, COUNT(student_id)
FROM attendance a
GROUP BY a.student_id;

-- find students with an id of over 6000 (12 rows)
SELECT student_id
FROM students
WHERE student_id > 6000;

-- find students who gave an average evaluation of 4 (9 rows)
SELECT student_id, AVG(evaluation)
FROM attendance a
GROUP BY student_id
HAVING AVG(evaluation) >= 4;

-- find total amount paid by students for all courses attended
SELECT student_id, SUM(amount_paid)
FROM attendance a
GROUP BY student_id
ORDER BY SUM(amount_paid) DESC;

--find total paid  for each offering
SELECT offering_id, SUM(amount_paid)
FROM attendance a
GROUP BY offering_id
ORDER BY SUM(amount_paid) DESC;

-- find min/max/avg evaluation for course offerings (7 rows)
SELECT offering_id, MIN(evaluation), MAX(evaluation), AVG(evaluation)
FROM attendance a
GROUP BY offering_id;

-- as above, but only display results where average evaluation is less than 2.5 (0 rows)
SELECT offering_id, MIN(evaluation), MAX(evaluation), AVG(evaluation)
FROM attendance a
GROUP BY offering_id
HAVING AVG(evaluation) < 2.5;
