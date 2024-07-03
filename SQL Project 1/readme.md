About Dataset

Context

Formula 1 race data from the years 1950 to 2017. This data set is based on Formula 1 Race Data by ChrisG. As ChrisG indicated, the data was downloaded from http://ergast.com/mrd/ at the conclusion of the 2017 seas

The data from the original CSV files(export.xlxs) to an SQLite database has been converted

Content

There two SQLite files:

Formula1.sqlite: the entire database, with 13 tables (listed below)

Formula1_4tables.sqlite: featuring four tables: races, drivers, circuits, and results

Formula1.sqlite contains these 13 tables:

circuits
constructor_standings
constructor_results
constructors
driver_standings
drivers
laptimes
pitstops
qualifying
races
results
seasons
status

Formula1_4tables.sqlite contains these 4 tables:

circuits
drivers
races
results

Source for dataset :- https://www.kaggle.com/datasets/davidcochran/formula-1-race-data-sqlite

In this project, the following tasks has been performed.

1.	Query on Drivers and Constructors: Find the name of drivers who have driven for more than one constructor. Display the driver's ID, driver's name, and the number of constructors they have driven for.
2.	Query on Races and Circuits: Retrieve the details of races that have taken place in the circuit with the longest length. Display the race ID, circuit ID, circuit name, and race date.
3.	Complex Join on Qualifying and Races: Identify the top 3 fastest qualifying times for each season and the corresponding drivers. Display the season, race ID, driver ID, and the qualifying time.
4.	Aggregate on Driver Standings: Calculate the average points scored by drivers per season. Display the driver ID, driver name, season, and average points.
5.	Subquery on Results and Drivers: List the drivers who have never finished a race in the last position. Display the driver ID, driver name, and total races participated in.
6.	Nested Query on Pitstops: Find the drivers with the shortest average pitstop time across all races. Display the driver ID, driver name, and average pitstop time.
7.	Query with Alias and JOIN on Constructor Standings: Retrieve the constructors with the highest cumulative points across all seasons. Display the constructor ID, constructor name, and total points.
8.	Complex Query on Lap Times and Races: Find the race with the most number of laps recorded. Display the race ID, race name, circuit ID, and total laps.
9.	Subquery on Qualifying and Circuits: Identify circuits where the pole position qualifying times are consistently below a specified threshold (e.g., 1 minute 30 seconds). Display the circuit ID, circuit name, and average pole position time.
10.	JOIN and Aggregate on Results and Constructors: Determine the constructors who have the most race wins. Display the constructor ID, constructor name, and total race wins.




