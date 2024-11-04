# US Household Income - Data Cleaning

SELECT *
FROM USHouseholdIncome;
 
SELECT * 
FROM ushouseholdincome_statistics;



SELECT COUNT(id)
FROM USHouseholdIncome;
 
SELECT COUNT(id)
FROM ushouseholdincome_statistics;

# Income Table
SELECT id, COUNT(id)
FROM USHouseholdIncome
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT *
FROM (
SELECT row_id,
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM USHouseholdIncome
) duplicates
WHERE row_num > 1
;



DELETE FROM USHouseholdIncome
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM USHouseholdIncome
		) duplicates
		WHERE row_num > 1)
;

# Statistics Table
SELECT id, COUNT(id)
FROM ushouseholdincome_statistics
GROUP BY id
HAVING COUNT(id) > 1
;
# no duplicates where found in this second table

# Below was used to try to fitler the Upper case and Lower case spelled Alabama, but SQL isn't separated them but grouping them. It recognizes that its the same state.
SELECT DISTINCT State_name
FROM USHouseholdIncome
ORDER BY 1
;

UPDATE USHouseholdIncome
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE USHouseholdIncome
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT *
FROM USHouseholdIncome
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE USHouseholdIncome
SET Place = 'Autauga County'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

SELECT Type, COUNT(Type)
FROM USHouseholdIncome
GROUP BY Type
#ORDER BY 1
;

UPDATE USHouseholdIncome
SET Type = 'Borough'
WHERE Type = 'Boroughs';


SELECT ALand, AWater
FROM USHouseholdIncome
WHERE (AWater = '0' OR AWater = '' OR AWater IS NULL)
AND (ALand = '0' OR ALand = '' OR ALand IS NULL)
;


