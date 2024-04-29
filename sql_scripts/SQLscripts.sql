SELECT Event.Event_Name, Artist.Artist_Name
FROM Event_Artist_Bridge
JOIN Event ON Event_Artist_Bridge.Event_ID = Event.Event_ID
JOIN Artist ON Event_Artist_Bridge.Artist_ID = Artist.Artist_ID
ORDER BY Event.Event_Start_Date DESC;


SELECT Venue.Venue_Name, COUNT(Event.Event_ID) AS Event_Count
FROM Event
JOIN Venue ON Event.Venue_ID = Venue.Venue_ID
GROUP BY Venue.Venue_Name;

SELECT *
FROM Event
WHERE Venue_ID IN (SELECT Venue_ID FROM Venue WHERE Venue_City = 'New York');

SELECT Event.Event_Name, Artist.Artist_Name
FROM Event
JOIN (SELECT * FROM Artist WHERE Artist_Name LIKE 'John%') AS JohnArtists
ON Event_Artist_Bridge.Artist_ID = JohnArtists.Artist_ID;

SELECT Event.Event_Name, Venue.Venue_Name
FROM Event
JOIN Venue ON Event.Venue_ID = Venue.Venue_ID
WHERE Venue.State_Code = 'NY' AND Event.Event_Start_Date > '2024-01-01';

SELECT Venue.Venue_Name, COUNT(Event.Event_ID) AS Event_Count
FROM Event
JOIN Venue ON Event.Venue_ID = Venue.Venue_ID
GROUP BY Venue.Venue_Name
HAVING Event_Count > 5;

SELECT Venue.Venue_Name, (SELECT MAX(Event_Start_Date) FROM Event WHERE Venue_ID = Venue.Venue_ID) AS Latest_Event_Date
FROM Venue;

SELECT e1.Event_Name AS First_Event, e2.Event_Name AS Next_Event
FROM Event e1
JOIN Event e2 ON e1.Event_Start_Date < e2.Event_Start_Date
ORDER BY e1.Event_Start_Date;

SELECT Event.Event_ID, Event.Event_Name, Event.Event_Start_Date, Event.Event_Price_Min, Event.Event_Price_Max, 
       Event.Age_Restrictions, Event.Seatmap_URL, Venue.Venue_Name, Venue.Venue_City, Venue.Venue_Postal_Code, 
       Venue.Venue_Latitude, Venue.Venue_Longitude, Venue.Venue_Address, State.State_Name, State.State_Code, 
       Country.Country_Name
FROM Event
JOIN Venue ON Event.Venue_ID = Venue.Venue_ID
JOIN State ON Venue.State_Code = State.State_Code
JOIN Country ON State.Country_Code = Country.Country_Code
ORDER BY Event.Event_Start_Date DESC;
