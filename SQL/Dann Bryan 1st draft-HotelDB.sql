DROP DATABASE  IF EXISTS HotelDatabase;
CREATE DATABASE IF NOT EXISTS HotelDatabase;
USE HotelDatabase;
CREATE TABLE Guests (
    GuestID INT PRIMARY KEY auto_increment,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Zip VARCHAR(10) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY auto_increment,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    GuestID INT NOT NULl,
    FOREIGN KEY fk_Reservation_GUEST (GuestID)
    references Guests(GuestID)
);
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    `Type` VARCHAR(50) NOT NULL,
    ADAAccessible varchar(3) NOT NULL,
    StandardOc INT NOT NULL,
    MaxOc INT NOT NULL
);
CREATE TABLE RoomRates (
    RoomRateID INT PRIMARY KEY auto_increment,
    RoomID INT NOT NULL,
    FOREIGN KEY fk_RoomRate_Room (RoomID) REFERENCES Room(RoomID),
    BasePrice DECIMAL NOT NULL,
    ExtraPerson DECIMAL(10,2)
);
CREATE TABLE RoomReservations (
    RoomReservationID INT Primary key NOT NULL AUTO_INCREMENT,
    ReservationID INT NOT NULL,
    FOREIGN KEY fk_RoomReservation(ReservationID) REFERENCES Reservations(ReservationID),
    RoomRateID INT NOT NULL,
    foreign key fk_RoomReservation_RoomRate (RoomRateID) REFERENCES RoomRates(RoomRateID),
    Adults INT,
    Children INT
);
CREATE TABLE Amenity (
    AmenityID INT PRIMARY KEY auto_increment NOT NULL,
    Amenity VARCHAR(50),
    Price DECIMAL(10,2) 
);
CREATE TABLE RoomAmenities (
    RoomId INT NOT NULL,
    AmenityID INT NOT NULL,
    PRIMARY KEY pk_RoomAmenities (RoomID, AmenityID),
    FOREIGN KEY fk_RoomAmenities_Room (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY fk_RoomAmenities_Amenity (AmenityID) REFERENCES Amenity(AmenityID)
   
   );