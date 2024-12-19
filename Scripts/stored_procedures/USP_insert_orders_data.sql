/*
 Script for creating stored procedure to insert data into orders table
 */

 CREATE OR ALTER PROCEDURE USP_insert_orders_data
 AS
 BEGIN
     IF EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'orders' AND type = 'U') AND
     NOT EXISTS(SELECT 1 FROM w3resource_sql.dbo.orders)
     BEGIN
         BULK INSERT w3resource_sql.dbo.orders
         FROM '/tmp/csvdata/orders.csv'
         WITH (
             FORMAT = 'CSV',
             FIELDTERMINATOR = ',',
             ROWTERMINATOR = '\n',
             FIRSTROW = 2
             )
     END
 END
