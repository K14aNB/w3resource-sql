/*
 Salespeople with Commission Range 0.10-0.12
 -------------------------------------------

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

EXEC w3resource_sql.dbo.usp_insert_salesman_data

--Write SQL query to find the details of those salespeople whose commission range
--from 0.10 to 0.12. Return salesman_id, name, city and commission
SELECT *
FROM w3resource_sql.dbo.salesman
WHERE commission BETWEEN 0.10 AND 0.12
