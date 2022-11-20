-- successful vs. unsuccessful // amount raised w/ outcome, avg amount, avg length 
SELECT outcome, 
	ROUND(SUM(pledged), 2) AS totalUSD_raised, 
	ROUND(AVG(pledged), 2) AS avgUSD_raised,
	AVG(DATEDIFF(deadline, launched)) AS avg_dayslength
FROM sys.campaign
WHERE currency_id = 2
GROUP BY outcome
ORDER BY 2 DESC;

-- ordered top countries raised money (must convert currency)
SELECT country.name AS country, MAX(pledged) AS total_raised, currency.name AS currency
FROM campaign
LEFT JOIN country
	ON campaign.country_id = country.id
LEFT JOIN currency
	ON campaign.country_id = currency.id
GROUP BY country_id
ORDER BY total_raised DESC;