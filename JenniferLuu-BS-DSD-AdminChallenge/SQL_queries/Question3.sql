-- top 3 categories by raised(USD) AND avg length of days
-- bottom 3 categories by raised(USD) AND avg days length
SELECT category.name AS category, pledged AS raised, DATEDIFF(deadline, launched) AS days_length, backers
FROM sys.campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
JOIN category
	ON sub_category.category_id = category.id
WHERE currency_id = 2
ORDER BY 2 ASC;