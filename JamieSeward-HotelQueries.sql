USE HotelDB;
GO

---1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s),
----- and the reservation dates.
SELECT 
	CONCAT(c.FirstName, ' ',c.LastName) GuestName,
	rr.RoomNumber,
	r.StartDate,
	r.EndDate
FROM Customer c
INNER JOIN Reservation r ON c.CustomerId = r.CustomerId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
WHERE r.EndDate BETWEEN '2023-07-01' AND '2023-07-31'
;

--GuestName			RoomNumber		StartDate						EndDate
--Jamie Seward		205				2023-06-28 00:00:00.0000000		2023-07-02 00:00:00.0000000
--Walter Holaway	204				2023-07-13 00:00:00.0000000		2023-07-14 00:00:00.0000000
--Wilfred Vise		401				2023-07-18 00:00:00.0000000		2023-07-21 00:00:00.0000000
--Bettyann Seery	303				2023-07-28 00:00:00.0000000		2023-07-29 00:00:00.0000000

--**********************************************************************************************************************************

---2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number,
----- and the dates of the reservation.

SELECT
	CONCAT(c.FirstName, ' ',c.LastName) GuestName,
	rr.RoomNumber,
	r.StartDate,
	r.EndDate
FROM Customer c
INNER JOIN Reservation r ON c.CustomerId = r.CustomerId
INNER JOIN RoomReservation rr ON  r.ReservationId = rr.ReservationId
INNER JOIN Room ON Room.RoomNumber = rr.RoomNumber
INNER JOIN RoomAmenities ON RoomAmenities.RoomNumber = Room.RoomNumber
WHERE RoomAmenities.JacuzziFee = '25';


--GuestName			RoomNumber		StartDate						EndDate
--Bettyann Seery	203				2023-02-05 00:00:00.0000000		2023-02-10 00:00:00.0000000
--Duane Cullison	305				2023-02-22 00:00:00.0000000		2023-02-24 00:00:00.0000000
--Karie Yang		201				2023-03-06 00:00:00.0000000		2023-03-07 00:00:00.0000000
--Jamie Seward		307				2023-03-17 00:00:00.0000000		2023-03-20 00:00:00.0000000
--Walter Holaway	301				2023-04-09 00:00:00.0000000		2023-04-13 00:00:00.0000000
--Wilfred Vise		207				2023-04-23 00:00:00.0000000		2023-04-24 00:00:00.0000000
--Jamie Seward		205				2023-06-28 00:00:00.0000000		2023-07-02 00:00:00.0000000
--Bettyann Seery	303				2023-07-28 00:00:00.0000000		2023-07-29 00:00:00.0000000
--Bettyann Seery	305				2023-08-30 00:00:00.0000000		2023-09-01 00:00:00.0000000
--Karie Yang		203				2023-09-13 00:00:00.0000000		2023-09-15 00:00:00.0000000
--Mack Simmer		301				2023-11-22 00:00:00.0000000		2023-11-25 00:00:00.0000000

--**********************************************************************************************************************************


---3. Write a query that returns all the rooms reserved for a specific guest, including the guest's namee, the room(s) reserved,
----- the starting date of the reservation, how many people were included in the reservation. (Choose a guest's name from the
----- existing data

SELECT
	CONCAT(c.FirstName, ' ',c.LastName) GuestName,
	rr.RoomNumber,
	r.StartDate,
	SUM(rr.NumberAdults + rr.NumberChildren) NumberOfGuests
FROM Customer c
INNER JOIN Reservation r ON r.CustomerId =c.CustomerId
INNER JOIN RoomReservation rr ON rr.ReservationId = r.ReservationId
WHERE c.LastName LIKE 'Seward'
GROUP BY c.LastName, c.FirstName,rr.RoomNumber, r.StartDate;

--GuestName		RoomNumber	StartDate						NumberOfGuests
--Jamie Seward	205			2023-06-28 00:00:00.0000000		2
--Jamie Seward	307			2023-03-17 00:00:00.0000000		2
--**********************************************************************************************************************************



---4. Write a query that returns a list of rooms, reservationId, and per-room costs for each reservation. The results should 
----- includ all rooms, whether or not there is a reservation associated with the room.
SELECT 
	r.RoomNumber,
	rr.ReservationId,
	rr.TotalRoomCost
FROM Room r
LEFT OUTER JOIN RoomReservation rr ON rr.RoomNumber = r.RoomNumber;

--RoomNumber	ReservationId	TotalRoomCost
--201			4				199.99
--202			7				349.98
--203			2				999.95
--203			21				399.98
--204			16				184.99
--205			15				699.96
--206			12				599.96
--206			23				449.97
--207			10				174.99
--208			13				599.96
--208			20				149.99
--301			9				799.96
--301			24				599.97
--302			6				924.95
--302			25				699.96
--303			18				199.99
--304			14				184.99
--305			3				349.98
--305			19				349.98
--306			NULL			NULL
--307			5				524.97
--308			1				299.98
--401			11				1199.97
--401			17				1259.97
--401			22				1199.97
--402			NULL			NULL
--**********************************************************************************************************************************

---5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT
	rr.RoomNumber,
	SUM(rr.NumberAdults + rr.NumberChildren) NumberOfGuests,
	r.StartDate,
	r.EndDate
FROM RoomReservation rr
INNER JOIN Reservation r ON r.ReservationId = rr.ReservationId
GROUP BY rr.RoomNumber, r.StartDate, r.EndDate
HAVING SUM(rr.NumberAdults + rr.NumberChildren) >= 3 AND (r.StartDate BETWEEN '2023-04-01' AND '2023-04-30' OR r.EndDate BETWEEN '2023-04-01' AND '2023-04-30');


--RoomNumber	NumberOfGuests	StartDate	EndDate
--**********************************************************************************************************************************
---6. Write a query that returns a list of all guests names and the number of reservations per guest, sorted starting with the 
----- guest with the most reservations and then by the guest's last name.
SELECT
	CONCAT(c.FirstName, ' ',c.LastName) GuestName,
	COUNT(r.ReservationId) NumberOfReservations
FROM Customer c
INNER JOIN Reservation r ON r.CustomerId = c.CustomerId
GROUP BY c.FirstName, c.LastName
ORDER BY COUNT(r.ReservationId) DESC, c.LastName;

--GuestName				NumberOfReservations
--Mack Simmer			4
--Bettyann Seery		3
--Duane Cullison		2
--Walter Holaway		2
--Aurore Lipton			2
--Jamie Seward			2
--Maritza Tilton		2
--Joleen Tison			2
--Wilfred Vise			2
--Karie Yang			2
--Zachery Luechtefeld	1
--**********************************************************************************************************************************

---7. Write a query that displays the name, address, and phone number of a guest based on their phone number. 
----- Choose a phone number from the existing data.

SELECT
	CONCAT(c.FirstName, ' ', c.LastName) GuestName,
	c.Address,
	c.PhoneNumber
FROM Customer c
WHERE c.PhoneNumber LIKE '(502)419-8714';

--GuestName		Address						PhoneNumber
--Jamie Seward	523 Academy Ridge Place		(502)419-8714