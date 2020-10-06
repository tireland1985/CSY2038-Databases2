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
