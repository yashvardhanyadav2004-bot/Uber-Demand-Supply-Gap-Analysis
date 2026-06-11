CREATE DATABASE uber_project;
use uber_project;
SELECT COUNT(*)
FROM uber_analysis;
SHOW COUNT(*) WARNINGS;
DESCRIBE uber_analysis;
SELECT COUNT(*) FROM uber_analysis;
DROP TABLE IF EXISTS uber_analysis;
CREATE TABLE uber_analysis (
Request_ID VARCHAR(50),
Pickup_Point VARCHAR(50),
Driver_ID VARCHAR(50),
Status VARCHAR(50),
Request_Timestamp VARCHAR(50),
Drop_Timestamp VARCHAR(50),
Request_Date VARCHAR(50),
Request_Time VARCHAR(50),
Request_Hour VARCHAR(50),
Time_Slot VARCHAR(50),
WeekDay VARCHAR(50),
Ride_Outcome VARCHAR(50),
Success_Flag VARCHAR(50),
Failure_Flag VARCHAR(50),
Demand VARCHAR(50),
Route VARCHAR(50),
Time_Duration_Minutes VARCHAR(50)
);
SELECT COUNT(*) AS Total_Records
FROM uber_analysis;
SELECT *
FROM uber_analysis
LIMIT 10;

SELECT COUNT(*) AS Total_Requests
FROM uber_analysis;
SELECT Status,
COUNT(*) AS Total
FROM uber_analysis
GROUP BY Status;
SELECT Time_Slot,
COUNT(*) AS Cancelled_Rides
FROM uber_analysis
WHERE Status='Cancelled'
GROUP BY Time_Slot
ORDER BY Cancelled_Rides DESC;
SELECT Time_Slot,
COUNT(*) AS No_Cars_Available
FROM uber_analysis
WHERE Status='No Cars Available'
GROUP BY Time_Slot
ORDER BY No_Cars_Available DESC;
SELECT Pickup_Point,
COUNT(*) AS Total_Requests
FROM uber_analysis
GROUP BY Pickup_Point;
SELECT Pickup_Point,
Status,
COUNT(*) AS Total
FROM uber_analysis
GROUP BY Pickup_Point, Status
ORDER BY Pickup_Point;
SELECT
ROUND(
SUM(CAST(Success_Flag AS UNSIGNED))*100.0/COUNT(*),
2
) AS Success_Rate
FROM uber_analysis;
SELECT
Time_Slot,
SUM(CAST(Failure_Flag AS UNSIGNED)) AS Failed_Rides
FROM uber_analysis
GROUP BY Time_Slot
ORDER BY Failed_Rides DESC;