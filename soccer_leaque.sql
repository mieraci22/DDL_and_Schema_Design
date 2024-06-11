-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

-- Create Teams table
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Create Players table
CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    Name VARCHAR(100),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

-- Create Referees table
CREATE TABLE Referees (
    RefereeID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Create Matches table
CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    HomeTeamID INT,
    AwayTeamID INT,
    Date DATE,
    HomeScore INT,
    AwayScore INT,
    SeasonID INT,
    FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID)
);

-- Create Goals table
CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    TimeScored TIME,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

-- Create MatchReferees table
CREATE TABLE MatchReferees (
    MatchID INT,
    RefereeID INT,
    PRIMARY KEY (MatchID, RefereeID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (RefereeID) REFERENCES Referees(RefereeID)
);

-- Create Seasons table
CREATE TABLE Seasons (
    SeasonID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
);

-- Create Standings table
CREATE TABLE Standings (
    StandingID INT PRIMARY KEY,
    TeamID INT,
    SeasonID INT,
    Points INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID)
);

-- Insert sample data into Teams
INSERT INTO Teams (TeamID, Name) VALUES
(1, 'Team A'),
(2, 'Team B');

-- Insert sample data into Players
INSERT INTO Players (PlayerID, Name, TeamID) VALUES
(1, 'Player 1', 1),
(2, 'Player 2', 2);

-- Insert sample data into Referees
INSERT INTO Referees (RefereeID, Name) VALUES
(1, 'Referee 1'),
(2, 'Referee 2');

-- Insert sample data into Seasons
INSERT INTO Seasons (SeasonID, StartDate, EndDate) VALUES
(1, '2024-01-01', '2024-12-31');

-- Insert sample data into Matches
INSERT INTO Matches (MatchID, HomeTeamID, AwayTeamID, Date, HomeScore, AwayScore, SeasonID) VALUES
(1, 1, 2, '2024-06-01', 2, 1, 1),
(2, 2, 1, '2024-06-02', 0, 3, 1);

-- Insert sample data into Goals
INSERT INTO Goals (GoalID, PlayerID, MatchID, TimeScored) VALUES
(1, 1, 1, '00:15:00'),
(2, 2, 1, '00:30:00'),
(3, 1, 1, '00:45:00');

-- Insert sample data into MatchReferees
INSERT INTO MatchReferees (MatchID, RefereeID) VALUES
(1, 1),
(1, 2),
(2, 1);

-- Insert sample data into Standings
INSERT INTO Standings (StandingID, TeamID, SeasonID, Points) VALUES
(1, 1, 1, 3),
(2, 2, 1, 0);
