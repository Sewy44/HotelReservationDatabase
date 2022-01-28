USE HotelDB;
GO

INSERT INTO Customer (FirstName, LastName, Address, City, StateAbbreviation, ZipCode, PhoneNumber) VALUES
	('Jamie', 'Seward', '523 Academy Ridge Place', 'Louisville', 'KY', '40245', '(502)419-8714'),
	('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291)553-0508'),
	('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478)277-9632'),
	('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308)494-0198'),
	('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214)730-0298'),
	('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377)507-0974'),
	('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814)485-2615'),
	('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279)491-0960'),
	('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446)396-6785'),
	('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834)727-1001'),
	('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA','22015','(446)351-6860'),
	('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026','(231)893-2755');

INSERT INTO RoomType (RoomType, StdOccupancy, MaxOccupancy, BasePrice, ExtraPersonFee) VALUES
	('Single', '2', '2', '174.99', '0'),
	('Double', '2', '4', '199.99', '10.00'),
	('Suite', '3', '8', '399.99', '20.00');

INSERT INTO Amenities (Amenity) VALUES
	('Microwave'),
	('Refrigerator'),
	('Jacuzzi'),
	('Oven');

INSERT INTO Reservation (StartDate, EndDate, CustomerId) VALUES
	('2/2/2023', '2/4/2023',2),
	('2/5/2023', '2/10/2023',3),
	('2/22/2023', '2/24/2023', 4),
	('3/6/2023', '3/7/2023', 5),
	('3/17/2023', '3/20/2023', 1),
	('3/18/2023', '3/23/2023', 6),
	('3/29/2023', '3/31/2023', 7),
	('3/31/2023', '4/5/2023', 8),
	('4/9/2023', '4/13/2023', 9),
	('4/23/2023', '4/24/2023', 10),
	('5/30/2023', '6/2/2023', 11),
	('6/10/2023', '6/14/2023', 12),
	('6/10/2023', '6/14/2023', 12),
	('6/17/2023', '6/18/2023', 6),
	('6/28/2023', '7/2/2023', 1),
	('7/13/2023', '7/14/2023', 9),
	('7/18/2023', '7/21/2023', 10),
	('7/28/2023', '7/29/2023', 3),
	('8/30/2023', '9/1/2023', 3),
	('9/16/2023', '9/17/2023', 2),
	('9/13/2023', '9/15/2023', 5),
	('11/22/2023', '11/25/2023', 4),
	('11/22/2023', '11/25/2023', 2),
	('11/22/2023', '11/25/2023', 2),
	('12/24/2023', '12/28/2023', 11);

INSERT INTO Room(RoomNumber, RoomType, Accessibility) VALUES
	('201', 'Double', '0'),
	('202', 'Double', '1'),
	('203', 'Double', '0'),
	('204', 'Double', '1'),
	('205', 'Single', '0'),
	('206', 'Single', '1'),
	('207', 'Single', '0'),
	('208', 'Single', '1'),
	('301', 'Double', '0'),
	('302', 'Double', '1'),
	('303', 'Double', '0'),
	('304', 'Double', '1'),
	('305', 'Single', '0'),
	('306', 'Single', '1'),
	('307', 'Single', '0'),
	('308', 'Single', '1'),
	('401', 'Suite', '1'),
	('402', 'Suite', '1');

INSERT INTO RoomReservation(ReservationId, RoomNumber, TotalRoomCost, NumberAdults, NumberChildren) VALUES
	('1', '308', '299.98', '1', '0'),
	('2', '203', '999.95', '2', '1'),
	('3', '305', '349.98', '2', '0'),
	('4', '201', '199.99', '2', '2'),
	('5', '307', '524.97', '1', '1'),
	('6', '302', '924.95', '3', '0'),
	('7', '202', '349.98', '2', '2'),
	('8', '304', '874.95', '2', '0'),
	('9', '301', '799.96', '1', '0'),
	('10', '207', '174.99', '1', '1'),
	('11', '401', '1199.97', '2', '4'),
	('12', '206', '599.96', '2', '0'),
	('13', '208', '599.96', '1', '0'),
	('14', '304', '184.99', '3', '0'),
	('15', '205', '699.96', '2', '0'),
	('16', '204', '184.99', '3', '1'),
	('17', '401', '1259.97', '4', '2'),
	('18', '303', '199.99', '2', '1'),
	('19', '305', '349.98', '1', '0'),
	('20', '208', '149.99', '2', '0'),
	('21', '203', '399.98', '2', '2'),
	('22', '401', '1199.97', '2','2'),
	('23', '206', '449.97', '2', '0'),
	('24', '301', '599.97', '2', '2'),
	('25', '302', '699.96', '2', '0');

INSERT INTO RoomAmenities(RoomNumber, Amenity, JacuzziFee) VALUES
	('201', 'Microwave', '0'),
	('201', 'Jacuzzi', '25'),
	('202', 'Refrigerator', '0'),
	('203', 'Microwave', '0'),
	('203', 'Jacuzzi', '25'),
	('204', 'Refrigerator', '0'),
	('205', 'Microwave', '0'),
	('205', 'Refrigerator', '0'),
	('205', 'Jacuzzi', '25'),
	('206', 'Microwave', '0'),
	('206', 'Refrigerator', '0'),
	('207', 'Microwave', '0'),
	('207', 'Refrigerator', '0'),
	('207', 'Jacuzzi', '25'),
	('208', 'Microwave', '0'),
	('208', 'Refrigerator', '0'),
	('301', 'Microwave', '0'),
	('301', 'Jacuzzi', '25'),
	('302', 'Refrigerator', '0'),
	('303', 'Microwave', '0'),
	('303', 'Jacuzzi', '25'),
	('304', 'Refrigerator', '0'),
	('305', 'Microwave', '0'),
	('305', 'Refrigerator', '0'),
	('305', 'Jacuzzi', '25'),
	('306', 'Microwave', '0'),
	('306', 'Refrigerator', '0'),
	('307', 'Microwave', '0'),
	('307', 'Refrigerator', '0'),
	('307', 'Jacuzzi', '25'),
	('308', 'Microwave', '0'),
	('308', 'Refrigerator', '0'),
	('401', 'Microwave', '0'),
	('401', 'Refrigerator', '0'),
	('401', 'Oven', '0'),
	('402', 'Microwave', '0'),
	('402', 'Refrigerator', '0'),
	('402', 'Oven', '0');

DELETE FROM RoomReservation
WHERE ReservationId = 8;

DELETE FROM Reservation
WHERE CustomerId = 8;

DELETE FROM Customer
WHERE CustomerId = 8;


