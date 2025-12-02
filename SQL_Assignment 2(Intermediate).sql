
/***************************************************************************************************
   Task: SQL_Assignment 2(Intermediate)
   Date: 26-NOV-2025
   Student : Manju Reddy
   Input files : Company Table.csv, Department Table.csv,Employee Table.csv
   List of Tables : Employee, Department, Company
   Questions Answered from "SQL_Assignment_2.pdf"
   ****************************************************************************************************/

## 1. Query all rows from Department table?
SELECT * 
FROM department_tb;

## 2.Change the name of department with id = 1 to 'Management'?
UPDATE department_tb 
SET name = 'Management'
WHERE ID = 1;

## 3.Delete employees with salary greater than 100000?
DELETE FROM employee_tb WHERE salary> 100000;

## 4.Query the names of companies?
SELECT DISTINCT NAME FROM company_tb;

## 5.Query the name and city of every employee?
SELECT name EmpName, City
FROM employee_tb;

## 6.Query all companies with revenue greater than 5000000?
SELECT * FROM company_tb
WHERE revenue>5000000 ;

## 7.Query all companies with revenue smaller than 5000000?
SELECT * FROM company_tb
WHERE revenue < 5000000 ;

## 8.Query all companies with revenue smaller than 5000000, but you cannot use the '<' operator?
SELECT name Company FROM company_tb
WHERE revenue between 0 AND 5000000;

## 9.Query all employees with salary greater than 50000 and smaller than 70000?
SELECT name, salary FROM employee_tb
WHERE salary>50000 AND salary<70000;

## 10.Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN?
SELECT name, salary FROM employee_tb
WHERE salary>50000 AND salary<70000;

## 11.Query all employees with salary equal to 80000?
SELECT name, salary FROM employee_tb
WHERE salary=80000;

## 12.Query all employees with salary not equal to 80000?
SELECT name, salary FROM employee_tb
WHERE salary!=80000;

## 13.Query all departments (each name only once)?
SELECT distinct name 'Deptname' FROM department_tb;

## 14.Query names of all employees together with id of department they work in, but you cannot use JOIN?
SELECT emp_tb.name EmpName , department_id Department
FROM employee_tb emp_tb;

## 15.Query names of all employees together with id of department they work in, using JOIN?
SELECT emp_tb.name EmpName , dept_tb.id Department
FROM employee_tb emp_tb, department_tb dept_tb
where emp_tb.department_id = dept_tb.id;

## 16.Query name of every company together with every department?
SELECT c.name Company, d.name Department FROM company_tb c CROSS JOIN department_tb d
order by 1;

## 17.Query employee name together with the department name that they are not working?
SELECT emp_tb.name EmpName , dept_tb.name Department
FROM employee_tb emp_tb, department_tb dept_tb
where emp_tb.department_id != dept_tb.id
order by 1;

## 18.Query names of every company and change the name of column to 'Company'?
SELECT * FROM company_tb;

ALTER TABLE company_tb RENAME COLUMN name TO company;

## 19.Query the city wise salary?
SELECT city, salary 
FROM employee_tb
ORDER BY CITY, SALARY;

## 20.Query the highest revenue company name?
SELECT b.COMPANY 
FROM company_tb b, (SELECT max(revenue) revenue FROM company_tb ) a
WHERE b.REVENUE = a.revenue;
