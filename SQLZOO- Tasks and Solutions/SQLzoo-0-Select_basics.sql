--0 SELECT basics--


--1.The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes'.
	
	SELECT population FROM world
	WHERE name = 'Germany';

--2.Checking a list The word IN allows us to check if an item is in a list.

	SELECT name, population FROM world
	WHERE name IN ('Sweden', 'Norway', 'Denmark');
	
--3.Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).

	SELECT name, area FROM world
	WHERE area BETWEEN 200000 AND 250000;
	

