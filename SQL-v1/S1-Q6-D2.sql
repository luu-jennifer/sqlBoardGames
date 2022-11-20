-- most raised campaigns and the number of campaign days
SELECT DATEDIFF(deadline, launched) AS days, ROUND(pledged, 2) AS raised
FROM campaign
ORDER BY raised DESC;

-- top 100 campaigns avg campaign days
WITH previous_query AS (
SELECT DATEDIFF(deadline, launched) AS days, ROUND(pledged, 2) AS raised
FROM campaign
ORDER BY raised DESC
LIMIT 100
)
SELECT AVG(days) AS avg_days
FROM previous_query;

-- longest and shortest campaigns
WITH previous_query AS (
SELECT DATEDIFF(deadline, launched) AS days, ROUND(pledged, 2) AS raised
FROM campaign
ORDER BY raised DESC
)
SELECT MAX(days) AS max_days, MIN(days) AS min_days
FROM previous_query;

-- longer campaigns and amount raised
SELECT DATEDIFF(deadline, launched) AS days, ROUND(pledged, 2) AS raised
FROM campaign
ORDER BY days DESC
LIMIT 10;

-- shorter campaigns and amount raised
SELECT DATEDIFF(deadline, launched) AS days, ROUND(pledged, 2) AS raised
FROM campaign
ORDER BY days ASC
LIMIT 10;