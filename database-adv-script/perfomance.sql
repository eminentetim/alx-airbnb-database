-- performance.sql

-- Initial query to retrieve all bookings along with user details, property details, and payment details
EXPLAIN
SELECT b.booking_id, b.property_id, b.user_id, b.start_date, b.end_date, b.total_price, b.status,
       u.first_name, u.last_name, u.email,
       p.name AS property_name, p.description, p.location, p.pricepernight,
       pay.amount, pay.payment_date, pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- Analyze the query’s performance using EXPLAIN
-- Look for any inefficiencies such as full table scans, unnecessary joins, or missing indexes

-- Refactor the query to reduce execution time
-- Create indexes on high-usage columns to improve join performance
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);

-- Refactored query with improved performance
EXPLAIN
SELECT b.booking_id, b.property_id, b.user_id, b.start_date, b.end_date, b.total_price, b.status,
       u.first_name, u.last_name, u.email,
       p.name AS property_name, p.description, p.location, p.pricepernight,
       pay.amount, pay.payment_date, pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- Verify the performance improvement using EXPLAIN after creating indexes

