CREATE DATABASE SALES_TREND; 
USE SALES_TREND;

CREATE TABLE TATA_MOTOR_SALES(
Period TEXT,
	Punch TEXT,
    Nexon TEXT,	
    Tiago TEXT,
	Curvv TEXT,
	Altroz TEXT,
	Safari TEXT,
	Harrier	TEXT,
    Tigor TEXT);

CREATE TABLE MAHINDRA_SALES(
Period	TEXT (50),
Scorpio_Scorpio_N TEXT,	
XUV700	TEXT,
Thar_Roxx TEXT,	
XUV_3XO TEXT,
Bolero_Neo TEXT,
BE6_9E TEXT,	
XUV400 TEXT,
Marazzo TEXT);

-- SALES AND OTHER ANALYSIS 

-- Total sales per car model across all months

SELECT 
  SUM(Punch) AS Total_Punch,
  SUM(Nexon) AS Total_Nexon, 
  SUM(Tiago) AS Total_Tiago, 
  SUM(Curvv) AS Total_Curvv,
  SUM(Altroz) AS Total_Altroz, 
  SUM(Safari) AS Total_Safari, 
  SUM(Harrier) AS Total_Harrier, 
  SUM(Tigor) AS Total_Tigor
FROM tata_MOTOR_sales;

SELECT 
SUM(Scorpio_Scorpio_N) AS TOTAL_SCORPIO,
SUM(XUV700) AS TOTAL_XUV700,
SUM(Thar_Roxx) AS TOTAL_THAR,
SUM(XUV_3XO) AS TOTAL_XUV_3XO,
SUM(Bolero_Neo) AS TOTAL_BOLERO,
SUM(BE6_9E) AS TOTAL_BE6_9E,
SUM(XUV400) AS TOTAL_XUV400,
SUM(Marazzo) AS TOTAL_MARAZZO
FROM mahindra_sales;

-- Monthly total sales (all cars combined)

SELECT Period,
       sum(Punch + Nexon + Tiago + Curvv + Altroz + Safari + Harrier + Tigor) AS Total_Monthly_Sales
FROM tata_motor_sales
GROUP BY PERIOD;

-- Find the month with highest Punch sales

SELECT Period, SUM(Punch) 
FROM tata_motor_sales
GROUP BY Period
ORDER BY SUM(PUNCH) DESC
LIMIT 1;

-- Find the month with highest XUV700 sales 

SELECT Period, SUM(XUV700)
FROM mahindra_sales
GROUP BY Period 
ORDER BY SUM(XUV700) DESC
LIMIT 1;


-- Average monthly sales for Nexon and XUV400

SELECT 
    ROUND(AVG(t.Nexon), 2) AS Avg_Nexon_Sales,
    ROUND(AVG(m.XUV400), 2) AS Avg_XUV400_Sales
FROM tata_motor_sales AS t
JOIN mahindra_sales m ON t.Period = m.Period;

-- find the month with Minimum THAR_ROXX and SAFARI

SELECT 
MAHINDRA_SALES.PERIOD,THAR_ROXX,SAFARI
FROM tata_motor_sales AS T
JOIN MAHINDRA_SALES ON t.PERIOD = MAHINDRA_SALES.PERIOD
ORDER BY THAR_ROXX+SAFARI ASC;

-- Growth of sales for Tiago month over month

SELECT t1.Period, 
       (t1.Tiago - t2.Tiago)  AS Tiago_Sales_Growth
FROM tata_motor_sales t1
JOIN tata_motor_sales t2 ON t1.Period = DATE_ADD(t2.Period, INTERVAL 1 MONTH);


-- Find the least performing car model overall


SELECT 'Punch' AS Model, SUM(Punch) AS Total_Sales FROM tata_motor_sales
UNION ALL
SELECT 'Nexon', SUM(Nexon) FROM tata_motor_sales
UNION ALL
SELECT 'Tiago', SUM(Tiago) FROM tata_motor_sales
ORDER BY Total_Sales ASC
LIMIT 1;

-- Monthly percentage contribution of Nexon to total sales

SELECT Period,
       ROUND((Nexon * 100.0) / 
       (Punch + Nexon + Tiago + Curvv + Altroz + Safari + Harrier + Tigor), 2) AS Nexon_Percentage
FROM tata_motor_sales;

-- Average sales per month per car model in tata motors 

SELECT 
  AVG(Punch) AS Avg_Punch,
  AVG(Nexon) AS Avg_Nexon,
  AVG(Tiago) AS Avg_Tiago,
  AVG(Curvv) AS Avg_Curvv,
  AVG(Altroz) AS Avg_Altroz,
  AVG(Safari) AS Avg_Safari,
  AVG(Harrier) AS Avg_Harrier,
  AVG(Tigor) AS Avg_Tigor
FROM tata_motor_sales;


-- Average sales per month per car model in mahindra and mahindra 

SELECT 
	AVG (Scorpio_Scorpio_N) AS AVG_SCORPIO,
    AVG (XUV700) AS AVG_XUV700,
    AVG (Thar_Roxx) AS AVG_Thar_Roxx,
    AVG(XUV_3XO) AS AVG_XUV_3XO,
    AVG(Bolero_Neo) AS AVG_Bolero_Neo,
    AVG(BE6_9E) AS AVG_BE6_9E,
    AVG(XUV400) AS AVG_XUV400,
    AVG(Marazzo) AS AVG_Marazzo
    FROM mahindra_sales;
    
-- List months where Curvv sales were above average

SELECT PERIOD,CURVV
FROM tata_motor_sales
WHERE CURVV>(SELECT AVG(CURVV) FROM tata_motor_sales);

-- Monthly sales variance between Punch and Nexon

SELECT T.Period, ABS(Punch - XUV700) AS Sales_Difference
FROM tata_motor_sales AS T
JOIN MAHINDRA_SALES ON T.PERIOD = MAHINDRA_SALES.PERIOD;

-- Top 3 months with highest total Mahindra sales

SELECT t.period,
(punch + nexon + tiago + curvv + altroz + safari + harrier + tigor ) AS  TOTAL_SALES,
(Scorpio_Scorpio_N + XUV700 + Thar_Roxx + XUV_3XO + Bolero_NEO + BE6_9E + XUV400 + Marazzo) AS Total_Sales
FROM tata_motor_sales AS T
JOIN mahindra_sales ON t.period = mahindra_sales.PERIOD
ORDER BY TOTAL_SALES DESC LIMIT 3;

-- Find percentage of Scorpio_Scorpio_N sales contribution per month

SELECT Period,
       ROUND((Scorpio_Scorpio_N * 100.0) / 
       (Scorpio_Scorpio_N + XUV700 + Thar_ROXX + XUV_3XO + Bolero_NEO + BE6_9E + XUV400 + Marazzo), 2) AS Scorpio_Percent
FROM mahindra_sales;


-- Month with lowest total sales in mahindra and mahindra

SELECT Period,
       (Scorpio_Scorpio_N + XUV700 + Thar_ROXX + XUV_3XO + Bolero_NEO + BE6_9E + XUV400 + Marazzo) AS Total
FROM mahindra_sales
ORDER BY Total ASC;

-- BE6 + 9E model and Nexon: which month had highest performance?

SELECT m.Period, BE6_9E, Nexon
FROM mahindra_sales AS M
JOIN TATA_MOTOR_SALES ON M.PERIOD = TATA_MOTOR_SALES.PERIOD
WHERE BE6_9E > 0 AND NEXON > 0
ORDER BY BE6_9E DESC
LIMIT 1;

-- Which company sold more total cars over 6 months?


SELECT 'Tata' AS Brand, SUM(Punch + Nexon + Tiago + Curvv + Altroz + Safari + Harrier + Tigor) AS Total_Sales FROM tata_motor_sales
UNION ALL
SELECT 'Mahindra', SUM(Scorpio_Scorpio_N + XUV700 + Thar_roxx + XUV_3XO + Bolero_neo + BE6_9E + XUV400 + Marazzo) FROM mahindra_sales
ORDER BY TOTAL_SALES DESC;

-- Which brand had the best-performing month?

SELECT Period, 'TATA' AS BRAND,
		(Punch + Nexon + Tiago + Curvv + Altroz + Safari + Harrier + Tigor) AS TOTAL_SALES
        FROM tata_motor_sales
        
UNION ALL 

SELECT Period , 'MAHINDRA' AS BRAND ,
	(Scorpio_Scorpio_N + XUV700 + Thar_Roxx + XUV_3XO + Bolero_Neo + BE6_9E + XUV400 + Marazzo) AS TOTAL_SALES
    FROM mahindra_sales
ORDER BY TOTAL_SALES DESC
LIMIT 1;

-- Month where Tata outsold Mahindra by the largest margin

WITH SALES AS (
  SELECT 
    t.Period,
    SUM(Punch + Nexon + Tiago + Curvv + Altroz + Safari + Harrier + Tigor) AS Tata_Sales,
    SUM(Scorpio_Scorpio_N + XUV700 + Thar_Roxx + XUV_3XO + Bolero_Neo + BE6_9E + XUV400 + Marazzo) AS Mahindra_Sales
  FROM tata_motor_sales t
  JOIN mahindra_sales  ON t.Period = mahindra_sales.Period
  GROUP BY t.Period
  ) SELECT 
  Period,
  Tata_Sales,
  Mahindra_Sales,
  ABS(Tata_Sales - Mahindra_Sales) AS Sales_Gap
FROM sales
ORDER BY Sales_Gap DESC 
LIMIT 1;

-- Identify months where a Mahindra model outsold all Tata models individually

SELECT m.Period, Thar_Roxx AS THAR
FROM mahindra_sales m
JOIN tata_motor_sales t ON m.Period = t.Period
WHERE Thar_Roxx > GREATEST(Punch, Nexon, Tiago, Curvv, Altroz, Safari, Harrier, Tigor);

-- Identify months where a Tata model outsold all Mahindra models individually

SELECT t.period, NEXON AS GHODA
FROM tata_motor_sales T
JOIN mahindra_sales  ON t.Period = mahindra_sales.Period
WHERE NEXON > greatest(Scorpio_Scorpio_N, XUV700, Thar_Roxx, XUV_3XO, Bolero_Neo, BE6_9E, XUV400, Marazzo);

 -- Find total EV sales (Curvv and XUV400) for each month

SELECT t.Period,
       t.Curvv AS Tata_EV,
       m.XUV400 AS Mahindra_EV,
       t.Curvv + m.XUV400 AS Total_EV_Sales
FROM tata_motor_sales t
JOIN mahindra_sales m ON t.Period = m.Period;

-- Which company dominated more months (higher sales)?

SELECT COUNT(*) AS Months_Tata_Leads
FROM tata_motor_Sales t
JOIN mahindra_sales m ON t.Period = m.Period
WHERE (Punch + Nexon + Tiago + Curvv + Altroz + Safari + Harrier + Tigor) >
      (Scorpio_Scorpio_N + XUV700 + Thar_Roxx + XUV_3XO + Bolero_Neo + BE6_9E + XUV400 + Marazzo);



    











    
    




















