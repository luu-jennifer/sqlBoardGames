-- most raised by top board game AND number backers
SELECT campaign.name AS boardgame_name, pledged AS raised, backers, datediff(deadline, launched) AS length_days
FROM sys.campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
WHERE sub_category.name = 'Tabletop Games'
	AND currency_id = 2
ORDER BY 2 DESC
LIMIT 1;