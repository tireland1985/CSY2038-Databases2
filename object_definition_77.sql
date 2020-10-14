--week 2 drops
DROP TABLE customers;
DROP TABLE states;
DROP TABLE bill_addresses;
ALTER TABLE sites DROP COLUMN state_ref;

DROP TYPE state_type;
DROP TYPE invoice_address_type;
--week 3 drops
DROP TABLE prospective_customers;
DROP TABLE adverts;

DROP TYPE social_media_table_type;
DROP TYPE social_media_varray_type;
DROP TYPE social_media_type;
PURGE RECYCLEBIN;
--week 2 tasks
CREATE OR REPLACE TYPE invoice_address_type AS OBJECT(
street VARCHAR2(25),
city VARCHAR2(25),
country VARCHAR2(25));
/
show errors

CREATE TABLE customers(
customer_id NUMBER(6),
customer_name VARCHAR2(25),
invoice_address invoice_address_type);

CREATE TABLE bill_addresses OF invoice_address_type;

DROP TABLE customers;

CREATE TABLE customers(
customer_id NUMBER(6),
customer_name VARCHAR2(25),
invoice_address REF invoice_address_type SCOPE IS bill_addresses);

CREATE OR REPLACE TYPE state_type AS OBJECT(
state VARCHAR2(25),
country VARCHAR2(25));
/
SHOW ERRORS

desc state_type;

CREATE TABLE states OF state_type;

ALTER TABLE sites ADD 
(state_ref REF state_type SCOPE IS states);

SELECT object_name,object_type FROM user_objects WHERE object_name NOT LIKE 'SYS%';

--week 3 tasks
CREATE OR REPLACE TYPE social_media_type AS OBJECT(
media_name VARCHAR2(25),
contact VARCHAR2(50));
/
CREATE TYPE social_media_varray_type AS VARRAY(50) OF social_media_type;
/
DESC social_media_type

DESC social_media_varray_type

SELECT object_name, object_type FROM user_objects;

COLUMN object_type FORMAT A25;
COLUMN object_name FORMAT A25;

CREATE TABLE prospective_customers(
prospective_customer_id NUMBER(6),
company_name VARCHAR2(50),
contact_name VARCHAR2(25),
social_media_available social_media_varray_type);

CREATE TYPE social_media_table_type AS TABLE OF social_media_type;
/
DESC social_media_table_type

CREATE TABLE adverts(
advert_id NUMBER(6),
advert_title VARCHAR2(50),
description VARCHAR2(25),
social_media_used social_media_table_type)
NESTED TABLE social_media_used STORE AS social_media_table;