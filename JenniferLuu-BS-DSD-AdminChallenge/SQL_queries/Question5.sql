-- top 3 country in terms of USD raised
SELECT country.name AS country, MAX(pledged) AS total_raised, currency.name AS currency
FROM campaign
LEFT JOIN country
	ON campaign.country_id = country.id
LEFT JOIN currency
	ON campaign.country_id = currency.id
WHERE country.name = 'us'
	OR country.name = 'gb'
    OR country.name = 'at'
GROUP BY country_id
ORDER BY total_raised DESC;