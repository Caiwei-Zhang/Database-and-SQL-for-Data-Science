-- Q1 Retrieve all employees whose address is in Elgin,IL
select F_NAME, L_NAME from EMPLOYEES 
		  where ADDRESS like '%Elgin,IL%';
		  
		  
-- Q2 Retrieve all employees who were born during the 1970's
select F_NAME, L_NAME from EMPLOYEES 
		  where B_DATE like '197%';


-- Q3 Retrieve all employees in department 5 whose salary is between 60000 and 70000
select F_NAME, L_NAME from EMPLOYEES 
		  where (SALARY between 60000 and 70000) and DEP_ID = 5; 
-- 需要加括号
-- Solutions select  from EMPLOYEES where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;

-- Q4A Retrieve a list of employees ordered by department ID.
select F_NAME, L_NAME, DEP_ID from EMPLOYEES 
		  order by DEP_ID;


-- Q4B  Retrieve a list of employees ordered in descending order by
-- department ID and within each department ordered alphabetically in
-- descending order by last name. 
select F_NAME, L_NAME, DEP_ID from EMPLOYEES 
		  order by DEP_ID desc, L_NAME desc;
-- 试了好几次试出来了	  


-- Q5A For each department ID retrieve the number of employees in the
-- department.
select DEP_ID, count(DEP_ID) as count from EMPLOYEES
          group by DEP_ID;


-- Q5B For each department retrieve the number of employees in the
-- department, and the average employees salary in the department.
select DEP_ID, count(DEP_ID) , AVG(SALARY) from EMPLOYEES
          group by DEP_ID;
-- 有疑问，这样写是否会把所有的SALARY都进行平均
          

-- Q5C Label the computed columns in the result set of Query 5B as
--“NUM_EMPLOYEES” and “AVG_SALARY”.
select DEP_ID, count(DEP_ID) as NUM_EMPLOYEES, 
                        AVG(SALARY)  as AVG_SALARY from EMPLOYEES
          group by DEP_ID;
          

-- Q5D In Query 5C order the result set by Average Salary.
select DEP_ID, count(DEP_ID) as NUM_EMPLOYEES, 
                        AVG(SALARY)  as AVG_SALARY from EMPLOYEES
          group by DEP_ID
          order by AVG(SALARY);
          
          
-- Q5E  In Query 5D limit the result to departments with fewer than 4
-- employees.
select DEP_ID, count(DEP_ID) as NUM_EMPLOYEES, 
                        AVG(SALARY)  as AVG_SALARY from EMPLOYEES
          group by DEP_ID
          having count(DEP_ID)  4
          order by AVG(SALARY);
          
--5E alternative if you want to use the label
-- select DEP_ID, NUM_EMPLOYEES, AVG_SALARY from
--   ( select DEP_ID, COUNT() AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY from EMPLOYEES group by DEP_ID)
--   where NUM_EMPLOYEES  4
-- order by AVG_SALARY;

-- Q6 Similar to 4B but instead of department ID use department
-- name. Retrieve a list of employees ordered by department name, and within
-- each department ordered alphabetically in descending order by last name.

-- select F_NAME, L_NAME from EMPLOYEES and DEP_NAME from DEPARTMENTS
-- order by DEP_NAME desc，L_NAME desc;

--BONUS Query6--
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;








