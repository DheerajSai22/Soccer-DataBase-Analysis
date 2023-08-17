-- create database soccer;

CREATE TABLE playing_position (
    position_id VARCHAR(2) PRIMARY KEY,
    position_desc VARCHAR(15)
);

CREATE TABLE soccer_city (
    city_id INT PRIMARY KEY,
    city VARCHAR(25),
    country_id INT
);

CREATE TABLE player_mast (
    player_id INT PRIMARY KEY,
    team_id INT,
    jersy_no INT,
    player_name VARCHAR(255),
    posi_to_play VARCHAR(2),
    dt_of_br DATE,
    age INT,
    playing_club VARCHAR(2)
);

CREATE TABLE soccer_country (
    country_id INT PRIMARY KEY,
    country_abbr VARCHAR(4),
    country_name VARCHAR(40)
);

CREATE TABLE soccer_venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(30),
    city_id INT,
    aud_capacity INT
);

CREATE TABLE referee_mast (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(40),
    country_id INT
);

CREATE TABLE match_mast (
    match_no INT PRIMARY KEY,
    player_stage CHAR(1),
    play_date DATE,
    results CHAR(5),
    decide_by CHAR(1),
    goal_score CHAR(5),
    venue_id INT,
    referee_id INT,
    audience INT,
    plr_of_match INT,
    stop1_sec INT,
    stop2_sec INT
);

CREATE TABLE coach_mast (
    coach_id INT PRIMARY KEY,
    coach_name VARCHAR(40)
);

CREATE TABLE soccer_team (
    team_id INT PRIMARY KEY,
    team_group CHAR(1),
    match_played INT,
    won INT,
    draw INT,
    lost INT,
    goal_for INT,
    goal_agnst INT,
    goal_diff INT,
    points INT,
    group_position INT
);

CREATE TABLE player_booked (
    match_no INT,
    team_id INT,
    player_id INT,
    booking_time VARCHAR(40),
    sent_off CHAR(1),
    play_schedule CHAR(2),
    play_half INT
);

CREATE TABLE player_in_out (
    match_no INT,
    team_id INT,
    player_id INT,
    in_out CHAR(1),
    play_schedule CHAR(2),
    play_half INT
);

CREATE TABLE match_details (
    match_no INT,
    play_stage CHAR(1),
    team_id INT,
    win_loos CHAR(1),
    decided_by CHAR(1),
    goal_score INT,
    penalty_score INT,
    ass_ref INT,
    player_gk INT
);

CREATE TABLE team_coaches (
    team_id INT,
    coach_id INT
);

CREATE TABLE match_captain (
    match_no INT,
    team_id INT,
    player_captain INT
);

CREATE TABLE penalty_gk (
    match_no INT,
    team_id INT,
    player_gk INT
);

CREATE TABLE penalty_shootout (
    kick_id INT PRIMARY KEY,
    match_no INT,
    team_id INT,
    player_id INT,
    score_goal CHAR(1),
    kick_no INT
);

CREATE TABLE goal_details (
    goal_id INT PRIMARY KEY,
    match_no INT,
    player_id INT,
    team_id INT,
    goal_time INT,
    goal_type CHAR(1),
    play_stage CHAR(1),
    goal_schedule CHAR(2),
    goal_half INT
);

CREATE TABLE asst_referee_mast (
    ass_ref_id INT,
    ass_ref_name VARCHAR(40),
    country_id INT
);
