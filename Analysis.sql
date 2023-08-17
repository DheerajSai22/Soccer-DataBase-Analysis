-- Queries
-- From the soccer_venue table, count the number of venues for EURO cup 2030. Return number of venues.
SELECT COUNT(venue_id)
FROM soccer_venue;

-- From the player_mast table, count the number of countries participated in the EURO cup 2030.
SELECT COUNT(DISTINCT(team_id))
FROM player_mast;

-- From the goal_details table, find the number of goals scored in EURO cup 2030 within normal time schedule.
SELECT COUNT(goal_id)
FROM goal_details
WHERE goal_schedule = ‘NT’;

-- From the match_mast table, find the number of matches ended with a result.
SELECT COUNT(match_no)
FROM match_mast
WHERE results IS NOT NULL;

-- From the match_mast table, find the number of matches ended with draws.
SELECT COUNT(match_no)
FROM match_mast
WHERE results = ‘DRAW’;

-- From the goal_details table, find the number of self-goals scored in EURO cup 2030.
SELECT COUNT(goal_type)
FROM goal_details
WHERE goal_type = ‘O’;

-- From the match_mast table, count the number of matches ended with a win results in-group stage.
SELECT COUNT(match_no)
FROM match_mast
WHERE results = ‘WIN’
AND play_stage = ‘G’;

-- From the penalty_shootout table, find the number of matches got a result by penalty shootout.
SELECT COUNT(DISTINCT(match_no))
FROM penalty_shootout;

-- From the match_mast table, find the number of matches decided by penalties in the Round 16.
SELECT COUNT(match_no)
FROM match_mast
WHERE decided_by = ‘P’
AND play_stage = ‘R’;

-- From the goal_details table, find the number of goal scored in every match within normal play schedule. Sort the result-set on match number. Return match number, number of goal scored.
SELECT match_no, COUNT(goal_id)
FROM goal_details
GROUP BY match_no
ORDER BY match_no;

-- From the match_mast table, find those matches where no stoppage time added in the first half of play. Return match no, date of play, and goal scored.
SELECT match_no, play_date, goal_score
FROM match_mast
WHERE stop1_sec = 0;

-- From the match_details table, count the number of matches ending with a goalless draw in-group stage of play. Return number of matches.
SELECT COUNT(DISTINCT(match_no))
FROM match_details
WHERE win_lose = ‘D’
AND goal_score = 0
AND play_stage = ‘G’;

-- From the match_details table, count the number of matches ending with only one goal win, except those matches, which was decided by penalty shoot-out. Return number of matches.
SELECT COUNT(match_no)
FROM match_details
WHERE win_lose = ‘W’
AND goal_score = 1
AND decided_by <> ‘P’;

-- From the match_details table, count the total number of goalless draws have there in the entire tournament. Return number of goalless draws.
SELECT COUNT(DISTINCT(match_no))
FROM match_details
WHERE win_lose = ‘D’
AND goal_score = 0;

-- From the player_in_out table, count the total number of players replaced in the extra time of play.
SELECT COUNT(player_id)
FROM player_in_out
WHERE in_out = ‘I’
AND play_schedule = ‘ET’;

-- From the player_in_out table, count the number of substitute happened in various stage of play for the entire Tournament. Sort the result-set in ascending order by play-half, play-schedule and number of substitute happened. Return play-half, play-schedule, number of substitute happened.
SELECT play_half, play_schedule, COUNT(*)
FROM player_in_out
WHERE in_out = ‘I’
GROUP BY play_half, play_schedule
ORDER BY play_half ASC, play_schedule ASC, COUNT(*) ASC;

-- From the penalty_shootout and player_mast tables, find the players with shot number they taken in penalty shootout matches. Return match_no, Team, player_name, jersey_no, score_goal, kick_no.
SELECT ps.match_no, pm.playing_club, pm.player_name, pm.jersey_no, ps.score_goal, ps.kick_no
FROM penalty_shootout AS ps
JOIN player_mast AS pm
ON ps.player_id = pm.player_id;

-- From the player_booked table, count the number of booking happened in each half of play within normal play schedule. Return play_half, play_schedule, number of booking happened.
SELECT play_half, play_schedule, COUNT(*)
FROM player_booked
WHERE play_schedule = ‘NT’
GROUP BY play_half, play_schedule
ORDER BY play_half;

-- From the player_booked table, count the number of booking happened in stoppage time.
SELECT COUNT(*)
FROM player_booked
WHERE play_schedule = ‘ST’;

-- From the player_booked table, count the number of booking happened in extra time.
SELECT COUNT(*)
FROM player_booked
WHERE play_schedule = ‘ET’;

-- From the match_details and soccer_country tables, find the teams played the first match of EURO cup 2016. Return match number, country name.
SELECT match_no, country_name
FROM match_details AS md
JOIN soccer_country AS sc
ON md.team_id = sc.country_id
WHERE match_no = 1;
