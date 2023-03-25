-- 1. Write a query that returns a list of reservations that end in July 2023, 
-- including the name of the guest, the room number(s), and the reservation dates.

USE HotelDatabase;

SELECT Reservations.ReservationID,
Reservations.CheckInDate,
Reservations.CheckOutDate,
Guests.FirstName,
Guests.LastName
FROM Reservations
Join Guests ON Guests.GuestID = Reservations.GuestID
WHERE Reservations.CheckOutDate BETWEEN '2023-07-01' AND '2023-07-31';

-- result
-- 16	2023-07-13	2023-07-14	Walter	Holaway
-- 17	2023-07-18	2023-07-21	Wilfred	Vise
-- 18	2023-07-28	2023-07-29	Bettyann	Seery


-- -----------------------------------------------------------------------
-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.

USE HotelDatabase;
SELECT g.FirstName,
    g.LastName,
    r.CheckInDate,
    r.CheckOutDate,
    rm.RoomID,
    ra.AmenityID 
FROM Guests g
JOIN Reservations r ON g.GuestID = r.GuestID
JOIN RoomReservations rr on rr.ReservationID = r.ReservationID
JOIN RoomRates rt ON rt.RoomRateID = rr.RoomRateID
JOIN Room rm ON rm.RoomID = rt.RoomID
JOIN RoomAmenities ra ON rm.RoomID = ra.RoomID
WHERE ra.AmenityID = 3;

-- Zachery	Luechtefeld	2023-03-29	2023-03-31	202	3
-- Walter	Holaway	2023-07-13	2023-07-14	204	3
-- Dannie	Bryan	2023-06-28	2023-07-02	205	3
-- Joleen	Tison	2023-06-10	2023-06-14	206	3
-- Mack	Simmer	2023-11-22	2023-11-25	206	3
-- Wilfred	Vise	2023-04-23	2023-04-24	207	3
-- Aurore	Lipton	2023-03-18	2023-03-23	302	3
-- Maritza	Tilton	2023-12-24	2023-12-28	302	3-- #Jeremiah	Pendergrass	2023-03-31	2023-04-05	304	3
-- Aurore	Lipton	2023-06-17	2023-06-18	304	3
-- Duane	Cullison	2023-02-22	2023-02-24	305	3
-- Bettyann	Seery	2023-08-30	2023-09-01	305	3
-- Dannie	Bryan	2023-03-17	2023-03-20	307	3
-- Mack	Simmer	2023-02-02	2023-04-02	308	3
-- Maritza	Tilton	2023-05-30	2023-06-02	401	3
-- Wilfred	Vise	2023-07-18	2023-07-21	401	3
-- Duane	Cullison	2023-11-22	2023-11-25	401	3


----------------------------------------------------------
-- 3. Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. (Choose a guest's name from the existing data.)
-- Jeremiah Pendergrass

SELECT 
	g.Firstname,
    g.lastname,
    r.CheckInDate,
    rr.Adults,
    rr.Children,
    rt.RoomID
FROM Guests g 
JOIN Reservations r ON g.GuestID = r.GuestID
JOIN RoomReservations rr ON rr.ReservationID = r.ReservationID
JOIN RoomRates rt ON rt.RoomRateID = rr.RoomRateID
WHERE g.FirstName = "Zachery"

-- Zachery	Luechtefeld	2023-03-29	2	2	202
;


------------------------------------------------------------------
-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, 
-- whether or not there is a reservation associated with the room

SELECT r.RoomID,
	   rr.ReservationID,	
	   rt.BasePrice,
       rt.ExtraPerson,
       rr.Adults,
       rr.Children
FROM RoomReservations rr
JOIN RoomRates rt ON rt.RoomRateID = rr.RoomRateID
Right OUTER JOIN Room r ON r.RoomID = rt.RoomID
;
-- 201	4	200	10.00	2	2
-- 202	7	175	10.00	2	2
-- 203	2	200	10.00	2	1
-- 203	21	200	10.00	2	2
-- 204	16	175	10.00	3	1
-- 205	15	175	0.00	2	0
-- 206	12	150	0.00	2	0
-- 206	23	150	0.00	2	0
-- 207	10	175	0.00	1	1
-- 208	13	150	0.00	1	0
-- 208	20	150	0.00	2	0
-- 301	9	200	10.00	1	0
-- 301	24	200	10.00	2	2
-- 302	6	175	10.00	3	0
-- 302	25	175	10.00	2	0
-- 303	18	200	10.00	2	1
-- 304	8	175	10.00	2	0
-- 304	14	175	10.00	3	0
-- 305	3	175	0.00	2	0
-- 305	19	175	0.00	1	0
-- 306					
-- 307	5	175	0.00	1	1
-- 308	1	150	0.00	1	0
-- 401	11	400	20.00	2	4
-- 401	17	400	20.00	4	2
-- 401	22	400	20.00	2	2
-- 402	



---------------------------------------------------------------				
-- 5. Write a query that returns all the rooms accommodating 
-- at least three guests and that are reserved on any date in April 2023.

SELECT rt.RoomID,
	   rr.Adults,
       rr.Children,
       r.CheckoutDate,
       r.CheckOutDate
FROM RoomRates rt
JOIN RoomReservations rr ON rr.RoomRateID = rt.RoomRateID
LEFT OUTER JOIN Reservations r ON r.ReservationID = rr.ReservationID
WHERE r.CheckInDate BETWEEN "2023-03-31" AND "2023-05-01" 
AND r.CheckOutDate BETWEEN "2023-03-31" AND "2023-05-01"
AND rr.Adults + rr.Children >= 1
;
-- 304	2	0	2023-04-05	2023-04-05
-- 301	1	0	2023-04-13	2023-04-13
-- 207	1	1	2023-04-24	2023-04-24     There were no reservations for more than  3 people in april. So i dropped it to 2 
                                           -- to show a result.
                                           
                                           
-------------------------------------------------------------------------------
-- 6 Write a query that returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the guest's last name.

USE HotelDatabase;
SELECT g.FirstName,
	   g.LastName,
       r.GuestID,
       r.ReservationID
FROM Guests g
JOIN Reservations r ON r.GuestID = g.GuestID
#ORDER BY ReservationID  DESC ;


-- not quite right, runs but not ordered correctly

;

-- Dannie	Bryan	1	5
-- Dannie	Bryan	1	15
-- Mack	Simmer	2	1
-- Mack	Simmer	2	20
-- Mack	Simmer	2	23
-- Mack	Simmer	2	24
-- Bettyann	Seery	3	2
-- Bettyann	Seery	3	18
-- Bettyann	Seery	3	19
-- Duane	Cullison	4	3
-- Duane	Cullison	4	22
-- Karie	Yang	5	4
-- Karie	Yang	5	21
-- Aurore	Lipton	6	6
-- Aurore	Lipton	6	14
-- Zachery	Luechtefeld	7	7
-- Jeremiah	Pendergrass	8	8
-- Walter	Holaway	9	9
-- Walter	Holaway	9	16
-- Wilfred	Vise	10	10
-- wilfred	Vise	10	17
-- Maritza	Tilton	11	11
-- Maritza	Tilton	11	25
-- Joleen	Tison	12	12
-- Joleen	Tison	12	13



------------------------------------------------------------------
-- 7. Write a query that displays the name, address, and phone number of a guest 
-- based on their phone number. (Choose a phone number from the existing data.)

SELECT Phone,
LastName,
FirstName,
Address,
State,
Zip
FROM Guests
Where Phone = "279 491-0960"

-- 279 491-0960	Pendergrass	Jeremiah	70 Oakwood St.	IL	60099


