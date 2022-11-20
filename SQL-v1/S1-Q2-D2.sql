-- Top 3 categories w/ most backers
WITH previous_query AS (
SELECT sub_category.name AS subcategory_name, backers, sub_category_id, category_id, datediff(deadline, launched) AS days
FROM campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
)
SELECT subcategory_name, name AS category_name, backers, days
FROM previous_query
JOIN category
	ON previous_query.category_id = category.id
ORDER BY backers DESC
LIMIT 3;
    
-- Bottom 3 categories w/ least backers
WITH previous_query AS (
SELECT backers, sub_category_id, category_id, sub_category.name AS subcategory_name, DATEDIFF(deadline, launched) AS days
FROM campaign
JOIN sub_category
	ON campaign.sub_category_id = sub_category.id
)
SELECT subcategory_name, name AS category_name, backers, days
FROM previous_query
JOIN category
	ON previous_query.category_id = category.id
ORDER BY backers ASC
LIMIT 3;