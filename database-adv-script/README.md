Explanation
Indexes on the User table:

idx_user_email: Index on the email column to speed up searches by email.
idx_user_role: Index on the role column to speed up queries filtering by role.
Indexes on the Property table:

idx_property_host_id: Index on the host_id column to speed up joins with the User table.
idx_property_location: Index on the location column to speed up searches by location.
idx_property_pricepernight: Index on the pricepernight column to speed up queries filtering or ordering by price.
Indexes on the Booking table:

idx_booking_user_id: Index on the user_id column to speed up joins with the User table.
idx_booking_property_id: Index on the property_id column to speed up joins with the Property table.
idx_booking_status: Index on the status column to speed up queries filtering by booking status.
idx_booking_start_date: Index on the start_date column to speed up queries filtering or ordering by start date.
idx_booking_end_date: Index on the end_date column to speed up queries filtering or ordering by end date.
