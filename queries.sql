USE PROJECT; 

-- 1. Find Products that start with the letter 'S' And ends with 'e':
select * from Products where ProductName like 's%e';

-- 2. Query for Products with Name Starting with 'S' or Ending with 'k; 
SELECT * FROM Products
WHERE ProductName LIKE 'S%' OR ProductName LIKE '%k';

-- 3. Find Employees whose FirstName contains 'r'whose salary is greater than 400000:
select * from employees where FirstName like '%r%' and salary > 40000;

-- 4. Find products whose names have exactly 4 characters:
select * from products where ProductName like '____' ;

-- 5. Find employees whose first names start with any letter between 'K' and 'N':
SELECT * FROM employees WHERE firstname >='K' AND firstname <'o';

-- 6. Find Orders placed on or after '2024-08-01' and where the total amount is greater than $100:
select * from Orders where OrderDate > '2024-08-01' and Amount > 100.00;

-- 7. Find Orders where the quantity is either 1 or 2:
select * from Orders where quantity = 1 or quantity =2;

-- 8. Find Products that are not in the 'Groceries' category:
select * from products where  CategoryID <>  3;

-- 9. select products where the CategoryID is not between 5 and 8: 
select * from products where CategoryID  not between 5 and 8;

-- 10. Count the number of employees in each position:
select Position , count(*) as Total 
from employees
group by Position;

-- 11. Find the total sales amount for each product:
select ProductID, sum(Amount) As Total 
from Orders
group by ProductID;

-- 12 Find the avg, min,max sales amount for each product: 
select ProductID, avg(Amount) As AvgTotal , min(Amount) As MinimumAmount,max(Amount) As MaximumAmount
from Orders
group by ProductID;

-- 13.List all product names for each category:
SELECT CategoryID, GROUP_CONCAT(ProductName) AS Products
FROM Products
GROUP BY CategoryID;

-- 14. Find categories with more than 1 products:
select CategoryID, count(*) as TOtalproduct
from products
group by CategoryID
having count(*)>1;

-- 15. Find positions where the average salary is greater than $30,000:
select Position, round(avg(Salary) ,2) As AverageSalary
from EMPLOYEES
group by Position
having avg(Salary) > 30000;

-- 16.Write a SQL query to retrieve the top 5 most expensive products. Include  ProductName, Price, 
-- and order the results by Price in descending order. 
SELECT  ProductName, Price 
From products
order by price desc
limit 5;

-- 17. Find the top 5 most expensive products: 
select * from products 
order by Price desc
limit 5;

-- 18. Find the name of the product with the highest price:
select ProductName, max(price) As HighAmounnt
from products
group by ProductName
order by HighAmounnt desc
limit 1;

-- 19 Write a query to find all unique first names that are either customer first names or employee first names.
SELECT FirstName 
FROM Employees
UNION
SELECT Cus_FirstName
FROM Customers;

-- 20. Retrieve all product names and all category names, including duplicates.
select productname from products
union all 
select categoryname from category;

-- 21.Retrieve the full names of all customers by concatenating their first and last names.
select concat(Cus_FirstName,' ',lastname ) as Cust_Name
from customers;

-- 22. How can you retrieve the names of all products that have a name length of 5 characters 
-- or more from the products table?"
select productname, length(productname) as lengths
from products
where length(productname) >= 5 ;

-- 23. Extract the first three characters from each category name
select categoryname , substring(CategoryName,1,3) as substrings
from category;

-- 24. Replace the substring "Soccer" with "Football" in the product names.
select productname, replace(productname,'Soccer Ball','Football') as modified
from products;

-- 25. Find the position of the substring "Chair" in the product names.
select productname, locate('chair',productname) as position 
from products 
where productname like "%chair%";

-- 26. What is today's date?
select curdate() as todaydate; 

-- 27. What is the current date and time?
select now() as CurrentDateTime;

-- 28. How can you retrieve the order ID, year, month, and day of each order from the Orders table?
SELECT OrderID, YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth,
DAY(OrderDate) AS OrderDay
FROM Orders;

-- 29. Convert the string '15/09/2024' to a date format.
SELECT STR_TO_DATE('15/09/2024', '%d/%m/%Y') AS ConvertedDate;

-- 30. How can you retrieve the details of customers whose CustomerID values are even numbers from the Customers table?
select * from customers where mod(customerid,2) = 0;

-- 31. How can you retrieve the details of customers whose CustomerID values are odd numbers from the Customers table?
select * from customers where mod(customerid,2) = 1;

-- 32. How can you retrieve 5 randomly selected customers from the Customers table?
SELECT * FROM Customers ORDER BY RAND() LIMIT 5;

-- 33. Rename the FirstName column to CustomerFirstName in the Customers table.
ALTER TABLE CUSTOMERS CHANGE COLUMN FIRSTNAME Cus_FirstName varchar(255);

-- 34. How can you retrieve the details of customers with CustomerID values of 2, 3, and 7 from the Customers table?
SELECT * FROM Customers WHERE CustomerID IN (2, 3, 7);

-- 35.  Write a SQL query to retrieve all orders placed in the last 15 days.
-- Include OrderID, OrderDate, CustomerID, and TotalAmount. 
select OrderID, OrderDate, CustomerID,Amount
from orders 
where OrderDate >= date_add(curdate(),INTERVAL -15 DAY);

-- 36. Write a SQL query to retrieve all employees who were hired in the last 2 year. 
-- Assume there's a column DateHired in the Employees table. 
-- Include EmployeeID, FirstName, LastName, Position, and DateHired. 
SELECT EmployeeID, FirstName, LastName, Position, HireDate
FROM Employees
WHERE YEAR(HireDate) >= YEAR(CURDATE()) - 2;


-- 37. Write a SQL query to retrieve all products that belong to CategoryID = 2 and have a price between 10 and 50. 
-- Include ProductID, ProductName, Price, and CategoryID. 
SELECT CategoryID,ProductID, ProductName, Price
FROM PRODUCTS
WHERE CategoryID = 2
AND PRICE BETWEEN 10 AND 50 ;

-- 38. Write a SQL query to retrieve all orders where the TotalAmount is greater than the average TotalAmount of all orders. 
-- Include OrderID, CustomerID, OrderDate, and TotalAmount. 
SELECT OrderID, CustomerID, OrderDate,Amount
FROM ORDERS
WHERE AMOUNT > (SELECT AVG(AMOUNT) FROM ORDERS);

-- 39. Write a SQL query to retrieve all orders placed by customers with CustomerID = 4 or CustomerID = 5 
-- where the TotalAmount is less than 50. Include OrderID, CustomerID, OrderDate, and TotalAmount
SELECT OrderID, CustomerID, OrderDate, Amount
FROM ORDERS 
WHERE (CustomerID = 5 or CustomerID = 4) AND AMOUNT <50;

-- 40. Write a SQL query to retrieve all products that do not belong to CategoryID = 1 or CategoryID = 4. 
-- Include ProductID, ProductName, Price, and CategoryID. 
select ProductID, ProductName, Price, CategoryID
from products
where CategoryID not in (1,4);

-- 41. Write a SQL query to retrieve all orders that include products with a ProductID of 7 or 15.
-- Assume ProductID is a foreign key in the Orders table. 
-- Include OrderID, CustomerID, OrderDate, and TotalAmount. 
select OrderID, CustomerID, OrderDate, Amount
from orders
where ProductID in (7,15);

-- 42. What are the top 5 products with the highest total sales amount, 
-- and how many times has each product been ordered?"
select Products.ProductName,Orders.ProductID,sum(Orders.amount) as TotalAmount, count(Orders.Quantity) as Totalcount
from Products join Orders on Products.ProductID =Orders.ProductID
group by Products.ProductID, Orders.ProductID
order by sum(amount) desc
limit 5;

-- 43.  Write a SQL query to retrieve the top 5 customers who have spent the most in total. 
-- Include their CustomerID, FirstName, LastName, and their total spending (TotalAmount).
select  CUSTOMERS.CustomerID,  CUSTOMERS.cus_FirstName,  CUSTOMERS.LastName, sum(orders.amount) as total_amount
from customers
join orders on customers.CustomerID = orders.CustomerID
group by customers.CustomerID,customers.cus_FirstName, customers.LastName
order by total_amount desc
limit 5;


