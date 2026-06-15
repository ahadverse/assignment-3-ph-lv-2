-- =============
-- Query 4:
-- =============


SELECT
    bookings.booking_id,
    users.full_name,
    matches.fixture,
    bookings.total_cost
FROM Bookings bookings
INNER JOIN Users   users ON bookings.user_id  = users.user_id
INNER JOIN Matches matches ON bookings.match_id = matches.match_id;