SELECT * FROM zomato LIMIT 10; 

SELECT
    SUM("restaurant name"IS NULL) AS missing_restaurant_name,
    SUM("cuisines" IS NULL) AS missing_cuisines,
    SUM("average cost for two" IS NULL) AS missing_cost,
    SUM("currency" IS NULL) AS missing_currency,
    SUM("has table booking" IS NULL) AS missing_table_booking,
    SUM("has online delivery" IS NULL) AS missing_online_delivery,
    SUM("aggregate rating" IS NULL) AS missing_rating,
    SUM("votes" IS NULL) AS missing_votes,
    SUM("city" IS NULL) AS missing_city
FROM ZOMATO;    

DELETE FROM ZOMATO WHERE "cuisines" IS NULL;

SELECT SUM("cuisines" IS NULL) AS missing_cuisines FROM ZOMATO;

SELECT "cuisines", COUNT(*) AS restaurant_count
FROM ZOMATO
GROUP BY "cuisines"
ORDER BY restaurant_count DESC
LIMIT 1;

SELECT "Restaurant name", "city","aggregate rating", "votes"
FROM ZOMATO 
WHERE "aggregate rating" IS NOT NULL
ORDER BY "aggregate rating" DESC, "votes" DESC
LIMIT 1;

SELECT "city", AVG("average cost for two") AS avg_cost
FROM ZOMATO
WHERE "average cost for two" < 10000
GROUP BY "city"
ORDER BY avg_cost DESC
LIMIT 1;

SELECT "city", COUNT (*) AS restaurant_count
FROM ZOMATO
GROUP BY "city"
ORDER BY restaurant_count DESC
LIMIT 1;

SELECT COUNT(DISTINCT "city") AS total_cities
FROM ZOMATO

SELECT COUNT(DISTINCT "cuisines") AS unique_cuisines
FROM ZOMATO

WITH SplitCuisines AS (
  SELECT 
    "Restaurant name",
    city,
    "aggregate rating",
    votes,
    TRIM(value) AS cuisine
  FROM zomato,
  json_each('["' || REPLACE("cuisines", ',', '","') || '"]')
)
SELECT * FROM SplitCuisines;

