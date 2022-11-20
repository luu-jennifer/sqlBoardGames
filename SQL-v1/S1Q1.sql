-- campaign w/country name
SELECT *
FROM sys.campaign
LEFT JOIN country 
	ON sys.campaign.country_id = country.id
ORDER BY goal
LIMIT 100;

-- campaign w/currency name
SELECT *
FROM campaign
LEFT JOIN currency
	ON campaign.currency_id = currency.id
LIMIT 100;

-- sub category / category games
SELECT sub_category.id, sub_category.name, category.name
FROM sub_category
LEFT JOIN category
	ON sub_category.category_id = category.id
WHERE category_id = 7;

-- Goals vs. outcome
-- currency, days, category
SELECT id, goal, pledged, backers, outcome, currency_id, datediff(deadline, launched) AS Days
FROM campaign
-- LEFT JOIN sub_category
-- 	ON campaign.sub_category_id = sub_category.id
WHERE goal > 15000 
	AND pledged > 15000 
    AND currency_id = 2 
ORDER BY pledged DESC
-- LIMIT 100
;
