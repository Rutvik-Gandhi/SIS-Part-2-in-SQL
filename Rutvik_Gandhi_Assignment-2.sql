-- A2_SIS.sql
-- Assignment 2
-- Revision History:
-- Rutvik Gandhi, Section 3, 2023.02.11: Created

Print 'W23 PROG8080 Section 3';
Print 'Assignment 2';
Print '';
Print 'Rutvik Gandhi';
Print '';
Print GETDATE();
Print '';

USE SIS;


-- 1

Print 'List the courses for the program code ‘0066C’. Include the school code,
program code, course number and semester in the result. Order the ProgramCourse
result by the semester and course number.';
Print '';

SELECT schoolCode, code, courseNumber, semester
FROM Program, ProgramCourse
WHERE PROGRAM.code = ProgramCourse.programCode AND programCode = '0066C'
ORDER BY semester, courseNumber;


-- 2

Print 'List the required course prerequisites for COMP2280. Include the course 
code, prereq and prereq course names in the result. Order the result by the 
prerequisite course code in descending order. Use the implicit join syntax.';
Print '';

SELECT C1.number AS "Course Code", CPA.prerequisiteNumber AS "Prereq",
		C2.name AS "Prereq Course Name"
FROM Course C1 JOIN CoursePrerequisiteAnd CPA
	ON C1.number = CPA.courseNumber AND CPA.courseNumber = 'COMP2280'
JOIN Course AS C2 ON CPA.prerequisiteNumber = C2.number
ORDER BY prerequisiteNumber DESC;

-- 3

Print 'List the persons from the Person table who are not students. Show the
person’s number, first name, last name, and city. Use LEFT OUTER JOIN. Order 
the results by the person’s last name.';
Print '';

SELECT *
FROM PERSON LEFT JOIN Student
	ON Person.number = Student.number
WHERE Student.number IS NULL
ORDER BY Person.lastName;

-- 4

Print 'List the lab software installed on machines in room 2A205. List each
software package’s unique identifier along with the software product’s name. 
Order the result by software product name. Use the explicit join syntax.';
Print '';

SELECT SW.product, SW.uniqueId
FROM LabSoftware LS JOIN Room R
	ON LS.roomId = R.id JOIN Software SW
	ON LS.softwareUniqueId = SW.uniqueId  AND R.number = '2A205'
ORDER BY SW.product;

-- 5

Print 'Show Employee e1.number aliased as ‘Employee’ and Employee e1.reportsTo 
aliased as ‘Supervisor’ and Employee e2.reportsTo aliased as ‘Supervisor 
Reports To’. Order the results by e1.reportsTo. Do left outer self-join 
(e1.reportsTo = e2.number).';
Print '';

SELECT E1.number AS EMPLOYEE, E1.reportsTo AS SUPERVISOR
	, E2.reportsTo AS 'Supervisor Reports To'
FROM Employee AS E1 LEFT JOIN Employee AS E2
	ON E1.reportsTo = E2.number
ORDER BY E1.reportsTo;


-- 6

Print 'Show CourseOffering courseNumber, CourseStudent minimum  finalMark aliased
as ‘Lowest Mark’, CourseStudent average finalMark aliased as ‘Average Mark’ and
CourseStudent maximum finalMark aliased as ‘Highest Mark’ for the Winter 2010 
session grouped by courseNumber. Report all grades as whole numbers.';
Print '';

SELECT CO.courseNumber, MIN(CS.finalMark) AS "Lowest Mark"
	, ROUND(AVG(CS.finalMark),0) AS "Average Mark"
	, MAX(CS.finalMark) AS "Highest Mark"
FROM CourseOffering CO,	CourseStudent CS
WHERE CO.id = CS.CourseOfferingId AND CO.sessionCode = 'W10'
GROUP BY CO.courseNumber;


-- 7

Print 'List the number of courses taught by employees in the School of Engineering
and IT (EIT), for those courses offered in any semester of 2008 or 2009. Include
in the result the employee number, “user id” in caps (i.e., first three letters
of last name and last 3 characters of employee number), along with the count of
the number of courses that they taught, aliased with “# Courses Taught”. Order 
the result by “userid”. Use only inner joins (explicit syntax).';
Print '';

SELECT P.number AS Employee
	, LEFT(P.lastName,3) + RIGHT(P.number,3) AS "USER ID"
	, COUNT(CO.courseNumber) AS "# Course Taught"
FROM PERSON P JOIN Employee E 
	ON P.number = E.number JOIN CourseOffering CO
	ON CO.employeeNumber = E.number
WHERE E.schoolCode = 'EIT' AND CO.sessionCode IN ('F08', 'W08', 'F09', 'W09')
GROUP BY P.number, P.lastName
ORDER BY [USER ID];


-- 8

Print 'Produce a list of all of the co-op programs and the total tuition for 
those programs over all semesters. As these amounts are for co-op programs, the
base tuition amount must be increased by the corresponding co-op multiplier for
each specific program. Output the program acronym and program name in the result,
along with the total tuition (i.e., Total Fees). Use FORMAT() to display the 
Total Fees in dollars and cents.';
Print '';

SELECT P.acronym AS Program, P.name AS "Program Name"
	, FORMAT(SUM(PF.tuition * (1 + PF.coopFeeMultiplier)), 'C') AS "Total Fees"
FROM Program P, ProgramFee PF
WHERE P.code = PF.code AND P.name LIKE '%Coop%'
GROUP BY P.acronym, P.name;


-- 9

Print 'List the students who have made payments, by cheque or cash only. Include
the student number, last name, first name and total payment amount in your answer.
Only display students with total payment amount of at least $10,000.00. Order 
the result by total payment amount in descending order. Use a join to produce
the result.';
Print '';

SELECT P.number AS "Student Number", P.lastName AS "Last Name"
	, P.firstName AS "First Name", SUM(PAY.amount) AS "Total Payment Amount"
FROM Person P, Payment PAY, PaymentMethod PM
WHERE P.number = PAY.studentNumber 
	AND PAY.paymentMethodId = PM.id AND PM.id IN (2, 3)
GROUP BY P.number, P.lastName, P.firstName
HAVING SUM(PAY.amount) >= 10000
ORDER BY "Total Payment Amount" DESC;