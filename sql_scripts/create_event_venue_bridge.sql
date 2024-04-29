DROP TABLE IF EXISTS event_venue_bridge;

CREATE TABLE event_venue_bridge (
    id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    venue_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
 );
