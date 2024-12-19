/*
 Script to create emp_details table and insert data
 */

 IF EXISTS(SELECT name FROM sys.databases WHERE name = 'w3resource_sql') AND
    NOT EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'emp_details' AND type = 'U')
 BEGIN
     CREATE TABLE w3resource_sql.dbo.emp_details(emp_idno INT PRIMARY KEY,
                                                 emp_fname VARCHAR(30) NOT NULL,
                                                 emp_lname VARCHAR(40) NOT NULL,
                                                 emp_dept TINYINT NOT NULL)

 END