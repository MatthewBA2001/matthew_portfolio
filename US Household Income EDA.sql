#US Household Income Exploratory Data Analysis


SELECT * 
FROM us_project.us_householdincome
;

SELECT * 
FROM us_project.us_household_income_statistics
;

SELECT State_Name, County, City, ALand, AWater
FROM us_project.us_householdincome
;
#lets add up the area of land and water we should have largest states with highest numbers, which we do. 
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_householdincome
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10
;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_householdincome
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10
;

#Lets join our tables together

SELECT * 
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
;

#this will show all of the data that was imported properly
SELECT * 
FROM us_project.us_householdincome u
RIGHT JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE u.id IS NULL
;

SELECT * 
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
;
#lets explore this data
SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median), 1)
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median), 1)
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median), 1)
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 10
;

SELECT Type, COUNT(TYPE),ROUND(AVG(Mean),1), ROUND(AVG(Median), 1)
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20
;

SELECT *
FROM us_project.us_householdincome
WHERE Type = 'Community'
;

SELECT u.State_Name, City, ROUND(AVG(MEAN),1), ROUND(AVG(Median),1)
FROM us_project.us_householdincome u
JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY 3 DESC
;

