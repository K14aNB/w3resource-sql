/*
 Script for creating stored procedure to insert data into customer table
 */

 CREATE OR ALTER PROCEDURE USP_insert_customer_data
 AS
 BEGIN
     IF EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'customer' AND type = 'U') AND
     NOT EXISTS(SELECT 1 FROM w3resource_sql.dbo.customer)
     BEGIN
         BULK INSERT w3resource_sql.dbo.customer
         FROM '/tmp/csvdata/customer.csv'
         WITH (
             FORMAT = 'CSV',
             FIELDTERMINATOR = ',',
             ROWTERMINATOR = '\n',
             FIRSTROW = 2
             )
     END
 END