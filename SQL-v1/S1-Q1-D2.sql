-- average raised of successful vs unsuccessful campaigns (USD) 
SELECT ROUND(AVG(pledged), 2) AS avg_raised, outcome
FROM campaign
WHERE currency_id = 2
GROUP BY outcome
ORDER BY avg_raised DESC;

-- campaign length [2-91 days]
SELECT DATEDIFF(deadline, launched) AS days, outcome
FROM campaign;

-- money raised by country [TOP 3 // US, GB, CH]
SELECT MAX(pledged) AS most_raised, country.name
FROM campaign
LEFT JOIN country
	ON campaign.country_id = country.id
GROUP BY country_id
ORDER BY most_raised DESC;

