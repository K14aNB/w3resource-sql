/*
 Script for creating stored procedure to insert data into nobel_win table
 */

 CREATE OR ALTER PROCEDURE USP_insert_nobel_win_data
 AS
 BEGIN
     IF EXISTS(SELECT name FROM w3resource_sql.sys.objects WHERE name = 'nobel_win' AND type = 'U') AND
     NOT EXISTS(SELECT 1 FROM w3resource_sql.dbo.nobel_win)
     BEGIN
         BULK INSERT w3resource_sql.dbo.nobel_win
         FROM '/tmp/csvdata/nobel_win.csv'
         WITH (
             FORMAT = 'CSV',
             FIELDTERMINATOR = ',',
             ROWTERMINATOR = '\n',
             FIRSTROW = 2
         )
     END
 END