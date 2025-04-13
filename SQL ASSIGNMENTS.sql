
--1. Basic Data Retrieval

--Retrieve data from the accounts table and display the names, websites and sales reps of all our 
--customers at Perch and Posey.

SELECT name, website, sales_rep_id
FROM accounts

--2. Filtering Data
--i) Retrieve the order id and the quantity ordered of only standard paper.

SELECT id, sum(standard_qty)AS standard_qty
FROM orders
GROUP BY  orders.id

--ii) Identify the top 10 total orders by paper quantity ordered?

SELECT total, max(total) AS total_orders
FROM orders  
GROUP BY total
ORDER BY total_orders desc
limit 10

--iii) Identify large total orders that are greater than 2000 pieces

SELECT total, max(total) as largest_orders
FROM orders
where total > 2000
group by total
order by total desc 

--3. Basic Data Retrieval
--Using the appropriate table, identify the highest total single order by count, made by a company

SELECT name, total, count(total )
from orders o
join accounts a
on o.account_id = a.id
group by a.name, o.total 
order by o.total desc
limit 1

--4. Filtering Data
--Using the appropriate table, identify the top 3 total single order by amount paid, made by the acompany.

SELECT total_amt_usd AS top_3_orders
FROM orders
ORDER BY total_amt_usd desc
limit 3

--5. Filtering Data
--Retrieve the list of orders where the total ordered quantity is greater than 2000 and the total price
--is greater than 50,000 , sorted by the order’s ID, in ascending order.


SELECT MAX (total),(total_amt_usd) 
FROM orders o
where total > 2000 and total_amt_usd > 50000
group by total_amt_usd, o.id
order by id asc

--6. Join

--Retrieve the top 10 orders of poster paper by amount spent and the respective names of companies 
--that placed the order. This will require both the Accounts table and the Orders table

SELECT name, MAX (total_amt_usd),(poster_qty)
FROM accounts a
JOIN orders o
on a.id = o.account_id
GROUP BY a.name, o.poster_qty, total_amt_usd
order by total_amt_usd desc
limit 10

--7. Join

--Retrieve the account names for all customers, the names of their sales reps and 
--the region names of their respective sales reps.

SELECT accounts.name AS customers_name, sales_reps.name AS sales_reps, region.name AS regions
FROM accounts 
JOIN sales_reps ON accounts.sales_rep_id = sales_reps.id 
JOIN region ON region.id = sales_reps.region_id
GROUP BY accounts.name, sales_reps.name, region.name 


