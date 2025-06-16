--Case Study: Virtual Art Gallery

--creating a database

create database virtualgallery;
use VirtualGallery;

--creating artist table first (reference in artwork table)

create table artist(
artistid int primary key,
name varchar(255),
biography text,
birthdate date,
nationality varchar(50),
website varchar(255),
contactinfo varchar(255));


--creating artwork table

create table artwork(
artworkid int primary key,
title varchar(255),
description varchar(255),
creationdate date,
medium varchar(255),
imageurl varchar(255),
artistid int,
foreign key (artistid) references artist(artistid));

--Artwork - Artist (Many-to-One) An artwork is created by one artist


--creating user table

create table users(
userid int primary key,
username varchar(50),
password varchar(50),
email varchar(50),
firstname varchar(50),
lastname varchar(50),
dob date,
profilepic varchar(50));

--creating table gallery
create table gallery(
galleryid int primary key,
name varchar(255),
description text,
location varchar(100),
curator int,
openinghours varchar(50),
foreign key (curator) references artist(artistid));

--creating juction table 1-- User - Favorite Artwork (Many-to-Many) A user can have many favorite artworks, and an artwork can be a favorite of multiple users.

create table userfavartwork(
userid int ,
artworkid int,
primary key(userid,artworkid),
foreign key (userid) references users(userid),
foreign key (artworkid) references artwork(artworkid));

--creating jumction table 2 Artwork - Gallery (Many-to-Many) An artwork can be displayed in multiple galleries, and a gallery can have multiple artworks

create table artworkgallery(
artworkid int,
galleryid int,
primary key(artworkid,galleryid),
foreign key (artworkid) references artwork(artworkid),
foreign key (galleryid) references gallery(galleryid));

--didnt run
INSERT INTO Artist (ArtistID, Name, Biography, BirthDate, Nationality, Website, ContactInformation) VALUES
(1, 'Leonardo da Vinci', 'Italian polymath of the Renaissance', '1452-04-15', 'Italian', 'http://leonardo.com', 'leonardo@art.com'),
(2, 'Frida Kahlo', 'Mexican painter known for self-portraits', '1907-07-06', 'Mexican', 'http://frida.com', 'frida@art.com');

INSERT INTO Artwork (ArtworkID, Title, Description, CreationDate, Medium, ImageURL, ArtistID) VALUES
(1, 'Mona Lisa', 'Portrait of Lisa Gherardini', '1503-06-01', 'Oil on poplar', 'monalisa.jpg', 1),
(2, 'The Broken Column', 'Self-portrait with column', '1944-01-01', 'Oil on canvas', 'brokencolumn.jpg', 2);

INSERT INTO Users (UserID, Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture) VALUES
(1, 'artlover123', 'pass123', 'user1@example.com', 'Riya', 'Singh', '1999-05-10', 'riya.jpg'),
(2, 'collector89', 'secure456', 'user2@example.com', 'Arjun', 'Verma', '1985-08-21', 'arjun.jpg');

INSERT INTO Gallery (GalleryID, Name, Description, Location, Curator, OpeningHours) VALUES
(1, 'Classic Hall', 'Displays timeless masterpieces', 'New York', 1, '10AM - 6PM'),
(2, 'Modern Arts Room', 'Focus on 20th-century works', 'London', 2, '11AM - 7PM');

INSERT INTO User_Favorite_Artwork (UserID, ArtworkID) VALUES
(1, 1),
(1, 2),
(2, 2);

INSERT INTO Artwork_Gallery (ArtworkID, GalleryID) VALUES
(1, 1),
(2, 2);
