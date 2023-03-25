DROP DATABASE IF EXISTS HotelDatabase;
CREATE DATABASE IF NOT EXISTS HotelDatabase;

USE HotelDatabase;

CREATE TABLE IF NOT EXISTS Guests (
    GuestID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Zip VARCHAR(10) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    GuestID INT ,
    FOREIGN KEY fk_Reservation_Guest (GuestID) REFERENCES Guest(GuestID), 
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL
    
    
);
CREATE TABLE Room (
    RoomID INT PRIMARY KEY NOT NULL,
    `Type` VARCHAR(50) NOT NULL,
    ADAAccessible VARCHAR(3) NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL
    
);

CREATE TABLE RoomRates (
    RoomRateID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    RoomID INT NOT NULL,
    FOREIGN KEY fk_RoomRate_Room (RoomID) REFERENCES Room(RoomID),
    BasePrice DECIMAL(10,2) NOT NULL,
    ExtraPerson DECIMAL(10,2) NOT NULL
);
CREATE TABLE RoomReservations (
    RoomReservationID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ReservationID INT NOT NULL,
    FOREIGN KEY fk_RoomReservation_Reservation (ReservationID) REFERENCES Reservation(ReservationID),
    RoomRateID INT NOT NULL,
    FOREIGN KEY fk_RoomReservation_RoomRate (RoomRateID) REFERENCES RoomRate(RoomRateID),
    Adult INT NOT NULL,
    Children INT NULL
);
CREATE TABLE Amenity (
    AmenityID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Amenity VARCHAR(50) NOT NULL,
    Price DEC(10,2)
);
CREATE TABLE RoomAmenities (
    RoomID INT NOT NULL, 
    AmenityID INT NOT NULL,
    PRIMARY KEY pk_RoomAmenities (RoomID, AmenityID),
    FOREIGN KEY fk_RoomAmenities_Room (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY fk_RoomAmenities_Amenity (AmenityID) REFERENCES Amenity(AmenityID)
    
    
);
