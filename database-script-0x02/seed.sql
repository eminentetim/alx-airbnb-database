-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(uuid(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '1234567890', 'admin', NOW()),
(uuid(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '0987654321', 'host', NOW()),
(uuid(), 'Emily', 'Jones', 'emily.jones@example.com', 'hashed_password3', NULL, 'guest', NOW()),
(uuid(), 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_password4', '1112233445', 'guest', NOW()),
(uuid(), 'Sara', 'Wilson', 'sara.wilson@example.com', 'hashed_password5', '5554433221', 'host', NOW());

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
(uuid(), (SELECT user_id FROM User WHERE email='jane.smith@example.com'), 'Beachfront Villa', 'A beautiful villa by the beach', 'Malibu', 250.00, NOW(), NOW()),
(uuid(), (SELECT user_id FROM User WHERE email='jane.smith@example.com'), 'Mountain Cabin', 'A cozy cabin in the mountains', 'Aspen', 150.00, NOW(), NOW()),
(uuid(), (SELECT user_id FROM User WHERE email='sara.wilson@example.com'), 'City Apartment', 'A modern apartment in the city center', 'New York', 180.00, NOW(), NOW()),
(uuid(), (SELECT user_id FROM User WHERE email='sara.wilson@example.com'), 'Lake House', 'A serene house by the lake', 'Seattle', 200.00, NOW(), NOW());

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(uuid(), (SELECT property_id FROM Property WHERE name='Beachfront Villa'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), '2023-12-01', '2023-12-05', 1000.00, 'confirmed', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='Mountain Cabin'), (SELECT user_id FROM User WHERE email='john.doe@example.com'), '2023-11-15', '2023-11-20', 750.00, 'pending', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='City Apartment'), (SELECT user_id FROM User WHERE email='michael.brown@example.com'), '2023-10-01', '2023-10-10', 1800.00, 'confirmed', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='Lake House'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), '2023-09-10', '2023-09-15', 1000.00, 'canceled', NOW());

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(uuid(), (SELECT booking_id FROM Booking WHERE user_id=(SELECT user_id FROM User WHERE email='emily.jones@example.com')), 1000.00, NOW(), 'credit_card'),
(uuid(), (SELECT booking_id FROM Booking WHERE user_id=(SELECT user_id FROM User WHERE email='john.doe@example.com')), 750.00, NOW(), 'paypal'),
(uuid(), (SELECT booking_id FROM Booking WHERE user_id=(SELECT user_id FROM User WHERE email='michael.brown@example.com')), 1800.00, NOW(), 'stripe'),
(uuid(), (SELECT booking_id FROM Booking WHERE user_id=(SELECT user_id FROM User WHERE email='emily.jones@example.com')), 1000.00, NOW(), 'credit_card');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(uuid(), (SELECT property_id FROM Property WHERE name='Beachfront Villa'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), 5, 'Amazing experience!', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='Mountain Cabin'), (SELECT user_id FROM User WHERE email='john.doe@example.com'), 4, 'Great cabin, beautiful views.', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='City Apartment'), (SELECT user_id FROM User WHERE email='michael.brown@example.com'), 5, 'Loved the modern design and location.', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='Lake House'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), 3, 'Nice view, but could use some updates.', NOW());

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(uuid(), (SELECT user_id FROM User WHERE email='john.doe@example.com'), (SELECT user_id FROM User WHERE email='jane.smith@example.com'), 'Hello Jane, how are you?', NOW()),
(uuid(), (SELECT user_id FROM User WHERE email='jane.smith@example.com'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), 'Hi Emily, thanks for the booking!', NOW()),
(uuid(), (SELECT user_id FROM User WHERE email='michael.brown@example.com'), (SELECT user_id FROM User WHERE email='sara.wilson@example.com'), 'Hi Sara, I loved your apartment!', NOW()),
(uuid(), (SELECT user_id FROM User WHERE email='sara.wilson@example.com'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), 'Emily, hope you enjoyed the lake house!', NOW());

