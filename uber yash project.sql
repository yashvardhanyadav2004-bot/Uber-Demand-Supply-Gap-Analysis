-- Total Records
SELECT COUNT(*) FROM uber_analysis;

-- Null Values
SELECT *
FROM uber_analysis
WHERE Pickup_Point IS NULL;

-- Distinct Status
SELECT DISTINCT Status
FROM uber_analysis;

-- Data Structure
DESCRIBE uber_analysis;

-- 1 WEEKDAY ANALYSIS
SELECT
WeekDay,
COUNT(*) AS Total_Requests
FROM uber_analysis
GROUP BY WeekDay
ORDER BY Total_Requests DESC;

-- 2 ROUTE ANALYSIS
SELECT
Route,
COUNT(*) AS Total_Requests
FROM uber_analysis
GROUP BY Route;

/* 3 Completion Rate by Pickup Point*/
SELECT
Pickup_Point,
ROUND(
SUM(CAST(Success_Flag AS UNSIGNED))*100/COUNT(*),2
) AS Completion_Rate
FROM uber_analysis
GROUP BY Pickup_Point;

/* Cancellation %*/
SELECT
ROUND(
    SUM(CASE
            WHEN Status = 'Cancelled' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
    2
) AS Cancellation_Rate
FROM uber_analysis;

/* 5 Peak Demand */
SELECT
Time_Slot,
COUNT(*) Total_Requests
FROM uber_analysis
GROUP BY Time_Slot
ORDER BY Total_Requests DESC;

/*Advanced Business Insights
Demand vs Supply Gap*/
SELECT

COUNT(*) Total_Requests,

SUM(CASE
WHEN Status='Trip Completed'
THEN 1 ELSE 0 END) Completed,

SUM(CASE
WHEN Status!='Trip Completed'
THEN 1 ELSE 0 END) Gap

FROM uber_analysis;

/*Pickup Point Performance*/
SELECT

Pickup_Point,

SUM(CASE
WHEN Status='Trip Completed'
THEN 1 ELSE 0 END) Completed,

SUM(CASE
WHEN Status='Cancelled'
THEN 1 ELSE 0 END) Cancelled,

SUM(CASE
WHEN Status='No Cars Available'
THEN 1 ELSE 0 END) NoCars

FROM uber_analysis

GROUP BY Pickup_Point;