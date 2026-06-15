-- =============
-- Query 1:
-- =============

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM Matches
WHERE tournament_category = 'Champions League'
AND match_status = 'Available';


-- =============
-- Query 2:
-- =============

SELECT
    user_id,
    full_name,
    email
FROM Users
WHERE full_name ILIKE 'Tanvir%'
OR full_name ILIKE '%Haque%';



-- =============
-- Query 3:
-- =============


SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM Bookings
WHERE payment_status IS NULL;



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



-- =============
-- Query 5:
-- =============


SELECT
    users.user_id,
    users.full_name,
    bookings.booking_id
FROM Users users
LEFT JOIN Bookings bookings ON users.user_id = bookings.user_id;


-- =============
-- Query 6:
-- =============


SELECT
    booking_id,
    match_id,
    total_cost
FROM Bookings
WHERE total_cost > (SELECT AVG(total_cost) FROM Bookings);



-- =============
-- Query 6:
-- =============


SELECT
    booking_id,
    match_id,
    total_cost
FROM Bookings
WHERE total_cost > (SELECT AVG(total_cost) FROM Bookings);



-- =============
-- Query 7:
-- =============

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM Matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;