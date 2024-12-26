/*
 Count of Unique Orders And Highest Purchase Amount For Each Customer
 --------------------------------------------------------------------

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

EXEC w3resource_sql.dbo.USP_insert_orders_data

--Write SQL query to count the unique orders and highest purchase amount
--for each customer. Sort the result in descending order of count.
--Return customer_id, number of distinct orders and highest purchase amount
--by each customer.
SELECT
    customer_id,
    COUNT(*) AS count_of_orders,
    MAX(purch_amt) AS highest_purchase_amount
FROM w3resource_sql.dbo.orders
GROUP BY customer_id
ORDER BY count_of_orders DESC
