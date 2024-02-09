-- 1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
FROM data_analyst_jobs;
 --answer: 1793
 
 
-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--answer: ExxonMobil


-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT *
FROM data_analyst_jobs
WHERE location IN ('TN','KY');
--answer: 21 postings in Tennessee, 27 postings in Tennessee or Kentucky


-- 4.	How many postings in Tennessee have a star rating above 4?
SELECT *
FROM data_analyst_jobs
WHERE location IN ('TN') AND star_rating = 4;
--answer: 1

-- 5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
--answer: 151


-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
--answer:NE Nebraska

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;

--answer: 881

-- 8.	How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE LOCATION in ('CA');
-- answer: 230


-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count)>5000
--answer: 71


-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY company
HAVING SUM(review_count)>5000
ORDER BY avg_rating DESC;
--answer: Google rating of 4.3


-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--answer: 774 (if case does not matter), 754 if case matters (use LIKE instead of ILIKE )

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
AND title NOT ILIKE'%Analytics%';
--answer: 26 if case matters (used LIKE),4 if case does not matter(used ILIKE). They're all Tableau related

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

SELECT  domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting >21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC


--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? Confusing question. . .
-- answer:
-- Top 3 Industries: 
-- "Internet and Software"
-- "Banks and Financial Services"
-- "Consulting and Business Services"
-- "Health Care"

-- How many jobs have been listed for more than 3 weeks for each of the top 4?
-- answer:  232 total
