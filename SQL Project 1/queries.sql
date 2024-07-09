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

-- creating index for tables data retrievel --

CREATE INDEX IF NOT EXISTS idx_results_driverI ON results(driverId);
CREATE INDEX IF NOT EXISTS idx_results_raceId ON results(raceId);
CREATE INDEX IF NOT EXISTS idx_results_PositionOrder ON results(raceId, positionOrder);


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

SELECT
    r.raceId,
    r.name,
    r.circuitId,
    lap_counts.total_laps
FROM
    races r
JOIN (
    SELECT
        lt.raceId,
        COUNT(*) AS total_laps
    FROM
        laptimes lt
    GROUP BY
        lt.raceId
    ORDER BY
        total_laps DESC
    LIMIT 1            -- optional--
) AS lap_counts ON r.raceId = lap_counts.raceId;


-- Question 9 --

WITH ConvertedTimes AS(
 SELECT
      r.circuitId,
      q.position,
      (CAST(SUBSTR(q.q1, 1, INSTR(q.q1, ':')-1) AS INTEGER) * 60 +
          CAST(SUBSTR(SUBSTR(q.q1, INSTR(q.q1, ':')+1), 1, INSTR(SUBSTR(q.q1, INSTR(q.q1, ':')+1), ':')-1) AS      INTEGER) +
         CAST(SUBSTR(q.q1, -3) AS FLOAT) / 1000.0) AS q1_seconds,   -- converting q1 into seconds --
        (CAST(SUBSTR(q.q2, 1, INSTR(q.q2, ':')-1) AS INTEGER) * 60 +
          CAST(SUBSTR(SUBSTR(q.q2, INSTR(q.q2, ':')+1), 1, INSTR(SUBSTR(q.q2, INSTR(q.q2, ':')+1), ':')-1) AS INTEGER) +
         CAST(SUBSTR(q.q2, -3) AS FLOAT) / 1000.0) AS q2_seconds,   -- converting q2 into seconds --
        (CAST(SUBSTR(q.q3, 1, INSTR(q.q3, ':')-1) AS INTEGER) * 60 +
         CAST(SUBSTR(SUBSTR(q.q3, INSTR(q.q3, ':')+1), 1, INSTR(SUBSTR(q.q3, INSTR(q.q3, ':')+1), ':')-1) AS INTEGER) +
         CAST(SUBSTR(q.q3, -3) AS FLOAT) / 1000.0) AS q3_seconds     -- converting q3 into seconds --
 FROM qualifying q
 JOIN
      races r ON q.raceId = r.raceId
 WHERE
      q.position = 1
 ),
    FilteredTimes AS(
    SELECT
        circuitId,
        MIN(q1_seconds, q2_seconds, q3_seconds) AS min_time  -- Finding minimum time value--
        FROM
        ConvertedTimes
        WHERE
        q1_seconds < 90 OR q2_seconds < 90 OR q3_seconds < 90
),
    AveragePoleTimes AS(
 SELECT
     circuitId,
     AVG(min_time) AS avg_pole_time
     FROM
     FilteredTimes
 GROUP By
      circuitId
 )
    SELECT
       c.circuitId,
       c.name,
       apt.avg_pole_time
       FROM
       AveragePoleTimes apt
       JOIN
       circuits c ON apt.circuitId = c.circuitId;

-- Question 10 --

CREATE INDEX IF NOT EXISTS idx_results_constructorId ON results(constructorId);
CREATE INDEX IF NOT EXISTS idx_results_PositionOrder ON results(raceId, positionOrder);

SELECT 
    c.constructorId,
    c.name,
    COUNT(r.raceId) AS total_races
FROM 
    constructors c
JOIN 
    results r ON c.constructorId = r.constructorId
WHERE 
    r.positionOrder = 1
GROUP BY 
    c.constructorId, c.name
ORDER BY 
    total_races DESC;
