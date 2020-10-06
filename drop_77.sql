/* DropCourse */
--CSY2038_77@STUDENT/19437590
-- Tim Ireland, CSY2038 Databases 2
-- 29/09/2020
--@e:\db2-files\DropCourse_77.sql

DROP TABLE invoices;
DROP TABLE attendance;
DROP TABLE offerings;
DROP TABLE courses;
DROP TABLE instructors;
DROP TABLE subject_areas;
DROP TABLE students;
DROP TABLE sites;
DROP TABLE addresses;

DROP TYPE address_type;
DROP TYPE invoice_item_table_type;
DROP TYPE invoice_item_type;
DROP TYPE classroom_varray_type;
DROP TYPE classroom_type;

DROP TABLE companies;

DROP TABLE customers;
DROP TABLE states;
DROP TABLE bill_addresses;

DROP TYPE invoice_address_type;
DROP TYPE state_type;

PURGE RECYCLEBIN;
COLUMN object_name FORMAT A30;
COLUMN object_type FORMAT A12;
SELECT object_name, object_type FROM user_objects;

--SELECT * FROM tab;
--SELECT * FROM user_types;
--SELECT * FROM user_constraints;
