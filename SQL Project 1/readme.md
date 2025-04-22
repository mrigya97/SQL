# Formula 1 Race Data (1950-2017)

## Context

This dataset contains Formula 1 race data from the years 1950 to 2017. It is based on the Formula 1 Race Data by ChrisG, and was downloaded from [Ergast API](http://ergast.com/mrd/) at the conclusion of the 2017 season.

The original CSV files (export.xlsx) were converted into an SQLite database for easier analysis.

## Dataset Overview

There are two SQLite files included in the dataset:

### 1. **Formula1.sqlite**  
   - This file contains the entire database, with 13 tables:

   - **Tables in Formula1.sqlite**:
     - `circuits`
     - `constructor_standings`
     - `constructor_results`
     - `constructors`
     - `driver_standings`
     - `drivers`
     - `laptimes`
     - `pitstops`
     - `qualifying`
     - `races`
     - `results`
     - `seasons`
     - `status`

### 2. **Formula1_4tables.sqlite**  
   - This file contains a subset of 4 key tables:

   - **Tables in Formula1_4tables.sqlite**:
     - `circuits`
     - `drivers`
     - `races`
     - `results`

## Source

Dataset source: [Kaggle Formula 1 Race Data SQLite](https://www.kaggle.com/datasets/davidcochran/formula-1-race-data-sqlite)

## Tasks Performed Using SQLite

The following queries and analysis were performed on the dataset using SQLite:

### 1. **Query on Drivers and Constructors**  
   - Find the name of drivers who have driven for more than one constructor.  
   - **Output**: Driver's ID, Driver's name, Number of constructors they have driven for.

### 2. **Query on Races and Circuits**  
   - Retrieve details of races that have taken place in the circuit located in each country with the most circuits.  
   - **Output**: Race ID, Circuit ID, Race name, Race date, Country.

### 3. **Complex Join on Qualifying and Races**  
   - Identify the top 3 fastest qualifying times for each season and the corresponding drivers.  
   - **Output**: Season, Race ID, Driver ID, Qualifying time.

### 4. **Aggregate on Driver Standings**  
   - Calculate the average points scored by drivers per season.  
   - **Output**: Driver ID, Driver name, Season, Average points.

### 5. **Subquery on Results and Drivers**  
   - List the drivers who have never finished a race in the last position.  
   - **Output**: Driver ID, Driver name, Total races participated in.

### 6. **Nested Query on Pitstops**  
   - Find the drivers with the shortest average pitstop time across all races.  
   - **Output**: Driver ID, Driver name, Average pitstop time.

### 7. **Query with Alias and JOIN on Constructor Standings**  
   - Retrieve the constructors with the highest cumulative points across all seasons.  
   - **Output**: Constructor ID, Constructor name, Total points.

### 8. **Complex Query on Lap Times and Races**  
   - Find the race with the most number of laps recorded.  
   - **Output**: Race ID, Race name, Circuit ID, Total laps.

### 9. **Subquery on Qualifying and Circuits**  
   - Identify circuits where the pole position qualifying times are consistently below a specified threshold (e.g., 1 minute 30 seconds).  
   - **Output**: Circuit ID, Circuit name, Average pole position time.

### 10. **JOIN and Aggregate on Results and Constructors**  
   - Determine the constructors who have the most race wins.  
   - **Output**: Constructor ID, Constructor name, Total race wins.
