Create database HBS;
use HBS;
-- Create the Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    PositionID Int,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create the Halls table
CREATE TABLE Halls (
    HallID INT AUTO_INCREMENT PRIMARY KEY,
    HallName VARCHAR(50) NOT NULL,
    Features VARCHAR(255)
);

-- Create the Bookings table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    HallID INT NOT NULL,
    UserID INT NOT NULL,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (HallID) REFERENCES Halls(HallID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    Description VARCHAR(255)
);

-- Create the Reports table
CREATE TABLE Reports (
    ReportID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    ReportText TEXT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
-- Update existing rows with position IDs
UPDATE Users
SET PositionID = 3
WHERE Position = 'Chief'
  AND UserID > 0;

UPDATE Users
SET PositionID = 2
WHERE Position = 'Manager'
  AND UserID > 0;

UPDATE Users
SET PositionID = 1
WHERE Position = 'General Employee'
  AND UserID > 0;
