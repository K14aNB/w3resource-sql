/*
 Script for creating stored procedure to insert data into emp_details table
 */

 CREATE OR ALTER PROCEDURE USP_insert_emp_details_data
 AS
 BEGIN
     IF EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'emp_details' AND type = 'U') AND
     NOT EXISTS(SELECT 1 FROM w3resource_sql.dbo.emp_details)
     BEGIN
         BULK INSERT w3resource_sql.dbo.emp_details
         FROM '/tmp/csvdata/emp_details.csv'
         WITH (
            FORMAT = 'CSV',
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2
            )
     END
 END