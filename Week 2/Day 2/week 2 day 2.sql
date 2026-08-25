SELECT *
FROM Products
WHERE Unit_Price > 30000
AND category = "Electronics";

SELECT *
FROM Products
WHERE Category = 'Electronics'
   OR Category = 'Accessories';
   
   SELECT *
FROM Products
WHERE Category IN ('Furniture', 'Office Supplies');

select * 
from products
where Unit_Price BETWEEN 5000 AND 30000;

SELECT *
FROM Products
WHERE Product_Name LIKE 'M%';

INSERT INTO Customers (Customer_ID, Customer_Name, City, Email)
VALUES (7, 'Ahmed Ali', 'Lahore', NULL);

SELECT *
FROM Customers
WHERE Email IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SELECT COUNT(*) AS Total_Orders
FROM Orders;

SELECT SUM(Sales) AS Total_Sales
FROM Orders;

SELECT AVG(Sales) AS Average_Sales
FROM Orders;

SELECT MAX(Sales) AS Maximum_Sales
FROM Orders;

SELECT MIN(Sales) AS Maximum_Sales
FROM Orders;

INSERT INTO Customers (Customer_ID, Customer_Name, City, Email)
VALUES
(8, 'Zain Ahmed', 'Karachi', 'zain@gmail.com'),
(9, 'Hira Khan', 'Islamabad', 'hira@gmail.com'),
(10, 'Usman Tariq', 'Lahore', 'usman@gmail.com'),
(11, 'Maham Noor', 'Peshawar', 'maham@gmail.com'),
(12, 'Danish Iqbal', 'Rawalpindi', 'danish@gmail.com'),
(13, 'Fatima Ali', 'Karachi', 'fatima@gmail.com'),
(14, 'Hamza Sheikh', 'Lahore', 'hamza@gmail.com'),
(15, 'Areeba Malik', 'Islamabad', 'areeba@gmail.com'),
(16, 'Saad Hussain', 'Peshawar', 'saad@gmail.com'),
(17, 'Iqra Aslam', 'Rawalpindi', 'iqra@gmail.com'),
(18, 'Talha Raza', 'Karachi', 'talha@gmail.com'),
(19, 'Maryam Shah', 'Lahore', 'maryam@gmail.com'),
(20, 'Omer Farooq', 'Islamabad', 'omer@gmail.com');

SELECT COUNT(*) AS Total_Customers
FROM Customers;

SELECT Payment_Method, SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Payment_Method;

SELECT Payment_Method, SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Payment_Method
HAVING SUM(Sales) > 50000;

SELECT 
    Order_ID,
    Sales,
    CASE
        WHEN Sales >= 50000 THEN 'High'
        WHEN Sales >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Category
FROM orders;