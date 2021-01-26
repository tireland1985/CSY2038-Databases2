-- CSY2038_77@STUDENT/19437590
-- Tim Ireland, CSY2038 Databases 2
-- 19/01/2021 (Term 2 topic 12)
-- @e:\db2-files\more_functions_77.sql
-- || = concatenation
/*
TRAINING_BUDGET
---------------
       58933.93
      117867.87
     1166891.86
      589339.33
      117867.87
      235735.73
       353603.6
	   */
DESC companies;
SELECT training_budget FROM companies;

UPDATE companies 
SET training_budget = training_budget+(training_budget * 0.17867865);

SELECT training_budget FROM companies;

-- show ceil, floor, round, trunc values of training budgets
SELECT training_budget, CEIL(training_budget), FLOOR(training_budget), ROUND(training_budget), TRUNC(training_budget)
FROM companies;

-- amend above query to include max(should return 1 row, may need to nest functions)




-- concat good morning, username (based on first+sur names)

SELECT CONCAT('Good morning, ',
		CONCAT(SUBSTR(student_firstname, 1,2),
				SUBSTR(student_surname, 1,5)))
FROM students;

-- as above but lower case
SELECT CONCAT('Good morning, ',
		CONCAT (LOWER(SUBSTR(student_firstname, 1,2)),
				LOWER(SUBSTR(student_surname, 1,5))))
FROM students;














--
SELECT AVG(training_budget), CEIL (AVG(training_budget)), FLOOR(AVG(training_budget)), ROUND(AVG(training_budget), 2), TRUNC(AVG(training_budget)), MAX(training_budget)
FROM companies;

