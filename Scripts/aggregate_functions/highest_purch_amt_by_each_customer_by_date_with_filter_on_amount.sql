/*
 Highest Purchase Amount By Each Customer by Date With Filter On Amount
 ---------------------------------------------------------------------------------

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

--Write SQL query to find the highest purchase amount by each customer
--on particular date with filter on purchase amount. Filter the result
--by highest purchase amount above 2000.00. Return customer_id, ord_date,
--and maximum_purchase_amount.
SELECT
    customer_id,
    ord_date,
    MAX(purch_amt) AS maximum_purchase_amount
FROM w3resource_sql.dbo.orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) > 2000.00
ORDER BY maximum_purchase_amount DESC
