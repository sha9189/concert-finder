DROP TABLE IF EXISTS event_artist_bridge;

CREATE TABLE event_artist_bridge (
    event_id VARCHAR(255) NOT NULL,
    artist_id VARCHAR(255) NOT NULL
);
