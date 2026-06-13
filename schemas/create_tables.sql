-- ====================
-- create_tables.sql
-- Football Ticket Booking System
-- ====================

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Bookings;

-- =======================
-- 1. USER TABLE
-- =======================

CREATE TABLE Users (
    user_id      SERIAL,
    full_name    VARCHAR(250)  NOT NULL,
    email        VARCHAR(150)  NOT NULL,
    role         VARCHAR(50)   NOT NULL,
    phone_number VARCHAR(20),

    CONSTRAINT pk_users       PRIMARY KEY (user_id),
    CONSTRAINT uq_users_email UNIQUE      (email),
    CONSTRAINT chk_users_role CHECK       (role IN ('Ticket Manager', 'Football Fan'))
);

-- ==========================
-- 2. MATCHES TABLE
-- ==========================

CREATE TABLE Matches (
    match_id            SERIAL,
    fixture             VARCHAR(200)   NOT NULL,
    tournament_category VARCHAR(100)   NOT NULL,
    base_ticket_price   NUMERIC(10, 2) NOT NULL,
    match_status        VARCHAR(50)    NOT NULL,

    CONSTRAINT pk_matches         PRIMARY KEY (match_id),
    CONSTRAINT chk_matches_price  CHECK       (base_ticket_price >= 0),
    CONSTRAINT chk_matches_status CHECK       (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

-- ==========================
-- 3. BOOKINGs TABLE
-- ==========================

CREATE TABLE Bookings (
    booking_id     SERIAL,
    user_id        INT            NOT NULL,
    match_id       INT            NOT NULL,
    seat_number    VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost     NUMERIC(10, 2) NOT NULL,

    CONSTRAINT pk_bookings             PRIMARY KEY (booking_id),
    CONSTRAINT fk_bookings_user        FOREIGN KEY (user_id)  REFERENCES Users  (user_id),
    CONSTRAINT fk_bookings_match       FOREIGN KEY (match_id) REFERENCES Matches (match_id),
    CONSTRAINT chk_bookings_cost       CHECK       (total_cost >= 0),
    CONSTRAINT chk_bookings_pay_status CHECK       (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded'))
);