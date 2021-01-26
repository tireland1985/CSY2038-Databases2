--WEEK 4
INSERT INTO bill_addresses (street, city, country)
VALUES ('54 FESTIVE ROAD', 'NORTHAMPTON', 'UK');
INSERT INTO bill_addresses (street, city, country)
VALUES ('30 ENGLISH STREET', 'BEDFORD', 'UK');

INSERT INTO customers(customer_id, customer_name, invoice_address)
SELECT 1, 'MANDY MORELL', REF(ba)
FROM bill_addresses ba
WHERE street='54 FESTIVE ROAD';

SELECT * FROM customers;

INSERT INTO states(state, country)
VALUES('BIHAR', 'INDIA');

UPDATE sites s
SET s.state_ref =(
SELECT REF (st)
	FROM states st
	WHERE st.state = 'BIHAR')
WHERE s.site_id = 1;

DROP TABLE customers;

CREATE TABLE customers(
customer_id NUMBER(6),
customer_name VARCHAR2(25),
invoice_address invoice_address_type);

INSERT INTO customers (customer_id, customer_name, invoice_address)
VALUES('2', 'CAROLE MORELL', invoice_address_type('1 MY WAY', 'LUTON', 'UK'));

INSERT INTO states (state, country)
VALUES('ALBERTA', 'CANADA');
INSERT INTO states (state, country)
VALUES('VICTORIA', 'AUSTRALIA');
INSERT INTO states (state, country)
VALUES('QUEENSLAND', 'AUSTRALIA');
INSERT INTO states (state, country)
VALUES('DELHI', 'INDIA');

INSERT INTO sites(site_id, address, state_ref)
SELECT 9, address_type('UNIVERSITY DRIVE', 'NORTHAMPTON', 'UK'), REF(st)
FROM states st
WHERE state = 'QUEENSLAND';

-- WEEK 5
INSERT INTO prospective_customers(prospective_customer_id, company_name, contact_name, social_media_available)
VALUES(80000, 'APPLE', 'STEVE JOBS', social_media_varray_type(
												social_media_type('FACEBOOK', 'STEVE'),
												social_media_type('TWITTER', 'STEVEJ'),
												social_media_type('MYSPACE', 'STEVE')
												)
);

INSERT INTO prospective_customers(prospective_customer_id, company_name, contact_name, social_media_available)
VALUES(80001, 'GOOGLE', 'SUNDAR PICHAI', social_media_varray_type(
													social_media_type('FACEBOOK', 'SUNDAR'),
													social_media_type('TWITTER', 'LARRY'),
													social_media_type('INSTAGRAM', 'SERGEY')
													)
);

INSERT INTO adverts(advert_id, advert_title, description, social_media_used)
VALUES(90000, 'SOFTWARE ENGINEER', 'EMPLOYMENT OPPORTUNITY', social_media_table_type(
																social_media_type('FACEBOOK', 'SUNDAR'),
																social_media_type('TWITTER', 'LARRY'),
																social_media_type('INSTAGRAM', 'SERGEY')
																)
);

INSERT INTO sites(site_id, address, classroom, location, state_ref)
SELECT 10, address_type('UNIVERSITY DRIVE', 'NORTHAMPTON',  'UK'),
			classroom_varray_type(
				classroom_type('LH401', '30', 'LECTURE ROOM')),
			'EUROPE NORTH',
			REF (st)
FROM states st
WHERE state = 'QUEENSLAND';
							