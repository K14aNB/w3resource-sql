/*
 Salespeople with Names not in A-M Range
 ---------------------------------------

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

--Write SQL query to find details of all salespeople except those whose names begin
--with any letter between 'A' and 'M'. Return salesman_id, name, city, commission.
SELECT *
FROM w3resource_sql.dbo.salesman
WHERE NOT (
        name LIKE 'A%'
        OR name LIKE 'B%'
        OR name LIKE 'C%'
        OR name LIKE 'D%'
        OR name LIKE 'E%'
        OR name LIKE 'F%'
        OR name LIKE 'G%'
        OR name LIKE 'H%'
        OR name LIKE 'I%'
        OR name LIKE 'J%'
        OR name LIKE 'K%'
        OR name LIKE 'L%'
        OR name LIKE 'M%'
    )
