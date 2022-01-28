USE [master];
GO

if exists (select * from sys.databases where name = N'HotelDB')
begin
		EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'HotelDB';
		ALTER DATABASE HotelDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE HotelDB;
end

CREATE DATABASE HotelDB;
GO

USE HotelDB;
GO

CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PhoneNumber CHAR(13) NOT NULL,
	Address VARCHAR(250) NOT NULL,
	City VARCHAR(100) NOT NULL,
	StateAbbreviation CHAR(2) NOT NULL,
	ZipCode VARCHAR(5) NOT NULL
);

CREATE TABLE Reservation (
	ReservationId INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATETIME2(7) NOT NULL,
	EndDate DATETIME2(7) NOT NULL,
	CustomerId INT NOT NULL,
	CONSTRAINT fk_Reservation_Customer FOREIGN KEY (CustomerId)
		REFERENCES Customer(CustomerId)
);

CREATE TABLE RoomType (
	RoomType CHAR(7) PRIMARY KEY,
	StdOccupancy INT NOT NULL,
	MaxOccupancy INT NOT NULL,
	BasePrice DECIMAL(5,2) NOT NULL,
	ExtraPersonFee DECIMAL(5,2) NOT NULL,
);

CREATE TABLE Amenities (
	Amenity VARCHAR(12) PRIMARY KEY
);

CREATE TABLE Room (
	RoomNumber INT PRIMARY KEY NOT NULL,
	RoomType CHAR(7) NOT NULL,
	Accessibility BIT NOT NULL,
	CONSTRAINT fk_Room_RoomType
		FOREIGN KEY (RoomType)
		REFERENCES RoomType(RoomType)
);

CREATE TABLE RoomReservation (
	ReservationId INT NOT NULL,
	RoomNumber INT NOT NULL,
	TotalRoomCost DECIMAL(10,2) NOT NULL,
	NumberAdults SMALLINT NOT NULL,
	NumberChildren SMALLINT NOT NULL,
	CONSTRAINT pk_RoomReservation PRIMARY KEY (Reservationid, RoomNumber),
	CONSTRAINT fk_RoomReservation_Reservation FOREIGN KEY (ReservationId)
		REFERENCES Reservation(ReservationId),
	CONSTRAINT fk_RoomReservation_RoomNumber FOREIGN KEY (RoomNumber)
		REFERENCES Room(RoomNumber)
);

CREATE TABLE RoomAmenities (
	RoomNumber INT NOT NULL,
	Amenity VARCHAR(12) NOT NULL,
	JacuzziFee DECIMAL(5,2),
	CONSTRAINT pk_RoomAmenities PRIMARY KEY (RoomNumber, Amenity),
	CONSTRAINT fk_RoomNumber_Room FOREIGN KEY (RoomNumber)
		REFERENCES Room(RoomNumber),
	CONSTRAINT fk_RoomAmenities_Amenities FOREIGN KEY (Amenity)
		REFERENCES Amenities(Amenity)
);
