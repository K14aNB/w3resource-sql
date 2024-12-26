/*
 Highest Grade in each city
 --------------------------

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

EXEC w3resource_sql.dbo.usp_insert_customer_data

--Write SQL query to find the highest grade of customers in each city.
SELECT
    city,
    MAX(grade) AS highest_grade
FROM w3resource_sql.dbo.customer
GROUP BY city
ORDER BY highest_grade DESC
