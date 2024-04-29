DROP TABLE IF EXISTS venue CASCADE;

CREATE TABLE venue (
    venue_id VARCHAR(255) PRIMARY KEY NOT NULL,
    venue_name VARCHAR(255) NOT NULL,
    venue_city VARCHAR(50),
    venue_postal_code VARCHAR(20),
    venue_lat FLOAT,
    venue_long FLOAT,
    venue_address VARCHAR(255),
    state_code VARCHAR(2), 
    FOREIGN KEY (state_code) REFERENCES state(state_code)
);
