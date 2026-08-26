select * from customers;

SELECT
    Customers.Customer_Name,
    Orders.Order_ID,
    Orders.Sales
FROM Customers
INNER JOIN Orders
    ON Customers.Customer_ID = Orders.Customer_ID;
    
    SELECT
    Customers.Customer_Name,
    Orders.Order_ID,
    Orders.Sales
FROM Customers
LEFT JOIN Orders
    ON Customers.Customer_ID = Orders.Customer_ID;
    
    SELECT
    Customers.Customer_Name,
    Orders.Order_ID,
    Orders.Sales
FROM Customers
RIGHT JOIN Orders
    ON Customers.Customer_ID = Orders.Customer_ID;
    
    SELECT
    Customers.Customer_ID,
    Customers.Customer_Name,
    Orders.Order_ID,
    Orders.Sales
FROM Customers
LEFT JOIN Orders
    ON Customers.Customer_ID = Orders.Customer_ID
UNION
SELECT
    Customers.Customer_ID,
    Customers.Customer_Name,
    Orders.Order_ID,
    Orders.Sales
FROM Customers
RIGHT JOIN Orders
    ON Customers.Customer_ID = Orders.Customer_ID;
    
    SELECT
    Customers.Customer_Name,
    Customers.City,
    Orders.Order_ID,
    Orders.Order_Date,
    Products.Product_Name,
    Products.Category,
    Orders.Quantity,
    Products.Unit_Price,
    Orders.Sales,
    Orders.Payment_Method
FROM Customers
INNER JOIN Orders
    ON Customers.Customer_ID = Orders.Customer_ID
INNER JOIN Products
    ON Orders.Product_ID = Products.Product_ID;
    
    SELECT
    C1.Customer_Name AS Customer_1,
    C2.Customer_Name AS Customer_2,
    C1.City
FROM Customers C1
INNER JOIN Customers C2
    ON C1.City = C2.City
    AND C1.Customer_ID < C2.Customer_ID;
    
    SELECT
    Order_ID,
    Customer_ID,
    Sales
FROM Orders
WHERE Sales > (
    SELECT AVG(Sales)
    FROM Orders
);

SELECT
    Customer_ID,
    Customer_Name
FROM Customers
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Orders
    WHERE Sales > (
        SELECT AVG(Sales)
        FROM Orders
    )
);

WITH CustomerSales AS (
    SELECT
        Customer_ID,
        SUM(Sales) AS Total_Sales
    FROM Orders
    GROUP BY Customer_ID
)
SELECT
    Customer_ID,
    Total_Sales
FROM CustomerSales
WHERE Total_Sales > 50000;

SELECT Customer_Name AS Name
FROM Customers

UNION ALL

SELECT Product_Name AS Name
FROM Products;