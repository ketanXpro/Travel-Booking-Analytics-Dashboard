USE travel_analytics;

-- ==========================================
-- Query 1: Total Trips
-- ==========================================
SELECT COUNT(*) AS Total_Trips
FROM travel_details;

-- ==========================================
-- Query 2: Average Trip Duration
-- ==========================================
SELECT AVG(`Duration (days)`) AS Average_Duration
FROM travel_details;

-- ==========================================
-- Query 3: Top Destinations
-- ==========================================
SELECT Destination,
COUNT(*) AS Total_Visitors
FROM travel_details
GROUP BY Destination
ORDER BY Total_Visitors DESC;

-- ==========================================
-- Query 4: Gender Distribution
-- ==========================================
SELECT `Traveler gender`,
COUNT(*) AS Total_Travelers
FROM travel_details
GROUP BY `Traveler gender`;

-- ==========================================
-- Query 5: Nationality Analysis
-- ==========================================
SELECT `Traveler nationality`,
COUNT(*) AS Total_Travelers
FROM travel_details
GROUP BY `Traveler nationality`
ORDER BY Total_Travelers DESC;

-- ==========================================
-- Query 6: Average Traveler Age
-- ==========================================
SELECT AVG(`Traveler age`) AS Average_Age
FROM travel_details;

-- ==========================================
-- Query 7: Accommodation Preferences
-- ==========================================
SELECT `Accommodation type`,
COUNT(*) AS Total_Bookings
FROM travel_details
GROUP BY `Accommodation type`
ORDER BY Total_Bookings DESC;

-- ==========================================
-- Query 8: Transportation Preferences
-- ==========================================
SELECT `Transportation type`,
COUNT(*) AS Total_Trips
FROM travel_details
GROUP BY `Transportation type`
ORDER BY Total_Trips DESC;

-- ==========================================
-- Query 9: Highest Accommodation Cost by Destination
-- ==========================================
SELECT Destination,
MAX(`Accommodation cost`) AS Highest_Cost
FROM travel_details
GROUP BY Destination
ORDER BY Highest_Cost DESC;

-- ==========================================
-- Query 10: Average Transportation Cost
-- ==========================================
SELECT AVG(`Transportation cost`) AS Avg_Transportation_Cost
FROM travel_details;

-- ==========================================
-- Query 11: Total Cost Per Trip
-- ==========================================
SELECT Destination,
(`Accommodation cost` + `Transportation cost`) AS Total_Cost
FROM travel_details
ORDER BY Total_Cost DESC;

-- ==========================================
-- Query 12: Most Expensive Destinations
-- ==========================================
SELECT Destination,
AVG(`Accommodation cost` + `Transportation cost`) AS Avg_Total_Cost
FROM travel_details
GROUP BY Destination
ORDER BY Avg_Total_Cost DESC;

-- ==========================================
-- Query 13: Travelers Above Average Age
-- (Subquery Example)
-- ==========================================
SELECT *
FROM travel_details
WHERE `Traveler age` >
(
    SELECT AVG(`Traveler age`)
    FROM travel_details
);

-- ==========================================
-- Query 14: Destinations with More Than 1 Visitor
-- (HAVING Example)
-- ==========================================
SELECT Destination,
COUNT(*) AS Visitors
FROM travel_details
GROUP BY Destination
HAVING COUNT(*) > 1;

-- ==========================================
-- Query 15: Total Revenue Estimate
-- ==========================================
SELECT
SUM(`Accommodation cost` + `Transportation cost`) AS Total_Revenue
FROM travel_details;