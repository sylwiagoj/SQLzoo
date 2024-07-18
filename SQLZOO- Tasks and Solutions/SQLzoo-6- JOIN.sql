-- JOIN--


--1.The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime.
	
	SELECT matchid, player 
	FROM goal 
	WHERE teamid = 'GER';


--2.Show id, stadium, team1, team2 for just game 1012.

	SELECT DISTINCT game.id,game.stadium,game.team1,game.team2
	FROM game
	JOIN goal ON (game.id=goal.matchid)
	WHERE matchid = 1012;
	
--3.The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored. Modify it to show the player, teamid, stadium and mdate for every German goal.

	SELECT goal.player,goal.teamid,game.stadium, game.mdate
	FROM game 
	JOIN goal ON (game.id=goal.matchid)
	WHERE teamid = 'GER';

	
--4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'.

	SELECT game.team1, game.team2,goal.player
	FROM game 
	JOIN goal ON (game.id=goal.matchid)
	WHERE  player LIKE 'Mario%';


--5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10.
	
	SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
	FROM eteam
	JOIN goal ON goal.teamid=eteam.id
	WHERE gtime<=10;
	
--6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

	SELECT game.mdate,eteam.teamname
	FROM eteam
	JOIN game ON game.team1=eteam.id
	WHERE team1='GRE';

	
--7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.

	SELECT goal.player
	FROM goal
	JOIN game ON game.id=goal.matchid
	WHERE stadium ='National Stadium, Warsaw';
	
--8. The example query shows all goals scored in the Germany-Greece quarterfinal. Instead show the name of all players who scored a goal against Germany.

	SELECT DISTINCT goal.player
	FROM game JOIN goal ON goal.matchid = game.id 
	WHERE (team1 = 'GER' OR team2 = 'GER') 
	AND teamid <> 'GER';
	
--9. Show teamname and the total number of goals scored.

	SELECT eteam.teamname, count(gtime)
	FROM eteam JOIN goal ON eteam.id=goal.teamid
	GROUP BY teamname;

--10. Show the stadium and the number of goals scored in each stadium.

	SELECT game.stadium,count(*)
	FROM game
	JOIN goal ON game.id=goal.matchid
	GROUP BY stadium;


--11. For every match involving 'POL', show the matchid, date and the number of goals scored.

	SELECT goal.matchid,game.mdate,COUNT(goal.teamid)
	FROM game JOIN goal ON goal.matchid = game.id
	WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
	GROUP BY goal.matchid,game.mdate;	
	
--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.

	SELECT goal.matchid,game.mdate,COUNT(goal.teamid)
	FROM game JOIN goal ON goal.matchid = game.id
	WHERE (goal.teamid = 'GER')
	GROUP BY goal.matchid,game.mdate;
























