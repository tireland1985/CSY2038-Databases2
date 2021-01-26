--@E:\DB2-FILES\object_queries_77.sql
--week 6
--poor (bad) method when referencing object tables
SELECT site_id, state_ref FROM sites;

-- better method for relational tables with columns referencing object types
SELECT DEREF (state_ref), site_id FROM sites s WHERE site_id = 1;

--best method, works for both relational tables with object columns and relational tables that reference object tables
-- select column1, <alias>.<column_name>.<attribute> FROM table <alias> WHERE ...
SELECT site_id, s.state_ref.state FROM sites s WHERE s.state_ref.state = 'BIHAR';

DESC sites;

--poor method: query sites for the id and address
SELECT site_id, address FROM sites;

DESC address_type;

--best method: get same data from above query
SELECT site_id, s.address.street, s.address.city, s.address.country FROM sites s;

-- amend to restrict data to a single street address
SELECT site_id, s.address.street, s.address.city, s.address.country FROM sites s
WHERE s.address.street = '343 ELM STREET';

-- names & cities of instructors in the UK
SELECT instructor_name, i.address.city FROM instructors i
WHERE i.address.country = 'UK';

DESC sites;
-- view primary key, and varray column (simple query)
SELECT site_id, classroom FROM sites;

-- query pk and varray content
SELECT s.site_id, c.room_number, c.capacity, c.description 
FROM sites s,
TABLE (s.classroom) c
WHERE site_id = 1;

DESC invoices;

--query primary key, nested table column & contents

SELECT i.invoice_number, ii.student_surname, ii.course_title, ii.start_date, ii.end_date, ii.amount 
FROM invoices i,
TABLE (i.invoice_item) ii;

-- query nested table only
SELECT VALUE(ii)
FROM THE(
	SELECT invoice_item
	FROM invoices
	WHERE invoice_number = 10007) ii; 