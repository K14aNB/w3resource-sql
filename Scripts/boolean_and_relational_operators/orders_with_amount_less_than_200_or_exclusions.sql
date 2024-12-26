/*
 Orders with Amount < 200 or Exclusions
 --------------------------------------

 Table: orders

 ord_no      purch_amt   ord_date    customer_id  salesman_id
----------  ----------  ----------  -----------  -----------
70001       150.5       2012-10-05  3005         5002
70009       270.65      2012-09-10  3001         5005
70002       65.26       2012-10-05  3002         5001
70004       110.5       2012-08-17  3009         5003
70007       948.5       2012-09-10  3005         5002
70005       2400.6      2012-07-27  3007         5001
70008       5760        2012-09-10  3002         5001
70010       1983.43     2012-10-10  3004         5006
70003       2480.4      2012-10-10  3009         5003
70012       250.45      2012-06-27  3008         5002
70011       75.29       2012-08-17  3003         5007
70013       3045.6      2012-04-25  3002         5001
 */

EXEC w3resource_sql.dbo.usp_insert_orders_data

--Write SQL query to find details of all orders with a purchase amount less than 200 or
--exclude orders with an order date greater than or equal to '2012-02-10' and a
--customer_id less than 3009. Return ord_no, purch_amt, ord_date, customer_id and
--salesman_id
SELECT *
FROM w3resource_sql.dbo.orders
WHERE purch_amt < 200 OR NOT (ord_date >= '2012-02-10' AND customer_id < 3009)
