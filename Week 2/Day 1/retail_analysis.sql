CREATE DATABASE retail_analytics;
USE retail_analytics;

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    Email VARCHAR(100)
);
INSERT INTO Customers (Customer_ID, Customer_Name, City, Email)
VALUES
(1, 'Ali Khan', 'Lahore', 'ali@gmail.com'),
(2, 'Sara Ahmed', 'Karachi', 'sara@gmail.com'),
(3, 'Hamza Raza', 'Islamabad', 'hamza@gmail.com'),
(4, 'Ayesha Malik', 'Lahore', 'ayesha@gmail.com'),
(5, 'Bilal Shah', 'Rawalpindi', 'bilal@gmail.com'),
(6, 'Noor Fatima', 'Peshawar', 'noor@gmail.com');

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Unit_Price DECIMAL(10,2)
);

INSERT INTO Products (Product_ID, Product_Name, Category, Unit_Price)
VALUES
(101, 'Laptop', 'Electronics', 85000),
(102, 'Mouse', 'Accessories', 2500),
(103, 'Keyboard', 'Accessories', 4500),
(104, 'Printer', 'Office Supplies', 28000),
(105, 'Office Chair', 'Furniture', 18000),
(106, 'Monitor', 'Electronics', 32000);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Order_Date DATE,
    Quantity INT,
    Payment_Method VARCHAR(30),
    Sales DECIMAL(12,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

INSERT INTO Orders
(Order_ID, Customer_ID, Product_ID, Order_Date, Quantity, Payment_Method, Sales)
VALUES
(1001, 1, 101, '2026-01-05', 1, 'Cash', 85000),
(1002, 2, 102, '2026-01-06', 3, 'Card', 7500),
(1003, 3, 103, '2026-01-07', 2, 'Card', 9000),
(1004, 4, 104, '2026-01-08', 1, 'Bank Transfer', 28000),
(1005, 5, 105, '2026-01-09', 2, 'Cash', 36000),
(1006, 1, 106, '2026-01-10', 2, 'Card', 64000),
(1007, 6, 102, '2026-01-11', 5, 'Cash', 12500),
(1008, 2, 101, '2026-01-12', 1, 'Card', 85000),
(1009, 3, 104, '2026-01-13', 2, 'Bank Transfer', 56000),
(1010, 4, 103, '2026-01-14', 3, 'Cash', 13500);

SELECT * FROM Customers;

SELECT * FROM Products;
select * from Products
where Product_Name = "Laptop";

SELECT DISTINCT Product_Name
FROM Products;

SELECT *
FROM Products
ORDER BY Unit_Price ASC;

SELECT *
FROM Products
LIMIT 3;


select * from orders;