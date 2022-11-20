-- top 3 categories w/backers AND avg length
-- bottom 3 campaigns w/backers AND avg length
SELECT category.name AS category, backers, DATEDIFF(deadline, launched) AS days_length
FROM sys.campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
JOIN category
	ON sub_category.category_id = category.id
ORDER BY 2 ASC;