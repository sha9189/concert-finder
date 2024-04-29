DROP TABLE IF EXISTS event_genre_bridge;

CREATE TABLE event_genre_bridge (
    id SERIAL PRIMARY KEY,
    event_id VARCHAR(255) NOT NULL,
    genre_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES event(event_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
 );