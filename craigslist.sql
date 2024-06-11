-- from the terminal run:
-- psql < craigslist.sql
-- psql craigslist

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist
-- Create Regions table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PreferredRegionID INT,
    FOREIGN KEY (PreferredRegionID) REFERENCES Regions(RegionID)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Create Posts table
CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    Title VARCHAR(255),
    Text TEXT,
    UserID INT,
    Location VARCHAR(255),
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

-- Create PostCategories table
CREATE TABLE PostCategories (
    PostID INT,
    CategoryID INT,
    PRIMARY KEY (PostID, CategoryID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Insert sample data into Regions
INSERT INTO Regions (RegionID, Name) VALUES
(1, 'San Francisco'),
(2, 'Atlanta'),
(3, 'Seattle');

-- Insert sample data into Users
INSERT INTO Users (UserID, Name, Email, PreferredRegionID) VALUES
(1, 'Alice', 'alice@example.com', 1),
(2, 'Bob', 'bob@example.com', 2);

-- Insert sample data into Categories
INSERT INTO Categories (CategoryID, Name) VALUES
(1, 'For Sale'),
(2, 'Jobs'),
(3, 'Housing');

-- Insert sample data into Posts
INSERT INTO Posts (PostID, Title, Text, UserID, Location, RegionID) VALUES
(1, 'Bike for sale', 'A used bike in good condition', 1, 'San Francisco', 1),
(2, 'Software Developer job', 'Looking for a software developer in Atlanta', 2, 'Atlanta', 2);

-- Insert sample data into PostCategories
INSERT INTO PostCategories (PostID, CategoryID) VALUES
(1, 1),
(2, 2);
