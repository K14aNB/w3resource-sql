/*
 Sum of Allotment of Departments
 -------------------------------

 Table: emp_department

 DPT_CODE DPT_NAME        DPT_ALLOTMENT
-------- --------------- -------------
      57 IT                      65000
      63 Finance                 15000
      47 HR                     240000
      27 RD                      55000
      89 QC                      75000
*/

EXEC w3resource_sql.dbo.USP_insert_emp_department_data

--Write SQL query to compute the sum of the allotment amount of all departments.
--Return sum of allotment amount.
SELECT SUM(dpt_allotment) AS sum_of_allotment
FROM w3resource_sql.dbo.emp_department
