-- What was the amount the most successful board game company raised? How many backers did they have?
WITH previous_query AS (
SELECT sub_category.name AS subcategory_name, backers, pledged, sub_category_id, category_id, datediff(deadline, launched) AS days
FROM campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
WHERE currency_id = 2
)
SELECT subcategory_name, name AS category_name, backers, pledged, days
FROM previous_query
JOIN category
	ON previous_query.category_id = category.id
WHERE subcategory_name = 'Tabletop Games'
ORDER BY pledged DESC
LIMIT 3;