# US Household Income - Exploratory Data Analysis

SELECT *
FROM USHouseholdIncome;
 
SELECT * 
FROM ushouseholdincome_statistics;



SELECT State_Name, SUM(ALand), SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;


SELECT *
FROM USHouseholdIncome u
JOIN ushouseholdincome_statistics us
	ON u.id = us.id
;


SELECT *
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0;


SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0;

SELECT u.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 10
;

SELECT Type, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
ORDER BY 1 DESC
LIMIT 20
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20
;

SELECT *
FROM USHouseholdIncome
WHERE Type = 'Community';


SELECT u.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM USHouseholdIncome u
JOIN ushouseholdincome_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC
;

