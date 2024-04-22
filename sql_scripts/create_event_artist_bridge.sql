DROP TABLE IF EXISTS event_artist_bridge;

CREATE TABLE event_artist_bridge (
    id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    artist_id VARCHAR(255) NOT NULL, 
    FOREIGN KEY (artist_id)
    REFERENCES artist(artist_id)
);
