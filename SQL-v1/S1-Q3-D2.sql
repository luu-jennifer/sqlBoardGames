-- Top 3 categories w/ most pledged
WITH previous_query AS (
SELECT sub_category.name AS subcategory_name, pledged, sub_category_id, category_id, datediff(deadline, launched) AS days
FROM campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
WHERE currency_id = 2
)
SELECT subcategory_name, name AS category_name, pledged, days
FROM previous_query
JOIN category
	ON previous_query.category_id = category.id
ORDER BY pledged DESC
LIMIT 3;
    
-- Bottom 3 categories w/ least pledged
WITH previous_query AS (
SELECT pledged, sub_category_id, category_id, sub_category.name AS subcategory_name, DATEDIFF(deadline, launched) AS days
FROM campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
WHERE currency_id = 2
)
SELECT subcategory_name, name AS category_name, pledged, days
FROM previous_query
JOIN category
	ON previous_query.category_id = category.id
ORDER BY pledged ASC
LIMIT 3;