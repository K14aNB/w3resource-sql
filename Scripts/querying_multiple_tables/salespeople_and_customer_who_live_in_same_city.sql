/*
 Salespeople and Customers Who Live In Same City
 -----------------------------------------------

 Table: salesman

  salesman_id |    name    |   city   | commission
-------------+------------+----------+------------
        5001 | James Hoog | New York |       0.15
        5002 | Nail Knite | Paris    |       0.13
        5005 | Pit Alex   | London   |       0.11
        5006 | Mc Lyon    | Paris    |       0.14
        5007 | Paul Adam  | Rome     |       0.13
        5003 | Lauson Hen | San Jose |       0.12

 Table: customer

 customer_id |   cust_name    |    city    | grade | salesman_id
-------------+----------------+------------+-------+-------------
        3002 | Nick Rimando   | New York   |   100 |        5001
        3007 | Brad Davis     | New York   |   200 |        5001
        3005 | Graham Zusi    | California |   200 |        5002
        3008 | Julian Green   | London     |   300 |        5002
        3004 | Fabian Johnson | Paris      |   300 |        5006
        3009 | Geoff Cameron  | Berlin     |   100 |        5003
        3003 | Jozy Altidor   | Moscow     |   200 |        5007
        3001 | Brad Guzan     | London     |       |        5005
*/

EXEC w3resource_sql.dbo.USP_insert_salesman_data

EXEC w3resource_sql.dbo.USP_insert_customer_data

--Write SQL query to find salespeople and customers who live in same city.
--Return customer_name, salesperson name and city.
SELECT
    c.cust_name,
    s.name,
    s.city
FROM customer AS c
INNER JOIN salesman AS s
    ON c.city = s.city
ORDER BY s.name ASC
