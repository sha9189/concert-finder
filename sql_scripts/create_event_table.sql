DROP TABLE IF EXISTS event CASCADE;

CREATE TABLE event (
        event_id VARCHAR(255) PRIMARY KEY,
        event_name VARCHAR(255) NOT NULL,
        event_url VARCHAR(255),
        event_start_date DATE,
        event_start_time TIME,
        price_min NUMERIC,
        price_max NUMERIC,
        seatmap_url VARCHAR(255),
        age_restrictions BOOLEAN
);