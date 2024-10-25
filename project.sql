create database project;

use project;

-- Catogory
CREATE TABLE IF NOT EXISTS Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);
-- Customers
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20),
    Address TEXT
);
-- Products
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10, 2) NOT NULL,
    QuantityInStock INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
-- Orders    
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Employees 
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    HireDate DATE NOT NULL
);

-- INSERTING VALUES IN CATOGORY:
INSERT INTO Category (CategoryName) VALUES 
('Electronics'),
('Clothing'),
('Groceries'),
('Books'),
('Furniture'),
('Toys'),
('Health & Beauty'),
('Sports');

select * from category;

-- INSERTING VALUES IN CUSTOMERS:
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address) VALUES 
('Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '123 Raj Nagar'),
('Ishita', 'Patel', 'ishita.patel@example.com', '8765432109', '456 Park Street'),
('Ravi', 'Kumar', 'ravi.kumar@example.com', '7654321098', '789 Patel Nagar'),
('Ananya', 'Deshmukh', 'ananya.deshmukh@example.com', '6543210987', '321 MG Road'),
('Arjun', 'Reddy', 'arjun.reddy@example.com', '5432109876', '654 Lake View'),
('Sanya', 'Gupta', 'sanya.gupta@example.com', '4321098765', '987 Green Avenue'),
('Vikram', 'Mehta', 'vikram.mehta@example.com', '3210987654', '654 Blue Ridge');

select * from customers;

-- INSERTING VALUES IN PRODUCTS:
INSERT INTO Products (ProductName, CategoryID, Price, QuantityInStock) VALUES 
('Smartphone', 1, 299.99, 50),        -- Electronics
('Jeans', 2, 49.99, 100),             -- Clothing
('Milk', 3, 2.99, 200),               -- Groceries
('Laptop', 1, 799.99, 30),            -- Electronics
('T-Shirt', 2, 19.99, 150),           -- Clothing
('Bread', 3, 1.99, 250),              -- Groceries
('Desk Chair', 5, 89.99, 20),         -- Furniture
('Action Figure', 6, 15.99, 75),      -- Toys
('Shampoo', 7, 5.49, 80),             -- Health & Beauty
('Soccer Ball', 8, 24.99, 40) ,      -- Sports
('Headphones',1,150.50,60);


select * from products;

-- How can you rename the column TotalAmount to Amount in the ORDERS table
-- and change its data type to decimal(10,2)?
ALTER TABLE ORDERS CHANGE COLUMN TotalAmount Amount decimal(10,2);

-- INSERTING VALUES IN ORDER:
INSERT INTO Orders (CustomerID, ProductID, Quantity, OrderDate, Amount) VALUES 
(1, 1, 1, '2024-08-01', 299.99),    -- Customer 1 orders Smartphone
(1, 3, 2, '2024-08-01', 5.98),      -- Customer 1 orders Milk
(2, 2, 1, '2024-08-02', 49.99),     -- Customer 2 orders Jeans
(2, 3, 1, '2024-08-02', 2.99),      -- Customer 2 orders Milk
(3, 4, 1, '2024-08-03', 799.99),    -- Customer 3 orders Laptop
(3, 5, 3, '2024-08-03', 59.97),     -- Customer 3 orders T-Shirts
(4, 6, 2, '2024-08-04', 31.98),     -- Customer 4 orders Action Figures
(4, 7, 4, '2024-08-04', 21.96),     -- Customer 4 orders Shampoo
(5, 8, 1, '2024-08-05', 24.99),     -- Customer 5 orders Soccer Ball
(5, 2, 2, '2024-08-05', 99.98),     -- Customer 5 orders Jeans
(6, 1, 2, '2024-08-06', 599.98),    -- Customer 6 orders Smartphones
(6, 5, 1, '2024-08-06', 19.99),     -- Customer 6 orders T-Shirt
(7, 3, 5, '2024-08-07', 14.95),     -- Customer 7 orders Milk
(7, 7, 2, '2024-08-07', 10.98);     -- Customer 7 orders Shampoo

select * from orders;

-- INSERTING VALUES IN EMPLOYEES TABLE: 
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate) VALUES 
('Raj', 'Singh', 'General Manager', 65000.00, '2020-02-10'),
('Priya', 'Chopra', 'Assistant Manager', 40000.00, '2023-04-05'),
('Amit', 'Sharma', 'Cashier', 35000.00, '2022-05-12'),
('Neha', 'Verma', 'Sales Person', 28000.00, '2021-06-18'),
('Karan', 'Patel', 'Sales Person', 20000.00, '2023-07-20'),
('Maya', 'Kumari', 'Sales Person', 18000.00, '2024-05-25'),
('Ravi', 'Nair', 'Cashier', 30000.00, '2023-09-15'),
('Sanya', 'Joshi', 'Sales Person', 28000.00, '2021-10-10'),
('Vikram', 'Singh', 'Sales Person', 15000.00, '2024-08-05'),
('Ananya', 'Reddy', ' Manager', 50000.00, '2021-12-01');

select * from employees;
 




