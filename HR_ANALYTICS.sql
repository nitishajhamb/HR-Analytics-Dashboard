CREATE DATABASE hr_analytics;
USE hr_analytics;
CREATE TABLE employees (
employee_id VARCHAR(10) PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL,
gender VARCHAR(10),
date_of_birth DATE,
age INT,
marital_status VARCHAR(20),
education_level VARCHAR(50),
department VARCHAR(50),
job_title VARCHAR(100),
date_of_joining DATE,
years_at_company INT,
salary INT,
city VARCHAR(50),
performance_rating VARCHAR(20),
employment_status VARCHAR(50),
attrition VARCHAR(10),
absent_days int
);
SELECT * FROM employees;
SELECT * FROM employees LIMIT 10;
SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(*) AS total_employees ,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
ROUND( SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate_percentage
FROM employees;

SELECT department,
COUNT(*) AS total,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_percentage
FROM employees
GROUP BY department
ORDER BY attrition_percentage DESC;

SELECT department,
ROUND(AVG(salary),0) AS avg_salary,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

SELECT gender,
COUNT(*) AS count,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM employees),2) AS percentage
FROM employees
GROUP BY gender;

SELECT performance_rating,
COUNT(*) AS employee_count,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM employees),2) AS percentage
FROM employees
GROUP BY performance_rating
ORDER BY percentage DESC;

SELECT performance_rating,
COUNT(*) AS employee_count,
ROUND(AVG(salary),0) AS avg_salary,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary
FROM employees
GROUP BY performance_rating
ORDER BY avg_salary DESC;

SELECT education_level,
COUNT(*) AS employee_count
FROM employees
GROUP BY education_level
ORDER BY employee_count DESC;

SELECT YEAR(date_of_joining) AS joining_year,
COUNT(*) AS employees_hired
FROM employees
GROUP BY YEAR(date_of_joining)
ORDER BY joining_year;

SELECT department,
ROUND(AVG(absent_days),0) AS avg_absent_days
FROM employees
GROUP BY department
ORDER BY avg_absent_days DESC;

SELECT attrition,
ROUND(AVG(salary),0) AS avg_salary,
COUNT(*) AS count
FROM employees
GROUP BY attrition;

SELECT emplyee_id,
employee_name,
department,
job_title,
salary
FROM employees
ORDER BY salary DESC
LIMIT 10;

SELECT city,
SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male,
SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female
FROM employees
GROUP BY city
ORDER BY city;

SELECT 
CASE
WHEN age < 25 THEN 'under 25'
WHEN age BETWEEN 25 AND 34 THEN '25-34'
WHEN age BETWEEN 35 AND 44 THEN '35-44'
WHEN age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END AS age_group,
COUNT(*) AS total,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_percentage
FROM employees
GROUP BY age_group
ORDER BY age_group;

SELECT city,
COUNT(*) AS active_employees
FROM employees
GROUP BY city
ORDER BY active_employees DESC;

CREATE VIEW delhi_employees AS
SELECT * FROM employees
WHERE city = 'Delhi';
SELECT * FROM delhi_employees;
		
        
