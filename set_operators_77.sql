--@E:\DB2-FILES\object_queries_77.sql
--week 7
-- list US cities where there are instructors or sites
SELECT s.address.city, s.address.country FROM sites s
WHERE s.address.country = 'USA'
UNION
SELECT i.address.city, i.address.country FROM instructors i
WHERE i.address.country = 'USA';

-- list US cities that have both instructors and sites
SELECT s.address.city, s.address.country FROM sites s
WHERE s.address.country = 'USA'
INTERSECT
SELECT i.address.city, s.address.country FROM instructors i
WHERE i.address.country = 'USA';

-- list all addresses that are not in the instructors table
SELECT a.street, a.city FROM addresses a 
MINUS
SELECT i.address.street, i.address.city FROM instructors i;

-- list addresses not in instructors and students tables (should return 0)
SELECT a.street, a.city FROM addresses a
MINUS
(SELECT i.address.street, i.address.city FROM instructors i 
UNION
SELECT s.address.street, s.address.city FROM students s);

