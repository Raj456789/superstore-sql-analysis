
--- ---------------------------------------------------------------
-- 1.Created a separate database
-- ----------------------------------------------------------------
CREATE DATABASE superstore_sql_analysis;

USE superstore_sql_analysis;
-- --------------------------------------------------------
---------------------------------------------------------------
-- 2. Copy  existing table
------------------------------------------------------------------
CREATE TABLE superstore AS
SELECT *
FROM superstore_db.superstore_clean;

SELECT count(*) from superstore

SELECT *
FROM superstore
LIMIT 10;

-- ---------------------------------------------------------------
-- 3.Data cleaning/validation
-- ----------------------------------------------------------------
-- Checked Total Records
SELECT count(*) as total_records 
FROM superstore

-- Checked NUll Values
SELECT
    SUM(`Ship Mode` IS NULL) AS ship_mode_null,
    SUM(Segment IS NULL) AS segment_null,
    SUM(City IS NULL) AS city_null,
    SUM(State IS NULL) AS state_null,
    SUM(Sales IS NULL) AS sales_null,
    SUM(Quantity IS NULL) AS quantity_null,
    SUM(Discount IS NULL) AS discount_null,
    SUM(Profit IS NULL) AS profit_null
FROM superstore;


--  Check duplicate rows
SELECT
    `Ship Mode`, Segment, Country, City, State,
    `Postal Code`, Region, Category, `Sub-Category`,
    Sales, Quantity, Discount, Profit,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY
    `Ship Mode`, Segment, Country, City, State,
    `Postal Code`, Region, Category, `Sub-Category`,
    Sales, Quantity, Discount, Profit
HAVING COUNT(*) > 1;


-- -- ---------------------------------------------------------------
-- 4.Basic SQL analysis
-- --------------------------------------------------------
-- Total Sales
SELECT SUM(Sales) as Total_Sales
FROM superstore;

-- Avearge Sales 
SELECT AVG(Sales) as Average_Sales
FROM superstore;

-- Total Profit 
SELECT SUM(Profit) as Total_Profit
FROM superstore;

-- Sales By Region 
SELECT Region, SUM(Sales) as Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;


-- Profit By Category
SELECT Category, SUM(Profit) as Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC

-- Categories with sales above a threshold
SELECT Category, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Category
HAVING SUM(Sales) > 100000
ORDER BY total_sales DESC;

-- --------------------------------------------------------
-- 5.CASE expression
-- --------------------------------------------------------

-- Classify profit by Category 
SELECT Category, Profit,
   CASE 
     WHEN Profit > 15 THEN "PROFITABLE CATEGORY"
     WHEN Profit < 15 THEN "LOSS CATEGORY"
     ELSE "NO PROFIT/LOSS"
   END AS Profit_Status
FROM superstore
LIMIT 20;

select * from superstore


-- --------------------------------------------------------
-- 6.Subquery
-- --------------------------------------------------------

-- Transactions above average sales
SELECT City, Sales, Profit 
FROM superstore
WHERE Sales > (SELECT AVG(Sales) FROM superstore)
ORDER BY Sales DESC;



-- --------------------------------------------------------
-- 7.JOINS
-- --------------------------------------------------------
-- (Superstore table is basically one flat table.so will 
-- create two supporting tables from the existing tables)


-- 1. Category Summary table (new)
CREATE TABLE category_summary AS
SELECT Category, SUM(Sales) as Total_Sales,SUM(Profit) as Total_Profit
FROM superstore
GROUP BY Category;

-- 2. Region Summary table (new)
CREATE TABLE region_summary AS
SELECT Region, SUM(Sales) as Total_Sales,SUM(Profit) as Total_Profit
FROM superstore
GROUP BY Region;


-- INNER JOIN
SELECT s.Category, s.Sales, c.Total_Sales
FROM superstore s
INNER JOIN category_summary c 
ON s.Category = c.Category
LIMIT 10;

-- LEFT JOIN
SELECT s.Region, s.Category, r.Total_Sales as region_total_sales
FROM superstore s 
LEFT JOIN region_summary r 
ON s.region = r.region
LIMIT 10;



-- --------------------------------------------------------
-- 8. Window Functions
-- --------------------------------------------------------

-- Rank categories by profit
SELECT Category, Total_Profit, 
RANK() OVER (ORDER BY Total_Profit DESC) as Profit_Rank
FROM category_summary


