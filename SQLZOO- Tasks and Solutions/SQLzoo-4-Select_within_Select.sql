-- SELECT within SELECT--


--1.List each country name where the population is larger than that of 'Russia'.--
	
	SELECT name FROM world
	WHERE population >
			(SELECT population FROM world
						WHERE name='Russia');

--2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.--

	SELECT name
	FROM world
	WHERE continent = 'Europe' 
	AND gdp/population > (
							SELECT gdp/population
							FROM world
							WHERE name = 'United Kingdom'
															);
	
--3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.--

	SELECT name, continent
	FROM world
	WHERE continent IN (
						SELECT continent
						FROM world
						WHERE name = 'Argentina'
						OR name = 'Australia'
												)
	ORDER BY name;

	
--4.Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.--

	SELECT name, population
	FROM world
	WHERE population > (
							SELECT population
							FROM world
							WHERE name = 'United Kingdom'
															)
	AND population < (
							SELECT population
							FROM world
							WHERE name = 'Germany'
														);


--6. Which countries have a GDP greater than every country in Europe? [Give the name only.] 

SELECT name
FROM world
WHERE gdp > 
			(SELECT MAX(gdp) 
			FROM WORLD 
			WHERE continent = 'Europe');

--7. Find the largest country (by area) in each continent, show the continent, the name and the area.

SELECT continent, name, area 
FROM world as x
WHERE area = 
			(SELECT MAX(area) FROM world as y
			WHERE x.continent = y.continent);

--8. List each continent and the name of the country that comes first alphabetically.

SELECT continent, name
FROM world x
WHERE name = (
				SELECT MIN(name)
				FROM world y
				WHERE x.continent = y.continent
												);
												
--9.Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.												
												
SELECT name, continent
FROM world w1
WHERE population > 3 * (
						SELECT MAX(population)
						FROM world w2
						WHERE w1.continent = w2.continent AND w1.name <> w2.name
																				);
																				