--Question 1--

SELECT 
    d.driverId,
    d.forename,
    d.surname,
    COUNT(DISTINCT r.constructorId) AS constructor_count
FROM 
    drivers d
JOIN 
    constructor_results cr ON d.driverId = cr.driverId
GROUP BY 
    d.driverId, d.forename, d.surname
HAVING 
    COUNT(DISTINCT r.constructorId) > 1;

-- Question 2 --

SELECT
    r.raceId,
    r.circuitId,
    r.name AS race_name,
    r.date AS race_date,
    c.country
    FROM races r
   JOIN circuits c ON r.circuitId = c.circuitId
   WHERE c.country = (
SELECT country
   FROM (
   SELECT country, COUNT(*) AS circuit_count
   FROM circuits
   GROUP BY country
   ORDER BY circuit_count DESC
LIMIT 1                 -- for each country --
 ) AS max_circuits_country

-- Question 3 --

 WITH ranked_qualifying_times AS(
 SELECT
        s.year,
        er.driverId,
	er.raceId,
	er.time AS qualifying_time,
	ROW_NUMBER() OVER(PARTITION BY s.year ORDER BY er.time ASC) AS rank -- Divides year column into different seasons --
	FROM
	results er
	JOIN races r ON er.raceId = r.raceId
	JOIN seasons s  ON r.year = s.year
 )
  SELECT
   	year, driverId, raceId, qualifying_time
   	FROM ranked_qualifying_times
   	WHERE rank<=3
        ORDER BY
        year, rank;
