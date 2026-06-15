-- =============
-- Query 5:
-- =============


SELECT
    users.user_id,
    users.full_name,
    bookings.booking_id
FROM Users users
LEFT JOIN Bookings bookings ON users.user_id = bookings.user_id;