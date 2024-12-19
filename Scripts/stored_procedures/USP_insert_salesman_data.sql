/*
 Script for creating stored procedure to insert data into salesman table
 */

 CREATE OR ALTER PROCEDURE USP_insert_salesman_data
 AS
 BEGIN
    IF EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'salesman' AND type = 'U') AND
    NOT EXISTS(SELECT 1 FROM w3resource_sql.dbo.salesman)
        BEGIN
            BULK INSERT w3resource_sql.dbo.salesman
                FROM '/tmp/csvdata/salesman.csv'
                WITH (FORMAT = 'CSV',
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n',
                FIRSTROW = 2)
        END
 END

