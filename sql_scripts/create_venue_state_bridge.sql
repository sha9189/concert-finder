DROP TABLE IF EXISTS venue_state_bridge;

CREATE TABLE venue_state_bridge (
    id SERIAL PRIMARY KEY,
    state_code VARCHAR(2) NOT NULL,
    venue_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (state_code) REFERENCES state(state_code),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
 );
