SELECT
    Order_ID,
    Sales,
    SUM(Sales) OVER() AS Total_Sales
FROM Orders;

SELECT
    Order_ID,
    Customer_ID,
    Sales,
    SUM(Sales) OVER(
        PARTITION BY Customer_ID
    ) AS Customer_Total_Sales
FROM Orders;

SELECT
    Order_ID,
    Customer_ID,
    Sales,
    ROW_NUMBER() OVER(
        PARTITION BY Customer_ID
        ORDER BY Sales DESC
    ) AS Order_Number
FROM Orders;

SELECT
    Order_ID,
    Customer_ID,
    Sales,
    RANK() OVER(
        ORDER BY Sales DESC
    ) AS Sales_Rank
FROM Orders;

SELECT
    Order_ID,
    Customer_ID,
    Sales,
    DENSE_RANK() OVER(
        ORDER BY Sales DESC
    ) AS Sales_Dense_Rank
FROM Orders;

SELECT
    Order_ID,
    Order_Date,
    Sales,
    SUM(Sales) OVER(
        ORDER BY Order_Date
    ) AS Running_Total
FROM Orders
ORDER BY Order_Date;

SELECT
    Order_ID,
    Order_Date,
    Sales,
    AVG(Sales) OVER(
        ORDER BY Order_Date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Moving_Average
FROM Orders
ORDER BY Order_Date;

SELECT
    Order_ID,
    Order_Date,
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    DAY(Order_Date) AS Order_Day
FROM Orders;

SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;
    
    SELECT
    COUNT(CASE WHEN Payment_Method = 'Cash' THEN 1 END) AS Cash_Orders,
    COUNT(CASE WHEN Payment_Method = 'Card' THEN 1 END) AS Card_Orders,
    COUNT(CASE WHEN Payment_Method = 'Bank Transfer' THEN 1 END) AS Bank_Transfer_Orders
FROM Orders;