USE blinkit_data;
SELECT*FROM blinkit;

SELECT COUNT(*) FROM blinkit;

SET SQL_SAFE_UPDATES = 0;
UPDATE blinkit
SET Item_Fat_Content = 
CASE
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content ='reg' THEN 'Regular'
ELSE Item_Fat_Content
END;

SELECT DISTINCT(Item_Fat_Content) from blinkit;

-- KPI 1. Total Sales

SELECT CAST(SUM(Sales) / 1000000.0 AS DECIMAL(10,2)) AS total_sales FROM blinkit;

-- KPI 2. Average Sales

SELECT CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales FROM blinkit;


-- KPI 3. Number Of Items

SELECT COUNT(*) AS number_of_items FROM blinkit;

-- KPI 4. Average Rating

SELECT AVG(rating) AS average_rating FROM blinkit;

-- Granular Requirement. 1. Total Sales and other KPI Metrics by Fat Content

SELECT Item_Fat_Content,
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(rating) AS average_rating
FROM blinkit
GROUP BY Item_Fat_Content
ORDER BY total_sales DESC;

-- Granular Requirement. 2. Total Sales by Item Type

SELECT Item_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(rating) AS average_rating
FROM blinkit
GROUP BY Item_Type
ORDER BY total_sales DESC LIMIT 5;

-- Granular Requirement. 3. Fat Content by Outlet for Total Sales

SELECT Outlet_Location_Type, Item_Fat_Content,
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(rating) AS average_rating
FROM blinkit
GROUP BY Outlet_Location_Type,Item_Fat_Content
ORDER BY total_sales DESC;

-- Granular Requirement. 4. Total Sales by Outlet Eastablishment

SELECT Outlet_Establishment_Year, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(rating) AS average_rating
FROM blinkit
GROUP BY Outlet_Establishment_Year
ORDER BY total_sales DESC;

-- Charts Requirement. 1. Percentage of Sales by Outlet Size

SELECT
		Outlet_Size,
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
        CAST(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit
GROUP BY Outlet_Size
ORDER BY total_sales DESC;

-- Charts Requirement. 2. Sales by Outlet Location

SELECT Outlet_Location_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(rating) AS average_rating
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY total_sales DESC;

-- Charts Requirement. 3. All Metrics by Outlet Type

SELECT Outlet_Type, 
	CAST(SUM(Sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(Avg(Sales) AS DECIMAL(10,0)) AS average_sales,
    COUNT(*) AS number_of_items,
    AVG(rating) AS average_rating
FROM blinkit
GROUP BY Outlet_Type
ORDER BY total_sales DESC;





























































































































