/*
 Orders Between 500-4000 Excluding Specific Amounts
 --------------------------------------------------

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

--Write SQL query to select orders between 500 and 4000 (both included).
--Exclude orders amount 948.50 and 1983.43.
--Return ord_no, purch_amt, ord_date, customer_id, salesman_id
SELECT *
FROM w3resource_sql.dbo.orders
WHERE purch_amt BETWEEN 500 AND 4000 AND purch_amt NOT IN (948.50, 1983.43)
