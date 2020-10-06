--CSY2038_77@STUDENT/19437590
-- Tim Ireland, CSY2038 Databases 2
-- 29/09/2020
--@e:\db2-files\week1practical_77.sql
COLUMN student_firstname HEADING 'First |Name'
COLUMN student_firstname FORMAT A10;
COLUMN gender FORMAT 999999;
--display a list of student names (concat first+last), gender and phone numbers
SELECT student_surname ||', '||  student_firstname, gender,phone_number FROM students;

