-- successful vs. unsuccessfull // amount raised w/ outcome, avg amount, avg/min/max length 
SELECT outcome, 
	ROUND(SUM(pledged), 2) AS totalUSD_raised, 
	ROUND(AVG(pledged), 2) AS avgUSD_raised,
	ROUND(AVG(DATEDIFF(deadline, launched)), 0) AS avg_dayslength,
    MIN(DATEDIFF(deadline, launched)) AS min_dayslength,
    MAX(DATEDIFF(deadline, launched)) AS max_dayslength
FROM sys.campaign
WHERE currency_id = 2
GROUP BY outcome
ORDER BY 2 DESC;