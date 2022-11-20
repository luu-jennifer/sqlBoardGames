-- highest raised campaigns w/ country and outcome
SELECT campaign.name AS campaign_name, country.name AS country, ROUND(goal, 2) AS goal, ROUND(pledged, 2) AS raised, outcome
FROM campaign
JOIN country
	ON campaign.country_id = country.id
ORDER BY pledged DESC
LIMIT 3;

-- top 3 countries w/ most successful campaigns (i. raised; ii. number of campaigns)
SELECT COUNT(country.name AS country)
FROM campaign
JOIN country
	ON campaign.country_id = country.id
WHERE country = 'US';