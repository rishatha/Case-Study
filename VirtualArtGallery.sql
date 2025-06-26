--  Create Database
CREATE DATABASE VirtualArtGalleryDB;


USE VirtualArtGalleryDB;


-- Artist Table
CREATE TABLE Artist (
    ArtistID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Biography VARCHAR(1000),
    BirthDate DATE,
    Nationality VARCHAR(100),
    Website VARCHAR(200),
    ContactInformation VARCHAR(200)
);

-- Artwork Table
CREATE TABLE Artwork (
    ArtworkID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(100),
    Description VARCHAR(500),
    CreationDate DATE,
    Medium VARCHAR(100),
    ImageURL VARCHAR(200),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

-- User Table
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50),
    [Password] VARCHAR(50),
    Email VARCHAR(100),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(200)
);

--  Gallery Table
CREATE TABLE Gallery (
    GalleryID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(500),
    Location VARCHAR(100),
    Curator INT,
    OpeningHours VARCHAR(100),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);

--  User_Favorite_Artwork (Many-to-Many)
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID)
);

--  Artwork_Gallery (Many-to-Many)
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID)
);

-- Insert into Artist
INSERT INTO Artist (Name, Biography, BirthDate, Nationality, Website, ContactInformation)
VALUES 
('Vincent van Gogh', 'Dutch post-impressionist painter.', '1853-03-30', 'Dutch', 'http://vangogh.com', 'contact@vangogh.com'),
('Pablo Picasso', 'Spanish painter and sculptor.', '1881-10-25', 'Spanish', 'http://picasso.com', 'contact@picasso.com');

-- Insert into Artwork 
INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES 
('Starry Night', 'A swirling night sky painting.', '1889-06-01', 'Oil on canvas', 'http://images.com/starry.jpg', 1),
('Guernica', 'Powerful anti-war painting.', '1937-04-26', 'Oil on canvas', 'http://images.com/guernica.jpg', 2);

-- Insert into User
INSERT INTO [User] (Username, [Password], Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES 
('artlover01', 'pass123', 'artlover01@email.com', 'Anna', 'Smith', '1990-01-01', 'http://images.com/user1.jpg'),
('collector23', 'pass456', 'collector23@email.com', 'John', 'Doe', '1985-12-05', 'http://images.com/user2.jpg');

-- Insert into Gallery (Curator is ArtistID)
INSERT INTO Gallery (Name, Description, Location, Curator, OpeningHours)
VALUES 
('Impressionist Hall', 'Gallery for impressionist artworks.', 'Paris', 1, '10:00 AM - 6:00 PM'),
('Modern Arts Wing', 'Modern and abstract artworks.', 'Madrid', 2, '11:00 AM - 7:00 PM');

-- Link artworks to galleries
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID)
VALUES 
(1, 1), -- Starry Night in Impressionist Hall
(2, 2); -- Guernica in Modern Arts Wing

-- Link favorites (users -artworks)
INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES 
(1, 1), -- artlover01 - Starry Night
(2, 2); -- collector23 - Guernica