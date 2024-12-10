-- database_index.sql

-- Creating indexes for high-usage columns in the User table
CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_role ON User (role);

-- Creating indexes for high-usage columns in the Property table
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_pricepernight ON Property (pricepernight);

-- Creating indexes for high-usage columns in the Booking table
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_booking_start_date ON Booking (start_date);
CREATE INDEX idx_booking_end_date ON Booking (end_date);

-- Measuring query performance before adding indexes
-- EXPLAIN SELECT * FROM User WHERE email = 'john.doe@example.com';
-- EXPLAIN SELECT * FROM Property WHERE location = 'Malibu';
-- EXPLAIN SELECT * FROM Booking WHERE user_id = (SELECT user_id FROM User WHERE email = 'john.doe@example.com');

-- Measuring query performance after adding indexes
-- EXPLAIN SELECT * FROM User WHERE email = 'john.doe@example.com';
-- EXPLAIN SELECT * FROM Property WHERE location = 'Malibu';
-- EXPLAIN SELECT * FROM Booking WHERE user_id = (SELECT user_id FROM User WHERE email = 'john.doe@example.com');

