/*
 Customers With Grade
 --------------------

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

--Write SQL query to locate all customers with a grade value.
--Return customer_id, cust_name, city, grade, salesman_id.
SELECT *
FROM w3resource_sql.dbo.customer
WHERE grade IS NOT NULL
