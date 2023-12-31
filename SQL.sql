SELECT * FROM EMPLOYEES

/* RETRIEVING DATA USING SELECT STATEMENTS --> PROJECTION, SELETION, JOINS */

SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME, SALARY, SALARY+500, DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME, SALARY, SALARY+(SALARY*0.10), DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME, SALARY, (SALARY+500)*12, DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME, SALARY, SALARY+(SALARY*0.10) as BONUS, DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME, SALARY, SALARY+(SALARY*0.10) BONUS, DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME, SALARY, SALARY+(SALARY*0.10) "ANNUAL BONUS", DEPARTMENT_ID
FROM EMPLOYEES

/* ANY ARITHMETIC OPERATION WITH A NULL VALUE RESULTS IN THE NULL ITSELF */

SELECT FIRST_NAME, SALARY, COMMISSION_PCT, SALARY+1000+COMMISSION_PCT, DEPARTMENT_ID
FROM EMPLOYEES

SELECT FIRST_NAME || LAST_NAME "FULL NAME"
FROM EMPLOYEES

SELECT LAST_NAME || JOB_ID "JOB TITLE"
FROM EMPLOYEES

/* a literal is a character, date or number values, date and char must be enclosed in a single quote */

SELECT LAST_NAME || ' is a '|| JOB_ID "JOB TITLE"
FROM EMPLOYEES

SELECT department_name || q'[ Department's manager id is  ]'|| MANAGER_ID "DEPT MANAGER"
FROM DEPARTMENTS

SELECT DISTINCT(DEPARTMENT_ID) 
FROM EMPLOYEES

DESCRIBE EMPLOYEES

SELECT SYSDATE
FROM DUAL

SELECT * FROM DUAL

SELECT 1008*88
FROM DUAL

/* ACTIVITIES */

/* 1) How many unique departments have employees currently working in them?

2)	For employees who quit the organization, find out how many years the employees were employed. 
Assume that the year consists of 365.25 days. 
Also retrieve the EMPLOYEE_ID, JOB_ID, START_DATE, and END_DATE for these employees 

3)	Query the JOBS table and return a single expression of the form The Job Id for the <job_title�s> job is: <job_id>. 
Take note that the job_title should have an apostrophe and an �s� appended to it to read more naturally. 
A sample of this output for the organization president is: �The Job Id for the President�s job is: AD_PRES.� 
Alias this column expression as �Job Description� using the AS keyword.  */

/* Restricting data */

/* WHERE, BETWEEN, LIKE, IN , AND, OR, NOT, NULL */

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID
FROM EMPLOYEES
WHERE last_name = 'King'

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '21-SEP-05'

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '21-SEP-05' AND '04-JAN-08'

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE NOT BETWEEN '21-SEP-05' AND '04-JAN-08'

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > 15000
AND
DEPARTMENT_ID IN (90,60,100)

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > 15000
OR
DEPARTMENT_ID IN (90,60,100)

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%'

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID,DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE LAST_NAME LIKE '_at%'

SELECT FIRST_NAME, LAST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL

SELECT FIRST_NAME, LAST_NAME, JOB_ID, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL

SELECT LAST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP'
OR JOB_ID = 'AD_PRES'
AND SALARY > 15000

SELECT LAST_NAME, SALARY, JOB_ID
FROM EMPLOYEES
WHERE (JOB_ID = 'SA_REP'
OR JOB_ID = 'AD_PRES')
AND SALARY > 15000

/* ORDER BY */

SELECT LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
ORDER BY HIRE_DATE

SELECT LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC

SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY SALARY DESC

SELECT LAST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
ORDER BY LAST_NAME

SELECT LAST_NAME, HIRE_DATE, SALARY, COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT

SELECT LAST_NAME, HIRE_DATE, SALARY, COMMISSION_PCT
FROM EMPLOYEES
ORDER BY COMMISSION_PCT DESC

SELECT LAST_NAME, HIRE_DATE, SALARY, COMMISSION_PCT, SALARY*0.12 "ANNUAL SAL"
FROM EMPLOYEES
ORDER BY "ANNUAL SAL" DESC

SELECT LAST_NAME, HIRE_DATE, SALARY, COMMISSION_PCT, SALARY*12 "ANNUAL SAL"
FROM EMPLOYEES
ORDER BY 3 DESC

SELECT LAST_NAME,DEPARTMENT_ID, SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, SALARY

/* SUBSTITUTION VARIABLES */

SELECT LAST_NAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 108

SELECT LAST_NAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID = &EMPLOYEE_NUM

SELECT LAST_NAME, EMPLOYEE_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = &&DEPARTMENT_NUM

UNDEFINE DEPARTMENT_NUM
DEFINE DEPARTMENT_NUM = 90

/* ACTIVITIES */
/* 1. RETRIEVE A LIST OF DEPARTMENT NAMES THAT ENDS WITH "ING" AND SECOND CHARACTER IS "A"

2. Write a query that extracts the JOB_TITLE, MIN_SALARY, and MAX_SALARY columns, 
as well as an expression called VARIANCE, which is the difference between the MAX_SALARY and MIN_SALARY values, 
for each row. The result should include only JOB_TITLE values that contain either the word �President� or �Manager.� 
Sort the list in descending order based on the VARIANCE expression. If more than one row has the same VARIANCE value, then, 
sort these rows by JOB_TITLE in reverse alphabetic order. 

3)	A common computation performed by the Finance department relates to the calculation of taxes levied upon an employee. 
The tax deducted per employee is calculated by obtaining the annual salary for the employee and the current tax rate, 
which may vary from year to year as per the regulations laid from the ministry of finance. 
Write a reusable query for the current tax rate and for an employee_id as input, return the EMPLOYEE_ID, 
FIRST_NAME, SALARY, ANNUAL SALARY,TAX_RATE, and the TAX AMOUNT */

/* FUNCTIONS */

/* CHARACTER --> UPPER, LOWER, INITCAP, LENGTH, SUBSTR, TRIM 
NUMERIC --> ROUND, ABS, MOD, TRUNC
DATES --> NEXT_DAY, LAST_DAY, ADD_MONTHS, MONTHS_BETWEEN */

SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, LAST_NAME) "FULL NAME", JOB_ID, LENGTH(LAST_NAME),
INSTR(LAST_NAME, 'a') "CONTAINS A?", UPPER(LAST_NAME)
FROM EMPLOYEES
WHERE SUBSTR(JOB_ID,4) = 'REP'

SELECT ROUND(108.98765,2)
FROM DUAL

SELECT SALARY, MOD(SALARY,5000)
FROM EMPLOYEES

/* DATES */

/* RR format */
/* YY format */

/* 18-June-19
19-May-78 */

/* 0-49 --> CURRENT CENTURY, 50-99 , LAST CENTURY

DD-MM-RR

1998   05-APR-98 1998  1998
1998   05-APR-22 2022  1921

2018   05-APR-18 2018  2018 
2018   05-APR-98 1998  2098 */

15-09-2022

22 --> RR --> 2022
78 --> RR --> 1978
22 --> YY --> 2022
78 --> YY --> 2078

SELECT SYSDATE FROM DUAL

SELECT EMPLOYEE_ID, ROUND((SYSDATE-HIRE_DATE)/7) WEEKS
FROM EMPLOYEES
ORDER BY WEEKS DESC

SELECT MONTHS_BETWEEN('01-JAN-03','12-DEC-10') FROM DUAL
SELECT NEXT_DAY('14-SEP-23', 'THURSDAY') FROM DUAL
SELECT LAST_DAY('14-SEP-23') FROM DUAL
SELECT ADD_MONTHS('30-SEP-23',2) FROM DUAL
SELECT NEXT_DAY('14-SEP-23', 4) FROM DUAL
SELECT ADD_MONTHS('30-SEP-23',-2) FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DD "OF" MONTH') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DDspth "OF" fmMONTH') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DDth "of" fmMONTH') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'DD MM YYYY') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'YYYY') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'YEAR') || ' is my birthday' 
FROM DUAL

SELECT TO_CHAR(SYSDATE, 'MM') || ' is my birthday' 
FROM DUAL

SELECT FIRST_NAME || ' ' ||  LAST_NAME FROM EMPLOYEES


SELECT TO_CHAR(SALARY, '$99,999.00') SALARY FROM EMPLOYEES

/* ADD_MONTHS, NEXT_DAY, LAST_DAY */

/* 
1. Print the hire date in the format "01-Jan-2022"
2. Print last name, hire date in the format, "1st of jan 2022" */

SELECT LAST_NAME,TO_CHAR(HIRE_DATE, 'DD-MON-YYYY')
FROM EMPLOYEES
WHERE HIRE_DATE < TO_DATE('01-JAN-08', 'DD-MON-RR')

/* 1. Envelope printing restricts the addressee field to 16 characters. Ideally, 
the addressee field contains employees� FIRST_NAME and LAST_NAME values separated by a 
single space. When the combined length of an employee�s FIRST_NAME and LAST_NAME exceeds 15 characters, 
the addressee field should contain their formal name. An employee�s formal name is made up of the 
first letter of their FIRST_NAME and the first 14 characters of their LAST_NAME. You are required to retrieve 
a list of FIRST_NAME and LAST_NAME values and formal names for employees where the combined length of FIRST_NAME 
and LAST_NAME exceeds 15 characters. 

2. Write a Query that displays the employee number, hire date, number of months employed, six-month review date, 
first Friday after hire date, and the last day of the hire month for all employees 
who have been employed for fewer than 150 months and working for department 50  */

SELECT UPPER(CONCAT(SUBSTR(LAST_NAME,1,8), '_IND'))
FROM EMPLOYEES

/* NVL,  NVL2, COALESCE, NULL IF */

SELECT LAST_NAME, SALARY, COMMISSION_PCT, NVL(COMMISSION_PCT, SALARY)
FROM EMPLOYEES

SELECT LAST_NAME, SALARY, COMMISSION_PCT, NVL2(COMMISSION_PCT, 'SAL+COMM', 'NO COMMISSION') AS "BONUS"
FROM EMPLOYEES

SELECT FIRST_NAME, LAST_NAME, NULLIF(LENGTH(FIRST_NAME),LENGTH(LAST_NAME)) RESULT 
FROM EMPLOYEES

SELECT LAST_NAME, COMMISSION_PCT, MANAGER_ID, COALESCE(TO_CHAR(COMMISSION_PCT), TO_CHAR(MANAGER_ID),'NO COMMISSION AND NO MANAGER')
FROM EMPLOYEES

/* CASE & DECODE FUNCTION */

SELECT LAST_NAME, JOB_ID, SALARY,
CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*0.10
WHEN 'ST_CLERK' THEN SALARY*0.05
WHEN 'SA_REP' THEN SALARY*0.2
ELSE SALARY END "REVISED_SALARY"
FROM EMPLOYEES

SELECT LAST_NAME, JOB_ID, SALARY,
DECODE(JOB_ID,'IT_PROG',SALARY*0.10,
'ST_CLERK',SALARY*0.05,
'SA_REP',SALARY*0.2,
SALARY) "REVISED_SALARY"
FROM EMPLOYEES

SELECT SALARY, LAST_NAME,
(CASE WHEN SALARY<=10000 THEN 'LOW'
WHEN SALARY BETWEEN 10000 AND 20000 THEN 'AVG'
WHEN SALARY>=20000 THEN 'HIGH'
ELSE 'UNKNOWN' END) SALARY
FROM EMPLOYEES

/* GROUP & AGGREGATION FUNCTIONS */
/* GROUP FUNCTIONS IGNORES NULL VALUES */
/* AVG, COUNT, DISTINCT, SUM, MIN, MAX */

SELECT ROUND(AVG(SALARY)), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES
WHERE JOB_ID LIKE '%REP%'

SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
FROM EMPLOYEES

SELECT COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100

SELECT AVG(COMMISSION_PCT)
FROM EMPLOYEES

SELECT AVG(NVL(COMMISSION_PCT,0))
FROM EMPLOYEES

SELECT COUNT(DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES

SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES

SELECT COMMISSION_PCT, NVL(COMMISSION_PCT,0)
FROM EMPLOYEES

/* ALL COLUMNS IN THE SELECT LIST THAT ARE NOT A GROUP FUNCTION MUST BE IN THE GROUP BY CLAUSE */

SELECT COUNT(DEPARTMENT_ID), AVG(SALARY)
FROM EMPLOYEES

SELECT AVG(SALARY)
FROM EMPLOYEES
GROUP BY (DEPARTMENT_ID)

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY (DEPARTMENT_ID)

SELECT DEPARTMENT_ID, JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID

SELECT DEPARTMENT_ID, JOB_ID, COUNT(LAST_NAME)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID

/* WHERE CLAUSE CANNOT BE USED TO RESTRICT GROUPS */

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE AVG(SALARY)>10000
GROUP BY DEPARTMENT_ID

/* HAVING */

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)>10000

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE SALARY>10000
GROUP BY DEPARTMENT_ID

/* ROWS ARE GROUPED, GROUP FN IS APPLIED, GROUPS MATCHING HAVING CLAUSE IS DISPLAYED */

SELECT DEPARTMENT_ID, AVG(SALARY) "AVG_SALARY"
FROM EMPLOYEES
GROUP BY (DEPARTMENT_ID)
ORDER BY "AVG_SALARY" DESC

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(50,60,80,90)
GROUP BY(DEPARTMENT_ID)
HAVING AVG(SALARY)>10000

/* ACTIVITIES 

1)	The company is planning a recruitment drive and wants to identify the days of the week on which 2 or more staff members were hired. 
Your report must list the days and the number of employees hired on each of them.

2) Analysis of staff turnover is a common reporting requirement. You are required to create a report containing the number of 
employees who left their jobs, grouped by the year in which they left. The jobs they performed are also required. 
The results must be sorted in descending order based on the number of employees in each group.
The report must list the year, the JOB_ID, and the number of employees who left a particular job in that year.

3) Calculate the average length of all the country names. Any fractional components must be rounded to the nearest whole number. */

/* JOINS & SUBQUERIES */

/* PURE NATURAL JOINS, USING CLAUSE, ON, OUTER JOINS */

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
FROM DEPARTMENTS
NATURAL JOIN LOCATIONS

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, D.LOCATION_ID, CITY
FROM DEPARTMENTS D,LOCATIONS L
WHERE (D.LOCATION_ID = L.LOCATION_ID)

SELECT * FROM LOCATIONS
SELECT * FROM DEPARTMENTS
SELECT * FROM EMPLOYEES

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID, CITY
FROM DEPARTMENTS
NATURAL JOIN LOCATIONS
WHERE DEPARTMENT_ID IN (50,60,80)

SELECT * FROM EMPLOYEES
NATURAL JOIN DEPARTMENTS

SELECT * FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 

/* T1 --> DEPT_ID, MANAGER_ID, C, D
T2 --> DEPT_ID,MANAGER_ID,X,Y

T1&T2 (NJ) -->  (T1.DEP_ID = T2.DEP_ID) AND (T1.MANAGER_ID = T2.MANAGER_ID)
*/

/* USING CLAUSE */

SELECT * 
FROM EMPLOYEES 
JOIN DEPARTMENTS
USING (DEPARTMENT_ID)
WHERE DEPARTMENT_ID = 80

/* COMMON COLUMNS THAT ARE NOT USED IN THE "USING" CLAUSE MUST BE ALIASED */

SELECT LAST_NAME, DEPARTMENT_ID, E.MANAGER_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
USING (DEPARTMENT_ID)
WHERE DEPARTMENT_ID = 80

/* DO NOT ALIAS THE COLUMN USED IN THE USING CLAUSE */

SELECT LAST_NAME, DEPARTMENT_ID, E.MANAGER_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
USING (DEPARTMENT_ID)
WHERE D.DEPARTMENT_ID = 80

/* ON CLAUSE */

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE D.DEPARTMENT_ID IN (60,80,90)

SELECT EMPLOYEE_ID, LAST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
AND D.DEPARTMENT_ID IN (60,80,90)


/* USING CLAUSE CAN ONLY BE USED TO JOIN COLUMNS WITH SAME NAMES */
/* IN ON CLAUSE COLUMN NAMES CAN BE DIFFERENT */

/* SELECT A, B, C
FROM T1 JOIN T2
USING (B)

SELECT T1.A, T1.B,T2.C
FROM T T1 JOIN TB T2
ON (T1.B = T2.C) */

SELECT * FROM EMPLOYEES
JOIN DEPARTMENTS
USING (DEPARTMENT_ID)

SELECT * FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID=D.DEPARTMENT_ID)

SELECT * FROM DEPARTMENTS

/* SELF JOINS */

SELECT E.FIRST_NAME, E.LAST_NAME, MGR.FIRST_NAME, MGR.LAST_NAME
FROM EMPLOYEES E JOIN EMPLOYEES MGR
ON (E.MANAGER_ID = MGR.EMPLOYEE_ID)

/* NON-EQUI JOINS */

SELECT E.LAST_NAME, E.SALARY, J.JOB_TITLE
FROM EMPLOYEES E JOIN JOBS J
ON E.SALARY BETWEEN J.MIN_SALARY AND J.MAX_SALARY

SELECT * FROM JOBS

/* CROSS JOINS */

SELECT EMPLOYEE_ID, DEPARTMENT_NAME
FROM EMPLOYEES
CROSS JOIN DEPARTMENTS

/* OUTER JOINS */

SELECT LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
RIGHT OUTER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)

/* 1. Fetch the EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID, LAST_NAME, HIRE_DATE, and END_DATE values for all rows retrieved 
using a pure natural join. Alias the EMPLOYEES table

2. Produce a report with one column aliased as Managers. with each row containing a sentence of the format 
FIRST_NAME LAST_NAME is manager of the DEPARTMENT_NAME

3) you are required to retrieve the DEPARTMENT_NAME and DEPARTMENT_ID values for those departments to which no employees are 
currently assigned

4. You are required to retrieve the employee�s LAST_NAME, EMPLOYEE_ID, manager�s LAST_NAME, and employee�s DEPARTMENT_ID 
for the rows with DEPARMENT_ID values of 10, 20, or 30. Alias the EMPLOYEES table as E and the second instance of the EMPLOYEES 
table as M. Sort the results based on the DEPARTMENT_ID column */

/* SUBQUERIES */
/* CRUD */

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES)

SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Russell')

SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) < (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 60)

SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYEES WHERE LAST_NAME = 'Taylor')

/* IN, ANY, ALL, EXISTS */

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < ANY(SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < ALL(SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG')

SELECT EMPLOYEE_ID, SALARY, LAST_NAME
FROM EMPLOYEES E
WHERE EXISTS
(SELECT EMPLOYEE_ID FROM EMPLOYEES E1
WHERE (E1.MANAGER_ID = E.EMPLOYEE_ID)
AND E1.SALARY > 10000)

SELECT * FROM DEPARTMENTS D
WHERE NOT EXISTS
(SELECT * FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT DEPARTMENT_ID,DEPARTMENT_NAME FROM DEPARTMENTS D
WHERE NOT EXISTS
(SELECT NULL FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID)

SELECT E.LAST_NAME
FROM EMPLOYEES E
WHERE E.EMPLOYEE_ID NOT IN 
(SELECT MGR.MANAGER_ID FROM EMPLOYEES MGR)


/* 
1) Write a query to identify all the employees who are managers. 
2) Write a query to identify the highest salary paid in each country.  */

/* CRUD OPERATIONS */

DROP TABLE RETAIL_DB1
DROP TABLE MYRETAIL_DB1

CREATE TABLE RETAIL_DB1(CUST_ID NUMBER(10) NOT NULL, CUST_NAME VARCHAR2 (10) NOT NULL, CITY CHAR(10),
CONSTRAINT RETAILDB_PK2 PRIMARY KEY(CUST_ID))
DESCRIBE RETAIL_DB

CREATE TABLE MYRETAIL_DB1(CUST_ID NUMBER(10) CONSTRAINT RETAILDB2_PK PRIMARY KEY, CUST_NAME VARCHAR2 (10) NOT NULL, CITY CHAR(10))

ALTER TABLE RETAIL_DB ADD(GENDER CHAR(5), PROF CHAR(5))
ALTER TABLE RETAIL_DB MODIFY(GENDER CHAR(10), PROF VARCHAR2(10))
ALTER TABLE RETAIL_DB DROP COLUMN PROF 
ALTER TABLE RETAIL_DB RENAME TO MYRETAIL_DB2

DESCRIBE MYRETAIL_DB2
DROP TABLE MYRETAIL_DB2

INSERT INTO RETAIL_DB1(CUST_ID, CUST_NAME, CITY) VALUES (101,'RAM','BLR')
ALTER TABLE RETAIL_DB1 READ ONLY
SELECT * FROM RETAIL_DB1
INSERT INTO RETAIL_DB1(CUST_ID, CUST_NAME, CITY) VALUES (102,'BHEEM','MLR')
ALTER TABLE RETAIL_DB1 READ WRITE
INSERT INTO RETAIL_DB1(CUST_ID, CUST_NAME, CITY) VALUES (103,'BHEEM',100)
ALTER TABLE RETAIL_DB1 DROP CONSTRAINT RETAILDB_PK2
INSERT INTO RETAIL_DB1(CUST_ID, CUST_NAME, CITY) VALUES (102,'JOHN','MLR')
ALTER TABLE RETAIL_DB1 DROP CONSTRAINT RETAILDB1_PK
ALTER TABLE RETAIL_DB1 ADD CONSTRAINT RETAILDB1_PK2 PRIMARY KEY(CUST_ID)
DELETE FROM RETAIL_DB1 WHERE CUST_ID = 102














