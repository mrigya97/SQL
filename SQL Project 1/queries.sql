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

-- Question 4 --

 SELECT
    ds.driverId,
    d.forename,
    d.surname,
    r.year AS season,
  AVG(ds.points) AS average_points
  FROM
    driver_standings ds
  JOIN
    races r ON ds.raceId = r.raceId
  JOIN
    drivers d ON ds.driverId = d.driverId
  GROUP BY
    ds.driverId, d.forename, d.surname, r.year
  ORDER BY
    r.year, average_points DESC;

-- Question 5 --

 SELECT d.driverId,
        d.forename,
        d.surname,
        COUNT(r.raceId) AS total_races
   	FROM drivers d
   	JOIN results r ON d.driverId = r.driverId
  	WHERE d.driverId NOT IN (
	    SELECT last_place.driverId
	    FROM (
	      SELECT r2.driverId, r2.raceId, r2.PositionOrder
	      FROM results r2
	     JOIN (
	       SELECT raceId, MAX(positionOrder) AS max_position
	       FROM results
	       GROUP BY raceId
       ) AS max_pos ON r2.raceId = max_pos.raceId
       AND r2.positionOrder = max_pos.max_position
      )
      AS last_place
 )
 GROUP BY d.driverId, d.forename, d.surname;

-- Question 6 --

SELECT p.driverId,
        d.forename,
        d.surname,
        AVG(p.milliseconds) AS average_pitstop_time
        FROM
          pitstops p
          JOIN
           drivers d ON p.driverId = d.driverId
          GROUP BY
           p.driverId,
           d.forename,
           d.surname
          ORDER BY
           average_pitstop_time ASC;

-- Question 7 --

SELECT
    cs.constructorId,
    c.name,
    SUM(cs.points) as total_points
    FROM
      constructor_standings cs
    JOIN
      constructors c ON cs.constructorId = c.constructorId
    GROUP BY
      cs.constructorId,
      c.name
    ORDER BY
      total_points DESC;

-- Question 8 --

