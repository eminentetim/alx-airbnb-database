-- partitioning.sql

-- Step 1: Create a partitioned table for Booking based on the start_date column
CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX (start_date)
) PARTITION BY RANGE (start_date) (
    PARTITION p2022 VALUES LESS THAN ('2023-01-01'),
    PARTITION p2023 VALUES LESS THAN ('2024-01-01'),
    PARTITION p2024 VALUES LESS THAN ('2025-01-01')
);

-- Step 2: Insert sample data into the partitioned Booking table
INSERT INTO Booking_Partitioned (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(uuid(), (SELECT property_id FROM Property WHERE name='Beachfront Villa'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), '2022-12-01', '2022-12-05', 1000.00, 'confirmed', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='Mountain Cabin'), (SELECT user_id FROM User WHERE email='john.doe@example.com'), '2023-11-15', '2023-11-20', 750.00, 'pending', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='City Apartment'), (SELECT user_id FROM User WHERE email='michael.brown@example.com'), '2023-10-01', '2023-10-10', 1800.00, 'confirmed', NOW()),
(uuid(), (SELECT property_id FROM Property WHERE name='Lake House'), (SELECT user_id FROM User WHERE email='emily.jones@example.com'), '2022-09-10', '2022-09-15', 1000.00, 'canceled', NOW());

-- Step 3: Test the performance of queries on the partitioned table
-- Fetching bookings by date range
EXPLAIN
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

-- Fetching bookings by date range
EXPLAIN
SELECT *
FROM Booking_Partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

