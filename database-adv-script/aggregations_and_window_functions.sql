-- Query to find the total number of bookings made by each user
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;

-- Query to rank properties based on the total number of bookings using the RANK window function
SELECT property_id, name, COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM Property p
JOIN Booking b ON p.property_id = b.property_id
GROUP BY property_id, name
ORDER BY total_bookings DESC;

