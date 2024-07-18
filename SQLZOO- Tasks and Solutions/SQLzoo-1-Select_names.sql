--1 SELECT names----


--1.Find the country that start with Y.
	
	SELECT name FROM world
	WHERE name LIKE 'Y%';

--2. Find the countries that end with y.

	SELECT name FROM world
	WHERE name LIKE '%Y';
	
--3.Find the countries that contain the letter x.

	SELECT name FROM world
	WHERE name LIKE '%x%';
	
--4.Iceland, Switzerland end with land - but are there others? Find the countries that end with land.

	SELECT name FROM world
	WHERE name LIKE '%land';

--5.Find the countries that start with C and end with ia.

	SELECT name FROM world
	WHERE name LIKE 'C%ia';
	
--6.Find the country that has 'oo' in the name.

	SELECT name FROM world
	WHERE name LIKE '%oo%';
	
--7.Find the countries that have three or more a in the name.

	SELECT name FROM world
	WHERE name LIKE '%a%a%a%';
	
--8.India and Angola have an n as the second character. You can use the underscore as a single character wildcard.

	SELECT name FROM world
	WHERE name LIKE '_t%'
	ORDER BY name;
	
--9.Find the countries that have two "o" characters separated by two others.

	SELECT name FROM world
	WHERE name LIKE '%o__o%';
	
--10. Find the countries that have exactly four characters.

	SELECT name FROM world
	WHERE name LIKE '____';
	
--11.Find the country where the name is the capital city.

	SELECT name
	FROM world
	WHERE name=capital;

--12.The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".Find the country where the capital is the country plus "City".

	SELECT name
	FROM world
	WHERE capital = concat(name, 'City');

--13.Find the capital and the name where the capital includes the name of the country.

	SELECT capital,name 
	FROM world 
	WHERE capital LIKE concat('%', name, '%');
	


	



	

	
	
