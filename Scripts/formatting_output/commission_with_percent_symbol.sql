/*
 Commission With Percent (%) Symbol
 ----------------------------------

 Table: salesman

 salesman_id |    name    |   city   | commission
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12
*/

EXEC w3resource_sql.dbo.USP_insert_salesman_data

--Write SQL query to select all the salespeople.
--Return salesman_id, name, city and commission with the percent (%) sign.
SELECT
    salesman_id,
    name,
    city,
    CONCAT(CAST((100 * commission) AS VARCHAR(10)), '%') AS commission_percentage
FROM w3resource_sql.dbo.salesman
