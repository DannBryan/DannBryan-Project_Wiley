USE PersonalTrainer;

-- Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
-- 64 rows

SELECT ExerciseCategory.ExerciseCategoryId ExerciseCategoryId,
ExerciseCategory.NAME ExerciseCategoryName,
Exercise.NAME ExerciseName
FROM ExerciseCategory
INNER JOIN Exercise ON Exercise.ExerciseCategoryId = ExerciseCategory.ExerciseCategoryId;
--------------------
    
-- Select ExerciseCategory.Name and Exercise.Name
-- where the ExerciseCategory does not have a ParentCategoryId (it is null).
-- Again, join the tables on their shared key (ExerciseCategoryId).
-- 9 rows
-- Incomplete

USE PersonalTrainer;
SELECT Exercise.Name,
		Exercise.ExerciseCategoryId,
        ExerciseCategory.ExerciseCategoryId,
        ExerciseCategory.Name,
		ExerciseCategory.ParentCategoryId	
FROM Exercise
JOIN ExerciseCategory ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;


--------------------

-- The query above is a little confusing. At first glance, it's hard to tell
-- which Name belongs to ExerciseCategory and which belongs to Exercise.
-- Rewrite the query using an aliases. 
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
-- 9 rows

USE PersonalTrainer;
SELECT Exercise.ExerciseCategoryId,
		Exercise.Name,
        ExerciseCategory.ExerciseCategoryId,
        ExerciseCategory.ParentCategoryId
			
FROM Exercise
JOIN ExerciseCategory ON ExerciseCategory.ExerciseCategoryId = Exercise.ExerciseCategoryId;
--------------------

-- Select FirstName, LastName, and BirthDate from Client
-- and EmailAddress from Login 
-- where Client.BirthDate is in the 1990s.
-- Join the tables by their key relationship. 
-- What is the primary-foreign key relationship?
-- 35 rows

USE PersonalTrainer;

SELECT `Client`.FirstName, 
		`Client`.LastName, 
       `Client`. BirthDate,
        Login.EmailAddress
FROM `Client`, Login
INNER JOIN Login ON Login.ClientId, Client.BirthDate
WHERE `Client`.Birthdate BETWEEN 1990-01-01 AND 1999-12-31;

-- Incomplete


--------------------

-- Select Workout.Name, Client.FirstName, and Client.LastName
-- for Clients with LastNames starting with 'C'?
-- How are Clients and Workouts related?
-- 25 rows
--------------------

-- Select Names from Workouts and their Goals.
-- This is a many-to-many relationship with a bridge table.
-- Use aliases appropriately to avoid ambiguous columns in the result.
--------------------

-- Select FirstName and LastName from Client.
-- Select ClientId and EmailAddress from Login.
-- Join the tables, but make Login optional.
-- 500 rows
--------------------

-- Using the query above as a foundation, select Clients
-- who do _not_ have a Login.
-- 200 rows
--------------------

-- Does the Client, Romeo Seaward, have a Login?
-- Decide using a single query.
-- nope :(
--------------------

-- Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
-- This requires a self-join.
-- 12 rows
--------------------
    
-- Rewrite the query above so that every ExerciseCategory.Name is
-- included, even if it doesn't have a parent.
-- 16 rows
--------------------
    
-- Are there Clients who are not signed up for a Workout?
-- 50 rows
USE PersonalTrainer;
SELECT c.FirstName, c.LastName, cw.WorkoutId
FROM `CLIENT` c
LEFT OUTER JOIN ClientWorkout cw ON c.ClientId = cw.ClientId
WHERE cw.WorkoutId IS NULL;
--------------------

-- Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
-- Goals are associated to Clients through ClientGoal.
-- Goals are associated to Workouts through WorkoutGoal.
-- 6 rows, 4 unique rows
--------------------

-- Select all Workouts. 
-- Join to the Goal, 'Core Strength', but make it optional.
-- You may have to look up the GoalId before writing the main query.
-- If you filter on Goal.Name in a WHERE clause, Workouts will be excluded.
-- Why?
-- 26 Workouts, 3 Goals
--------------------

-- The relationship between Workouts and Exercises is... complicated.
-- Workout links to WorkoutDay (one day in a Workout routine)
-- which links to WorkoutDayExerciseInstance 
-- (Exercises can be repeated in a day so a bridge table is required) 
-- which links to ExerciseInstance 
-- (Exercises can be done with different weights, repetions,
-- laps, etc...) 
-- which finally links to Exercise.
-- Select Workout.Name and Exercise.Name for related Workouts and Exercises.
SELECT * FROM Workout;
SELECT * FROM Exercise;


--------------------
   
-- An ExerciseInstance is configured with ExerciseInstanceUnitValue.
-- It contains a Value and UnitId that links to Unit.
-- Example Unit/Value combos include 10 laps, 15 minutes, 200 pounds.
-- Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name
-- for the 'Plank' exercise. 
-- How many Planks are configured, which Units apply, and what 
-- are the configured Values?
-- 4 rows, 1 Unit, and 4 distinct Values
--------------------