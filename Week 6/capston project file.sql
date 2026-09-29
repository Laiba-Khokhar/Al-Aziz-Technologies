SELECT 
    SUM(Net_Sales) AS Total_Sales
FROM fact_orders_clean;

USE qsr_master_project;

-- Fix Fact Orders first column
ALTER TABLE fact_orders_clean
RENAME COLUMN `ï»¿Order_ID` TO Order_ID;

-- Fix dimension table first columns
ALTER TABLE dim_branch
RENAME COLUMN `ï»¿Branch_ID` TO Branch_ID;

ALTER TABLE dim_product
RENAME COLUMN `ï»¿Product_ID` TO Product_ID;

ALTER TABLE dim_customer
RENAME COLUMN `ï»¿Customer_ID` TO Customer_ID;

ALTER TABLE dim_rider
RENAME COLUMN `ï»¿Rider_ID` TO Rider_ID;

SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM fact_orders_clean;

SELECT 
    AVG(Net_Sales) AS Average_Order_Value
FROM fact_orders_clean;

SELECT 
    SUM(Profit) AS Total_Profit
FROM fact_orders_clean;

SELECT 
    SUM(Profit) / SUM(Net_Sales) * 100 AS Profit_Margin_Percent
FROM fact_orders_clean;
             --  branch analysis 
SELECT 
    b.Branch_ID,
    b.City,
    b.Area,
    SUM(f.Net_Sales) AS Total_Sales,
    SUM(f.Profit) AS Total_Profit
FROM fact_orders_clean f
JOIN Dim_Branch b
    ON f.Branch_ID = b.Branch_ID
GROUP BY 
    b.Branch_ID,
    b.City,
    b.Area
ORDER BY Total_Sales DESC;
             -- product analysis
SELECT 
    p.Product_ID,
    p.Product,
    p.Category,
    SUM(f.Quantity) AS Units_Sold,
    SUM(f.Net_Sales) AS Total_Sales,
    SUM(f.Profit) AS Total_Profit
FROM fact_orders_clean f
JOIN Dim_Product p
    ON f.Product_ID = p.Product_ID
GROUP BY 
    p.Product_ID,
    p.Product,
    p.Category
ORDER BY Total_Sales DESC;

-- category analysis

SELECT 
    p.Category,
    SUM(f.Quantity) AS Units_Sold,
    SUM(f.Net_Sales) AS Total_Sales,
    SUM(f.Profit) AS Total_Profit
FROM fact_orders_clean f
JOIN Dim_Product p
    ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC; 

-- customer analysis

SELECT 
    c.Customer_ID,
    c.Customer_Type,
    COUNT(DISTINCT f.Order_ID) AS Order_Count,
    SUM(f.Net_Sales) AS Total_Sales
FROM fact_orders_clean f
JOIN Dim_Customer c
    ON f.Customer_ID = c.Customer_ID
GROUP BY 
    c.Customer_ID,
    c.Customer_Type
ORDER BY Total_Sales DESC
LIMIT 20; 
            -- customer type analysis 
SELECT 
    c.Customer_Type,
    COUNT(DISTINCT f.Order_ID) AS Order_Volume,
    SUM(f.Net_Sales) AS Total_Sales,
    AVG(f.Net_Sales) AS Average_Order_Value
FROM fact_orders_clean f
JOIN Dim_Customer c
    ON f.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Type
ORDER BY Total_Sales DESC;

      -- Rider Analysis
      
SELECT 
    r.Rider_ID,
    r.Rider_Name,
    COUNT(f.Order_ID) AS Delivery_Orders,
    AVG(f.Delivery_Time_Min) AS Avg_Delivery_Time,
    AVG(f.Order_Accuracy_Pct) AS Avg_Order_Accuracy
FROM fact_orders_clean f
JOIN Dim_Rider r
    ON f.Rider_ID = r.Rider_ID
WHERE f.Order_Type = 'Delivery'
GROUP BY 
    r.Rider_ID,
    r.Rider_Name
ORDER BY Delivery_Orders DESC;
-- order type analysis 
SELECT 
    Order_Type,
    COUNT(DISTINCT Order_ID) AS Order_Volume,
    SUM(Net_Sales) AS Total_Sales,
    AVG(Net_Sales) AS Average_Order_Value
FROM fact_orders_clean
GROUP BY Order_Type
ORDER BY Total_Sales DESC;

        -- Monthly Sales Trend 
SELECT 
    Order_Year,
    Order_Month,
    Month_Name,
    SUM(Net_Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM fact_orders_clean
GROUP BY 
    Order_Year,
    Order_Month,
    Month_Name
ORDER BY 
    Order_Year,
    Order_Month;
    -- Delivery Performance 
    SELECT 
    Delivery_Performance,
    COUNT(*) AS Order_Count,
    AVG(Delivery_Time_Min) AS Avg_Delivery_Time
FROM fact_orders_clean
WHERE Order_Type = 'Delivery'
GROUP BY Delivery_Performance
ORDER BY Avg_Delivery_Time;

-- Complaint Analysis
SELECT 
    Complaint,
    COUNT(*) AS Complaint_Count
From fact_orders_clean
GROUP BY Complaint;

             -- Order Accuracy
SELECT 
    AVG(Order_Accuracy_Pct) AS Average_Order_Accuracy
FROM fact_orders_clean;

SELECT 
    b.City,
    p.Category,
    SUM(f.Net_Sales) AS Total_Sales
FROM fact_orders_clean f
JOIN Dim_Branch b
    ON f.Branch_ID = b.Branch_ID
JOIN Dim_Product p
    ON f.Product_ID = p.Product_ID
GROUP BY 
    b.City,
    p.Category
ORDER BY 
    b.City,
    Total_Sales DESC;
    
  SELECT COUNT(*) AS Missing_Order_ID
FROM fact_orders_clean
WHERE Order_ID IS NULL;

SELECT COUNT(*) AS Invalid_Net_Sales
FROM fact_orders_clean
WHERE Net_Sales < 0;

SELECT Order_ID, COUNT(*) AS Count
FROM fact_orders_clean
GROUP BY Order_ID
HAVING COUNT(*) > 1;