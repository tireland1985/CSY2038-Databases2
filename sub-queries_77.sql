-- show surnames of students who work in amsterdam
SELECT student_id, student_surname , company_id
FROM students
WHERE company_id IN (
	SELECT company_id
	FROM companies
	WHERE city = 'AMSTERDAM');

--show US cities where there are both sites and instructors
SELECT i.instructor_id, i.instructor_name, i.address.city, i.address.country
FROM instructors i
WHERE i.address.city IN (
	SELECT s.address.city
		FROM sites s
		WHERE s.address.country = 'USA');
		
-- show all addresseses that are NOT IN the instructors table
SELECT a.street, a.city FROM addresses a
WHERE a.street NOT IN (
	SELECT i.address.street
	FROM instructors i);
	
-- show addresses that are not in the instructors and students table
SELECT a.street, a.city, a.country FROM addresses a
WHERE a.city NOT IN (
	SELECT i.address.city
	FROM instructors i)
AND a.city NOT IN (
	SELECT s.address.city
	FROM students s);
	
-- show instructors who earn more than their mentors
SELECT instructor_id, instructor_name, salary
FROM instructors
WHERE EXISTS (
	SELECT mentor_id
	FROM instructors
	WHERE mentor_id IS NOT NULL) 
