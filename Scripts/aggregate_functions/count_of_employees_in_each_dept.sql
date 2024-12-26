/*
 Count of Employees in Each Department
 -------------------------------------

 Table: emp_details

  EMP_IDNO EMP_FNAME       EMP_LNAME         EMP_DEPT
--------- --------------- --------------- ----------
   127323 Michale         Robbin                  57
   526689 Carlos          Snares                  63
   843795 Enric           Dosio                   57
   328717 Jhon            Snares                  63
   444527 Joseph          Dosni                   47
   659831 Zanifer         Emily                   47
   847674 Kuleswar        Sitaraman               57
   748681 Henrey          Gabriel                 47
   555935 Alex            Manuel                  57
   539569 George          Mardy                   27
   733843 Mario           Saule                   63
   631548 Alan            Snappy                  27
   839139 Maria           Foster                  57
*/

EXEC w3resource_sql.dbo.USP_insert_emp_details_data

--Write SQL query to count the number of employees in each department.
--Return department code and number of employees.
SELECT
    emp_dept,
    COUNT(*) AS count_of_employees
FROM w3resource_sql.dbo.emp_details
GROUP BY emp_dept
ORDER BY emp_dept ASC
