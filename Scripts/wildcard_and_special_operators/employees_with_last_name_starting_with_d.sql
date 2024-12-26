/*
 Employees With Last Name Starting with D
 ----------------------------------------

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

EXEC w3resource_sql.dbo.usp_insert_emp_details_data

--Write SQL query to locate the employees whose last name begins with the letter 'D'.
--Return emp_idno, emp_fname, emp_lname, emp_dept
SELECT *
FROM w3resource_sql.dbo.emp_details
WHERE emp_lname LIKE 'D%'
